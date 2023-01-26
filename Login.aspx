<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="APC440_Jandrin_Individual_Final_Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {}
        .auto-style3 {}
        .auto-style4 {}
        .auto-style5 {}
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            background-color: #FF9900;
        }
    </style>
</head>
<body class="auto-style7">
    <form id="form1" runat="server">
        <div class="auto-style6">
            Login<br />
            <br />
            <asp:Image ID="imgLoginCamera" runat="server" CssClass="auto-style1" Height="148px" Width="175px" ImageUrl="~/Images/cinema-movie.jpg" />
            <br />
            <asp:Label ID="lblSuccessfulRegistration" runat="server"></asp:Label>
            <br />
            <br />
            Username:<br />
            <asp:TextBox ID="txtUsername" runat="server" CssClass="auto-style3" Width="175px"></asp:TextBox>
            <br />
            <asp:Label ID="lblUsernameError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            Password:<br />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style4" Width="175px"></asp:TextBox>
            <br />
            <asp:Label ID="lblPasswordError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" CssClass="auto-style2" OnClick="btnLogin_Click" Text="Login" Width="175px" />
            <br />
            <br />
            <asp:Button ID="btnRegister" runat="server" CssClass="auto-style5" OnClick="btnRegister_Click" Text="Register" Width="175px" />
            <br />
            <asp:Label ID="lblSqlError" runat="server" ForeColor="#FF9900"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
