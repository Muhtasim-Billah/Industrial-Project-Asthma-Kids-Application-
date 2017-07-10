<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NotToday.aspx.cs" Inherits="AsthmaApp.NotToday" %>
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
                                <li ><a href="Home.aspx">Home</a></li>
                                <%--<li><a href="WeatherAnalysis.aspx">Forecast Analysis</a></li>--%>
                                <li class="active"><a href="DailyLogging.aspx">Daily Logging</a></li>
                                <li ><a href="AsthmaQuiz.aspx">Asthma Quiz</a></li>
                                <li>
                                    <a href="Registration.aspx">Register</a>
                                    

                                </li>
<%--                                <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />--%>
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


    
        <%-- *******Here finishing integration of wizard data into database********** --%>


    <div class="container-wrap">
        <div class="row animate-box fadeInUp animated-fast">
        <div class="LoggingTime">


            <br />

            <div class="WizardDiv">
                <br />
                <asp:Wizard ID="wzd" runat="server" DisplaySideBar="false" StepPreviousButtonStyle-CssClass="WizStepPrevBtn">

                 <HeaderTemplate>
                        <table style="width: 100%" >
                            <tr>
                                <td class="wizardTitle">
                                    <%--<%= wzd.ActiveStep.Title%>--%>
                                </td>
                                <td>
                                    <table style="width: 100%; border-collapse: collapse;">
                                        <tr>
                                            <td style="text-align: left" >
                                                <span class="wizardProgress">Steps:</span>
                                            </td>
                                            <asp:Repeater ID="SideBarList" runat="server">
                                                <ItemTemplate>
                                                    <td class="stepBreak">&nbsp;</td>
                                                    <td class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%# DataBinder.Eval(Container, "DataItem.Name")%>">
                                                        <%# wzd.WizardSteps.IndexOf(Container.DataItem as WizardStep) + 1 %>
                                                    </td>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <SideBarTemplate></SideBarTemplate> 
                
            <%-- WIZARD STEPS --%>
             <WizardSteps>

                        <%-- 1st wizard step --%>
                                    
                        <asp:WizardStep ID="Wiz1" runat="server" title="Step 1">
        

                            <%--<asp:Label ID="Label1" runat="server" Text="Choose the day you have Asthma"></asp:Label>--%>
                              <asp:Label ID="Label8" runat="server" Text="When was the attack ?" Font-Size="X-Large"></asp:Label>
                             <br />

                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC"  CellPadding="1" DayNameFormat="Shortest"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" 
                                Width="250px" OnDayRender="Calendar1_DayRender" SelectedDate="<%# DateTime.Today %>" >

                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <%--<WeekendDayStyle BackColor="#CCCCFF" />--%>
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" 
                                    BorderWidth="1px" Font-Bold="True"
                                    Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />

                            </asp:Calendar>
                            
                            
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Time: " Font-Size="X-Large"></asp:Label>
                            <%--<asp:TextBox ID="tbOtherDateTime" runat="server" placeholder="ex: 3:30"></asp:TextBox>--%>
                            <asp:DropDownList ID="DdlTime" runat="server">
                                 <asp:ListItem Enabled="true" Text="Select Time" Value="-1"></asp:ListItem>
                                <asp:ListItem Value="12:00 AM">12:00 AM</asp:ListItem>
                                <asp:ListItem Value="2:00 AM">2:00 AM</asp:ListItem>
                                <asp:ListItem Value="4:00 AM">4:00 AM</asp:ListItem>
                                <asp:ListItem Value="6:00 AM">6:00 AM</asp:ListItem>
                                <asp:ListItem Value="8:00 AM">8:00 AM</asp:ListItem>
                                <asp:ListItem Value="10:00 AM">10:00 AM</asp:ListItem>
                                <asp:ListItem Value="12:00 PM">12:00 PM</asp:ListItem>
                                <asp:ListItem Value="2:00 PM">2:00 PM</asp:ListItem>
                                <asp:ListItem Value="4:00 PM">4:00 PM</asp:ListItem>
                                <asp:ListItem Value="6:00 PM">6:00 PM</asp:ListItem>
                                <asp:ListItem Value="8:00 PM">8:00 PM</asp:ListItem>
                                <asp:ListItem Value="10:00 PM">10:00 PM</asp:ListItem>
                            </asp:DropDownList>

                             <br />
                            <br />

                        </asp:WizardStep>

                        <%-- 2nd wizard step --%>
                        <asp:WizardStep ID="Wiz2" runat="server" title="Step 2">

                            <asp:Label ID="Label3" runat="server" Text="Where was the attack?" Font-Size="X-Large"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Please enter your post code"  Font-Size="X-Large"></asp:Label>
                            <%--<asp:Label ID="Label6" runat="server" Text="Put in your post code please ~ " AssociatedControlID="tbOtherDateTime"></asp:Label>--%>
                            <br />
                            <br />
                            <asp:TextBox ID="tbPostcode" runat="server" placeholder="ex: 3082"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="tbPostcode"
                                ErrorMessage="Only numeric allowed." ForeColor="Red"
                                ValidationExpression="^[0-9]*$" ValidationGroup="NumericValidate">*
                            </asp:RegularExpressionValidator>
                             <br />
                            <br />
                        </asp:WizardStep>

                        <%-- 3rd wizard step --%>
                        <asp:WizardStep ID="Wiz3" runat="server" title="Step 3">

                            <asp:Label ID="Label5" runat="server" Text="Were you doing any activity?" Font-Size="X-Large"></asp:Label>
                            <br />
                            
                            <asp:DropDownList ID="DropDownActivity" runat="server" Font-Size="Large">
                                 <asp:ListItem Value="True">None</asp:ListItem>
                                <asp:ListItem Value="Running" Selected="True">Running</asp:ListItem>
                                <asp:ListItem Value="Swimming">Swimming</asp:ListItem>
                                <asp:ListItem Value="Tennis">Tennis</asp:ListItem>
                                <asp:ListItem Value="Badminton">Badminton</asp:ListItem>
                                <asp:ListItem Value="Basketball">Basketball</asp:ListItem>
                                <asp:ListItem Value="Golf">Golf</asp:ListItem>
                                <asp:ListItem Value="Boxing">Boxing</asp:ListItem>
                                <asp:ListItem Value="Football">Football</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>

                            <br />
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="Were you having any food?" Font-Size="X-Large"></asp:Label>
                            <br />
                            
                            <asp:DropDownList ID="DropDownFood" runat="server" Font-Size="Large">
                               <asp:ListItem Value="True">None</asp:ListItem>
                                <asp:ListItem Value="Egg" Selected="True">Egg</asp:ListItem>
                                <asp:ListItem Value="Cow's milk">Cow's milk</asp:ListItem>
                                <asp:ListItem Value="Peanut">Peanut</asp:ListItem>
                                <asp:ListItem Value="Tree nut">Tree nut</asp:ListItem>
                                <asp:ListItem Value="Soy">Soy</asp:ListItem>
                                <asp:ListItem Value="Wheat">Wheat</asp:ListItem>
                                <asp:ListItem Value="Fish">Fish</asp:ListItem>
                                <asp:ListItem Value="Prawn">Prawn</asp:ListItem>
                                <asp:ListItem Value="Salad">Salad</asp:ListItem>
                                <asp:ListItem Value="Fruit">Fruit</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>


                            <br />
                            <br />
                            <asp:Label ID="Label7" runat="server" Text="Were there any animals nearby?   " Font-Size="Large"></asp:Label>
                            <br />
                           
                            <asp:DropDownList ID="DropDownAnimal"  runat="server" Font-Size="Large">
                                <asp:ListItem Value="True">None</asp:ListItem>
                                <asp:ListItem Value="Cat" Selected="True">Cat</asp:ListItem>
                                <asp:ListItem Value="Dog">Dog</asp:ListItem>
                                <asp:ListItem Value="Rabbit">Rabbit</asp:ListItem>
                                <asp:ListItem Value="Mice">Mice</asp:ListItem>
                               <%-- <asp:ListItem Value="Hamster">Hamster</asp:ListItem>--%>
                                <asp:ListItem Value="Guinea pig">Guinea pig</asp:ListItem>
                                
                                <asp:ListItem Value="Bird">Bird</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                             <br />
                            <br />
                        </asp:WizardStep>

                    <%-- Last wizard step --%>
                        <asp:WizardStep runat="server"  >

                            <asp:Label ID="Lab1" runat="server" Text="Well Done!" Font-Bold="true" Font-Size="30px"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Labe2" runat="server" Text="Now you can check your analysis!" Font-Size="Large"></asp:Label>
                            <br />
                            <br />
                        </asp:WizardStep>



                    </WizardSteps>

                     <StartNextButtonStyle CssClass="push_button_for_Daily_Logging blue"  />
                    <StepPreviousButtonStyle CssClass="push_button_for_Login blue"   />
                    <StepNextButtonStyle CssClass="push_button_for_Login blue" />
                    <FinishPreviousButtonStyle CssClass="push_button_for_Login blue"/>
                    <FinishCompleteButtonStyle CssClass="push_button_for_Login blue"  /> 
                    
                    <FinishNavigationTemplate>

                        <asp:Button ID="FinishButton" CssClass="push_button_for_Daily_Logging blue" runat="server" CommandName="MoveComplete"  Text="Check Results"  OnClick="FinishButton_Click" />
                    </FinishNavigationTemplate>        
                    
                </asp:Wizard>

               <%-- <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" BackColor="#ff9933" Text="Go Results"  OnClick="FinishButton_Click1"  PostBackUrl="~/Locked/Results.aspx" />--%>

            </div>


        </div>
            </div>
    </div>


            



</asp:Content>
