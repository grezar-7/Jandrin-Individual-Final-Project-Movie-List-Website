using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APC440_Jandrin_Individual_Final_Project
{
    public partial class MovieSearch : System.Web.UI.Page
    {
        String username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["t"] != null)
            {
                lblWelcomeUser.Text = "Welcome " + Request.QueryString["t"] + "!";
            }
            //cookie
            if (Request.Cookies["username"] != null)
            {
               username = Request.Cookies["username"].Value;
            }
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkWishList_Click(object sender, EventArgs e)
        {
            Response.Redirect("Wish List.aspx");
        }
    }
}