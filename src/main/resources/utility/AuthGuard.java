package utility;

import javax.imageio.IIOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthGuard {

    public static boolean isLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        boolean isLogin = false;

        if(cookies == null) {
            System.out.println("no cookies");
            request.setAttribute("error", "Please Login First");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return isLogin;
        }


        for (Cookie cookie: cookies) {
            if(cookie.getName().equalsIgnoreCase("userId")){
                isLogin = true;
                break;
            }
        }

        if(!isLogin){
            request.setAttribute("error", "Please Login First");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        }

        return isLogin;
    }
}