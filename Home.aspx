<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="Styles/StyleSheet.css" rel="stylesheet" />

    <style type="text/css">
        html, body {
            padding: 0px;
            margin: 0px;
            font-family: Arial;
            background-color:cornsilk;
        }
        .heading a {
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
            float: left;
        }
        #LogoutButton {
            //background-color: cornsilk;
            color: cornsilk;
            margin-left: 1100px;
        }
        .buddy ul {
        }
            .buddy ul li {
            }
                .buddy ul li a {
                    display: block;
                    width: 110px;
                    line-height: 40px;
                    text-align: center;
                    background-color: #3366FF;
                    color: wheat;
                }
                    .buddy ul li a:hover {
                        background-color: wheat;
                        color: #3366FF;
                    }
        .greed {
            margin-left: 200px;
            margin-top: 20px;
            min-height: 400px;
            margin-left: 28%;
            margin-bottom: 30px;
        }
        .footer {
            background-color:#3366FF ;
            height: auto;
            text-align: center;
            height: 40px;
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
        <div>
            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Categories</h3>
            <hr />
            <menu class="buddy" id="menu" runat="server">
                <ul>
                    <li>
                        <asp:LinkButton ID="Islamic" runat="server" Text="Islamic" OnClick="Islamic_Click"></asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="Engineering" runat="server" Text="Engineering" OnClick="Engineering_Click"></asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="Literature" runat="server" Text="Literature" OnClick="Literature_Click"></asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="Novel" runat="server" Text="Novel" OnClick="Novel_Click"></asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="Programming" runat="server" Text="Programming" OnClick="Programming_Click"></asp:LinkButton>
                    </li>
                </ul>
            </menu>
        </div>
        

        <div class="greed">
            <asp:Label runat="server" ID="categorylabel" ></asp:Label>
            <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
                AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None"
                OnRowCommand="GridView_RowCommand" OnRowDataBound="GridView_RowDataBound" Width="700px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="No.">
                        <ItemStyle Width="50px" Font-Size="Small" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="filename" HeaderText="File Name" SortExpression="filename" />
                    <asp:BoundField DataField="filesize" HeaderText="File size" SortExpression="filesize" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="DownloadLink" runat="server" Text="Download" CommandName="DownloadCommand"
                                CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Font-Size="X-Small" ForeColor="#3366FF" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" Height="50px" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Connection %>"
                DeleteCommand="DELETE FROM [Files] WHERE [Id] = @Id"
                InsertCommand="INSERT INTO [Files] ([filename], [filepath], [category], [filesize]) VALUES (@filename, @filepath, @category, @filesize)"
                ProviderName="<%$ ConnectionStrings:Connection.ProviderName %>"
                SelectCommand="SELECT [Id], [filename], [filepath], [category], [filesize] FROM [Files] WHERE [category] = @category"
                UpdateCommand="UPDATE [Files] SET [filename] = @filename, [filepath] = @filepath, [category] = @category, [filesize] = @filesize WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:SessionParameter Name="category" SessionField="category" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="filename" Type="String" />
                    <asp:Parameter Name="filepath" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="filesize" Type="Int64" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="filename" Type="String" />
                    <asp:Parameter Name="filepath" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="filesize" Type="Int64" />
                    <asp:Parameter Name="Id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>

            

        </div>
        <div class="footer">
            &copy; CSE 2K11 | Designed by Mehedi Hasaan Ani.

        </div>
    </form>
</body>
</html>
