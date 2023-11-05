package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import beans.User;
import database.Db;

public class UserModel {

    public static User login(String email, String password) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        User user = new User();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM users WHERE active_status = 1 AND email = '" + email + "' AND password = '" + password + "';");

        while (set.next()){
            user.setId(set.getString(1));
            user.setName(set.getString(2));
            user.set_class(set.getString(3));
            user.setEmail(set.getString(4));
            user.setAdminStatus(set.getString(7));
            System.out.println(set.getString(2));
        }

        return user;
    }

    public static void register(String name,String email, String password) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM users WHERE email = '" + email + "';");

        if(set.next()){
            throw new Exception("Email already taken.");
        }

        con.createStatement().execute("INSERT INTO users (name, email, class, password, active_status, admin_status) values ('" + name + "','"+ email +"','3A','"+ password +"',0,0);");

    }


}