<%@ Page Title="Receive Payment | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="ReceivePayment.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Fee Collection</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Payment</li>
                <li class="active">Fee Collection</li>
            </ol>
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="row">
                                        <div class="col-lg-9 col-md-6 col-sm-6 col-xs-6">
                                            <div class="pull-left">
                                                <h4 class="BoldFont">Fee Collection</h4>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6">
                                            <asp:UpdateProgress runat="server" ID="ProgressBar" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
                                                    <div class="progress-bar progress-bar-striped active" style="width: 100%; margin-top: 5px; font-weight: 700; height: 30px; line-height: 30px">
                                                        Please Wait... 
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                            <asp:Label ID="lblMessage" EnableViewState="true" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body"></div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

