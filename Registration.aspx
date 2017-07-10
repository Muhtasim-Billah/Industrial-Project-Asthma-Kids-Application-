<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AsthmaApp.Registration" %>


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
                                <%--<li><a href="../WeatherAnalysis.aspx">Forecast Analysis</a></li>--%>
                                <li><a href="DailyLogging.aspx">Daily Logging</a></li>
                                <li ><a href="AsthmaQuiz.aspx">Asthma Quiz</a></li>
                                <li>
                                    <a href="Registration.aspx">Register</a>
                                    

                                </li>
                                <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
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



        <div class="LoginContainer">
        <div class="row animate-box fadeInUp animated-fast">
        <br />
        <div class="Heading1">Registration
        </div>
        <br />
        <div class="temp"><p>Register to start logging your daily asthma conditions!</p></div>
            </div>
        <%--<br />--%>
        <div class="RegFormat">


            <%-- Registration page Design --%>
            <%--<div class="centeralignRegistartion"> --%>
            <table>
                 
                <tr>
                    <td ><asp:Label ID="UnameLbl"  Text="User Name: " Font-Bold="true" Font-Names="Arial" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="UnameBox" runat="server" Text='<%# Bind("User_name") %>' width="300px" Height="22px" />

                    </td>
                </tr>

                <tr>
                    <td><asp:RequiredFieldValidator ID="vUName" ControlToValidate="UnameBox" Display="Dynamic"
                            ErrorMessage="Please Enter User Name" ForeColor="#FF0000" Font-Name="Arial"
                            runat="server"/> </td>
                </tr>

                 <tr>
                    <td><asp:Label ID="PasswordLbl" Text="Set Password: " Font-Bold="true" Font-Names="Arial" runat="server" /></td>
                    <td><asp:TextBox ID="PasswordBox" runat="server" Text='<%# Bind("User_password")%>' textmode="password"  columns="10" 
                        width="300px" Height="22px" /></td>
                </tr>

                <tr>
                    <td><asp:RequiredFieldValidator ID="vPassword" ControlToValidate="PasswordBox" Display="Dynamic"
                            ErrorMessage="Please Set a Password" Font-Names="Arial" ForeColor="#FF0000"
                            runat="server"/></td>
                </tr>

                <tr>
                    <td><asp:Label ID="RPasswordLbl" Text="Confirm password: " Font-Bold="true" Font-Names="Arial"
                         runat="server" /></td>
                    <td><asp:TextBox ID="RPasswordBox" runat="server" textmode="password"  columns="10"
                        width="300px" Height="22px" /></td>
                </tr>

                <tr>
                    <td><asp:RequiredFieldValidator ID="vRPassword" ControlToValidate="RPasswordBox" Display="Dynamic"
                            ErrorMessage="Please Re-enter the password"  Font-Name="Arial" ForeColor="#FF0000"
                            runat="server"/></td>
                </tr>
                <%--<tr>
                   <td ><asp:RegularExpressionValidator ID="regPassword" ControlToValidate="PasswordBox" Display="Dynamic" 
                            ValidationExpression="^(?=.{8,})" 
                            ErrorMessage="Password must contain 8 characters with special characters."  
                            Font-Name="Arial" ForeColor="#FF0000" runat="server"/></td>
                </tr>--%>
                <tr>
                    <td><asp:CompareValidator ID="comPassword" ControlToCompare="PasswordBox" ControlToValidate="RPasswordBox"
                            Display="Dynamic" ErrorMessage="Password Don't Match! Please retype your password carefully." 
                            Font-Name="Arial" ForeColor="#FF0000" runat="server"/></td>
                </tr>

                <tr>
                    <td><asp:Label ID="EmailLbl" Text="Email: " Font-Bold="true" Font-Names="Arial" runat="server" /></td>
                    <td><asp:TextBox ID="EmailBox" runat="server" Text='<%# Bind("Email")%>'
                        width="300px" Height="22px" /></td>
                </tr>

                <tr>
                    <td><asp:RequiredFieldValidator ID="vEmail" ControlToValidate="EmailBox" Display="Dynamic"
                            ErrorMessage="Please Enter an Email Address"  Font-Name="Arial" ForeColor="#FF0000"
                            runat="server"/></td>
                </tr>

                <tr>
                    <td><asp:RegularExpressionValidator ID="regEmail" ControlToValidate="EmailBox" Display="Dynamic" 
                            ValidationExpression=".*@.*\..*" 
                            ErrorMessage="Please Enter a Valid Email Address"  
                            Font-Name="Arial" ForeColor="#FF0000" runat="server"/></td>
                </tr>

                <tr>
                    <%--<td><asp:Label ID="PhoneNoLbl" Text="Phone No: " Font-Bold="true" Font-Names="Arial"
                         runat="server" /></td>
                    <td><asp:TextBox ID="PhoneNoBox" runat="server" Text='<%# Bind("Phone") %>'
                        width="300px" Height="22px" /></td>--%>

                </tr> 

                <tr>
                    <%--<td><asp:RequiredFieldValidator ID="vPhone" ControlToValidate="PhoneNoBox" Display="Dynamic" 
                            ErrorMessage="Please Enter a Phone Number"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/></td>--%>

                </tr>

                <tr>
                    <%--<td><asp:CheckBox ID="cbAccept" runat="server" Text="I agree all the above information is correct"
                        font-bold="true"/></td>--%>
                </tr>

                <%--since Required field validator not work with checkbox hence i use custom validator  --%>
<%--                <tr>
                    <td><asp:CustomValidator id="Accept" runat="server" 
                         OnServerValidate="ValidateCheckbox" ErrorMessage="Please check the agreement"
                        Font-Name="Arial"  ForeColor="#FF0000" /> </td>
                </tr>--%>


            </table>

           
            <br />
            <div class="centeralignRegistartion">
            <asp:Button ID="SubmitButton"   CssClass="push_button_for_Login blue"  runat ="server" Text="Submit"   CommandName="Insert"
                 CausesValidation="True" OnClick="SubmitButton_Click" />
            </div>
                <div class="centeralignRegistartion2">
            <asp:Button ID="ResetButton"  CssClass="push_button_for_Login blue"  runat  ="server" Text="Reset"   
                CausesValidation="False" OnClick="ResetButton_Click" />
            <%-- Registration Page Design Finish --%> 
            </div>
        <br />  
             <%--</div>--%>
         </div>
    </div>              
   <%-- Changes for alignment ends--%>


</asp:Content>
