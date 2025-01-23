package main;
import connexion.Connexion;
import material.Production;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import vente.*;
public class Main {
    public static void main(String[] args) throws Exception {
        
        Connexion conn = new Connexion();
        
        
        Connection connection = conn.connectePostgres();
        // List<Commission> products =  Commission.getFiltre(null,null, "1");
        // for (Commission product : products ) {
        //     System.out.println(product.getSeller().getName()+' '+product.getYear());
        // }
        
                HashMap<String, Double> nombre = Commission.getEtatCommissionBySexe(null, null);

                List<String> sexe = new ArrayList<String>();
                sexe.add("male");
                sexe.add("female");
                for(String s : sexe){
                    System.out.println(nombre.get(s));
                }
                
        // Sale sale = new Sale(0, 0, 8, 0, 250, 0, null, 1);
        // sale.setPrice();
        // sale.save(connection);

        if (connection != null) connection.close();
    }
}

