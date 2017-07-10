<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AsthmaApp.GridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Animate.css -->
    <link rel="stylesheet" href="../myTemplate/css/animate.css" />
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="../myTemplate/css/icomoon.css" />
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../myTemplate/css/bootstrap.css" />

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="../myTemplate/css/magnific-popup.css" />

    <!-- Flexslider  -->
    <link rel="stylesheet" href="../myTemplate/css/flexslider.css" />

    <!-- Theme style  -->
    <link rel="stylesheet" href="../myTemplate/css/style.css" />

    <!-- Modernizr JS -->
    <script src="../myTemplate/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->

     <!-- jQuery -->
    <script src="../myTemplate/js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="../myTemplate/js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="../myTemplate/js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="../myTemplate/js/jquery.waypoints.min.js"></script>
    <!-- Flexslider -->
    <script src="../myTemplate/js/jquery.flexslider-min.js"></script>
    <!-- Magnific Popup -->
    <script src="../myTemplate/js/jquery.magnific-popup.min.js"></script>
    <script src="../myTemplate/js/magnific-popup-options.js"></script>
    <!-- Counters -->
    <script src="../myTemplate/js/jquery.countTo.js"></script>
    <!-- Main -->
    <script src="../myTemplate/js/main.js"></script>

</asp:Content>

<script runat="server">

    /* Display Data by row wise */
    void displayData(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            lblDisplayBook.Text = "<table><tr><td>" +

              " </td><td><b>Username: </b><p /><b> " +
              GridView1.Rows[Convert.ToInt32(e.CommandArgument)].
                Cells[2].Text +
              "</b> <br />Password: " +
              GridView1.Rows[Convert.ToInt32(e.CommandArgument)].
                Cells[3].Text +
              " </b><br />Email: " +
              GridView1.Rows[Convert.ToInt32(e.CommandArgument)].
                Cells[4].Text +
              "<br />Phone: " +
              GridView1.Rows[Convert.ToInt32(e.CommandArgument)].
                Cells[5].Text +
              "</td></tr></table>";
        }
        catch(Exception ex)
        {
            lblDisplayBook.Text = "";
        }
    }

    /* after Update refreshing the grid*/
    void refreshGrid(object sender, GridViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }

    /* searching data by user's name */
    private void findUser(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        switch (btn.CommandName)
        {
            case "FName":
                SqlDataSource1.SelectCommand = "SELECT * FROM Login WHERE User_name =" + Session["id"].ToString();
                //SqlDataSource1.SelectCommand = "SELECT * FROM Login WHERE User_name LIKE '%" + 
                //FnameBox.Text.Trim(' ') + "%'";
                break;
        }

        GridView1.DataBind();
    }



    </script>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--*** MENU START*** --%>
    <div id="page">
        <nav class="fh5co-nav" role="navigation">
            <div class="container-wrap">
                <div class="top-menu">
                    <div class="row">
                        <div class="col-xs-2">
                            <div id="fh5co-logo"><a href="Home.aspx">Asthma Alerts</a></div>
                        </div>
                        <div class="col-xs-10 text-right menu-1">
                            <ul>
                                <li><a href="../Home.aspx">Home</a></li>
                                <li><a href="../WeatherAnalysis.aspx">Forecast Analysis</a></li>
                                <li  class="active"><a href="Locked/DailyLogging.aspx">Daily Logging</a></li>
                                <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />

                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </nav>
        </div>
    <%-- ***MENU FINISH*** --%>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AsthmaKidsDBConnectionString %>" SelectCommand="SELECT * FROM [Login]" UpdateCommand="UPDATE [Login] SET [User_name] = @User_name, [User_password] = @User_password, [Email] = @Email, [Phone] = @Phone WHERE [User_id] = @User_id" >

        <UpdateParameters>
            <asp:Parameter Name="User_name" Type="String" />
            <asp:Parameter Name="User_password" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="User_id" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

   <div class="LoginContainer">

       <div>  
                <p>  
                    <asp:Label ID="Label1" Font-Size="XX-Large" Font-Bold="true" runat="server"></asp:Label> 
                </p>  
            </div>  

    <%-- interface for searching by user's first name option --%>
    <table>
            <tr>
                <td colspan="2"> Please enter user name.<br/> 
                </td>
            </tr>
            <tr>
                <td class="text">   
                <asp:TextBox id="FnameBox" runat="server" 
                width = "100" ></asp:TextBox>
                </td>
                <td>
                <asp:Button id="btnFname" onclick="findUser" 
                runat="server" 
                Text="Click to find Users from their first name"
                CssClass="button" CommandName="FName" />
                </td>
            </tr>
            
        </table>


        <%-- this label will display the selected row data (used in displayData function in script part) --%>
        <asp:Label ID="lblDisplayBook" runat="server"
                    CssClass="usersLabel" />
    <p />

    <div>
        <asp:GridView ID="GridView1" runat="server"
                      DataSourceID="SqlDataSource1" HeaderStyle-CssClass="usersHeader" 
                      CssClass="usersGridPage" AlternatingRowStyle-CssClass="usersAlternate" 
                      RowStyle-CssClass ="usersRow" AutoGenerateColumns="False"
                      DataKeyNames="User_id"
                      OnItemUpdated="refreshGrid"
                      OnRowCommand="displayData"
                      AllowSorting="True">
            <%--<EditRowStyle ForeColor="Black" CssClass="editUsers" />--%>

<AlternatingRowStyle CssClass="usersAlternate"></AlternatingRowStyle>

            <Columns>
                <asp:BoundField DataField="User_id" HeaderText="User_id" 
                                ReadOnly="True" ItemStyle-CssClass="differentUsers" SortExpression="User_id" InsertVisible="False"  />
                <asp:BoundField DataField="User_name" HeaderText="User_name" 
                                ItemStyle-CssClass="differentUsers" SortExpression="User_name"  />
                <asp:BoundField DataField="User_password" HeaderText="User_password" 
                                ItemStyle-CssClass="differentUsers" SortExpression="User_password"  />
                <asp:BoundField DataField="Email" HeaderText="Email" 
                                ItemStyle-CssClass="differentUsers" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" 
                                ItemStyle-CssClass="differentUsers" SortExpression="Phone" />

                <asp:CommandField ButtonType="Link" EditText="Edit" ShowEditButton="true" />
                
            </Columns>


<HeaderStyle CssClass="usersHeader"></HeaderStyle>

<RowStyle CssClass="usersRow"></RowStyle>


        </asp:GridView>

        <p>  
                <asp:Button ID="LogoutBtn" runat="server" Height="47px" onclick="LogoutBtn_Click"   
                Text="Logout" Width="92px" />  
        </p> 
    
    </div>

       </div>

</asp:Content>
