package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import database.Db;
import beans.User;
import models.UserModel;
import utility.CookieUtility;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The GET request has been made to login");

        String userId = CookieUtility.getUserId(request, response);
        if(!userId.equalsIgnoreCase("0")){
            response.sendRedirect("/home");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The POST request has been made to login");

        String email = request.getParameter("email").toString();
        String password = request.getParameter("password").toString();

        User user = new User();

        try{
            user = UserModel.login(email, password);
        }catch (Exception e){
            request.setAttribute("email", email);
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return;
        }

        if(user.getId() == null) {
            request.setAttribute("email", email);
            request.setAttribute("error", "Wrong username or password");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return;
        }

        Cookie c1 = new Cookie("userId", user.getId());
        Cookie c2 = new Cookie("name", user.getName());
        Cookie c3 = new Cookie("class", user.get_class());
        Cookie c4 = new Cookie("email", user.getEmail());

        response.addCookie(c1);
        response.addCookie(c2);
        response.addCookie(c3);
        response.addCookie(c4);

        request.setAttribute("justLogin", "yes");
        response.sendRedirect("/home");

    }
}