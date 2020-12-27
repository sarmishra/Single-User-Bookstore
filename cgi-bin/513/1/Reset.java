// Import the following packages to use JDBC.
import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class  Reset {
  public static void  main( String args[ ] ) throws SQLException {
    String user     = "C##saroj.mishra";
    String password = "saroj5284";
    String database = "65.52.222.73:1521/cdb1";

	// Open an OracleDataSource and get a connection.
    OracleDataSource ods = new OracleDataSource( );
    ods.setURL     ( "jdbc:oracle:thin:@" + database );
    ods.setUser    ( user );
    ods.setPassword( password );
    Connection conn = ods.getConnection( );

    try {
	// Add author to the database.
      Statement stmt = conn.createStatement( );
      String querybook, queryauthor, querygenre, querybook1, querybook2; 	

     ResultSet rset;
     queryauthor = "Delete from Author";
     stmt.executeUpdate(queryauthor);
     querybook = "Delete from Book";
     stmt.executeUpdate(querybook);
     querygenre = "Delete from Genre";
     stmt.executeUpdate(querygenre);
     querybook2 = "Delete from Book1";
     stmt.executeUpdate(querybook);
     querybook2 = "Delete from Book2";
     stmt.executeUpdate(querybook);

     System.out.println("<br><br><br><h2 align = center>Deleted all the tables data!!!</h2><br>");

     // Close the ResultSet and Statement.
     stmt.close( );
    }

    catch ( SQLException ex ) {
      System.out.println( ex );
    }

    // Close the Connection.
    conn.close( );
  }
}	