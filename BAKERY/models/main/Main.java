package main;
import connexion.Connexion;
import java.sql.*;
import material.*;
import java.util.List;
public class Main {
    public static void main(String[] args) throws Exception {
        
        Connexion conn = new Connexion();
        
        
        Connection connection = conn.connectePostgres();
        List<Product> products = Product.getAll();
        for (Product product : products) {
            System.out.println(product.line());
        }

        if (connection != null) connection.close();
    }
}

