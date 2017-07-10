<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WeatherAnalysis.aspx.cs" Inherits="AsthmaApp.WeatherAnalysis" %>
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

     <%-- MENU --%>
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
                                <%--<li class="active"><a href="WeatherAnalysis.aspx">Forecast Analysis</a></li>--%>
                                <li><a href="DailyLogging.aspx">Daily Logging</a></li>
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
<%-- ***MENU FINISH**** --%>


    
        <div class="container-wrap"> 
             <div class="row animate-box fadeInUp animated-fast">
           <%-- <div class="alertInfo">

                <br />
                 <h4>Environment Asthma Alert Information</h4>

                <p>
                    Extends of environment alerts are calculated according to Australia Asthma studies. There are two basic justifications of extends to which temperature is likely to 
                    cause asthma in Australia, one is whether the temperature is over or below 21°C based on different month, and the other is the difference between maximum and minimum
                     temperature throughout a day.  

                </p>
                <p>
                    In general sense, referring to E. H. Derrick and S. Szymansk12’s research, there are high possibility for kids to get Asthma when the temperature is under 21°C; meanwhile
                     E. H. Derrick also found the number of asthma cases hit a peak during the months of April and May, declining to lower level in months of January, February, March, September,
                     and staying in average in other months. Moreover, the paper “Diurnal temperature range and childhood asthma: a time-series study” also suggests the difference between maximum
                     and minimum temperature in a day can influence the possibility of causing asthma. In other words, there is a low possibility of getting asthma if the difference between the
                     maximum and minimum temperature during a day is between 5°C and 10°C; while the possibility increases from 10°C to 15°C and any difference higher than 15°C can cause serious
                     increase in asthma attacks.  
                </p>
                <p>
                      Based on these researches, we came up with a Severity Index that ranges from 1 to 7 to show the level of environment threats for Asthma patients, according to the index a
                     value of 1 indicates a low severity while a value of 7 refers the highest threats of asthma environment trigger (temperature). The following diagram represent the calculations
                     in a logical form, where S is extends of asthma trigger (temperature):
                </p>
             </div>

                <div class="alertImage">--%>
                    
                         <div class="imageallign">
                       <br />
                        <img src="myTemplate/images/Severity1.PNG"  style="width:500px;height:200px;" />
                     <img src="myTemplate/images/Severity2.PNG"  style="width:500px;height:200px;" />
                    </div>
                  <div class="imageallign">
                       <img src="myTemplate/images/Severity3.PNG"  style="width:500px;height:200px;" />
                     <img src="myTemplate/images/Severity4.PNG"  style="width:500px;height:200px;" />
                      </div>
                 <div class="imageallign">
                       <img src="myTemplate/images/Severity5.PNG"  style="width:500px;height:200px;" />
                     <img src="myTemplate/images/Severity6.PNG"  style="width:500px;height:200px;" />
                      </div>
                 <div class="imageallign">
                       <img src="myTemplate/images/Severity7.PNG"  style="width:500px;height:200px;" />
                     
                      </div>
                <%--</div>--%>
           </div>

        </div>

</asp:Content>
