package vente;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import connexion.Connexion;


public class Client {
    private int id_client;
    private String name;

    // Constructeur par défaut
    public Client() {
    }

    // Constructeur avec paramètres
    public Client(int id_client, String name) {
        this.id_client = id_client;
        this.name = name;
    }

    // Getter pour id_client
    public int getIdClient() {
        return id_client;
    }

    // Setter pour id_client
    public void setIdClient(int id_client) {
        this.id_client = id_client;
    }

    // Getter pour name
    public String getName() {
        return name;
    }

    // Setter pour name
    public void setName(String name) {
        this.name = name;
    }
    
    public String option(){
        return "\t\t<option value=\""+id_client+"\">"+name+"</option>\n";
    }
    public static List<Client> getAll()throws Exception{
        Connection connection = null;
        Connexion conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        // objet de retour
        List<Client> retour = new ArrayList<Client>();
        
        try {
            // creation de la connection
            conn = new Connexion();
            connection = conn.connectePostgres();
            // requete pour avoir tous les objets
            String query = "SELECT * FROM bakery_clients";
            
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            // recuperation des informations et creation de tous les objets
            while (resultSet.next()) {
                int id_client = resultSet.getInt("id_client");
                String name = resultSet.getString("name");

                Client client = new Client(id_client, name);
                retour.add(client);
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
    
    public void getById(int id_client) throws Exception {
        Connection connection = null;
        String query = "SELECT * FROM bakery_clients WHERE id_client = ?";
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = Connexion.connectePostgres();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id_client);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                setIdClient(resultSet.getInt("id_client"));
                setName(resultSet.getString("name"));
            } else {
                throw new Exception("Client inexistant");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        }
    }
}
