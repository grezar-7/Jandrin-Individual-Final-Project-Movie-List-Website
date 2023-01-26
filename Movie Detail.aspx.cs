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
    public partial class Movie_Detail : System.Web.UI.Page
    {
        
        string username;
        protected void Page_Load(object sender, EventArgs e)
        {

            username = Request.Cookies["Username"].Value;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkMovieSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieSearch.aspx");
        }

        protected void btnAddtoWishlist_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            String query;
            string connString =
                         ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            //Query to add selected Movie to the user's wishlist
            query = String.Format("INSERT INTO [Movie Wish List] ([Title], [Cover Image], [Movie Description], [Movie Rating], [Movie Trailer])" +
                "(SELECT [Title], [Cover Image], [Movie Description], [Movie Rating], [Movie Trailer] FROM [Movie List] WHERE [Id] = '{0}'); SELECT SCOPE_IDENTITY();", Request.QueryString["t"]); 
            


            try
            {
                conn.Open();
                cmd = new SqlCommand(query, conn);
                var modified =cmd.ExecuteScalar();
                //makes it so the added movie is connected to user so only the user can see it.
                query = String.Format("UPDATE [Movie Wish List] SET [UserID]='{0}' " + 
                    "WHERE [Id] ='{1}'", username, modified);
                cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
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
    }
}