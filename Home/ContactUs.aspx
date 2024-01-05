<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Home_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        section {
            padding: 60px 0;
            min-height: 100vh;
        }

        .contact-info {
            display: inline-block;
            width: 100%;
            text-align: center;
            margin-bottom: 10px;
        }

        .contact-info-icon {
            margin-bottom: 15px;
        }

        .contact-info-item {
            background: #071c34;
            padding: 30px 0px;
        }

        .contact-page-sec .contact-page-form h2 {
            color: #071c34;
            text-transform: capitalize;
            font-size: 22px;
            font-weight: 700;
        }

        .contact-page-form .col-md-6.col-sm-6.col-xs-12 {
            padding-left: 0;
        }

        .contact-page-form.contact-form input {
            margin-bottom: 5px;
        }

        .contact-page-form.contact-form textarea {
            height: 110px;
        }

        .contact-page-form.contact-form input[type="submit"] {
            background: #071c34;
            width: 150px;
            border-color: #071c34;
        }

        .contact-info-icon i {
            font-size: 48px;
            color: #fda40b;
        }

        .contact-info-text p {
            margin-bottom: 0px;
        }

        .contact-info-text h2 {
            color: #fff;
            font-size: 22px;
            text-transform: capitalize;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .contact-info-text span {
            color: #999999;
            font-size: 16px;
            font-weight:;
            display: inline-block;
            width: 100%;
        }

        .contact-page-form input {
            background: #f9f9f9 none repeat scroll 0 0;
            border: 1px solid #040404;
            margin-bottom: 20px;
            padding: 12px 16px;
            width: 100%;
            border-radius: 4px;
        }

        .contact-page-form .message-input {
            display: inline-block;
            width: 100%;
            padding-left: 0;
        }

        .single-input-field textarea {
            background: #f9f9f9 none repeat scroll 0 0;
            border: 1px solid #040404;
            width: 100%;
            height: 120px;
            padding: 12px 16px;
            border-radius: 4px;
        }

        .single-input-fieldsbtn input[type="submit"] {
            background: #fda40b none repeat scroll 0 0;
            color: #fff;
            display: inline-block;
            font-weight: 600;
            padding: 10px 0;
            text-transform: capitalize;
            width: 150px;
            margin-top: 20px;
            font-size: 16px;
        }

            .single-input-fieldsbtn input[type="submit"]:hover {
                background: #071c34;
                transition: all 0.4s ease-in-out 0s;
                border-color: #071c34;
            }

        .single-input-field h4 {
            color: #464646;
            text-transform: capitalize;
            font-size: 14px;
        }

        .contact-page-form {
            display: inline-block;
            width: 100%;
            margin-top: 30px;
        }

        .contact-page-map {
            margin-top: 36px;
        }

        .contact-page-form form {
            padding: 20px 15px 0;
        }
        .glyphicon{
            color:#fda40b;
            font-size:48px;
        }
        .txth5{
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div></div>
    <body>
        <section class="contact-page-sec">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <div class="contact-info-text">
                                    <h2>Address</h2>
                                    <span>Ravenshaw University, </span>
                                    <span>Cuttack, 753003</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fa fa-envelope"></i>
                                </div>
                                <div class="contact-info-text">
                                    <h2>E-mail</h2>
                                    <span>info@itm.com</span>
                                    <span>contactusitm@gmail.com</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-item">
                                <div class="glyphicon glyphicon-earphone">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                <div class="contact-info-text">
                                    <h2>Contact time</h2>
                                    <span>Mon - Fri  9:00 am - 4.00 pm</span>
                                    <span>Sat  9:00 am - 2.00 pm</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="contact-page-form col-lg-12">
                            <h2>Get in Touch</h2>
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="single-input-field">
                                         <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Your Name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="single-input-field">
                                        <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="E-mail" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12 message-input">
                                    <div class="single-input-field">
                                        <asp:TextBox ID="txtMessage" CssClass="form-control" placeholder="Message" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="single-input-fieldsbtn">
                                     <asp:Button ID="btnsubmit10" OnClick="btnsubmit10_Click" ValidationGroup="Error" CssClass="btn btn-success" runat="server" Text="Submit" />
                               </div>
                                  <div class="form-group">
                            <asp:Label ID="lblMessage5" runat="server"></asp:Label>
                        </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-page-map">
                            <iframe width="100%" height="305" frameborder="0" style="border: 0" src="https://maps.google.com/maps?width=600&amp;height=400&amp;hl=en&amp;q=Ravenshaw University , Cuttack&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</body>
</asp:Content>
