// Import the following packages to use JDBC.
import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class  ViewAll {
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
	// Select Book Table: 
      Statement stmt1 = conn.createStatement( );
      String query1 = "select author_id, author_name from author";
      Statement stmt2 = conn.createStatement( );
      String query2 = "select isbn, book_title from book";
      Statement stmt3 = conn.createStatement( );
      String query3 = "select genre_id, genre_name from genre";
  
      ResultSet rset1 = stmt1.executeQuery(  query1 );
      ResultSet rset2 = stmt2.executeQuery(  query2 );
      ResultSet rset3 = stmt3.executeQuery(  query3 );

      // Iterate through the result and print the data.

      System.out.print("<br><h2 align = center ><u>BookStore Informations:</u></h2><br>");

	
      System.out.print( " <table align = left>");

      while ( rset1.next( ) ) {

 	System.out.print( "<a href='http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/ViewAuthor.cgi?author_id="+ rset1.getString(1)+"'>" + rset1.getString(2) + "<a><br>" );

      }
     System.out.print( "</table>");

System.out.print( " <table align = center>");

   while ( rset2.next( ) ) {

 	System.out.print( "<a href='http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/ViewBook.cgi?isbn="+ rset2.getString(1)+"'>" + rset2.getString(2) + "<a><br>" );

      }
     System.out.print( "</table>");


System.out.print( " <table align = right>");

  while ( rset3.next( ) ) {

 	System.out.print( "<a href='http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/ViewGenre.cgi?genre_id="+ rset3.getString(1)+"'>" + rset3.getString(2) + "<a><br>" );


      }
     System.out.print( "</table>");

     // Close the ResultSet and Statement.
     stmt1.close( );
     stmt2.close( );
     stmt3.close( );
     rset1.close( );
     rset2.close( );
     rset3.close( );

    }
	
    catch ( SQLException ex ) {
      System.out.println( ex );
    }

    // Close the Connection.
    conn.close( );
  }
}	