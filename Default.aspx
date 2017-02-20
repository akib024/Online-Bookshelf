<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookShelf.com</title>

    <style type="text/css">
        html, body {
            padding: 0px;
            margin: 0px;
            font-family: Arial;
            background-color:cornsilk;
        }
        a {
            text-decoration: none;
            color: white;
        }
        #reg {
            color: #3366FF;
            text-decoration: none;
        }
        #log {
            
            color: #3366FF;
            text-decoration: none;
        
        }
        .heading {
            margin-top: 0px;
            padding-left: 100px;
            padding-top: 30px;
            color: white;
            background-color: #3366FF;
            height: 100px;
        }
        .buddy {
            text-align: center;
        }     
        .footer {
            background-color:#3366FF ;
            height: auto;
            text-align: center;
            height: 40px;
            margin-top: 350px;
            color: wheat;
        }   
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <div class="heading">
            <asp:LinkButton runat="server" ID="homebutton" OnClick="homebutton_Click" Font-Size="XX-Large"><b>BookShelf.com</b></asp:LinkButton>
            
        </div>


    <div class="buddy">
        <br /><br /><br /><br /><br />
        Welcome to Bookshelf.com

        <p>
            To use our website, please <a href="Register.aspx" id="reg">Register</a>, or <a href="Login.aspx" id="log">Login</a>
        </p>

        <div class="footer">
            &copy; CSE 2K11 | Designed by Mehedi Hasaan Ani.

        </div>
    </div>
        
    </form>
</body>
</html>
