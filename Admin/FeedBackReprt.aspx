<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="FeedBackReprt.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
               <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | View Feedback Repor</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Report</li>
                <li class="active">View Feedback Repor</li>
            </ol>
        </section>
                                   <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="FUid" AutoGenerateColumns="False" AllowPaging="False"
                                                AllowSorting="false" DataSourceID="dsDetails" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                                <HeaderStyle />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                        <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Msg" HeaderText="Msg" SortExpression="Msg" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select * from tbl_FeedbackMaster where Status='Active'  order by FUid DESC"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
    </div>
</asp:Content>

