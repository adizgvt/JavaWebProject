package servlets;

import javax.servlet.ServletException;
import java.io.PrintWriter;
import java.lang.Exception;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import utility.AuthGuard;
import utility.CookieUtility;
import models.SubjectModel;
import beans.Subject;

@WebServlet("/subject")
public class SubjectServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The GET request has been made to subject");

        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        List<Subject> subjectList = new ArrayList<>();
        try {
            String userId = CookieUtility.getUserId(request, response);
            System.out.println(userId + userId);
            subjectList = SubjectModel.getUserSubjects(userId);
        }catch (Exception e){
            PrintWriter pw = response.getWriter();
            pw.println(e.getMessage());
            response.setStatus(400);
        }

        for (Subject subject: subjectList) {
            System.out.println(subject.getName());
            System.out.println("iterate");
        }
        request.setAttribute("subjects", subjectList);
        request.getRequestDispatcher("/WEB-INF/jsp/mySubjects.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The POST request has been made to subject");

        PrintWriter pw = response.getWriter();

        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        String subjectName = request.getParameter("name");
        String startTime = request.getParameter("start");
        String endTime = request.getParameter("end");

        if(subjectName.isBlank() || startTime.isBlank() || endTime.isBlank()){
            pw.println("All fields must be filled.");
            response.setStatus(400);
            return;
        }

        try{
            String userId = CookieUtility.getUserId(request, response);
            int id = SubjectModel.addSubject(subjectName, userId, startTime, endTime);
            pw.println("Subject successfully added." + id);
        }catch (Exception e){
            pw.println(e.getMessage());
            response.setStatus(400);

        }
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The DELETE request has been made to subject");

        PrintWriter pw = response.getWriter();

        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        String subjectId = request.getParameter("id");
        System.out.println(subjectId);

        try{
            SubjectModel.deleteSubject(subjectId);
            pw.println("Subject successfully deleted.");
        }catch (Exception e){
            pw.println(e.getMessage());
            response.setStatus(400);

        }

    }

}