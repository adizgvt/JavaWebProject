package utility;

import javax.imageio.IIOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CookieUtility {

    public static String getUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String userId = "0";

        for (Cookie cookie: cookies) {
            if(cookie.getName().equalsIgnoreCase("userId")){
                userId = cookie.getValue();
                break;
            }
        }
        return userId;
    }
}