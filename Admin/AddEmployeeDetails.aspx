<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddEmployeeDetails.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <asp:Label ID="lblUid" runat="server" Visible="false"></asp:Label>
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Add Teachers Details</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Teacher</li>
                <li class="active">Add Teachers Details</li>
            </ol>
        </section>
    </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>
            <asp:Label ID="lblpassword" runat="server" Visible="false" Text="Label"></asp:Label>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4 class="BoldFont">Add Teachers Details</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtName" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtName">
                                                       Teacher Name                                                      
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="TxtEmail" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="TxtEmail">
                                                       Email    
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="Error" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Invalid E-mail" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>                                              
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="TxtEmail" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                              </div>
                                            </div>
                                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtClientMobile" MaxLength="10" CssClass="form-control" placeholder="MOBILE" runat="server"></asp:TextBox>
                                                <label>
                                                    Mobile
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="Error" ControlToValidate="txtClientMobile" SetFocusOnError="true" runat="server" ForeColor="Red" ErrorMessage=" Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationGroup="Error" runat="server" ControlToValidate="txtClientMobile" ErrorMessage="Invalid Mobile No" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" TargetControlID="txtClientMobile" FilterType="Numbers" ValidChars="0123456789" runat="server" />
                                                </label>
                                            </div>
                                        </div>
                                        </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <asp:LinkButton ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Submit </asp:LinkButton>
                                            <asp:LinkButton ID="BtnUpdate" OnClick="BtnUpdate_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Update </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail Photo" ImageUrl="../img/profileimg.jpg" Width="150" Height="115px" />
                                                <div class="form-group">
                                                    <label>
                                                        Photo
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="ImgfileUpload" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </label>  
                                    <div class="custom-file">
                                        <asp:FileUpload ID="ImgfileUpload" runat="server" CssClass="custom-file-input" onchange="ShowImagePreview(this);" />
                                        <label class="custom-file-label"></label>
                                             </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="TUid" AutoGenerateColumns="False" AllowPaging="False"
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
                                                            <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click"  runat="server" Height="13px" ImageUrl="../img/EditIcon.png" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Delete">
                                                       <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                         <ItemTemplate>
                                                          <asp:ImageButton ID="ImageButtonDelete" OnClick="ImageButtonDelete_Click"  data-toggle="modal" data-target="#DeleteModal" runat="server" Height="13px" ImageUrl="../img/DeleteImageColor.png" />
                                                          </ItemTemplate>
                                                          </asp:TemplateField>
                                                    <asp:BoundField DataField="TeacherName" HeaderText="Teacher Name" SortExpression="TeacherName" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Email" HeaderText=" Email" SortExpression="Email" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Image">
                                                      <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                     <ItemTemplate>
                                                    <asp:ImageButton ID="image" ImageUrl='<%# Eval("Tphoto") %>' runat="server" Height="100px" Width="100px" />
                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                           </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select * from tbl_TeacherDetails where Status='Active'"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>   

                            </div>
                        </div>
                    </div>
                </div>
            </div>
              </ContentTemplate>
                            <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
                    <asp:PostBackTrigger ControlID="BtnUpdate" />
        </Triggers>
            </asp:UpdatePanel>
    <div class="modal fade" id="DeleteModal">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header modalhead">
                    <div class="modal-title">
                        <h4>Are you sure to want to delete ?</h4>
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblUniqueID" runat="server" Visible="false" Text="00"></asp:Label>
                            <asp:Button ID="btnYes" OnClick="btnYes_Click"  CssClass="btn btn-primary" runat="server" Text="Yes" />
                            <asp:Button ID="btnno" CssClass="btn btn-danger" data-dismiss="modal" runat="server" Text="No" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

