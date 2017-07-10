using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Script.Serialization;
using AsthmaApp.Model;
using System.Text.RegularExpressions;

namespace AsthmaApp
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTmpMX.Visible = false;
            //lblHumid.Visible = false;
            lblSevr.Visible = false;
            lblMx.Visible = false;
            lblMi.Visible = false;
            lblNight.Visible = false;
            ClickMore.Visible = false;

        }

       
        
            //Changes for alignment Pratham (23/04/2017)        

            protected void Check_PostCode()
            {
            try
            {
                AccessDataSource12.SelectCommand = "SELECT * FROM PostcodeDetails WHERE suburb='MELBOURNE' and postcode= '" + txtCity + "'";
                AccessDataSource12.Select(DataSourceSelectArguments.Empty);
            }
            catch (Exception ex)
            {
                showExceptionMsgForPostCode();
            }
        }
            //Changes for alignment ends




        protected void btn_getWeather_Click(object sender, EventArgs e)
        {
            try
            {
                int postcode = Int32.Parse(txtCity.Text);
                string strCode = postcode.ToString();
                int length = strCode.Length;
                if (length != 4)
                {
                    clearFields();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid postal code for Melbourne.')", true);
                }


                string state = "Victoria";
                string concatePlace = postcode + state;

                string sMonth = DateTime.Now.ToString("MM");
                int severityLevel = 0;


                string appId = "5af2545a7094a931a66428bf573acfe7";
                string url = string.Format("http://api.openweathermap.org/data/2.5/forecast/daily?q={0}&units=metric&cnt=1&APPID={1}", concatePlace.Trim(), appId);
                //string url = string.Format("http://api.openweathermap.org/data/2.5/weather?id={1}", concatePlace.Trim(), appId);
                using (WebClient client = new WebClient())
                {
                    string json = client.DownloadString(url);

                    WeatherInfo weatherInfo = (new JavaScriptSerializer()).Deserialize<WeatherInfo>(json);
                    imgWeatherIcon.ImageUrl = string.Format("http://openweathermap.org/img/w/{0}.png", weatherInfo.List[0].Weather[0].Icon);
                    lblCity_Country.Text = ""; /*changes 5*/
                    lblCity_Country.Text = weatherInfo.City.Name + "," + weatherInfo.City.Country;
                    imgCountryFlag.ImageUrl = string.Format("http://openweathermap.org/images/flags/{0}.png", weatherInfo.City.Country.ToLower());
                    lblDescription.Text = weatherInfo.List[0].Weather[0].Description;
                    //imgWeatherIcon.ImageUrl = string.Format("http://openweathermap.org/img/w/{0}.png", weatherInfo.List[0].Weather[0].Icon);
                    lblTempMin.Text = string.Format("{0}°С", Math.Round(weatherInfo.List[0].Temp.Min, 1));
                    lblTempMax.Text = string.Format("{0}°С", Math.Round(weatherInfo.List[0].Temp.Max, 1));
                    lblTempDay.Text = string.Format("{0}°С", Math.Round(weatherInfo.List[0].Temp.Day, 1));
                    lblTempNight.Text = string.Format("{0}°С", Math.Round(weatherInfo.List[0].Temp.Night, 1));

                    //Writing New Logic
                    double dayTemp = Math.Round(weatherInfo.List[0].Temp.Day, 1);
                    double nightTemp = Math.Round(weatherInfo.List[0].Temp.Night, 1);
                    double currentTemp = ((dayTemp + nightTemp) / 2);

                    //Current Temp Logic
                    if (currentTemp < 21)
                        severityLevel = severityLevel + 1;
                    else
                        severityLevel = severityLevel + 0;

                    //Month Logic
                    if (sMonth.Equals("01") || sMonth.Equals("02") || sMonth.Equals("03") || sMonth.Equals("09"))
                        severityLevel = severityLevel + 1;
                    else if (sMonth.Equals("04") || sMonth.Equals("05"))
                        severityLevel = severityLevel + 3;
                    else
                        severityLevel = severityLevel + 2;

                    //Temperature Gap Logic
                    double tGap = Math.Round(weatherInfo.List[0].Temp.Max, 1) - Math.Round(weatherInfo.List[0].Temp.Min, 1);

                    if (tGap < 5)
                        severityLevel = severityLevel + 0;
                    else if ((tGap >= 5) && (tGap < 10))
                        severityLevel = severityLevel + 1;
                    else if ((tGap >= 10) && (tGap < 15))
                        severityLevel = severityLevel + 2;
                    else
                        severityLevel = severityLevel + 3;
                    //Changes made after alignment (Prathamesh 19/04/2017)
                    //if (severityLevel == 1)

                    //    lblDayTempAlert.Text = "Very Low";
                    //else if (severityLevel == 2)
                    //    lblDayTempAlert.Text = "Low";
                    //else if (severityLevel == 3)
                    //    lblDayTempAlert.Text = "Low to Moderate";
                    //else if (severityLevel == 4)
                    //    lblDayTempAlert.Text = "Moderate";
                    //else if (severityLevel == 5)
                    //    lblDayTempAlert.Text = "High";
                    //else if (severityLevel == 6)
                    //    lblDayTempAlert.Text = "Very High";
                    //else if (severityLevel == 7)
                    //    lblDayTempAlert.Text = "Critical";
                    
                    //Code added to change the colour according to severity (Prathamesh) 19/04/2017
                    if (severityLevel == 1)
                    {
                        lblDayTempAlert.Text = "Very Low";
                        lblDayTempAlert.ForeColor = System.Drawing.Color.GreenYellow;
                        lblDayTempAlert.BorderColor = System.Drawing.Color.Black;
                    }
                    else if (severityLevel == 2)
                    {
                        lblDayTempAlert.Text = "Low";
                        lblDayTempAlert.ForeColor = System.Drawing.Color.Green;
                        lblDayTempAlert.BorderColor = System.Drawing.Color.Black;
                    }
                    else if (severityLevel == 3)
                    {
                        lblDayTempAlert.Text = "Low to Moderate";
                        lblDayTempAlert.ForeColor = System.Drawing.Color.Yellow;
                        lblDayTempAlert.BorderColor = System.Drawing.Color.Black;
                    }
                    else if (severityLevel == 4)
                    {
                        lblDayTempAlert.Text = "Moderate";
                        lblDayTempAlert.ForeColor = System.Drawing.Color.Orange;
                        lblDayTempAlert.BorderColor = System.Drawing.Color.Black;
                    }
                    else if (severityLevel == 5)
                    {
                        lblDayTempAlert.Text = "High";
                        lblDayTempAlert.ForeColor = System.Drawing.Color.OrangeRed;
                        lblDayTempAlert.BorderColor = System.Drawing.Color.Black;
                    }
                    else if (severityLevel == 6)
                    {
                        lblDayTempAlert.Text = "Very High";
                        lblDayTempAlert.ForeColor = System.Drawing.Color.Red;
                        lblDayTempAlert.BorderColor = System.Drawing.Color.HotPink;


                    }
                    else if (severityLevel == 7)
                    {
                        lblDayTempAlert.Text = "Critical";
                        lblDayTempAlert.ForeColor = System.Drawing.Color.DarkRed;
                        lblDayTempAlert.BorderColor = System.Drawing.Color.Black;

                    }
                    //lblHumidity.Text = weatherInfo.List[0].Humidity.ToString();
                    ////Day Temp Alert
                    //Boolean dayTempAlert = DayTemperatureAlert(lblTempDay.Text);
                    //if (dayTempAlert == true)
                    //{
                    //    lblDayTempAlert.Text = "Day: High";
                    //    //lblDayTempAlert.Attributes.Add("style", "text-decoration:blink");
                    //    //lblDayTempAlert.Attributes["style"] = "color:red; font-weight:bold;";
                    //}
                    //else
                    //{
                    //    lblDayTempAlert.Text = "Day: Low";
                    //    //lblDayTempAlert.ForeColor = System.Drawing.Color.Green;
                    //}

                    ////Night Temp Alert
                    //Boolean nightTempAlert = NightTemperatureAlert(lblTempNight.Text);
                    //if (nightTempAlert == true)
                    //{
                    //    lblNightTempAlert.Text = "Night: High";
                    //    //lblDayTempAlert.ForeColor = System.Drawing.Color.Red;
                    //}
                    //else
                    //{
                    //    lblNightTempAlert.Text = "Night: Low";
                    //    //lblDayTempAlert.ForeColor = System.Drawing.Color.Green;
                    //}

                    //tblWeather.Visible = true;
                    lblTmpMX.Visible = true;
                    //lblHumid.Visible = true;
                    lblSevr.Visible = true;
                    lblMx.Visible = true;
                    lblMi.Visible = true;
                    lblNight.Visible = true;
                    ClickMore.Visible = true;
                    //Changes for alignment Pratham (23/04/2017)  
                    //Check_PostCode();
                    //Changes end
                }
            }

            catch (Exception ex)
            {
                showExceptionMsg();
            }
        }


        //This function is for showing exception message
        protected void showExceptionMsg()
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter numeric format of postal code.')", true);
            clearFields();
        }

        //Changes for alignment Pratham (23/04/2017)  
        protected void showExceptionMsgForPostCode()
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter a valid Postcode for Melbourne')", true);
            clearFields();
        }
        //changes end

        protected void showExceptionMsgForInvalidPostcode() /*Change 3*/
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter a valid postal code.')", true);
            clearFields();
        }

        //This function is for clearing all label fields
        protected void clearFields()
        {
            txtCity.Text = "";
            lblCity_Country.Text = "";
            imgCountryFlag.Visible = false;
            lblDescription.Text = "";
            lblTempMin.Text = "";
            lblTempMax.Text = "";
            lblTempDay.Text = "";
            lblTempNight.Text = "";
            //lblHumidity.Text = "";
            lblDayTempAlert.Text = "";
            lblNightTempAlert.Text = "";
        }

        //This function is for showing day temperature alert
        protected Boolean DayTemperatureAlert(string dayTemp)
        {
            string[] dtempString = dayTemp.Split('°');
            double dtemp = Convert.ToDouble(dtempString[0]);

            if (dtemp < 21)
                return true;
            else
                return false;
        }

        //This function is for showing night temperature alert
        protected Boolean NightTemperatureAlert(string nightTemp)
        {
            string[] ntempString = nightTemp.Split('°');
            double ntemp = Convert.ToDouble(ntempString[0]);

            if (ntemp < 21)
                return true;
            else
                return false;
        }
    }

    
}