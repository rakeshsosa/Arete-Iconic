/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ebs05
 */
public class GRNFinance {
    
    private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
//    private static final String DB_CONNECTION = "jdbc:mysql://192.168.1.9:3306/arete_tms";
    private static final String DB_CONNECTION = "jdbc:mysql://localhost:3306/arete_tms";
    private static final String DB_USER = "root";
   // private static final String DB_PASSWORD = "Ebs@#999$";
     private static final String DB_PASSWORD = "root";

    //  public static void main(String[] args){
    public static void callOracleStoredProcINParameter(String GRN, String grnNo, String itemCode) throws SQLException {

        Connection dbConnection = null;
        CallableStatement callableStatement = null;

        String insertStoreProc = "{call ODBPROC_GET_PUR_FIN_DETAIL(?,?,?)}";

        try {
            dbConnection = getDBConnection();
            callableStatement = dbConnection.prepareCall(insertStoreProc);

            callableStatement.setString(1, GRN);
            callableStatement.setString(2, grnNo);
            callableStatement.setString(3, itemCode);

            // execute insertDBUSER store procedure
            callableStatement.executeUpdate();

            System.out.println("Record is inserted into DBUSER table!");

        } catch (SQLException e) {
            e.printStackTrace();

            System.out.println(e.getMessage());

        } finally {

            if (callableStatement != null) {
                callableStatement.close();
            }

            if (dbConnection != null) {
                dbConnection.close();
            }

        }

    }

    private static Connection getDBConnection() throws SQLException {

        Connection dbConnection = null;

        try {

            Class.forName(DB_DRIVER);

        } catch (ClassNotFoundException e) {

            System.out.println(e.getMessage());

        }

        try {

            dbConnection = DriverManager.getConnection(
                    DB_CONNECTION, DB_USER, DB_PASSWORD);
            return dbConnection;

        } catch (SQLException e) {

            System.out.println(e.getMessage());

        }finally {

            if (dbConnection != null) {
                dbConnection.close();
            }

        }

        return dbConnection;

    }
    
}
