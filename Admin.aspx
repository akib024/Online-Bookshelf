<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator</title>

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
        .heading {
            margin-top: 0px;
            padding-left: 100px;
            padding-top: 30px;
            color: white;
            background-color: #3366FF;
            height: 100px;
        }
        .buddy {
            margin-top: 70px;
            padding-left: 100px;
        }      
        #LogoutButton {
            //background-color: cornsilk;
            color: cornsilk;
            margin-left: 1100px;
        }
        .footer {
            background-color:#3366FF ;
            height: auto;
            text-align: center;
            height: 40px;
            margin-top: 350px;
        }   
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="heading">
            <asp:LinkButton runat="server" ID="homebutton" OnClick="homebutton_Click" Font-Size="XX-Large"><b>BookShelf.com</b></asp:LinkButton>
            <asp:LinkButton ID="LogoutButton" runat="server" Text="Logout" OnClick="LogoutButton_Click"></asp:LinkButton>
        </div>

        <div>
            
        </div>
        <asp:Table runat="server" CssClass="buddy">
            <asp:TableRow>
                <asp:TableCell><asp:Label runat="server">Category:</asp:Label></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="CategoryList" runat="server">
                    <asp:ListItem Value="islamic">Islamic</asp:ListItem>
                    <asp:ListItem Value="engr">Engineering</asp:ListItem>
                    <asp:ListItem Value="literature">Literature</asp:ListItem>
                    <asp:ListItem Value="novel">Novel</asp:ListItem>
                    <asp:ListItem Value="programming">Programming</asp:ListItem>
                </asp:DropDownList></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Select pdf file:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:TableCell>
                
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell ><asp:FileUpload ID="FileUploadControl" runat="server" Width="171px" /></asp:TableCell>
            </asp:TableRow>
                

            <asp:TableRow>
                <asp:TableCell><asp:TableCell><asp:Button ID="UploadButton" runat="server" Text="Add File" OnClick="UploadButton_Click" /></asp:TableCell></asp:TableCell>
                <asp:TableCell><asp:TableCell><asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label></asp:TableCell></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        
       
            
            
        <div class="footer">
            &copy; CSE 2K11 | Designed by Mehedi Hasaan Ani.

        </div>
            
        
    </form>
</body>
</html>
