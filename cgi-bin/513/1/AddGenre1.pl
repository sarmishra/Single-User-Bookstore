#!/usr/bin/perl
use CGI;
$query  = new CGI;
$genre = $query->param("genre");
$submit = $query->param("submit");
$isbn = $query->url_param( 'isbn' );


# Remove leading and trailing spacing.
$genre =~ s/^\s*(\S*)\s*$/$1/;
# For security, remove some Unix metacharacters.
$genre =~ s/;|>|>>|<|\*|\?|\&|\|//g;

if ( $submit eq "Add to List" ) {
  # Print HTML.
  print ( "Content-type: text/html\n\n" );
  
print <<EndofHTML;
	<html>
	<head>
	<title>Update Genre</title>
	<link rel="icon" type="image/jpg" sizes="50*50" href="https://www.fccnn.com/sports/article785186.ece/alternates/LANDSCAPE_560/3221322%2Bund-sports-logo-words.jpg">
	</head>
	<body  style="background-color:Skyblue">
	<form align = "left">
	<br><br>
         <input type="submit" value=" Go Back " onclick="history.go(-1);return false;" />
        </form>
	<form align = "left">
        <input type="submit" value=" Go Home " onclick="history.go(-5);return false;" />
        </form>
	</body>
	 <div style="position: relative; font-size:80%">
	  <p style="position: fixed; bottom: 0; width:100%; text-align: center">© 2020 Saroj Mishra – Grand Forks, ND - SEECS</p>
	 </div>
	</html>
EndofHTML

 
  # Compose a Java command.
     $cmd  = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom  AddGenre '$genre' ";
     system( $cmd );


print <<EndofHTML;
	<html>
	<h2 align = "center"><u> Update Book's Genres </u></h2> <br>
	<table width="100%"><tr><td>
	<form align = "center" method="post" action="http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/AddGenre1.cgi?isbn=$isbn">
   	Genre:
  	<input type="text" name="genre" required="required" placeholder = "Genre" size="15" /><br>
  	<input type="submit" name="submit" value="Add to List" />&nbsp;
	</form></td></tr><br>

	<table align = "center" >
	<br><br>
	<tr><td width="350"><b>Genres List<b></td> 	
	<td width="120"><b>Existing Genres</b></td></tr>
	<tr><td>
	<form method="post" action="http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/AddNewGenre.cgi?isbn=$isbn" >
	<select name="genre" multiple size="3" style="width: 150px;">
EndofHTML

	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom Genre ";
	system($cmd);

print <<EndofHTML;
	</select><br>
	<input type="submit" name="submit" value="Add Genres">
	</td></form>
	<td>
	<form method="post" align = "center" action="http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/AddNewGenre.cgi?isbn=$isbn" >
	<select name="upgenre" multiple size="3" style="width: 150px;">
EndofHTML

	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom ExistGenre '$isbn' "; 
	system( $cmd );

	print <<EndofHTML;
	</select><br>
	<input type = "submit" name = "submit" value = "Delete Genres" >
	</td></tr>
	</table>
	</form><br><br>
	<form method="post" align = "center" action="http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/ViewBook.cgi?isbn=$isbn" >
	<input type = "submit" name = "act" value = "View Updated Book">
	</form>
	</html>
EndofHTML
	
}






