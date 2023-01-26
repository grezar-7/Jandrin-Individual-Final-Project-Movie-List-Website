using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APC440_Jandrin_Individual_Final_Project
{
    public partial class Wish_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkSearchPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieSearch.aspx");
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}