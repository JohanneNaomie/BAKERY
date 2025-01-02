package controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import material.*;
import connexion.Connexion;

@WebServlet("/Product")
public class ProductController extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id_product = request.getParameter("id_product");
        String name = request.getParameter("name");
        String conservation_time_h = request.getParameter("conservation_time_h");

        if (    
            null!=action && action.equals("insert") && 
            null!=name && !name.isEmpty() &&
            null!=conservation_time_h && !conservation_time_h.isEmpty()){
                // parse 
                double conservation=Double.parseDouble(conservation_time_h);
                // creation de l' objet
                Product product = new Product(0, name, conservation);
                Connection connection=null;
                Connexion conn=null;
                try {
                    conn = new Connexion();

                    connection = conn.connectePostgres();

                    product.save(connection);

                } catch (Exception e) {

                    
                } finally {
                    if ( null != connection ) {
                        try {
                            connection.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    response.sendRedirect("Product?action=liste");
                }
        }
        else if (    
            null!=action && action.equals("update") && 
            null!=id_product && !id_product.isEmpty() &&
            null!=name && !name.isEmpty() &&
            null!=conservation_time_h && !conservation_time_h.isEmpty()){
                // parse 
                int id_prod=Integer.parseInt(id_product);
                double conservation=Double.parseDouble(conservation_time_h);
                // creation de l' objet
                Product product = new Product(id_prod, name, conservation);
                Connection connection=null;
                Connexion conn=null;
                try {
                    conn = new Connexion();

                    connection = conn.connectePostgres();

                    product.update(connection);

                 
                } catch (Exception e) {
                    e.printStackTrace();                    
                } finally {
                    if ( null != connection ) {
                        try {
                            connection.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    response.sendRedirect("Product?action=liste");
                }
        }

    } 
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id_product = request.getParameter("id_product");
        /// page Insert
        if(null != action && action.equals("pageInsert")){
            RequestDispatcher dispat = request.getRequestDispatcher("/WEB-INF/views/insertProduct.jsp");
            dispat.forward(request, response);
        }
        /// delete
        else if (null != action && action.equals("delete") && null !=id_product && !id_product.isEmpty()) {
         
            try {
                //  suppresion
                int id_prod=Integer.parseInt(id_product);
                Product product = new Product();
                product.getById(id_prod);
                Connection connection = Connexion.connectePostgres();
                product.delete(connection);
                connection.close();
                
            } catch (Exception e) {
                e.printStackTrace();   
            }
            response.sendRedirect("Product?action=liste");


        }
        /// Update
        else if (null != action && action.equals("update") && null !=id_product && !id_product.isEmpty()){
            RequestDispatcher dispat = request.getRequestDispatcher("/WEB-INF/views/updateProduct.jsp");
            
            
            try {
                int id_prod=Integer.parseInt(id_product);
                Product product = new Product();
                product.getById(id_prod);
                request.setAttribute("product", product);
                
            } catch (Exception e) {
                e.printStackTrace();
                
            }
            dispat.forward(request, response);

        }
        /// liste des produits
        else if (null != action && action.equals("liste")) {
            RequestDispatcher dispat = request.getRequestDispatcher("/WEB-INF/views/listProduct.jsp");
            List<Product> products = null;
            String error = "";
            try {
                products=Product.getAll();
                request.setAttribute("products", products);
                
            } catch (Exception e) {
                e.printStackTrace();
                error=e.getMessage();
            }
            request.setAttribute("error", error);
            dispat.forward(request, response);
        }
        
    }

}
