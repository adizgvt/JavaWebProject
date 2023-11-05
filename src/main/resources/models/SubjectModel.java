package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Subject;
import database.Db;

public class SubjectModel {

    public static int addSubject(String name, String userId, String start, String end) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();
        int subjectId = 0;
        con.createStatement().execute("INSERT INTO subjects (name, user_id, start_time, end_time) values ('" + name + "','" + userId + "','" + start + "','" + end + "');");

        ResultSet set = con.createStatement().executeQuery("SELECT id FROM subjects WHERE user_id = '" + userId + "' ORDER BY id DESC LIMIT 1;");

        while (set.next()){
            subjectId = set.getInt(1);
        }

        return subjectId;
    }

    public static List<Subject> getUserSubjects(String userId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Subject> subjectList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM subjects WHERE user_id = '" + userId + "';");

        while (set.next()){
            Subject subject = new Subject();
            subject.setId(set.getString(1));
            subject.setUserId(set.getString(2));
            subject.setName(set.getString(3));
            subject.setStartTime(set.getString(4));
            subject.setEndTime(set.getString(5));
            subjectList.add(subject);
        }
        return subjectList;
    }

    public static void deleteSubject(String subjectId) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();
        System.out.println(subjectId);
        con.createStatement().execute("DELETE FROM subjects WHERE id = '" + subjectId + "';");

    }


}