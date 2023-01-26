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
    public partial class Register : System.Web.UI.Page
    {
        String userName, firstName, password;


        /*This link button will be clicked if user is already registered or
        used to navigate back to login if user accidently clicked the register button
        */
        protected void lnkAlreadyUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //code to make sure info is put in properly

            //for Username textfield
            if (txtUsername.Text.Equals(""))
            {
                lblUsernameError.Text = "Please put in a username";
            }
            else
            {
                userName = txtUsername.Text.ToString();
                lblUsernameError.Text = "";
            }
            /*TODO
            this is where I will make sure the username is unique
            if(){lblUsernameError.Text = "Username in use. Please try something different}
            */

            //for FirstName textfield

            if (txtFirstName.Text.Equals(""))
            {
                lblFirstNameError.Text = "Please put in your first name";
            }
            else
            {
                firstName = txtFirstName.Text.ToString();
                lblFirstNameError.Text = "";
            }

            //for password textfield
            if (txtPassword.Text.Equals(""))
            {
                lblPasswordError.Text = "Please create a password";
            }
            else if (!(txtPassword.Text.Equals("")) && txtPassword.Text.Length < 4)
            {
                lblPasswordError.Text = ("Passwords must be at least four characters long");
            }
            else
            {
                password = txtConfirmPassword.Text.ToString();
                lblPasswordError.Text = ("");
            }

            //for confirm password textfield

            if ((!(txtPassword.Text.Equals(txtConfirmPassword.Text))) && (lblPasswordError.Text.Equals("")))
            {
                lblConfirmPasswordError.Text = "Passwords did not match. Please retype password";
            }
            else
            {
                lblConfirmPasswordError.Text = "";
            }

            //Code to make sure all input errors are displayed before using the return function
            if (!(lblUsernameError.Text.Equals("")) || !(lblFirstNameError.Text.Equals("")) || !(lblPasswordError.Text.Equals("")) || !(lblConfirmPasswordError.Text.Equals("")))
            {
                return;
            }

            //SQL code section
            SqlCommand cmd;
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            
            //checks to see if username is already in use
            var query = String.Format("SELECT [Username] FROM [Users] WHERE [Username] = '{0}'", userName);
            try
            {
                conn.Open();
                cmd = new SqlCommand(query, conn);
                
                //if cmd.ExecuteScalar() is null, no matches were found. Data can be registered into Users table
                if (cmd.ExecuteScalar() == null)
                {
                    query = String.Format("INSERT INTO [Users] ([Username], [First Name], [Password]) VALUES ('{0}', '{1}', '{2}')", txtUsername.Text, txtFirstName.Text, txtConfirmPassword.Text);
                    cmd = new SqlCommand(query, conn);
                    cmd.ExecuteNonQuery();
                    
                    //send a query that will say "You have registered successfully. Please now login"
                    Response.Redirect("Login.aspx?l=1"); //?l=1
                }
                else
                {
                    //checks to see if username is already in use. If it is, error is sent.
                    var testUsername = cmd.ExecuteScalar().ToString();

                    if (testUsername.Equals(userName)) 
                    {
                        lblUsernameError.Text = "Username is already in use. Please use a different username.";
                        conn.Close();
                        return;
                    }
                }
            }
            catch (Exception ex)
            {
                //handle Coding and SQL error messages here
                lblSqlError.Text = "Error: " + ex.Message;

            }
            finally
            {
                conn.Close();
            }

        }
    }
    
}