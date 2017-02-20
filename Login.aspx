<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
            padding-left: 100px;
            padding-top: 70px;
        }       
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="heading">
            <asp:LinkButton runat="server" ID="homebutton" OnClick="homebutton_Click" Font-Size="XX-Large"><b>BookShelf.com</b></asp:LinkButton>
            
        </div>

        <div class="buddy">
            <asp:Table ID="LoginTable" runat="server">

                <asp:TableRow>
                    <asp:TableCell>Email:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="EmailTB" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Password:&nbsp;</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="PassTB" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>
                        <asp:CheckBox ID="RememberMeCB" runat="server" Text="Remember Me" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Panel ID="MessagePanel" runat="server" Visible="false" CssClass="Panel Message">
                <asp:Label ID="Message" runat="server" Text=""></asp:Label>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
