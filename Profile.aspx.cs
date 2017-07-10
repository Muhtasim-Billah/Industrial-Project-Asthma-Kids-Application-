using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AsthmaApp
{
    public partial class GridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["id"].ToString() == "")
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    Label1.Text = "Welcome " + Session["id"].ToString() + " ! You can edit your profile below.";

                }
            }
            catch(Exception ex)
            {
                Response.Redirect("~/Login.aspx");
            }
            

        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            Session["id"] = "";
            Response.Redirect("~/Login.aspx");
        }
    }
}