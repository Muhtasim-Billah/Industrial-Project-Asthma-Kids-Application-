<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="AsthmaApp.Results" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Animate.css -->
    <link rel="stylesheet" href="myTemplate/css/animate.css" />
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="myTemplate/css/icomoon.css" />
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="myTemplate/css/bootstrap.css" />

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="myTemplate/css/magnific-popup.css" />

    <!-- Flexslider  -->
    <link rel="stylesheet" href="myTemplate/css/flexslider.css" />

    <!-- Theme style  -->
    <link rel="stylesheet" href="myTemplate/css/style.css" />

    <!-- Modernizr JS -->
    <script src="myTemplate/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->

        <!-- jQuery -->
    <script src="myTemplate/js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="myTemplate/js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="myTemplate/js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="myTemplate/js/jquery.waypoints.min.js"></script>
    <!-- Flexslider -->
    <script src="myTemplate/js/jquery.flexslider-min.js"></script>
    <!-- Magnific Popup -->
    <script src="myTemplate/js/jquery.magnific-popup.min.js"></script>
    <script src="myTemplate/js/magnific-popup-options.js"></script>
    <!-- Counters -->
    <script src="myTemplate/js/jquery.countTo.js"></script>
    <!-- Main -->
    <script src="myTemplate/js/main.js"></script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <%--*** MENU START*** --%>
    <%--<div id="page">--%>
        <nav class="fh5co-nav" role="navigation">
            <div class="container-wrap">
                <div class="top-menu">
                    <div class="row">
                        <div class="col-xs-2">
                            <div id="fh5co-logo"><a href="Home.aspx">Asthma Alerts</a></div>
                        </div>
                        <div class="col-xs-10 text-right menu-1">
                            <ul>
                                <li><a href="Home.aspx">Home</a></li>
                                <%--<li><a href="WeatherAnalysis.aspx">Forecast Analysis</a></li>--%>
                                <li class="active"><a href="DailyLogging.aspx">Daily Logging</a></li>
                                <li ><a href="AsthmaQuiz.aspx">Asthma Quiz</a></li>
                                <li>
                                    <a href="Registration.aspx">Register</a>
                                    

                                </li>
                                 <li><a href="ContactUs.aspx">About Us</a></li>
                                 <li>
                                            <% if(Session["UserName"] != null && Session["UserId"] != null) { %>
                                               <a href="Login.aspx" >Logout</a>
                                            <% } %>
							    </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </nav>
        <%--</div>--%>
    <%-- ***MENU FINISH*** --%>




     <div class="container-wrap">
          <div class="row animate-box fadeInUp animated-fast">
        <div class="LoggingTime">
            <br />

            <div >
                <h2>Your Asthma Trends</h2>
              </div>      
            
                <asp:DropDownList ID="DdlMonth" runat="server">

                    <asp:ListItem Enabled="true" Text="Select Month" Value="-1"></asp:ListItem>
                    <%--<asp:ListItem Value="Every Month">Every Month</asp:ListItem>--%>
                    <asp:ListItem Value="Jan">Jan</asp:ListItem>
                    <asp:ListItem Value="Feb">Feb</asp:ListItem>
                    <asp:ListItem Value="Mar">Mar</asp:ListItem>
                    <asp:ListItem Value="Apr">Apr</asp:ListItem>
                    <asp:ListItem Value="May">May</asp:ListItem>
                    <asp:ListItem Value="Jun">Jun</asp:ListItem>
                    <asp:ListItem Value="Jul">Jul</asp:ListItem>
                    <asp:ListItem Value="Aug">Aug</asp:ListItem>
                    <asp:ListItem Value="Sep">Sep</asp:ListItem>
                    <asp:ListItem Value="Oct">Oct</asp:ListItem>
                    <asp:ListItem Value="Nov">Nov</asp:ListItem>
                    <asp:ListItem Value="Dec">Dec</asp:ListItem>

                </asp:DropDownList>

                <asp:DropDownList ID="DdlYear" runat="server">

                    <asp:ListItem Enabled="true" Text="Select Year" Value="-1"></asp:ListItem>
                    <asp:ListItem Value="2017">2017</asp:ListItem>
                    <asp:ListItem Value="2016">2016</asp:ListItem>
                    <asp:ListItem Value="2015">2015</asp:ListItem>
                    <asp:ListItem Value="2014">2014</asp:ListItem>
                    <asp:ListItem Value="2013">2013</asp:ListItem>

                </asp:DropDownList>
                <div class="ContactUsimageallign">
                    <asp:Button ID="ShowButton" runat="server" Text="Show"  OnClick="ShowButton_Click" CssClass="push_button_for_results blue" />
                </div>
                
            
            <br />


            <%-- Line Graph section month versus number of accidents --%>
            <asp:Chart ID="GraphMonth" runat="server" DataSourceID="LGM_SqlDataSource" Width="900px" Visible="false">
                <Series>
                    <asp:Series Name="Series1" ChartType="Line" XValueMember="Month" YValueMembers="Accident" ></asp:Series>                     
                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
  
                        <AxisX Title="Months in year" LabelAutoFitStyle="None"  >
                                <LabelStyle interval="1"   />
                                <MajorGrid Enabled="false" />
                            <CustomLabels ></CustomLabels>

                        </AxisX>
                            
                        <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                        </AxisY>

                    </asp:ChartArea>
                </ChartAreas>

            </asp:Chart>
            
            <%-- Line Graph section time versus number of accidents --%>
            <asp:Chart ID="GraphDay" runat="server" DataSourceID="LGD_SqlDataSource" Width="900" Visible="false">
                <Series>
                    <asp:Series Name="Series1" ChartType="Line" XValueMember="Day" YValueMembers="Accident" ></asp:Series>                     
                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
  
                        <AxisX Title="Days in month" LabelAutoFitStyle="None"  >
                                <LabelStyle interval="1"  />
                                <MajorGrid Enabled="false" />
                            <CustomLabels ></CustomLabels>

                        </AxisX>
                            
                        <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                        </AxisY>

                    </asp:ChartArea>
                </ChartAreas>

            </asp:Chart>

            <%-- Default Line Graph section time versus number of accidents --%>
            <asp:Chart ID="DefaultLG" runat="server" DataSourceID="DefaultLGSource" Width="900" Visible="true">
                <Series>
                    <asp:Series Name="Series1" ChartType="Line" XValueMember="Day" YValueMembers="Accident" ></asp:Series>                     
                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
  
                        <AxisX Title="Days in month" LabelAutoFitStyle="None"  >
                                <LabelStyle interval="1"  />
                                <MajorGrid Enabled="false" />
                            <CustomLabels ></CustomLabels>

                        </AxisX>
                            
                        <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                        </AxisY>

                    </asp:ChartArea>
                </ChartAreas>

            </asp:Chart>

            <br />
            <%-- Column chart for activity versus time --%>
            <asp:Chart ID="ColumnActivity" runat="server" DataSourceID="Act_SqlDataSource" Visible="false">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Activity" YValueMembers="Accident"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">

                        <AxisX Title="Activities" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>


            <%-- Column chart for food analysis --%>
            <asp:Chart ID="ColumnFood" runat="server" DataSourceID="Food_SqlDataSource" Visible="false">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Food" YValueMembers="Accident"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Food" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            

            
            <%-- Column chart for animal analysis --%>
            <asp:Chart ID="ColumnAnimal" runat="server" DataSourceID="Ani_SqlDataSource" visible="false">
                
                <Series>
                    <asp:Series Name="Series1" XValueMember="Animal" YValueMembers="Accident" ></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">

                        <AxisX Title="Animal" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <%-- NEW CODE FOR WHOLE YEAR --%>
            <%-- Yearly Column chart for activity versus time --%>
            <asp:Chart ID="YearActivity" runat="server" DataSourceID="YearActivitySource" Visible="false">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Activity" YValueMembers="Accident"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">

                        <AxisX Title="Activities" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <%-- Yearly Column chart for food analysis --%>
            <asp:Chart ID="YearFood" runat="server" DataSourceID="YearFoodSource" Visible="false">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Food" YValueMembers="Accident"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Food" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

             <%-- Yearly Column chart for animal analysis --%>
            <asp:Chart ID="YearAnimal" runat="server" DataSourceID="YearAnimalSource" Visible="false" >
                
                <Series>
                    <asp:Series Name="Series1" XValueMember="Animal" YValueMembers="Accident" ></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">

                        <AxisX Title="Animal" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>



            <%-- NEW CODE FOR DEFAULT--%>
            <%-- Default Column chart for activity versus time --%>
            <asp:Chart ID="DefaultActivityGraph" runat="server" DataSourceID="DefaultActivitySource" Visible="true">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Activity" YValueMembers="Accident"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">

                        <AxisX Title="Activities" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

             <%-- Default Column chart for food analysis --%>
            <asp:Chart ID="DefaultFoodGraph" runat="server" DataSourceID="DefaultFoodSource" Visible="true">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Food" YValueMembers="Accident"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Food" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>


            <%-- Default Column chart for animal analysis --%>
            <asp:Chart ID="DefaultAnimalGraph" runat="server" DataSourceID="DefaultAnimalSource" Visible="true" >
                
                <Series>
                    <asp:Series Name="Series1" XValueMember="Animal" YValueMembers="Accident" ></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">

                        <AxisX Title="Animal" LabelAutoFitStyle="None" >

                            <MajorGrid Enabled="false" />  
                            </AxisX>
                            <AxisY Title="Number of attacks" Interval="2"> 
                                <MajorGrid Enabled="false" />                               
                            </AxisY>

                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="Ani_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Animal,Year,Month, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Animal,Year,Month,Accident Having Year = @year AND Month= @month">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    <asp:ControlParameter ControlID="DdlYear" DefaultValue="2017" Name="year" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DdlMonth" DefaultValue="" Name="month" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Act_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Activity,Year,Month, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Activity,Year,Month,Accident HAVING Year = @year AND Month = @month ">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" DefaultValue="" />
                    <asp:ControlParameter ControlID="DdlYear" DefaultValue="2017" Name="year" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DdlMonth" DefaultValue="May" Name="month" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Food_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Food,Year,Month, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Food,Year,Month,Accident HAVING Year = @year AND Month = @month">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    <asp:ControlParameter ControlID="DdlYear" DefaultValue="2017" Name="year" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DdlMonth" DefaultValue="May" Name="month" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="LGD_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Day, Month, Year, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Day, Month, Year,Accident HAVING Year = @year AND Month = @month">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    <asp:ControlParameter ControlID="DdlYear" DefaultValue="2017" Name="year" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DdlMonth" DefaultValue="May" Name="month" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="LGM_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Month, Year, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Month, Year, Accident HAVING (Year = @year)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    <asp:ControlParameter ControlID="DdlYear" DefaultValue="2017"  Name="year" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DefaultLGSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Day, Month, Year, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Day, Month, Year,Accident HAVING Year = '2017' AND Month = 'May'">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DefaultAnimalSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Animal,Year,Month, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Animal,Year,Month,Accident Having Year = '2017' AND Month= 'May'">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DefaultFoodSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Food,Year,Month, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Food,Year,Month,Accident Having Year = '2017' AND Month= 'May'">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DefaultActivitySource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Activity,Year,Month, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Activity,Year,Month,Accident Having Year = '2017' AND Month= 'May'">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="YearActivitySource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Activity, Year, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Activity, Year, Accident HAVING (Year = @year)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="UserId" />
                    <asp:Parameter DefaultValue="2017" Name="year" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="YearFoodSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Food, Year, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Food, Year, Accident HAVING (Year = @year)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="UserId" />
                    <asp:Parameter DefaultValue="2017" Name="year" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="YearAnimalSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT DISTINCT Animal, Year, SUM(Accident) AS 'Accident' FROM PersonalRecords WHERE (User_id = @UserId) GROUP BY Animal, Year, Accident HAVING (Year = @year)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="UserId" />
                    <asp:Parameter DefaultValue="2017" Name="year" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SelectEmailDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CloudKidsDBConnectionString %>" SelectCommand="SELECT * FROM [SenderEmail]"></asp:SqlDataSource>
            </div>
              <br />
 
              <br />
               <div class="emailframe">
                   <h3>Send the graphs through email</h3>
            To:     
             <asp:TextBox ID="Emailto" CssClass="emailinputbox"  runat="server" Text="" Width="30%" Height="30px" ></asp:TextBox>
                  <br />
<asp:Button ID="EmailSend" runat="server" OnClick="Send_Click"  Text="Send Email" CssClass="push_button_for_results blue"/>
             <asp:Label ID="Emailstatus" runat="server"></asp:Label> 
                   <br />
                   <br />
                   <h3>Delete All Records</h3>
                   <asp:Button ID="DeleteRecords" runat="server" OnClick="DeleteRecords_Click"  Text="Delete" CssClass="push_button_for_results blue" />

                 </div>
              
              
               <asp:Image ID="imgScreenShot" runat="server" Height="1000" Width="1000" Visible = "false" />
              <asp:Label ID="DefaultGraphs" Visible="false"   runat ="server"> </asp:Label>

                   

                   
                   
            
          

                   

             

             <%-- changes for email end--%>
              <br />
              <br />



         </div>
              
    </div>

</asp:Content>
