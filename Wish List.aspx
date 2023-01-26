<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wish List.aspx.cs" Inherits="APC440_Jandrin_Individual_Final_Project.Wish_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FF9900;
        }
    </style>
</head>
<body class="auto-style1">
    <form id="form1" runat="server">
        <div>
            Wish List<br />
            <asp:LinkButton ID="lnkLogOut" runat="server" OnClick="lnkLogOut_Click">Log Out</asp:LinkButton>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:ImageField DataImageUrlField="Cover Image" HeaderText="Movie Poster">
                        <ControlStyle Height="100px" Width="66px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Movie Description" HeaderText="Movie Description" SortExpression="Movie Description" />
                    <asp:BoundField DataField="Movie Rating" HeaderText="Movie Rating" SortExpression="Movie Rating" />
                    <asp:HyperLinkField DataNavigateUrlFields="Movie Trailer" HeaderText="Movie Trailer" Text="Link To Movie Trailer" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <br />
            <asp:LinkButton ID="lnkSearchPage" runat="server" OnClick="lnkSearchPage_Click">Return To Search Page</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Movie Wish List] WHERE ([UserID] = @UserID) ORDER BY [Title] DESC">
                <SelectParameters>
                    <asp:CookieParameter CookieName="Username" Name="UserID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
