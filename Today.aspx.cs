using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace AsthmaApp
{
    public partial class Today : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null && Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            wzd.PreRender += new EventHandler(wzd_PreRender);
        }


        protected void wzd_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = wzd.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;

            SideBarList.DataSource = wzd.WizardSteps;
            SideBarList.DataBind();

        }

        public string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }

            int stepIndex = wzd.WizardSteps.IndexOf(step);

            if (stepIndex < wzd.ActiveStepIndex)
            {
                return "stepCompleted";
            }
            else if (stepIndex > wzd.ActiveStepIndex)
            {
                return "stepNotCompleted";
            }
            else
            {
                return "stepCurrent";
            }
        }





        protected void FinishButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=asthmasql.database.windows.net;Initial Catalog=CloudKidsDB;User ID=monashbullseye;Password=MaRaMuPr326");

            //SqlCommand select = new SqlCommand("Select User_id From Login Where User_name =" + Session["UserId"]+ "And User_password =" + );
            SqlCommand insert = new SqlCommand("Insert Into PersonalRecords(User_id, Year, Month, Day, Time, Activity, Animal, Food, Accident) Values(@i_uid, @i_year, @i_month, @i_Day, @i_Time, @i_Activity, @i_Animal, @i_Food, @i_Accident)", conn);
            insert.Parameters.AddWithValue("@i_uid", Session["UserId"]);
            insert.Parameters.AddWithValue("@i_year", (int)(DateTime.Now.Year));
            string monName = getMonthName((int)DateTime.Now.Month);
            insert.Parameters.AddWithValue("@i_month", monName);
            insert.Parameters.AddWithValue("@i_Day", (int)DateTime.Now.Date.Day);
            insert.Parameters.AddWithValue("@i_Time", DdlTime.SelectedValue);
            insert.Parameters.AddWithValue("@i_Activity", DropDownActivity.SelectedValue);
            insert.Parameters.AddWithValue("@i_Animal", DropDownAnimal.SelectedValue);
            insert.Parameters.AddWithValue("@i_Food", DropDownFood.SelectedValue);
            insert.Parameters.AddWithValue("@i_Accident", 1);

            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
                Response.Redirect("Results.aspx");
            }
            catch (Exception ex)
            {
                conn.Close();
            }
        }


        //give first 3 character of the month with month number input
        protected string getMonthName(int number)
        {
            if (number == 1)
            {
                return "Jan";
            }
            else if (number == 2)
            {
                return "Feb";
            }
            else if (number == 3)
            {
                return "Mar";
            }
            else if (number == 4)
            {
                return "Apr";

            }
            else if (number == 5)
            {
                return "May";

            }
            else if (number == 6)
            {
                return "Jun";

            }
            else if (number == 7)
            {
                return "Jul";

            }
            else if (number == 8)
            {
                return "Aug";

            }
            else if (number == 9)
            {
                return "Sep";

            }
            else if (number == 10)
            {
                return "Oct";

            }
            else if (number == 11)
            {
                return "Nov";

            }
            else if (number == 12)
            {
                return "Dec";

            }
            else
            {
                return "";

            }
        }
    }
}