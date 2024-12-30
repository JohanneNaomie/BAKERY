package main;
import connexion.Connexion;
import java.sql.*;
import material.*;
import java.util.List;
public class Main {
    public static void main(String[] args) throws Exception {
        
        Connexion conn = new Connexion();
        
        
        Connection connection = conn.connectePostgres();
        Ingredient ingredient = new Ingredient();
        ingredient.getById(1);
        ingredient.delete(connection);


        if (connection != null) connection.close();
    }
}

