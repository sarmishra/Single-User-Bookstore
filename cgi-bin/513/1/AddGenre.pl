#!/usr/bin/perl
use CGI;
$query  = new CGI;
$genre = $query->param("genre");
$submit = $query->param("submit");

if ( $submit eq "Add to List" ) {
  # Print HTML.
  print ( "Content-type: text/html\n\n" );
  

  # Remove leading and trailing spacing.
  $genre =~ s/^\s*(\S*)\s*$/$1/;
  # For security, remove some Unix metacharacters.
  $genre =~ s/;|>|>>|<|\*|\?|\&|\|//g;

  # Compose a Java command.
     $cmd  = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom  AddGenre '$genre' ";
     system( $cmd );

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
</form><br>
<form align = "left">
&nbsp;&nbsp;<input type="submit" value=" Go Home " onclick="history.go(-2);return false;" />
</form>

</div><br>

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

	







