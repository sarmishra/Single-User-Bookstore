// Import the following packages to use JDBC.
import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class  ExistGenre {
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
	// Select Genre Table: 
      Statement stmt = conn.createStatement( );
      String query = "select g.genre_id, g.genre_name from genre g, book2 b2  where b2.isbn = '" + args[0].trim() + "' and b2.g_id=g.genre_id";
	
      // System.out.println( "<b>" + query + "</b>" + "<br>" + "<br>");
      ResultSet rset = stmt.executeQuery(query );

      // Iterate through the result and print the data.

      // System.out.print("<br><br>");
      while ( rset.next( ) ) {

        System.out.print(  "<option value ='" + rset.getString(1) + "'>" + rset.getString(2) + "</option>");
        

	}

     // Close the ResultSet and Statement.
     rset.close( );
     stmt.close( );
    }
	
    catch ( SQLException ex ) {
      System.out.println( ex );
    }

    // Close the Connection.
    conn.close( );
  }
}	