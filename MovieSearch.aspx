<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieSearch.aspx.cs" Inherits="APC440_Jandrin_Individual_Final_Project.MovieSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {}
        .auto-style3 {
            background-color: #FF9900;
        }
    </style>
</head>
<body class="auto-style3">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblWelcomeUser" runat="server"></asp:Label>
            <br />
            <asp:LinkButton ID="lnkLogOut" runat="server" OnClick="lnkLogOut_Click">Logout</asp:LinkButton>
            <br />
            <br />
            Search By Movie Title:<br />
            <asp:TextBox ID="txtTitleSearch" runat="server" CssClass="auto-style2" Width="125px"></asp:TextBox>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" PageSize="5" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <Columns>
                    <asp:ImageField DataImageUrlField="Cover_Image" HeaderText="Movie Poster">
                        <ControlStyle Height="100px" Width="66px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Movie_Rating" HeaderText="Movie_Rating" SortExpression="Movie_Rating" />
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Movie Detail.aspx?t={0}" Text="More Details..." />
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
            <asp:LinkButton ID="lnkWishList" runat="server" OnClick="lnkWishList_Click">Go To Wish List</asp:LinkButton>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Cover Image] AS Cover_Image, [Title], [Movie Rating] AS Movie_Rating, [Id] FROM [Movie List] WHERE ([Title] LIKE '%' + @Title + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtTitleSearch" DefaultValue="%%" Name="Title" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
