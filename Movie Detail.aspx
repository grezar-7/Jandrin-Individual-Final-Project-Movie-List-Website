<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movie Detail.aspx.cs" Inherits="APC440_Jandrin_Individual_Final_Project.Movie_Detail" %>

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
            Movie Details&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lnkLogOut" runat="server" OnClick="lnkLogOut_Click">Log Out</asp:LinkButton>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:ImageField DataImageUrlField="Cover Image" HeaderText="Movie Poster">
                    </asp:ImageField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Movie Description" HeaderText="Movie Description" SortExpression="Movie Description" />
                    <asp:BoundField DataField="Movie Rating" HeaderText="Movie Rating" SortExpression="Movie Rating" />
                    <asp:HyperLinkField DataNavigateUrlFields="Movie Trailer" Text="Link to Trailer" HeaderText="Movie Trailer" />
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
            <asp:Button ID="btnAddtoWishlist" runat="server" OnClick="btnAddtoWishlist_Click" Text="Add Movie to Wish List" />
            <br />
            <asp:Label ID="lblSqlError" runat="server"></asp:Label>
            <br />
            <asp:LinkButton ID="lnkMovieSearch" runat="server" OnClick="lnkMovieSearch_Click">Return To Search Page</asp:LinkButton>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Movie List] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="Id" QueryStringField="t" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Movie Wish List]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
