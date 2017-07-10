<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="AsthmaApp.ContactUs" %>
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
                                <li ><a href="Home.aspx">Home</a></li>
                               <%-- <li><a href="WeatherAnalysis.aspx">Forecast Analysis</a></li>--%>
                                <li><a href="DailyLogging.aspx">Daily Logging</a></li>
                                <li><a href="AsthmaQuiz.aspx">Asthma Quiz</a></li>
                               <li>
                                    <a href="Registration.aspx">Register</a>
                                    

                                </li>
                                <li class="active"><a href="ContactUs.aspx">About Us</a></li>
                                <%--<li></li>
                                <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />--%>
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
    <div class="container-wrap">
    <%--<div id="ContactUsContainer" class="LoginContainer">--%>
          <div class="row animate-box fadeInUp animated-fast">
        <div class="imageallignForContact">
            <br />

            <img src="myTemplate/images/TeamLogo.png"  style="width:230px;height:200px;" />
            <br />
            <div class="ContactUsLabel">Life With Technology </div>  
            <div class="contactusheading">
                We are a group of student pursuing our masters in Information Technology and Business Information Systems from Monash University. Asthma Alerts is a part of our final year project which aims at providing a platform for adults to manage theirs kid's asthma conditions through the means of asthma severity alerts for various locations in Melbourne, a quiz to test your knowledge on the condition and daily asthma logging and analysis. Although there is no cure for asthma, but together we can better manage it.</h6>
           </div>
                 <br />
            <br />

            <div id="box1">   
                <img src="myTemplate/images/Pratham.jpg"  style="width:200px;height:180px;" />
                <h3>Prathamesh</h3>
                I am currently pursuing Master of business information systems and working part time as a business analyst at Burra foods Australia. In my leisure time I like to play competitive games and do adventure sports, photogrphy and cooking.
                
            </div>
             <div id="box2">  
                 <img src="myTemplate/images/Muhtasim.jpg"    style="width:200px;height:180px;"/>
                  <h3>Muhtasim</h3>
                 I am now studying in Master of Information Technology. I did my Bachelor in Computer Science & Engineering. I have some work experience in Software & Database field. I love browsing new things, listening music & travelling.
             </div>
             <div id="box3"> 
                 <img src="myTemplate/images/Marshall.jpg"    style="width:200px;height:180px;" />
                  <h3>Marshall</h3>
                 I am MIT student who aiming at networking design work. My favorite time, I like to play competitive games such as Overwatch and League of legends. I would like to drive alone when the dark nights are coming.
             </div>
             <div id="box4"> 
                 <img src="myTemplate/images/Ray.jpg"    style="width:200px;height:180px;" />
                  <h3>Ray</h3>
                     I’m now doing a Master Degree of Business Information System, and also an analyst in South North Security Corp. in China. I have also worked as a UI designer & Business analyst. I feel it is a great pleasure to join BULLSEYE.
             </div>
              <%-- <h3>Contact us at: monashbullseye@gmail.com</h3>--%>
          
            </div>
             
              <br />
              <br />
              
              </div>
        
<%--              </div>--%>

    
        </div>











</asp:Content>
