package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import utility.AuthGuard;

@WebServlet("/")
public class HelloServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The GET request has been made to hello");

        if(!AuthGuard.isLogin(request, response)){
            response.sendRedirect("/login");
        }

        response.sendRedirect("/home");
    }

}