package material;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import connexion.Connexion;

public class Product {
    private int id_product;
    private String name_product;
    private double conservation_time_h;

    public Product(){
    }
    public Product (int id_product,String name_product,double conservation_time_h){
        this.id_product=id_product;
        this.name_product=name_product;
        this.conservation_time_h=conservation_time_h;
    }

///     Getteur
    public int getIdProduct(){
        return id_product;
    }
    public String getName(){
        return name_product;
    }
    public double getConservatonTimeH(){
        return conservation_time_h;
    }

    //      getteur by id
    public void getById(int id_product) throws Exception{
        Connection connection=null;
        String query="SELECT * FROM bakery_products WHERE id_product = ?";
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = Connexion.connectePostgres();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id_product);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                setIdProduct(resultSet.getInt("id_product"));
                setName(resultSet.getString("name_product"));
                setConservationTimeH(resultSet.getDouble("conservation_time_h"));
            }else {
                throw new Exception("Ingredient inexistant");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (null!=resultSet) resultSet.close();
            if (null!=preparedStatement) preparedStatement.close();
            if (null!=connection) connection.close();
        }
    }

///     Setteur
    public void setIdProduct(int id_product){
        this.id_product=id_product;
    }
    public void setName(String name_product){
        this.name_product=name_product;
    }
    public void setConservationTimeH(double conservation_time_h){
        this.conservation_time_h=conservation_time_h;
    }

    
///     affichage
    public String line() {
        String retour="\t<tr>\n";

        retour+="\t\t<td>"+name_product+"</td>\n";
        retour+="\t\t<td>"+conservation_time_h+"</td>\n";
        retour+="\t\t<td><a href=\"Product?action=update&id_product="+id_product+"\">update<a> <a href=\"Product?action=delete&id_product="+id_product+"\">delete<a></td>\n";
        retour+="\t</tr>\n";

        return retour;   
    }

///     insert
    public void save(Connection co)throws Exception{
        String query = "INSERT INTO bakery_products (name_product , conservation_time_h) values ( ? , ? )";

        try(PreparedStatement preparedStatement = co.prepareStatement(query)){

            preparedStatement.setString(1, name_product);
            preparedStatement.setDouble(2, conservation_time_h);

            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e ){
            e.printStackTrace();
            throw e;
        }
    }

///     update
    public void update(Connection co)throws Exception{
        String query = "UPDATE bakery_products set name_product = ? , conservation_time_h = ? WHERE id_product = ? ";

        try(PreparedStatement preparedStatement = co.prepareStatement(query)){

            preparedStatement.setString(1, name_product);
            preparedStatement.setDouble(2, conservation_time_h);
            preparedStatement.setInt(3, id_product);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e ){
            e.printStackTrace();
            throw e;
        }
    }
///     delete 
    public void delete(Connection co)throws Exception{
        String query = "DELETE FROM bakery_products WHERE id_product = ?";
        try (PreparedStatement preparedStatement = co.prepareStatement(query)){
            preparedStatement.setInt(1, id_product);

            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
///     liste de tous les products
    public static List<Product> getAll()throws Exception{
        Connection connection = null;
        Connexion conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        // objet de retour
        List<Product> retour = new ArrayList<Product>();
        
        try {
            // creation de la connection
            conn = new Connexion();
            connection = conn.connectePostgres();
            // requete pour avoir tous les objets
            String query = "SELECT * FROM bakery_products";
            
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            // recuperation des informations et creation de tous les objets
            while (resultSet.next()) {
                int id_product = resultSet.getInt("id_product");
                String name_product = resultSet.getString("name_product");
                double conservation_time_h = resultSet.getDouble("conservation_time_h");

            
                Product product = new Product(id_product, name_product, conservation_time_h);
                retour.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            // fermeture de toutes les connections
            if (null != resultSet) resultSet.close();
            if (null != statement) statement.close();
            if (null != connection) connection.close(); 
        }
        return retour;
    }

}
