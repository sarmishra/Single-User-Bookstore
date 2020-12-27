#Homepage

#!/usr/bin/perl
use CGI;
$query  = new CGI;
$act    = $query->param( 'act' );
$password = $query->param( 'password' );
$interface = $query->param( 'interface' );

$password =~ s/^\s*(\S*)\s*$/$1/;
$password=~ s/;|>|>>|<|\*|\?|\&|\|//g;


#Add Books
if ( $act eq "Add Book" ) {
  # Print HTML.
  print ( "Content-type: text/html\n\n" );

print <<EndofHTML;
	<!DOCTYPE html>
	<html>
	<head>
	<title>Add Book</title>

	<link rel="icon" type="image/jpg" sizes="50*50" href="https://www.fccnn.com/sports/article785186.ece/alternates/LANDSCAPE_560/3221322%2Bund-sports-logo-words.jpg">
	</head>

	<body  style="background-color:#009a44;">
 
	<h1 align= "center" style="color:#00008B; font-family:verdana; font-size:200%; background-color:LightGray; border: 2px solid black; padding: 5px;"><b> UND Online Bookstore</b></h1><br>

	<form align = "left">
	&nbsp;&nbsp;<input type="submit" value=" Go Back " onclick="history.go(-1);return false;" />
	</form>
	<br>
	<h2 align = "center"><u> Add Books </u></h2> <br>
	<table width="100%"><tr><td>
	<form align = "center" method="post" action="http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/AddGenre.cgi">
   	&nbsp;&nbsp;Genre:
  	&nbsp;&nbsp;<input type="text" name="genre" required="required" placeholder = "Genre" size="15" /><br>
  	&nbsp;&nbsp;<input type="submit" name="submit" value="Add to List" />&nbsp;
	</form> <br><br>


	<form align = "center" method="post" action="http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/AddBook.cgi">
	Select Genres:<br>
	<select name="genre" multiple size="3" style="width: 150px;">
EndofHTML

	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom Genre ";
	system($cmd);


print <<EndofHTML;
	</select></td><td><center>
  	&nbsp;&nbsp;Book Title:&nbsp;
  	&nbsp;&nbsp;<input type="text" name="btitle" required="required" placeholder = "Book Title" size="30" /><br><br>
  	&nbsp;&nbsp;ISBN:
 	&nbsp;&nbsp;<input type="text" name="isbn" required="required"  placeholder = "ISBN" size="20" /> <br><br>
  	&nbsp;&nbsp;Select Author(s):<br>
  	<select name="author" multiple size="3"  style="width: 160px;">
EndofHTML

	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom Author ";
	system($cmd);

print <<EndofHTML;
	</select></center></td></tr>
  	<br><br>
	<tr><td colspan = "2"><center><br><br>
  	<input type="submit" name="submit" value="Add Book" />&nbsp;
  	<input type="reset"  value="Clear" />&nbsp;
	</td></tr>
	</form> 
	</table>
	</body>
 <div style="position: relative; font-size:80%">
  <p style="position: fixed; bottom: 0; width:100%; text-align: center">© 2020 Saroj Mishra – Grand Forks, ND - EECS</p>
 </div>
</html>

EndofHTML

}


elsif ( $act eq "Add Author" ) {
  # Print HTML.
  print ( "Content-type: text/html\n\n" );
  system( "/bin/cat ../../../513/1/AddAuthor.html" );

}


elsif ( $act eq "View All Data" ) {
  # Print HTML.
  print ( "Content-type: text/html\n\n" );
  system( "/bin/cat ../../../513/1/ViewAll.html" );

}


# Source code display part
elsif ($act eq "Display Source"){
   if ($password eq "saroj123"){
     print ( "Content-type: text/plain\n\n" );
     if ($interface == 1){
     system( "/bin/cat ../../../513/1/index.html; echo '\n\n\n\n'; /bin/cat Login.cgi; echo '\n\n\n\n'; /bin/cat Login.pl");
	}
     elsif ( $interface == 2 ) {
     system( "/bin/cat ../../../513/1/home.html; echo '\n\n\n\n'; /bin/cat BookStore.cgi; echo '\n\n\n\n'; /bin/cat BookStore.pl; echo '\n\n\n\n'; /bin/cat ViewAll.java");
	}
    elsif ( $interface == 3 ) {
     system( "/bin/cat ../../../513/1/ViewAll.html; echo '\n\n\n\n'; /bin/cat ViewAll.cgi; echo '\n\n\n\n'; /bin/cat ViewAll.pl");
	}
     elsif ( $interface == 4 ) {
     system( "/bin/cat ViewBook.cgi; echo '\n\n\n\n'; /bin/cat ViewBook.pl; echo '\n\n\n\n'; /bin/cat ViewBook.java");
	}
    elsif ( $interface == 5 ) {
     system( "/bin/cat ViewAuthor.cgi; echo '\n\n\n\n'; /bin/cat ViewAuthor.pl; echo '\n\n\n\n'; /bin/cat ViewAuthor.java");
	}
    elsif ( $interface == 6 ) {
     system( "/bin/cat ViewGenre.cgi; echo '\n\n\n\n'; /bin/cat ViewGenre.pl; echo '\n\n\n\n'; /bin/cat ViewGenre.java");
	}
    elsif ( $interface == 7 ) {
     system( "/bin/cat ../../../513/1/AddAuthor.html; echo '\n\n\n\n'; /bin/cat AddAuthor.cgi; echo '\n\n\n\n'; /bin/cat AddAuthor.pl; echo '\n\n\n\n'; /bin/cat AddAuthor.java");
	}
    elsif ( $interface == 8 ) {
     system( "/bin/cat ../../../513/1/AddBook.html; echo '\n\n\n\n'; /bin/cat AddBook.cgi; echo '\n\n\n\n'; /bin/cat AddBook.pl; echo '\n\n\n\n'; /bin/cat AddBook.java; echo '\n\n\n\n'; /bin/cat AddBook1.java; echo '\n\n\n\n'; /bin/cat AddBook2.java" );
	}
    elsif ( $interface == 9 ) {
     system( " echo '\n\n\n\n'; /bin/cat AddGenre.cgi; echo '\n\n\n\n'; /bin/cat AddGenre.pl; echo '\n\n\n\n'; /bin/cat AddGenre.java echo '\n\n\n\n'; /bin/cat UpdateGenre.cgi; echo '\n\n\n\n'; /bin/cat UpdateGenre.pl" );
	}    
    elsif ( $interface == 10 ) {
     system( " echo '\n\n\n\n'; /bin/cat AddGenre1.cgi; echo '\n\n\n\n'; /bin/cat AddGenre1.pl; echo '\n\n\n\n'; /bin/cat AddNewGenre.cgi; echo '\n\n\n\n'; /bin/cat AddNewGenre.pl; echo '\n\n\n\n'; /bin/cat AddNewGenre.java " );
	}  
    elsif ( $interface == 11 ) {
     system( " echo '\n\n\n\n'; /bin/cat Author.java; echo '\n\n\n\n'; /bin/cat Genre.java; echo '\n\n\n\n'; /bin/cat DeleteGenre.java; echo '\n\n\n\n'; /bin/cat ExistGenre.java" );
	}    
    elsif ( $interface == 12 ) {
     system( " echo '\n\n\n\n'; /bin/cat ListAuthors.java; echo '\n\n\n\n'; /bin/cat ListGenres.java; echo '\n\n\n\n'; /bin/cat ListTitles.java; echo '\n\n\n\n'; /bin/cat Reset.java" );
	}    

    elsif ( $interface eq "help" ) {
     system( "/bin/cat ../../../513/1/Help.html;" );
	}

    else {
      print( "\n\n\n  No such interface: $interface" );
    }

}

else {
  print( "Content-type: text/html\n\n" );
  print( "<br><br> <h3 align = center>Enter a correct password!</h3>" );

print <<EndofHTML;
	<html>
	<head>
	<title>Incorrect Password</title>
	<link rel="icon" type="image/jpg" sizes="50*50" href="https://www.fccnn.com/sports/article785186.ece/alternates/LANDSCAPE_560/3221322%2Bund-sports-logo-words.jpg">
	</head>
	<body  style="background-color:Skyblue">
	<form align = "center">
	<br><br><br>
         <input type="submit" value=" Go Back " onclick="history.go(-1);return false;" />
        </form>
        </div>

	</body>
	 <div style="position: relative; font-size:80%">
	  <p style="position: fixed; bottom: 0; width:100%; text-align: center">© 2020 Saroj Mishra – University of North Dakota - SEECS</p>
	 </div>
	</html>
EndofHTML

}
}


elsif ( $act eq "Reset" ) {
  # Print HTML.
  print ( "Content-type: text/html\n\n" );

print <<EndofHTML;
	<html>
	<head>
	<title>Reset All Data</title>
	<link rel="icon" type="image/jpg" sizes="50*50" href="https://www.fccnn.com/sports/article785186.ece/alternates/LANDSCAPE_560/3221322%2Bund-sports-logo-words.jpg">
	</head>
	<body  style="background-color:Skyblue">
	</body>
	 <div style="position: relative; font-size:80%">
	  <p style="position: fixed; bottom: 0; width:100%; text-align: center">© 2020 Saroj Mishra – Grand Forks, ND - EECS</p>
	 </div>
	</html>
EndofHTML


 # Compose a Java command.
     $cmd  = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom  Reset ";
     system( $cmd );
	

print <<EndofHTML;
        <form align = "center">
	<br><br><br>
         <input type="submit" value=" Go Back " onclick="history.go(-1);return false;" />
        </form>
        </div>
   </body>
  </html>
EndofHTML

}


elsif ( $act eq "Help" ) {
  # Print HTML.
  print ( "Content-type: text/html\n\n" );
  system( "/bin/cat ../../../513/1/Help.html" );

}

else {
  print( "Content-type: text/html\n\n" );
  print( "<br><br> <h3 align = center> No such option: <em>$act</em> " );
}


