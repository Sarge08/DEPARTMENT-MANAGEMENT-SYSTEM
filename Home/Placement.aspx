<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true" CodeFile="Placement.aspx.cs" Inherits="Home_Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .well{
            margin-top:20px;
            border:10px solid;
            border-color:brown;
        }
        .head{
            background-color:brown;
            color:white;
            font-weight:bold;
            padding:10px;
            margin-bottom:30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
                <div class="row">
          <div class="well">
          <div class="col-lg-12">
              <h3 class="text-center head">Our Placement Record</h3>
              </div>
              <div class="border">
                              <div class="row">
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
                  </div>
              </div>
                    </div>
    </div>
</asp:Content>

