package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import database.Db;
import beans.User;
import models.UserModel;
import utility.AuthGuard;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The POST request has been made to logout");

        for (Cookie cookie: request.getCookies()) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        request.setAttribute("success", "Successfully logged out.");
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
    }

}