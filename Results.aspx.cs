using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail; /*Email Changes*/
using System.Drawing;
using System.Threading;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace AsthmaApp
{
    public partial class Results : System.Web.UI.Page
    {
        string IsShowButtonClicked;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null && Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //if (ColumnActivity.Visible == false)
            //{ 
            //ColumnActivity.Visible = false;
            //ColumnFood.Visible = false;
            //ColumnAnimal.Visible = false;
            //DefaultLG.Visible = true;
            //DefaultActivityGraph.Visible = true;
            //DefaultFoodGraph.Visible = true;
            //DefaultAnimalGraph.Visible = true;
            //}
            
        }

        protected void ShowButton_Click(object sender, EventArgs e)
        {

            DefaultGraphs.Text = "N";
            IsShowButtonClicked = "Y";
            string GraphMonth1 = Server.MapPath("/tempchart/GraphMonth.png");
            FileInfo GraphMonthfile = new FileInfo(GraphMonth1);
            if (GraphMonthfile.Exists)
            {
                GraphMonthfile.Delete();
            }
            string GraphDay1 = Server.MapPath("/tempchart/GraphDay.png");
            FileInfo GraphDayfile = new FileInfo(GraphDay1);
            if (GraphDayfile.Exists)
            {
                GraphDayfile.Delete();
            }
            string ColumnActivity1 = Server.MapPath("/tempchart/ColumnActivity.png");
            FileInfo ColumnActivityfile = new FileInfo(ColumnActivity1);
            if (ColumnActivityfile.Exists)
            {
                ColumnActivityfile.Delete();
            }
            string ColumnFood1 = Server.MapPath("/tempchart/ColumnFood.png");
            FileInfo ColumnFoodfile = new FileInfo(ColumnFood1);
            if (ColumnFoodfile.Exists)
            {
                ColumnFoodfile.Delete();
            }
            string ColumnAnimal1 = Server.MapPath("/tempchart/ColumnAnimal.png");
            FileInfo ColumnAnimalfile = new FileInfo(ColumnAnimal1);
            if (ColumnAnimalfile.Exists)
            {
                ColumnAnimalfile.Delete();
            }
            string YearActivity1 = Server.MapPath("/tempchart/YearActivity.png");
            FileInfo YearActivityfile = new FileInfo(YearActivity1);
            if (YearActivityfile.Exists)
            {
                YearActivityfile.Delete();
            }
            string YearFood1 = Server.MapPath("/tempchart/YearFood.png");
            FileInfo YearFoodfile = new FileInfo(YearFood1);
            if (YearFoodfile.Exists)
            {
                YearFoodfile.Delete();
            }
            string YearAnimal1 = Server.MapPath("/tempchart/YearAnimal.png");
            FileInfo YearAnimalfile = new FileInfo(YearAnimal1);
            if (YearAnimalfile.Exists)
            {
                YearAnimalfile.Delete();
            }

            if ((DdlMonth.Items.Count > 0) && (DdlYear.Items.Count > 0))
            {
                if (DdlMonth.SelectedValue == "-1" && DdlYear.SelectedValue != "-1")
                {
                    string s = DdlYear.SelectedValue;
                    DefaultLG.Visible = false;
                    DefaultActivityGraph.Visible = false;
                    DefaultFoodGraph.Visible = false;
                    DefaultAnimalGraph.Visible = false;
                    ColumnActivity.Visible = false;
                    ColumnFood.Visible = false;
                    ColumnAnimal.Visible = false;
                    GraphMonth.Visible = true;
                    YearActivity.Visible = true;
                    YearFood.Visible = true;
                    YearAnimal.Visible = true;
                    GraphMonth.SaveImage(Server.MapPath("/tempchart/GraphMonth.png"));
                    ColumnActivity.SaveImage(Server.MapPath("/tempchart/YearActivity.png"));
                    ColumnFood.SaveImage(Server.MapPath("/tempchart/YearFood.png"));
                    ColumnAnimal.SaveImage(Server.MapPath("/tempchart/YearAnimal.png"));
                }
                else
                {
                    DefaultLG.Visible = false;
                    DefaultActivityGraph.Visible = false;
                    DefaultFoodGraph.Visible = false;
                    DefaultAnimalGraph.Visible = false;
                    GraphMonth.Visible = false;
                    YearActivity.Visible = false;
                    YearFood.Visible = false;
                    YearAnimal.Visible = false;
                    GraphDay.Visible = true;
                    ColumnActivity.Visible = true;
                    ColumnFood.Visible = true;
                    ColumnAnimal.Visible = true;
                    GraphDay.SaveImage(Server.MapPath("/tempchart/GraphDay.png"));
                    ColumnActivity.SaveImage(Server.MapPath("/tempchart/ColumnActivity.png"));
                    ColumnFood.SaveImage(Server.MapPath("/tempchart/ColumnFood.png"));
                    ColumnAnimal.SaveImage(Server.MapPath("/tempchart/ColumnAnimal.png"));
                }
            }
            else
            {
                GraphDay.Visible = false;
                GraphMonth.Visible = true;
                GraphMonth.SaveImage(Server.MapPath("/tempchart/GraphMonth.png"));
                ColumnActivity.SaveImage(Server.MapPath("/tempchart/ColumnActivity.png"));
                ColumnFood.SaveImage(Server.MapPath("/tempchart/ColumnFood.png"));
                ColumnAnimal.SaveImage(Server.MapPath("/tempchart/ColumnAnimal.png"));
            }
        }

        protected void Send_Click(object sender, EventArgs e)
        {
            if (Emailto.Text == string.Empty)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter the email recipient')", true);
                return;
            }

            bool isvalid = IsValidEmail(Emailto.Text);

            if (isvalid == false)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter correct email format')", true);
                return;
            }

            //SqlConnection conn = new SqlConnection("Data Source=asthmasql.database.windows.net;Initial Catalog=CloudKidsDB;User ID=monashbullseye;Password=MaRaMuPr326");
            //SqlCommand selectParam = new SqlCommand("Select Sender_email,Sender_password from SenderEmail", conn);
            //string emailID, password;
            ////selectParam.Parameters.AddWithValue("@EmailID", Sender_email);
            ////SqlCommand oCmd = new SqlCommand(oString, conn);
            //conn.Open();
            //using (SqlDataReader oReader = selectParam.ExecuteReader())
            //{
            //    while (oReader.Read())
            //    {
            //        emailID = oReader["Sender_email"].ToString();
            //        password = oReader["Sender_password"].ToString();
            //    }

            //    conn.Close();
            //}

            try
            {
                //string uname = User.Identity.Name;
                string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
                string sub = "Asthma Analysis for " + Session["UserName"];

                string sPath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
               


                string msgbody = "The email was sent from AsthmaAlerts.tk & provides asthma analysis for " + Session["UserName"] + " according to the logged conditions";
                MailMessage message = new MailMessage(Emailto.Text, Emailto.Text, sub, msgbody);
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;

                SqlConnection conn = new SqlConnection("Data Source=asthmasql.database.windows.net;Initial Catalog=CloudKidsDB;User ID=monashbullseye;Password=MaRaMuPr326");
                SqlCommand selectParam = new SqlCommand("Select Sender_email,Sender_password from SenderEmail", conn);
                string emailID = "";
                string password="";
                //selectParam.Parameters.AddWithValue("@EmailID", Sender_email);
                //SqlCommand oCmd = new SqlCommand(oString, conn);
                conn.Open();
                using (SqlDataReader oReader = selectParam.ExecuteReader())
                {
                    while (oReader.Read())
                    {
                        emailID = oReader["Sender_email"].ToString();
                        password = oReader["Sender_password"].ToString();
                    }

                    conn.Close();
                }

                // client.Credentials = new System.Net.NetworkCredential("monashbullseye@gmail.com", "MaRaMuPr326");
                client.Credentials = new System.Net.NetworkCredential(emailID, password);
                //System.Net.Mail.Attachment attachment;
                System.Net.Mail.Attachment attachment1;
                System.Net.Mail.Attachment attachment2;
                System.Net.Mail.Attachment attachment3;
                System.Net.Mail.Attachment attachment4;
                System.Net.Mail.Attachment attachment5;
                System.Net.Mail.Attachment attachment6;
                System.Net.Mail.Attachment attachment7;
                System.Net.Mail.Attachment attachment8;
                //attachment = new System.Net.Mail.Attachment("//ad.monash.edu/home/User009/pgduk1/Desktop/BullsEye's Proposal Document v1.1.pdf");
                if (DefaultGraphs.Text !="N")
                {
                    DefaultLG.SaveImage(Server.MapPath("/tempchart/DefaultLG.png"));
                    DefaultActivityGraph.SaveImage(Server.MapPath("/tempchart/DefaultActivityGraph.png"));
                    DefaultFoodGraph.SaveImage(Server.MapPath("/tempchart/DefaultFoodGraph.png"));
                    DefaultAnimalGraph.SaveImage(Server.MapPath("/tempchart/DefaultAnimalGraph.png"));
                    string Path = Server.MapPath("/tempchart/DefaultLG.png");
                    FileInfo file = new FileInfo(Path);
                    if (file.Exists)
                    {
                        attachment1 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/DefaultLG.png"));
                        message.Attachments.Add(attachment1);
                    }
                    string Path1 = Server.MapPath("/tempchart/DefaultActivityGraph.png");
                    FileInfo file1 = new FileInfo(Path1);
                    if (file1.Exists)
                    {
                        attachment2 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/DefaultActivityGraph.png"));
                        message.Attachments.Add(attachment2);
                    }
                    string Path2 = Server.MapPath("/tempchart/DefaultFoodGraph.png");
                    FileInfo file2 = new FileInfo(Path2);
                    if (file2.Exists)
                    {
                        attachment3 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/DefaultFoodGraph.png"));
                        message.Attachments.Add(attachment3);
                    }
                    string Path3 = Server.MapPath("/tempchart/DefaultAnimalGraph.png");
                    FileInfo file3 = new FileInfo(Path3);
                    if (file3.Exists)
                    {
                        attachment4 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/DefaultAnimalGraph.png"));
                        message.Attachments.Add(attachment4);
                    }
                }
                else
                {
                    string Path = Server.MapPath("/tempchart/GraphMonth.png");
                    FileInfo file = new FileInfo(Path);
                    if (file.Exists)
                    {
                        attachment1 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/GraphMonth.png"));
                        message.Attachments.Add(attachment1);
                    }

                    string Path1 = Server.MapPath("/tempchart/GraphDay.png");
                    FileInfo file1 = new FileInfo(Path1);
                    if (file1.Exists)
                    {
                        attachment2 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/GraphDay.png"));
                        message.Attachments.Add(attachment2);
                    }
                    string Path2 = Server.MapPath("/tempchart/ColumnActivity.png");
                    FileInfo file2 = new FileInfo(Path2);
                    if (file2.Exists)
                    {
                        attachment3 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/ColumnActivity.png"));
                        message.Attachments.Add(attachment3);
                    }
                    string Path3 = Server.MapPath("/tempchart/ColumnFood.png");
                    FileInfo file3 = new FileInfo(Path3);
                    if (file3.Exists)
                    {
                        attachment4 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/ColumnFood.png"));
                        message.Attachments.Add(attachment4);
                    }
                    string Path4 = Server.MapPath("/tempchart/ColumnAnimal.png");
                    FileInfo file4 = new FileInfo(Path4);
                    if (file4.Exists)
                    {
                        attachment5 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/ColumnAnimal.png"));
                        message.Attachments.Add(attachment5);
                    }
                    string Path5 = Server.MapPath("/tempchart/YearActivity.png");
                    FileInfo file5 = new FileInfo(Path5);
                    if (file5.Exists)
                    {
                        attachment6 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/YearActivity.png"));
                        message.Attachments.Add(attachment6);
                    }
                    string Path6 = Server.MapPath("/tempchart/YearFood.png");
                    FileInfo file6 = new FileInfo(Path6);
                    if (file6.Exists)
                    {
                        attachment7 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/YearFood.png"));
                        message.Attachments.Add(attachment7);
                    }
                    string Path7 = Server.MapPath("/tempchart/YearAnimal.png");
                    FileInfo file7 = new FileInfo(Path7);
                    if (file7.Exists)
                    {
                        attachment8 = new System.Net.Mail.Attachment(Server.MapPath("/tempchart/YearAnimal.png"));
                        message.Attachments.Add(attachment8);
                    }
                }


                client.Send(message);
                //Emailstatus.Text = "email was sent successfully";
                //string image = "data:image/png;base64," + Convert.ToBase64String(bytes);
                //message.Body = "<img src = '" + imgScreenShot + "' />";
                //message.IsBodyHtml = true;
                //string FileName1 = "TempImg.Png";
                message.Dispose();
                string GraphMonth = Server.MapPath("/tempchart/GraphMonth.png");
                FileInfo GraphMonthfile = new FileInfo(GraphMonth);
                if (GraphMonthfile.Exists)
                {
                    GraphMonthfile.Delete();
                }
                string GraphDay = Server.MapPath("/tempchart/GraphDay.png");
                FileInfo GraphDayfile = new FileInfo(GraphDay);
                if (GraphDayfile.Exists)
                {
                    GraphDayfile.Delete();
                }
                string ColumnActivity = Server.MapPath("/tempchart/ColumnActivity.png");
                FileInfo ColumnActivityfile = new FileInfo(ColumnActivity);
                if (ColumnActivityfile.Exists)
                {
                    ColumnActivityfile.Delete();
                }
                string ColumnFood = Server.MapPath("/tempchart/ColumnFood.png");
                FileInfo ColumnFoodfile = new FileInfo(ColumnFood);
                if (ColumnFoodfile.Exists)
                {
                    ColumnFoodfile.Delete();
                }
                string ColumnAnimal = Server.MapPath("/tempchart/ColumnAnimal.png");
                FileInfo ColumnAnimalfile = new FileInfo(ColumnAnimal);
                if (ColumnAnimalfile.Exists)
                {
                    ColumnAnimalfile.Delete();
                }
                string YearActivity = Server.MapPath("/tempchart/YearActivity.png");
                FileInfo YearActivityfile = new FileInfo(YearActivity);
                if (YearActivityfile.Exists)
                {
                    YearActivityfile.Delete();
                }
                string YearFood = Server.MapPath("/tempchart/YearFood.png");
                FileInfo YearFoodfile = new FileInfo(YearFood);
                if (YearFoodfile.Exists)
                {
                    YearFoodfile.Delete();
                }
                string YearAnimal = Server.MapPath("/tempchart/YearAnimal.png");
                FileInfo YearAnimalfile = new FileInfo(YearAnimal);
                if (YearAnimalfile.Exists)
                {
                    YearAnimalfile.Delete();
                }
                string DefaultLG1 = Server.MapPath("/tempchart/DefaultLG.png");
                FileInfo DefaultLGfile = new FileInfo(DefaultLG1);
                if (DefaultLGfile.Exists)
                {
                    DefaultLGfile.Delete();
                }
                string DefaultActivityGraph1 = Server.MapPath("/tempchart/DefaultActivityGraph.png");
                FileInfo DefaultActivityGraphfile = new FileInfo(DefaultActivityGraph1);
                if (DefaultActivityGraphfile.Exists)
                {
                    DefaultActivityGraphfile.Delete();
                }
                string DefaultFoodGraph1 = Server.MapPath("/tempchart/DefaultFoodGraph.png");
                FileInfo DefaultFoodGraphfile = new FileInfo(DefaultFoodGraph1);
                if (DefaultFoodGraphfile.Exists)
                {
                    DefaultFoodGraphfile.Delete();
                }
                string DefaultAnimalGraph1 = Server.MapPath("/tempchart/DefaultAnimalGraph.png");
                FileInfo DefaultAnimalGraphfile = new FileInfo(DefaultAnimalGraph1);
                if (DefaultAnimalGraphfile.Exists)
                {
                    DefaultAnimalGraphfile.Delete();
                }


                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email Sent Successfully')", true);


            }
            catch (Exception ex)
            {
                Emailstatus.Text = ex.StackTrace;
            }
        }


        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        protected void DeleteRecords_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection("Data Source=asthmasql.database.windows.net;Initial Catalog=CloudKidsDB;User ID=monashbullseye;Password=MaRaMuPr326");
                SqlCommand selectParam = new SqlCommand("Select Sender_email,Sender_password from SenderEmail", conn);
                string emailID = "";
                string password = "";
                
                conn.Open();

                using (SqlDataReader oReader = selectParam.ExecuteReader())
                {
                    while (oReader.Read())
                    {
                        emailID = oReader["Sender_email"].ToString();
                        password = oReader["Sender_password"].ToString();
                    }

                    conn.Close();
                }

                string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
                string sub = "Record deletion request for: " + Session["UserName"];

                string sPath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;



                string msgbody = "The user: " + Session["UserName"] + " has requested deletion of all their records from the AsthmaAlerts database. Please perform the required actions within the next 2 days.";
                MailMessage message = new MailMessage(emailID, emailID, sub, msgbody);
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;

                
                client.Credentials = new System.Net.NetworkCredential(emailID, password);
                client.Send(message);
               
                message.Dispose();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Deletion request sent successfully. The record will be deleted in the next 2 days')", true);
            }
            catch(Exception ex)
            {
                Emailstatus.Text = ex.StackTrace;
            }
        }
    }
}