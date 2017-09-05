<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MasterFarm._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
    <!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
    <!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
    <!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->
    <meta charset="utf-8">
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Jonathan:0717002320">
    <title>Farm Manager</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <link href="~/favicon(1).ico" rel="shortcut icon" type="image/x-icon" />
    <!-- ============ Add custom CSS here ============ -->
    <link href="/Digital/css/jClocksGMT.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Farm Manager</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/contact">Contact Us</a> </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <%--<div id="clock_uk"></div>--%>
            <div id="banner">
                <h1>Farm Manager <strong>Login Form</strong></h1>
                <h1><strong>shiundu.com</strong></h1>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Login Page <i class="fa fa-pencil pull-right"></i></legend>
<%--                        <div class="form-group">
                          <asp:Label ID="Label5" runat="server" Text="Branch" CssClass="col-lg-2 control-label"></asp:Label>                          
                            <div class="col-lg-10">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control ddl">
                                    <asp:ListItem>Head Office</asp:ListItem>
                                    <asp:ListItem>Main Branch</asp:ListItem>
                                </asp:DropDownList>                              
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="UserName:" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TxtUserName" runat="server" style="text-transform: uppercase"  placeholder="User Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TxtPassword" runat="server" placeholder="Password" CssClass="form-control"
                                    TextMode="Password"></asp:TextBox>
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnsave_Click"/>
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" />                              
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';

        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
            //"img/44.jpg",
            "img/34.jpg"
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );
    </script>
       <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>

        <script src="/Digital/js/jClocksGMT.js" type="text/javascript"></script>
        <script src="/Digital/js/jquery.rotate.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {

                $('#clock_hou').jClocksGMT(
                {
                    title: 'EAT, TX, Nairobi',
                    offset: '3'
                });

                $('#clock_india').jClocksGMT(
                {
                    title: 'New Delhi, India',
                    offset: '+5.5',
                    dst: false,
                    skin: 2,
                    timeformat: 'HH:mm'
                });

                $('#clock_korea').jClocksGMT(
                {
                    title: 'Seoul, S. Korea',
                    offset: '+8',
                    skin: 3,
                    date: true
                });

                $('#clock_uk').jClocksGMT(
                {
                    date: true,
                    dateformat: 'YYYY/MM/DD',
                    skin: 4
                });

                $('#clock_tokyo').jClocksGMT(
                {
                    title: 'Tokyo, Japan',
                    offset: '+9',
                    skin: 5
                });

            });
        </script>

    </form>
</body>
</html>