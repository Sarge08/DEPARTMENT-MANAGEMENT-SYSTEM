﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddDesignation.aspx.cs" Inherits="Admin_Default2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Add Designation Details</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Master</li>
                <li class="active">Add Designation Details</li>
            </ol>
        </section>
    </div>
 <asp:Label ID="lblUid" runat="server" Visible="false"></asp:Label>
        <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4 class="BoldFont">Add Designation Details</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-4">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-floating mb-3">
                                    <asp:TextBox ID="txtDesignation" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                    <label for="txtDesignation">
                                        Designation Name                                                      
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDesignation" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                </div>
                            </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                     <asp:LinkButton ID="btnAddDesignation" OnClick="btnAddDesignation_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Add Designation</asp:LinkButton>
                                        <asp:LinkButton ID="btnUpdateDesignation" OnClick="btnUpdateDesignation_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-success" runat="server"><i class="fa fa-check"></i> Update Designation</asp:LinkButton>
                                </div>
                                  </div>
                                        </div>
                                           <div class="col-lg-8">
                                          <div class="row">
                                                <div class="col-lg12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="DEGUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" DataSourceID="dsDetails" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
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
                                                                    <asp:BoundField DataField="Designation" HeaderText="Project Name" SortExpression="ProjectName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                </Columns>
                                                            </asp:GridView>  
                                                         <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select * from tblDesignation where Status = 'Active' ORDER BY DEGUid desc"></asp:SqlDataSource>

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
</asp:Content>

