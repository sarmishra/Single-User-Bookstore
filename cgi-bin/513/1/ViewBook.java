// Import the following packages to use JDBC.
import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class  ViewBook {
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

      Statement stmt = conn.createStatement( );
      // String query = "select a.author_id, a.author_name, g.genre_name, b.book_title from author a, book b, genre g, book1 b1, book2 b2 where a.author_id = " + args[0].trim() + " and a.author_id=b1.a_id and b1.isbn=b.isbn and b.isbn=b2.isbn and b2.g_id=g.genre_id";
      String query = "select isbn, book_title from book where isbn = '" + args[0].trim() +"' ";
      ResultSet rset = stmt.executeQuery(  query );
      if ( rset.next( ) ) {
      System.out.println("<br><br><b><u>ISBN: </u></b>" + rset.getString(1) + "<br>");
      System.out.println("<b><u>Book Title: </u></b>" + rset.getString(2) + "<br>");
      }

      System.out.print( "<b><u>Authors:</u></b><br>");
      Statement stmt1 = conn.createStatement( );
      String query1 = "select a.author_name from author a, book1 b1 where b1.isbn = '" + args[0].trim() + "' and b1.a_id=a.author_id";
      ResultSet rset1 = stmt1.executeQuery(  query1 );
      while ( rset1.next() ) {
        System.out.print( rset1.getString(1) + "<br>" );
      }

      System.out.print( "<b><u>Genres:</u> <a href='http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/UpdateGenre.cgi?isbn="+ args[0].trim()+"'> Update Genres </a></b><br>");
      Statement stmt2 = conn.createStatement( );
      String query2 = "select g.genre_name from genre g, book2 b2  where b2.isbn = '" + args[0].trim() + "' and b2.g_id=g.genre_id  ";
      ResultSet rset2 = stmt1.executeQuery(  query2 );
      while ( rset2.next() ) {
        System.out.print( rset2.getString(1) + "<br>" );
      }

     // Close the ResultSet and Statement.
     rset.close( );
     rset1.close( );
     rset2.close( );
     stmt.close( );
     stmt1.close( );
     stmt2.close( );
    }
	
    catch ( SQLException ex ) {
      System.out.println( ex );
    }

    // Close the Connection.
    conn.close( );
  }
}	