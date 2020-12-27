// Import the following packages to use JDBC.
import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class  ListAuthors {
  public static void  main( String args[ ] ) throws SQLException {
    String user     = "C##saroj.mishra";
    String password = "saroj5284";
    String database = "65.52.222.73:1521/cdb1";

	//Open an OracleDataSource and get a connection.
    OracleDataSource ods = new OracleDataSource( );
    ods.setURL     ( "jdbc:oracle:thin:@" + database );
    ods.setUser    ( user );
    ods.setPassword( password );
    Connection conn = ods.getConnection( );

    try {
	// List of Authors 
      Statement stmt = conn.createStatement( );
      String query = "select author_id, author_name from author";
       
      ResultSet rset = stmt.executeQuery(  query );

      // Iterate through the result and print the data.

      System.out.print("<br><br>");
	
      System.out.print( " <table align = center border = 1 width = 200 height = 180> <tr><th>" + "Author's Lists:" + "</th></tr>");

      while ( rset.next( ) ) {

 	System.out.print( "<tr><td> <a href='http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/ViewAuthor.cgi?author_id="+ rset.getString(1)+"'>" + rset.getString(2) + "<a><br></td></tr>" );

      }
     System.out.print( "</table>");

     // Close the ResultSet and Statement.
     stmt.close( );
     rset.close( );

    }
	
    catch ( SQLException ex ) {
      System.out.println( ex );
    }

    // Close the Connection.
    conn.close( );
  }
}	