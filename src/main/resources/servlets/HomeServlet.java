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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The GET request has been made to home");

        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        request.getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
    }

}