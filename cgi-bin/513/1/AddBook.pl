#!/usr/bin/perl
use CGI;
$query  = new CGI;
$isbn = $query->param("isbn");
$btitle = $query->param("btitle");
$submit = $query->param("submit");
$isbn =~ s/;|>|>>|<|\*|\?|\&|\|//g;
$isbn =~ s/^\s*(\S*)\s*$/$1/;
$btitle =~ s/^\s*(\S*)\s*$/$1/;
$btitle =~ s/;|>|>>|<|\*|\?|\&|\|//g;



if ( $submit eq "Add Book" ) {
  print ( "Content-type: text/html\n\n" );

print <<EndofHTML;
		
	<!DOCTYPE html>
	<html>
	<head>
	<title>Add Book</title>

	<link rel="icon" type="image/jpg" sizes="50*50" href="https://www.fccnn.com/sports/article785186.ece/alternates/LANDSCAPE_560/3221322%2Bund-sports-logo-words.jpg">
	</head>
	<body  style="background-color:Skyblue">

	<form align = "center">
	<br><br><br><br>
	<h3> Successfully added Book!!! </h3>
	<br><br><br>
        <input type="submit" value=" Go Back " onclick="history.go(-1);return false;" />
        <br><br>
	<input type="submit" value=" Go Home " onclick="history.go(-2);return false;" />
        </form>
	</body>
 	<div style="position: relative; font-size:80%">
  	<p style="position: fixed; bottom: 0; width:100%; text-align: center">© 2020 Saroj Mishra – Grand Forks, ND - EECS</p>
 	</div>
	</html>

EndofHTML

  
  # Compose a Java command.
  $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom AddBook '";
  $cmd .= $isbn . "' '" . $btitle . "'";
  system( $cmd );
  #print($cmd);

  $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom AddBook1 '";
  $cmd .= $isbn . " ' ";
  my @authors = $query->param('author');
  foreach my $author (@authors) {  $cmd .= "'" . $author . "' "; }
  system($cmd);
  #print($cmd);

  
  $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom AddBook2 '";
  $cmd .= $isbn . " ' ";
  my @genres = $query->param('genre');
  foreach my $genre (@genres) {  $cmd .= "'" . $genre . "' "; }
  system($cmd);
  #print($cmd);	  
  

}

