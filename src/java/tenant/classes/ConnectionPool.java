/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.commons.dbcp.DriverManagerConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDataSource;
//mport org.apache.tomcat.dbcp.pool2.impl.GenericObjectPool;
import org.apache.commons.pool.impl.GenericObjectPool;
import org.apache.tomcat.dbcp.pool2.ObjectPool;

/**
 *
 * @author ebs-sdd41
 */
public class ConnectionPool  {
    
  // JDBC Driver Name & Database URL
    
 
     //Local server detaisl
        
        static final String JDBC_DRIVER = "org.postgresql.Driver";
         static final String JDBC_DB_URL = "jdbc:postgresql://localhost:5432/property_management?autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=UTF-8;";
//         // JDBC Database Credentials
	 static final String JDBC_USER = "postgres";
	 static final String JDBC_PASS = "postgres@123";
         
         
          //AWS server detaisl
         
//          static final String JDBC_DRIVER = "org.postgresql.Driver";
//         static final String JDBC_DB_URL = "jdbc:postgresql://arete-invoice-generator.cvgwl3vtizgc.ap-south-1.rds.amazonaws.com:5432/aretehrmswms?autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=UTF-8;";
////         // JDBC Database Credentials
//	 static final String JDBC_USER = "postgres";
//	 static final String JDBC_PASS = "postgres#123";

        
        //static final String JDBC_PASS = "p@ssw0rd";
        private static GenericObjectPool gPool = null;
	private static DataSource dataSource = null;

	 static {
            try {
                Class.forName(JDBC_DRIVER);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ConnectionPool.class.getName()).log(Level.SEVERE, null, ex);
            }
try { 
		// Creates an Instance of GenericObjectPool That Holds Our Pool of Connections Object!
		gPool = new GenericObjectPool();
		gPool.setMaxActive(50);
		
		gPool.setTestOnBorrow(true);
		gPool.setTestOnReturn(true);
		gPool.setWhenExhaustedAction(GenericObjectPool.WHEN_EXHAUSTED_GROW);
		

		// Creates a ConnectionFactory Object Which Will Be Use by the Pool to Create the Connection Object!
		ConnectionFactory cf = new DriverManagerConnectionFactory(JDBC_DB_URL, JDBC_USER, JDBC_PASS);

		// Creates a PoolableConnectionFactory That Will Wraps the Connection Object Created by the ConnectionFactory to Add Object Pooling Functionality!
		PoolableConnectionFactory pcf = new PoolableConnectionFactory(cf, gPool, null, null, false, true);
		dataSource= new PoolingDataSource(gPool);
                
                System.out.println("inside static block :: " + dataSource);
               }catch(Exception e) {
             e.printStackTrace();
                }
	}

	public GenericObjectPool getConnectionPool() {
            System.out.println("inside getConnectionPool :: " + gPool);
		return gPool;
	}
	public static DataSource getDataSource() {
            System.out.println("inside getDataSource :: " + dataSource);
		return dataSource;
	}   
 
}
