<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="ClientWiseReport.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Client Wise Report</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">All Reports</li>
                <li class="active">Client Wise Report</li>
            </ol>
        </section>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4 class="BoldFont">View Report</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                <div class="form-floating mb-3">
                                    <asp:TextBox ID="txtDateFrom" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfBirth_CalendarExtender11" TargetControlID="txtDateFrom"></ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtDateFrom" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                    <label for="txtDateOfBirth">
                                        Date From:                                                     
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateFrom" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md- 2 col-sm-2 col-xs-12">
                                <div class="form-floating mb-3">
                                    <asp:TextBox ID="txtDateTo" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfBirth_CalendarExtender11" TargetControlID="txtDateTo"></ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtDateTo" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                    <label for="txtDateOfBirth">
                                        Date To:                                                     
                                   
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateTo" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <asp:LinkButton ID="btnSearch" OnClick="btnSearch_Click" ValidationGroup="Error" CssClass="btn btn-info btn-lg" runat="server"><span class="glyphicon glyphicon-search"></span> Search</asp:LinkButton>
                                <asp:LinkButton ID="btnExport" OnClick="btnExport_Click" ValidationGroup="Error" CssClass="btn btn-success btn-lg" runat="server">Export <span class="glyphicon glyphicon-export"></span></asp:LinkButton>
                            </div>
                        </div>
                            <div class="row">
                            <div class="col-lg-12 form-group">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="CLid" AutoGenerateColumns="False" AllowPaging="False"
                                        AllowSorting="false" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                        <HeaderStyle />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                <ItemStyle Font-Size="Small" Font-Bold="true" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CName" HeaderText="Client Name" SortExpression="ClientName" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CAddress" HeaderText="Client Address" SortExpression="ClientAddress" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DateOfCall" HeaderText="Date Of Call" DataFormatString="{0:dd-MM-yyyy}" SortExpression="DateOfCall" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="FollowOfDate" HeaderText="Follow Of Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="FollowOfDate" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CallStatus" HeaderText="Call Status" SortExpression="CallStatus" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" NullDisplayText="N/A" ReadOnly="True">
                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

