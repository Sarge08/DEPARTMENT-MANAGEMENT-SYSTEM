<%@ Page Title="Admin Dashboard | e-IMS | Smart ERP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/Dashboard.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
            </ol>
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                                        <div class="row">
                                            <div class="well">
                                              <div class="col-lg12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="GridView1" OnRowDataBound="GridView1_RowDataBound" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" DataSourceID="DsDetails" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                                            <HeaderStyle />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                                </asp:TemplateField>
                                                                    <asp:BoundField DataField="SName" HeaderText="Student Name" SortExpression="SName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="RollNo" HeaderText="Roll No" SortExpression="RollNo" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Mobile" HeaderText="Contact No" SortExpression="Mobile" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                               <asp:BoundField DataField="Session" HeaderText="Session" SortExpression="Session" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PStatus" HeaderText="Placement Status" SortExpression="PStatus" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                </Columns>
                                                            </asp:GridView>  
                                                         <asp:SqlDataSource ID="DsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select s.*,f.* from tbl_StudentMaster s,tbl_PlacementMaster f where s.Status = 'Active' and s.SUid=f.SUid "></asp:SqlDataSource>

                                                        </div>
                                                    </div>
                                            </div>
                                              </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <div class="box1">
                                        <div class="row">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                <img src="../img/boximg-1.png" class="img-responsive" />
                                            </div>
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <asp:Label ID="lbltotalRecord1" CssClass="lblmsg" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label class="boxtext">Total Strength </label>
                                            </div>
                                        </div>
                                    </div>
                                 <a data-target="#Strength" data-toggle="modal" class="view text-center">View</></a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <div class="box2">
                                        <div class="row">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                <img src="../img/Cashless.png" class="img-responsive" />
                                            </div>
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <asp:Label ID="lblTotalCall" CssClass="lblmsg" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label class="boxtext">Total Placed Student </label>
                                            </div>
                                        </div>
                                    </div>
                                    <a><p data-target="#FollowOfToday" data-toggle="modal" class="view">View</p></a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <div class="box3">
                                        <div class="row">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                <img src="../img/PatientIconBlack.png" class="img-responsive" />
                                            </div>
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <asp:Label ID="lblFollowOfNextDay" CssClass="lblmsg" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label class="boxtext">Not Placed Student </label>
                                            </div>
                                        </div>
                                    </div>
                                    <a><p data-target="#FollowOfNextDay" data-toggle="modal" class="view">View</p></a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <div class="box4">
                                        <div class="row">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                <img src="../img/img1.png" class="img-responsive" />
                                            </div>
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <asp:Label ID="lblTotalInterestedClient" CssClass="lblmsg" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label class="boxtext">Total Registration </label>
                                            </div>
                                        </div>
                                    </div>
                                    <a><p data-target="#InterestedClient" data-toggle="modal" class="view">View</p></a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
  </div>
                           
                    <!-- Trigger the modal with a button -->

                    <!-- Modal -->
                    <div class="modal fade" id="Strength" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Total Strength</h4>
                                </div>
                                <div class="modal-body">
                                       <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" DataSourceID="SqlDataSource1" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                                            <HeaderStyle />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="SName" HeaderText="Student Name" SortExpression="SName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SEmail" HeaderText="Email" SortExpression="SEmail" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="RollNo" HeaderText="Roll No" SortExpression="RollNo" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                               <asp:TemplateField HeaderText="Image">
                                                                <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                <asp:ImageButton ID="image" ImageUrl='<%# Eval("SPhoto") %>' runat="server" Height="100px" Width="100px" />
                                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select * from tbl_StudentMaster where Status='Active'"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                       </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                            <!-- fro modal-2 -->
                         <div class="container">
                
                    <!-- Trigger the modal with a button -->

                    <!-- Modal -->
                    <div class="modal fade" id="FollowOfToday" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Total Placed Student</h4>
                                </div>
                                <div class="modal-body">
                                      <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="GridView2" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" DataSourceID="SqlDataSource2" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                                            <HeaderStyle />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="SName" HeaderText="Student Name" SortExpression="SName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SEmail" HeaderText="Email" SortExpression="SEmail" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="RollNo" HeaderText="Roll No" SortExpression="RollNo" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PStatus" HeaderText="Placement Status"  SortExpression="PStatus" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                 <asp:BoundField DataField="Company1" HeaderText="1St Company" SortExpression="Company1" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                   <asp:BoundField DataField="Company2" HeaderText="2nd Company" SortExpression="Company2" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Company3" HeaderText="3rd Company" SortExpression="Company3" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                               <asp:TemplateField HeaderText="Image">
                                                                <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                <asp:ImageButton ID="image" ImageUrl='<%# Eval("SPhoto") %>' runat="server" Height="100px" Width="100px" />
                                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="SELECT s.*,f.PStatus,f.Company1,f.Company2,f.Company3 from tbl_StudentMaster s,tbl_PlacementMaster f where s.SUid=f.SUid and s.Status='Active' and f.PStatus='Yes'"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                       </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                              <!-- fro modal-3 -->
                         <div class="container">
                
                    <!-- Trigger the modal with a button -->

                    <!-- Modal -->
                    <div class="modal fade" id="FollowOfNextDay" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Not Placed</h4>
                                </div>
                                <div class="modal-body">
                                     <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="GridView3" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" DataSourceID="SqlDataSource3" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                                            <HeaderStyle />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="SName" HeaderText="Student Name" SortExpression="SName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SEmail" HeaderText="Email" SortExpression="SEmail" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="RollNo" HeaderText="Roll No" SortExpression="RollNo" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PStatus" HeaderText="Placement Status"  SortExpression="PStatus" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                 <asp:BoundField DataField="Company1" HeaderText="1St Company" SortExpression="Company1" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                   <asp:BoundField DataField="Company2" HeaderText="2nd Company" SortExpression="Company2" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Company3" HeaderText="3rd Company" SortExpression="Company3" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                               <asp:TemplateField HeaderText="Image">
                                                                <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                <asp:ImageButton ID="image" ImageUrl='<%# Eval("SPhoto") %>' runat="server" Height="100px" Width="100px" />
                                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="SELECT s.*,f.PStatus,f.Company1,f.Company2,f.Company3 from tbl_StudentMaster s,tbl_PlacementMaster f where s.SUid=f.SUid and s.Status='Active' and f.PStatus='No'"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                       </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                                <!-- fro modal-4 -->
                         <div class="container">
                
                    <!-- Trigger the modal with a button -->

                    <!-- Modal -->
                    <div class="modal fade" id="InterestedClient" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Total Registration</h4>
                                </div>
                                <div class="modal-body">
                                     <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="GridView4" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" DataSourceID="SqlDataSource4" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                                            <HeaderStyle />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="SName" HeaderText="Student Name" SortExpression="SName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SEmail" HeaderText="Email" SortExpression="SEmail" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="RollNo" HeaderText="Roll No" SortExpression="RollNo" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PStatus" HeaderText="Placement Status"  SortExpression="PStatus" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                 <asp:BoundField DataField="Company1" HeaderText="1St Company" SortExpression="Company1" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                   <asp:BoundField DataField="Company2" HeaderText="2nd Company" SortExpression="Company2" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Company3" HeaderText="3rd Company" SortExpression="Company3" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                               <asp:TemplateField HeaderText="Image">
                                                                <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                <asp:ImageButton ID="image" ImageUrl='<%# Eval("SPhoto") %>' runat="server" Height="100px" Width="100px" />
                                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="SELECT s.*,f.PStatus,f.Company1,f.Company2,f.Company3 from tbl_StudentMaster s,tbl_PlacementMaster f where s.SUid=f.SUid and s.Status='Active'"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                       </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

