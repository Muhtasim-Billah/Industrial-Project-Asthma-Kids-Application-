using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AsthmaApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserId"] = null;
            Session["UserName"] = null;


        }

        protected void LoginBtn_Authenticate(object sender, AuthenticateEventArgs e)
        {
            //SqlDataSource1.SelectCommand = "SELECT * FROM login WHERE User_name= '" + LoginBtn.UserName + "' AND User_password= '" + LoginBtn.Password + "'";
            //SqlDataSource1.Select(DataSourceSelectArguments.Empty);


            //New things
            String[] Info = LoginCheckDataAccess(LoginBtn.UserName, LoginBtn.Password);

            if (int.Parse(Info[0]) != 0)
            {
                Session["UserId"] = int.Parse(Info[0]);
                Session["UserName"] = Info[1];
                Response.Redirect("DailyLogging.aspx");
            }

        }


        // Writing new code for login
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AsthmaKidsDBConnectionString"].ToString());

        public String[] LoginCheckDataAccess(string UserName, string Password) // passing Bussiness object Here
        {
            String[] Info = new String[2];

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CloudKidsDBConnectionString"].ToString());

            try
            {
                //What is sp_LoginCheck here?
                SqlCommand cmd = new SqlCommand("sp_LoginCheck", con);

                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param = cmd.CreateParameter();
                param = cmd.CreateParameter();
                param.ParameterName = "@UserName";
                param.Value = UserName;
                param.DbType = DbType.String;
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "@UserPassword";
                param.Value = Password;
                param.DbType = DbType.String;
                cmd.Parameters.Add(param);

                con.Open();

                SqlDataReader da = cmd.ExecuteReader();
                da.Read();

                if (da.HasRows)
                {
                    Info[0] = da[0].ToString();
                    Info[1] = da[1].ToString();
                }
                else
                {
                    Info[0] = "0";
                    Info[1] = "0";
                }


                return Info;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session["UserId"] = null;
            Session["UserName"] = null;
        }
    }
}