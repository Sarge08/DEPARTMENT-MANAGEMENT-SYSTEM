<%@ Page Title="Add Batch Details | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddBatch.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Add Batch Details</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Master</li>
                <li class="active">Add Batch Details</li>
            </ol>
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblUid" runat="server" Visible="false"></asp:Label>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4 class="BoldFont">Add Batch Details</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="Body">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListTrainingCentre" Width="100%" AppendDataBoundItems="true" DataSourceID="SqlDataSource4" DataTextField="CentreName" DataValueField="TCUid" CssClass="form-control select2 DropDown" runat="server">
                                                    <asp:ListItem Value="0">Training Centre Name</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HMS %>" SelectCommand="SELECT CentreName+' ('+TCCode+') ' as CentreName, TCUid FROM tblTrainingCentreMaster where Status = 'Active' and TCStatus = 'Regd. Done' order by CentreName desc"></asp:SqlDataSource>
                                                <label for="DropDownListTrainingCentre">
                                                    Training Centre Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DropDownListTrainingCentre" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtBatchName" CssClass="form-control" placeholder="Type Batch Name" runat="server"></asp:TextBox>
                                                        <label for="txtBatchName">
                                                            Batch Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtBatchName" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtBatchTiming" CssClass="form-control" placeholder="Type Batch Timing" runat="server"></asp:TextBox>
                                                        <label for="txtBatchTiming">
                                                            Batch Timing                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtBatchTiming" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:LinkButton ID="btnAddBatch" OnClick="btnAddBatch_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Add Batch</asp:LinkButton>
                                                <asp:LinkButton ID="btnUpdateBatch" Visible="false" OnClick="btnUpdateBatch_Click" ValidationGroup="Error" CssClass="btn btn-success" runat="server"><i class="fa fa-check"></i> Update Batch</asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="gvDetails" DataSourceID="dsDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Candidate Found..." runat="server" DataKeyNames="BatchUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" PageSize="100" CssClass="table table-condensed table-bordered table-striped">
                                                            <HeaderStyle />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="View">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" Height="13px" ImageUrl="../img/EditIcon.png" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:BoundField DataField="CentreName" HeaderText="Centre Name" SortExpression="CentreName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="BatchName" HeaderText="Batch Name" SortExpression="BatchName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Timing" HeaderText="Batch Timing" SortExpression="Timing" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select b.BatchUid,b.BatchName,b.Timing,tc.CentreName from tblBatchMaster b, tblTrainingCentreMaster tc where b.Status = 'Active' and b.TCUid =tc.TCUid order by b.BatchUid desc"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

