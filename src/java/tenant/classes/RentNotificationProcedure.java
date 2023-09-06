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
 * @author Lakshmi Prasanna
 */
public class RentNotificationProcedure {
    

    private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
//    private static final String DB_CONNECTION = "jdbc:mysql://192.168.1.9:3306/arete_tms?noAccessToProcedureBodies=true";
    private static final String DB_CONNECTION = "jdbc:mysql://localhost:3306/arete_tms?noAccessToProcedureBodies=true";
    private static final String DB_USER = "root";
  //  private static final String DB_PASSWORD = "Ebs@#999$";
   private static final String DB_PASSWORD = "root";
    
    public static void callOracleStoredProcINParameter(String centerCode) throws SQLException {

        Connection dbConnection = null;
        CallableStatement callableStatement1 = null;
        
        String insertStoreProc = "{call sp_rent_notif(?)}";
        try {
            dbConnection = getDBConnection();
            System.out.println("XXXXXXXXXXXX - dbConnection is " + dbConnection);
            callableStatement1 = dbConnection.prepareCall(insertStoreProc);
            
            callableStatement1.setString(1, centerCode);
            
            // execute insertDBUSER store procedure
            int executeUpdate1 = callableStatement1.executeUpdate();
            System.out.println("Record is inserted into DBUSER table!");

        } catch (SQLException e) {
            e.printStackTrace();

            System.out.println(e.getMessage());

        } finally {

            if (callableStatement1 != null) {
                callableStatement1.close();
            }

            if (dbConnection != null) {
                dbConnection.close();
            }

        }

    }
    
    //**********Rent Notification**************\\
    public static void callOracleStoredProcINParameter() throws SQLException {

        Connection dbConnection = null;
        CallableStatement callableStatement1 = null;
        
        String insertStoreProc = "{call sp_rent_notif()}";
        try {
            dbConnection = getDBConnection();
            callableStatement1 = dbConnection.prepareCall(insertStoreProc);
            
            //callableStatement1.setString(1, centerCode);
            
            // execute insertDBUSER store procedure
             callableStatement1.execute();
            System.out.println("Record is inserted into DBUSER table!");

        } catch (SQLException e) {
            e.printStackTrace();

            System.out.println(e.getMessage());

        } finally {

            if (callableStatement1 != null) {
                callableStatement1.close();
            }

            if (dbConnection != null) {
                dbConnection.close();
            }

        }

    }
    
    //**********Rent Invoice**************\\
    
     public static void callOracleStoredProcINParameterRentInvoice() throws SQLException {

        Connection dbConnection = null;
        CallableStatement callableStatement1 = null;
        
        String insertStoreProc = "{call sp_rent_invoice()}";
        try {
            dbConnection = getDBConnection();
            callableStatement1 = dbConnection.prepareCall(insertStoreProc);
            
            //callableStatement1.setString(1, centerCode);
            System.out.println("Record is going to inserted into DBUSER table!");
            // execute insertDBUSER store procedure
             callableStatement1.execute();
            System.out.println("Record is inserted into DBUSER table!");

        } catch (SQLException e) {
            e.printStackTrace();

            System.out.println(e.getMessage());

        } finally {

            if (callableStatement1 != null) {
                callableStatement1.close();
            }

            if (dbConnection != null) {
                dbConnection.close();
            }

        }

    }
     
      public static void callOracleStoredProcINParameterRentInvoice1(int sno) throws SQLException {

        Connection dbConnection = null;
        CallableStatement callableStatement1 = null;
        System.out.println("Hi parameter");
        String insertStoreProc = "{call sp_rent_invoice_sno(?)}";
        try {
            dbConnection = getDBConnection();
            callableStatement1 = dbConnection.prepareCall(insertStoreProc);
            
            callableStatement1.setInt(1, sno);
            System.out.println("Record is going to inserted into DBUSER table!");
            // execute insertDBUSER store procedure
             callableStatement1.execute();
            System.out.println("Record is inserted into DBUSER table!");

        } catch (SQLException e) {
            e.printStackTrace();

            System.out.println(e.getMessage());

        } finally {

            if (callableStatement1 != null) {
                callableStatement1.close();
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

        } finally {
            if (dbConnection != null) {
                dbConnection.close();
            }
        }

        try {

            dbConnection = DriverManager.getConnection(
                    DB_CONNECTION, DB_USER, DB_PASSWORD);
            System.out.println("Connection Established Successfull and the DATABASE NAME IS:"
                        + dbConnection.getMetaData().getDatabaseProductName());
            
            System.out.println("XXXXXXXXXXXX - dbConnection in getDBCOnnection is " + dbConnection);
            return dbConnection;

        } catch (SQLException e) {

            System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX SQL Exception");
            System.out.println(e.getMessage());

        } 

        return dbConnection;

    }
}
