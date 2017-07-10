using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AsthmaApp
{
    public partial class AsthmaQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void QuizAgain_Click(object sender, EventArgs e)
        {
            Response.Redirect("AsthmaQuiz.aspx");
        }
    }
}