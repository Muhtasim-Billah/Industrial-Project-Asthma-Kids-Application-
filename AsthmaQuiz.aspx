<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AsthmaQuiz.aspx.cs" Inherits="AsthmaApp.AsthmaQuiz" %>
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

    <nav class="fh5co-nav" role="navigation">
            <div class="container-wrap">
                <div class="top-menu">
                    <div class="row">
                        <div class="col-xs-2">
                            <div id="fh5co-logo"><a href="Home.aspx">Asthma Alerts</a></div>
                        </div>
                        <div class="col-xs-10 text-right menu-1">
                            <ul id="menu">
                                <li><a href="Home.aspx">Home</a></li>
                               <%-- <li><a href="WeatherAnalysis.aspx">Forecast Analysis</a></li>--%>
                                <li><a href="DailyLogging.aspx">Daily Logging</a></li>
                                <li class="active"><a href="AsthmaQuiz.aspx">Asthma Quiz</a></li>
                                <li>
                                    <a href="Registration.aspx">Register</a>
                                    

                                </li>
                                <%--<li></li>
                                <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />--%>
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


    <%-- WRITE CODE INSIDE HERE --%>
    <div class="container-wrap">
        <div class="row animate-box fadeInUp animated-fast">
            <div class="LoggingTime">
                <br />

                
                <div class="centrealignIframe">
                   <iframe style="border:none;margin:auto" src="https://quiz.tryinteract.com/#/590d506d73e5c3001142a860" width="400" height="700" ></iframe><div id="int-pb" style="display:block;font-size:11px;color:#666;"></div>
                    <asp:Button ID="QuizAgain" runat="server" OnClick="QuizAgain_Click"  Text="Retake Quiz" />
                </div>


            </div>
        </div>
    </div>
</asp:Content>
