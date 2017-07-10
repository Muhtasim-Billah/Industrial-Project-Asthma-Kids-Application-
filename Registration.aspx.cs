using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace AsthmaApp
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string isSaved="N";
            SqlConnection conn = new SqlConnection("Data Source=asthmasql.database.windows.net;Initial Catalog=CloudKidsDB;User ID=monashbullseye;Password=MaRaMuPr326");
            SqlCommand insert = new SqlCommand("Insert Into Login(User_name, User_password, Email) Values(@UserName, @Password, @Email)", conn);
            insert.Parameters.AddWithValue("@UserName", UnameBox.Text);
            insert.Parameters.AddWithValue("@Password", PasswordBox.Text);
            insert.Parameters.AddWithValue("@Email", EmailBox.Text);
            //insert.Parameters.AddWithValue("@Phone", PhoneNoBox.Text);
            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
                isSaved = "Y";
                
            }
            catch (Exception ex)
            {
                conn.Close();
            }
            if (isSaved == "Y")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User created Successfully')", true);
            }
            //Clearing all fields
            clearAll();
        }

        //This function for clearing all fields
        protected void clearAll()
        {
            UnameBox.Text = "";
            PasswordBox.Text = "";
            EmailBox.Text = "";
            //PhoneNoBox.Text = "";
            
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User created Successfully')", true);
           
            Response.Redirect("Login.aspx");
        }

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            clearAll();
        }
    }
}