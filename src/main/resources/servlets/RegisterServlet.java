package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import database.Db;
import beans.User;
import models.UserModel;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The GET request has been made to register");

        request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The POST request has been made to register");

        String name = request.getParameter("name").toString();
        String email = request.getParameter("email").toString();
        String password = request.getParameter("password").toString();
        String passwordConfirmation = request.getParameter("password_confirmation").toString();

        if(!password.equalsIgnoreCase(passwordConfirmation)){
            request.setAttribute("email", email);
            request.setAttribute("name", name);
            request.setAttribute("error", "Password doesn't match.");
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
            return;
        }

        try {
            UserModel.register(name, email, password);
        }catch (Exception e){
            request.setAttribute("email", email);
            request.setAttribute("name", name);
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
            return;
        }

        request.setAttribute("success", "Successfully registered. Please enter you email and password again to login.");
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);

    }
}