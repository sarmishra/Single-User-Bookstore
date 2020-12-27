#Login.pl

#!/usr/bin/perl
use CGI;
$query   = new CGI;
$username = $query->param("username");
$password = $query->param("password");

$username =~ s/^\s*(\S*)\s*$/$1/;
$username =~ s/;|>|>>|<|\*|\?|\&|\|//g;
$password =~ s/^\s*(\S*)\s*$/$1/;
$password =~ s/;|>|>>|<|\*|\?|\&|\|//g;


if ( $password eq "saroj123" ) {
  print ( "Content-type: text/html\n\n" );

    system( "/bin/cat ../../../513/1/home.html" );

}
else {
  print ( "Content-type: text/html\n\n" );

print <<EndofHTML;
<html>
<head>
  <link rel="stylesheet" type="text/css" href="http://undcemcs02.und.edu/~saroj.mishra/513/1/style.css" />
  <link rel="icon" type="image/jpg" sizes="50*50" href="https://www.fccnn.com/sports/article785186.ece/alternates/LANDSCAPE_560/3221322%2Bund-sports-logo-words.jpg">

</head>
  <title> Online Bookstore </title>

<div class="login-page">
  <div class="form-mainpage">
<legend> <script>alert('Username or Password is not Correct, Try Again !')</script> </legend>

	<div class="login">
	<h3 align = "center" style="color:gray;">Welcome to the UND BookStore</h3><br> 
   	<form method="post" action="http://undcemcs02.und.edu/~saroj.mishra/cgi-bin/513/1/Login.cgi">
    	<input type="text" name="username" value="513" required="required" />
        <input type="password" name="password" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">Login</button>
    	</form>
	</div>

	
  </div>
</div>
<div style="position: relative; font-size:80%">
  <p style="position: fixed; bottom: 0; width:100%; text-align: center">© 2020 Saroj Mishra – University of North Dakota, SEECS</p>
 </div>

</html>
EndofHTML

}
