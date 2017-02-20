<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="Styles/StyleSheet.css" rel="stylesheet" />

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

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="buddy">
            <asp:Table ID="RegistrationTable" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Name:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="NameTB" runat="server">
                        </asp:TextBox>
                    </asp:TableCell>

                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="NameValid" runat="server" CssClass="ValidationError" ErrorMessage="Name required" ControlToValidate="NameTB"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Email:</asp:TableCell>
                    <asp:TableCell>

                        <asp:UpdatePanel ID="EmailUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="EmailTB" runat="server" TextMode="Email" AutoPostBack="true" OnTextChanged="EmailTB_TextChanged"></asp:TextBox>
                                <asp:Label ID="UserExistLabel" runat="server" Text="User already exists" Visible="false"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="EmailValid" runat="server" CssClass="ValidationError" ErrorMessage="Email required" ControlToValidate="EmailTB"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Password:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="PassTB" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="PassValid" runat="server" CssClass="ValidationError" ErrorMessage="Password cannot be empty" ControlToValidate="PassTB"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Confirm Password:&nbsp;</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="ConfirmPassTB" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CompareValidator CssClass="ValidationError" ControlToCompare="ConfirmPassTB" ControlToValidate="PassTB" runat="server" ErrorMessage="Passwords don't match"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="RegisterButton" runat="server" OnClick="RegisterButton_Click" Text="Register" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Panel ID="StatusPanel" runat="server" Visible="false">
                <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
                <asp:Button ID="Next" runat="server" Text="Next" OnClick="Next_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
