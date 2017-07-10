<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AsthmaApp.Home" %>


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

    <asp:AccessDataSource ID="AccessDataSource12" runat="server" > </asp:AccessDataSource>

    <%-- MENU --%>
    <div id="page">
        <nav class="fh5co-nav" role="navigation">
            <div class="container-wrap">
                <div class="top-menu">
                    <div class="row">
                        <div class="col-xs-2">
                            <div id="fh5co-logo"><a href="Home.aspx">Asthma Alerts</a></div>
                        </div>
                        <div class="col-xs-10 text-right menu-1">
                            <ul id="menu">
                                <li class="active"><a href="Home.aspx">Home</a></li>
                               <%-- <li><a href="WeatherAnalysis.aspx">Forecast Analysis</a></li>--%>
                                <li><a href="DailyLogging.aspx">Daily Logging</a></li>
                                <li><a href="AsthmaQuiz.aspx">Asthma Quiz</a></li>
                               <li>
                                    <a href="Registration.aspx">Register</a>

                                </li>
                                 <li><a href="ContactUs.aspx">About Us</a></li>
                                <li>
                                            <% if(Session["UserName"] != null && Session["UserId"] != null) { %>
                                               <a href="Login.aspx" >Logout</a>
                                            <% } %>
							    </li>
                                <%--<li></li>
                                <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />--%>

                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </nav>
        <%--</div>--%>
<%-- ***MENU FINISH**** --%>





    <div class="container-wrap">
        <aside id="fh5co-hero">
            <div class="row"> 
                <div class="col-md-9 col-md-push-0.9">
            <div class="flexslider">
                <ul class="slides">
                    <li style="background-image: url(myTemplate/images/MMFrontpage1.jpg);">
                       <%-- <div class="overlay-gradient"></div>--%>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 col-md-pull-3 slider-text">
                                    <div class="slider-text-inner">
                                        <h1>1 out of 9 children in Australia suffer from Asthma</h1>
                                        <%--<h2>Most of them are kids</h2>
                                        <p><a class="btn btn-primary btn-demo" href="#"></i> View Asthma Kids</a> <a class="btn btn-primary btn-learn">Learn More</a></p>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li style="background-image: url(myTemplate/images/MMFrontpage0.jpg);">
                        <%--<div class="overlay-gradient"></div>--%>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 col-md-push-3 slider-text">
                                    <div class="slider-text-inner">
                                        <h1>34% of people report that asthma interferes with their daily living</h1>
                                        <%--<h2>Free html5 templates Made by</h2>
                                        <p><a class="btn btn-primary btn-demo" href="#"></i> View Demo</a> <a class="btn btn-primary btn-learn">Learn More</a></p>*@--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
                    </div>


                <div class="col-md-3 col-md-pull-0.5">
               <%-- <div id="fh5co-work" class="fh5co-light-grey">--%>
            <div class="row animate-box"> <%--HERE--%>
                <%--<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">--%> <%--Changes 1--%>
                    <h2></h2>
                   <div class="PostalCodeHeader">
                    <%--<div class="Heading1">Today's Asthma Severity
                    </div> --%>
                       <h2>Today's Asthma Severity</h2>
                    <p>Please enter your postal code </p>
                    <div class="PostalCodeHeader">
                     
                        <asp:TextBox class="PostCodeTextBox" ID="txtCity" runat="server" Text="" width="40%" Height="3em"/>
                        <h2></h2>
                        <asp:Button ID="btn_getWeather" Text="Check Severity" CssClass="push_button blue" runat="server" OnClick="btn_getWeather_Click"  />
                   
                    </div>
                       </div>
                <%--</div>--%>
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <%--<div class="row">--%>
                    
                       <%-- <div class="bgFirstWidget"> --%>

                      <%--Change content from table to Div--%>
                            <div class="row animate-box fadeInUp animated-fast">
                            <div id="testingondiv" class="temp">
                                <br />
                                 <%=DateTime.Now.ToString("dd/MM/yyyy") %>
                                
                             <br> <asp:Label ID="lblCity_Country" runat="server" /> &nbsp;
                                  <asp:Image ID="imgCountryFlag" Visible="true" runat="server" />&nbsp;&nbsp;
                                  <asp:Label ID="lblDescription" runat="server" />&nbsp;
                                  <%--<asp:Label ID="lblHumid" text ="Humidity:" runat="server" />
                                  <asp:Label ID="lblHumidity" runat="server" /> --%>
                                  <asp:Image ID="imgWeatherIcon" align="center" runat="server" /></br>
                                <div class="walert">
                                   <asp:Label ID="lblSevr" text =" Severity:" runat="server" />
                                   <asp:Label ID="lblDayTempAlert" runat="server" /> </br>
                                   <asp:Label ID="lblNightTempAlert" runat="server" />
                                   </div>
                                <div class="wtemp"><%--Temperature:(Min:--%>
                                    <asp:Label ID="lblTmpMX" text="Temperature: Min:" runat="server" />
                                    <asp:Label ID="lblTempMin" runat="server" />
                                    <asp:Label ID="lblMx" text ="Max:" runat="server" />
                                    <asp:Label ID="lblTempMax" runat="server" /> </br>
                                    <asp:Label ID="lblMi" text="Day: Min:" runat="server" />
                                    <asp:Label ID="lblTempDay" runat="server" />
                                    <asp:Label ID="lblNight" text="Night: " runat="server" />
                                    <asp:Label ID="lblTempNight" runat="server" />
                                    <br /><p>&nbsp;</p>
                                    <%--<a  class="one" href="WeatherAnalysis.aspx" >Click to findout more on severity</a>--%>
                                    <asp:Label ID="ClickMore" runat="server"> <a  class="one" href="WeatherAnalysis.aspx" >Click to findout more on severity</a>  </asp:Label> 
                                </div>
                        <asp:Label ID="Label3" runat="server" />
                            </div>
                                </div>
                            <%--Changes in content End--%>

                        <asp:Label ID="lblException" runat="server" />

                       <%-- <table id="tblWeather" class="weather" runat="server" border="0" cellpadding="0" cellspacing="0" color="black" visible="false" style ="align-content">
                            <tr>
                                <th class="wtitle" colspan="0" >  <%--<%=DateTime.Now.ToString() %>--%>
                             <%--   </th>
                            </tr>
                            <tr>
                                <td class="wplace">--%>
                                    <%--<asp:Label ID="lblCity_Country" runat="server" />
                                    <asp:Image ID="imgCountryFlag" Visible="true" runat="server" />
                                    <asp:Label ID="lblDescription" runat="server" />
                                    Humidity:
                        <asp:Label ID="lblHumidity" runat="server" />--%>
                           <%--     </td>
                            </tr>
                            <tr>
                                <td class="wimage">--%>
                                    <%--<asp:Image ID="imgWeatherIcon" align="center" runat="server" />--%>
                               <%-- </td>
                                <td class="walert">--%><%--Severity: <br />
                                    <asp:Label ID="lblDayTempAlert" runat="server" /> <br />
                                    <asp:Label ID="lblNightTempAlert" runat="server" />--%>
                            <%--    </td>
                            </tr>--%>
<%--                       <%--      <%-- Adding alert things --%>
                           <%-- <tr>

                            </tr>

                            <tr>
                                <td class="wtemp">--%><%--Temperature:
                        (Min:
                            <asp:Label ID="lblTempMin" runat="server" />
                                    Max:
                            <asp:Label ID="lblTempMax" runat="server" />) <br />
                                    (Day:
                            <asp:Label ID="lblTempDay" runat="server" />
                                    Night:
                            <asp:Label ID="lblTempNight" runat="server" />)--%>
                            <%--    </td>
                            </tr>

                            <tr>
                                <td class="wlink">--%>
                               
                               <%-- <a class="one" href="WeatherAnalysis.aspx" >Click to findout more on severity</a>--%>
                              <%--  </td>
                            </tr>
                           
                        </table>--%>
                            </div>
                        

                    <%--</div>--%>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_getWeather" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
 </div>


        </aside>


        <%--The section for keeping weather alert --%>

        </div>
        
    </div>
</asp:Content>
