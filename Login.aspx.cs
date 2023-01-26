using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//importing for SQL usage
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace APC440_Jandrin_Individual_Final_Project
{
    public partial class Login : System.Web.UI.Page
    {
        String username, password;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["l"] != null)
            {
                lblSuccessfulRegistration.Text = "Your registration is complete. Please now login";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //display errors if textboxes are empty
            if(txtUsername.Text == "")
            {
                lblUsernameError.Text = "Please type in your username";
            }
            else
            {
                username = txtUsername.Text;
                lblUsernameError.Text = "";
            }

            if(txtPassword.Text == "")
            {
                lblPasswordError.Text = "Please type in your password";
            }
            else
            {
                password = txtPassword.Text;
                lblPasswordError.Text = "";
            }

            //Code to make sure all input errors are displayed before using the return function
            if (!(lblUsernameError.Text.Equals("")) || !(lblPasswordError.Text.Equals("")))
            {
                btnRegister.Text = ("code is working");
                return;
            }

            //Code to have the user sign in and the code verify the data with what is in the database
            
            SqlCommand cmd;
            String query;
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            query = String.Format("SELECT [Password] FROM [Users] WHERE [Username] = '{0}'", username);

            try
            {
                conn.Open();
                cmd = new SqlCommand(query, conn);
                String testPassword = cmd.ExecuteScalar().ToString();

                if (testPassword.CompareTo(txtPassword.Text) == 0)
                {
                    Response.Cookies["Username"].Value = txtUsername.Text;
                    btnRegister.Text = "Login Successful. Transfering you to main page now. Please wait";

                    query = String.Format("SELECT [First Name] FROM [Users] WHERE [Username] = '{0}'", username);
                    cmd = new SqlCommand(query, conn);
                    String getFirstName = cmd.ExecuteScalar().ToString();
                    Response.Redirect("MovieSearch.aspx?t=" + getFirstName);

                }
                else
                {
                    lblPasswordError.Text = "Incorrect username and password combination";
                    return;
                }

                cmd.Dispose();
            }
            catch (Exception ex)
            {
                lblSqlError.Text = ex.Message;
            }
            finally
            {

                conn.Close();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}