package material;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import connexion.Connexion;

public class Ingredient {
    private int id_ingredient;
    private String name_ingredient;
    private int id_unit; 
    private double stock;
    private Date last_update;

    public Ingredient(){
    }
    public Ingredient(int id_ingredient,String name_ingredient,int id_unit,double stock,Date last_update){
        this.id_ingredient=id_ingredient;
        this.name_ingredient=name_ingredient;
        this.id_unit=id_unit;
        this.stock=stock;
        this.last_update=last_update;
    }   
///     Getteur
    //      getteur classique
    public int getIdIngredient(){
        return this.id_ingredient;
    }
    public String getName(){
        return this.name_ingredient;
    }
    public int getIdUnit(){
        return this.id_unit;
    }
    public double getStock(){
        return this.stock;
    }
    public Date getLastUpdate(){
        return this.last_update;
    }
    //      getteur entrer dans base
    public Unit getUnit(){
        try {
            
            Unit unit = new Unit();
            unit.getById(id_unit);
            return unit;
        } catch (Exception e) {
            return null;
        }
    }
    //      getteur by id
    public void getById(int id_ingredient) throws Exception{
        Connection connection=null;
        String query="SELECT * FROM bakery_ingredients WHERE id_ingredient = ?";
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = Connexion.connectePostgres();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id_ingredient);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                setIdIngredient(resultSet.getInt("id_ingredient"));
                setName(resultSet.getString("name_ingredient"));
                setIdUnit(resultSet.getInt("id_unit"));
                setStock(resultSet.getDouble("stock"));
                setLastUpdate(resultSet.getDate("last_update"));
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
    public void setIdIngredient(int id_ingredient){
        this.id_ingredient=id_ingredient;
    }
    public void setName(String name_ingredient){
        this.name_ingredient=name_ingredient;
    }
    public void setIdUnit(int id_unit){
        this.id_unit=id_unit;
    }
    public void setStock(double stock){
        this.stock=stock;
    }
    public void setLastUpdate(Date last_update){
        this.last_update=last_update;
    }


///     affichage
    public String line() {
        String retour="\t<tr>\n";

        retour+="\t\t<td>"+name_ingredient+"</td>\n";
        retour+="\t\t<td>"+stock+"</td>\n";
        retour+="\t\t<td>"+getUnit().getName()+"</td>\n";
        retour+="\t\t<td>"+last_update+"</td>\n";
        retour+="\t\t<td><a href=\"Ingredient?action=update&id_ingredient="+id_ingredient+"\">update<a> <a href=\"Ingredient?action=delete&id_ingredient="+id_ingredient+"\">delete<a></td>\n";
        retour+="\t</tr>\n";

        return retour;   
    }


///     insert
    public void save(Connection co)throws Exception{
        String query = "INSERT INTO bakery_ingredients (name_ingredient , id_unit , stock) values ( ? , ? , ?)";

        try(PreparedStatement preparedStatement = co.prepareStatement(query)){

            preparedStatement.setString(1, name_ingredient);
            preparedStatement.setInt(2, id_unit);
            preparedStatement.setDouble(3, stock);

            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e ){
            e.printStackTrace();
            throw e;
        }
    }
///     update
    public void update(Connection co)throws Exception{
        String query = "UPDATE bakery_ingredients set name_ingredient = ? , id_unit = ? , stock = ? , last_update = now() WHERE id_ingredient= ? ";

        try(PreparedStatement preparedStatement = co.prepareStatement(query)){

            preparedStatement.setString(1, name_ingredient);
            preparedStatement.setInt(2, id_unit);
            preparedStatement.setDouble(3, stock);
            preparedStatement.setInt(4, id_ingredient);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e ){
            e.printStackTrace();
            throw e;
        }
    }
///     delete 
    public void delete(Connection co)throws Exception{
        String query = "DELETE FROM bakery_ingredients WHERE id_ingredient = ?";
        try (PreparedStatement preparedStatement = co.prepareStatement(query)){
            preparedStatement.setInt(1, id_ingredient);

            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
///     liste de tous les ingredients
    public static List<Ingredient> getAll()throws Exception{
        Connection connection = null;
        Connexion conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        // objet de retour
        List<Ingredient> retour = new ArrayList<Ingredient>();
        
        try {
            // creation de la connection
            conn = new Connexion();
            connection = conn.connectePostgres();
            // requete pour avoir tous les objets
            String query = "SELECT * FROM bakery_ingredients";
            
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            // recuperation des informations et creation de tous les objets
            while (resultSet.next()) {
                int id_ingredient = resultSet.getInt("id_ingredient");
                String name_ingredient = resultSet.getString("name_ingredient");
                int id_unit = resultSet.getInt("id_unit");
                double stock = resultSet.getDouble("stock");
                Date last_update = resultSet.getDate("last_update");

            // je voulais pas utiliser le getById car je ne veux pas re-rentrer dans la base
                Ingredient ingredient = new Ingredient(id_ingredient, name_ingredient, id_unit,stock, last_update);
                retour.add(ingredient);
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