<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DailyLogging.aspx.cs" Inherits="AsthmaApp.DailyLogging" %>
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
                                <li  class="active"><a href="DailyLogging.aspx">Daily Logging</a></li>
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
       <%-- Changes for alignment Pratham (23/04/2017)--%>
         <div class="row animate-box fadeInUp animated-fast">
        <div class="LoggingTime">
            <br />
            <br />
            <h2>How was your kid today?</h2>
            
            <br />
            <button type="button" class="btn btn-info" onclick="window.location='Results.aspx';">Great!</button>
            <button type="button" class="btn btn-info" onclick="window.location='Today.aspx';">Had Minor Symptoms</button>
            <button type="button" class="btn btn-info" onclick="window.location='Today.aspx';">Had an Asthma attack</button>
            <br />
            <br />
            <button type="button" class="btn btn-link"  onclick="window.location='NotToday.aspx';">Had asthma symptoms, but <em>not</em> today</button>
            <br />
            <button type="button" class="btn btn-link"  onclick="window.location='Results.aspx';">See kid's asthma records</button>
        </div>
             </div>
        <%--Changes for alignment ends--%>
    </div>
       
</asp:Content>
