<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="APC440_Jandrin_Individual_Final_Project.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            background-color: #FF9900;
        }
        .auto-style2 {
            background-color: #FF9900;
        }
    </style>
</head>
<body class="auto-style2">
    <form id="form1" runat="server">
        <div class="auto-style1">
            Register<br />
            <br />
            Username:<br />
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblUsernameError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            First Name:<br />
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblFirstNameError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            Password:<br />
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblPasswordError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            Confirm Password:<br />
            <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblConfirmPasswordError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lblSqlError" runat="server" ForeColor="#FF9900"></asp:Label>
            <br />
            <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
            <br />
            <br />
            <asp:LinkButton ID="lnkAlreadyUser" runat="server" OnClick="lnkAlreadyUser_Click">Already A User?</asp:LinkButton>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
