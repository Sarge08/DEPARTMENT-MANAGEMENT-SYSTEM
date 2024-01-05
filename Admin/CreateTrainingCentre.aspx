<%@ Page Title="Create Training Centre | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="CreateTrainingCentre.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Create Training Centre</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Training Centre</li>
                <li class="active">Create Training Centre</li>
            </ol>
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblTCID" Visible="false" runat="server"></asp:Label>
            <asp:Label ID="lblUid" Visible="false" runat="server"></asp:Label>
            <asp:Label ID="lblUniqueKey" runat="server" Visible="false"></asp:Label>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="row">
                                        <div class="col-lg-9 col-md-6 col-sm-6 col-xs-6">
                                            <div class="pull-left">
                                                <h4 class="BoldFont">Create Training Centre</h4>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6">
                                            <asp:UpdateProgress runat="server" ID="ProgressBar" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
                                                    <div class="progress-bar progress-bar-striped active">
                                                        Please Wait... 
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <center>
                                            <asp:Image ID="ImageProfilePhoto" Height="100" ImageUrl="../img/StudentIcon.png" CssClass="img-responsive img-thumbnail ProfilePhoto" runat="server" />
                                            </center>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Font-Bold="true" ValidationGroup="Error" runat="server" ControlToValidate="FileUpload1Phtoto" ErrorMessage="Only Image File Allowed" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.PNG|.JPEG|.jpg|.jpeg|.JPG|.gif)$"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStudentPhoto" Font-Bold="true" runat="server" ErrorMessage="Required" ControlToValidate="FileUpload1Phtoto" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </label>
                                            <asp:FileUpload ID="FileUpload1Phtoto" EnableViewState="true" ViewStateMode="Enabled" onchange="ShowImagePreviewProfilePhoto(this)" CssClass="form-control" runat="server" />
                                            <asp:LinkButton ID="btnUpdatePhtoto" OnClick="btnUpldate_Click" CssClass="btn btn-info" Visible="false" runat="server">Update Photo</asp:LinkButton>
                                               </div>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-9 col-xs-12">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtCentreName" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtCentreName">
                                                        Training Centre Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtCentreName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtAuthorizedPersonName" CssClass="form-control text-capitalize" placeholder="Type Authorized Person Name" runat="server"></asp:TextBox>
                                                    <label for="txtAuthorizedPersonName">
                                                        Authorized Person Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtAuthorizedPersonName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtEmail" CssClass="form-control text-lowercase" placeholder="Type Email" runat="server"></asp:TextBox>
                                                    <label for="txtEmail">
                                                        Email                                                   
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="Error" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+.)+[a-z]{2,5}$"></asp:RegularExpressionValidator>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtMobileNumber" CssClass="form-control" placeholder="Type Mobile Number" MaxLength="10" runat="server"></asp:TextBox>
                                                    <label for="txtMobileNumber">
                                                        Mobile      
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtMobileNumber" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="Error" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Invalid Mobile" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtMobileNumber" FilterType="Numbers" ValidChars="0123456789" runat="server" />
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtDateOfRegd" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtDateOfRegd"></ajaxToolkit:CalendarExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderss6" TargetControlID="txtDateOfRegd" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                    <label for="txtDateOfRegd">
                                                        Date of Regd.                                                     
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8ss" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfRegd" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtBranchCode" CssClass="form-control" placeholder="Type Branch Code" runat="server"></asp:TextBox>
                                                    <label for="txtBranchCode">
                                                        Branch Code                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtBranchCode" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtPresentAddresss" CssClass="form-control text-capitalize" placeholder="Type Employee Present Address" runat="server"></asp:TextBox>
                                                    <label for="txtPresentAddresss">
                                                        Present Address                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtPresentAddresss" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-9 col-md-9 col-sm-7 col-xs-12">
                                        <div class="form-group">
                                            <asp:LinkButton ID="btnAddTC" OnClick="btnAddTC_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Create Centre</span></asp:LinkButton>
                                            <asp:LinkButton ID="btnUpdateTC" OnClick="btnUpdateTC_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-success" runat="server"><i class="fa fa-refresh"></i> Update Centre</span></asp:LinkButton>
                                            <asp:LinkButton ID="btnSendMail" OnClick="btnSendMail_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-primary" runat="server"><i class="fa fa-mail-forward"></i> Send Mail</span></asp:LinkButton>
                                            <asp:LinkButton ID="btnClear" ValidationGroup="Error" CssClass="btn btn-danger" runat="server"><span><i class="fa fa-refresh"></i> Clear</span></asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-5 col-xs-12">
                                        <div class="form-group">
                                            <asp:Label ID="lblMessage" Font-Bold="true" Width="100%" runat="server" EnableViewState="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel ID="Panel1" DefaultButton="btnSearch" runat="server">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <div class="input-group form-group">
                                                <asp:TextBox ID="txtSearch" CssClass="form-control" placeholder="Type Patient Name  or Patient UHID No or Patient Mobile No..." runat="server"></asp:TextBox>
                                                <span class="input-group-btn">
                                                    <asp:LinkButton runat="server" ID="btnSearch" OnClick="btnSearch_Click" CssClass="btn btn-info">
                                             <span class="glyphicon glyphicon-search"></span> Search
                                                    </asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="btnRefresh" OnClick="btnRefresh_Click" Visible="false" CssClass="btn btn-warning">
                                             <span class="glyphicon glyphicon-refresh"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <div class="table-responsive">
                                                <asp:GridView ID="gvDetails" OnRowDataBound="gvDetails_RowDataBound" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="TCUid" AutoGenerateColumns="False" AllowPaging="True"
                                                    AllowSorting="false" PageSize="50" DataSourceID="dsDetails" CssClass="table table-condensed table-bordered table-striped">
                                                    <HeaderStyle />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="true">
                                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                            <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="View">
                                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton1" ValidationGroup="Other" OnClick="ImageButton1_Click" runat="server" Height="13px" ImageUrl="../img/EditIcon.png" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="TCStatus" HeaderText="TC Status" SortExpression="TCStatus" NullDisplayText="N/A" ReadOnly="True">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TCCode" HeaderText="TC Code" SortExpression="TCCode" NullDisplayText="N/A" ReadOnly="True">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="true" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="CentreName" HeaderText="Centre Name" SortExpression="CentreName" NullDisplayText="N/A" ReadOnly="True">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="true" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Owner" HeaderText="Owner Name" SortExpression="Owner" NullDisplayText="N/A" ReadOnly="True">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="true" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="MobileNumber" HeaderText="Mobile No" SortExpression="MobileNumber" NullDisplayText="N/A" ReadOnly="True">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="true" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="DateOfRegd" HeaderText="Date of Regd." DataFormatString="{0:dd-MMM-yyyy}" SortExpression="DateOfRegd" NullDisplayText="N/A" ReadOnly="True">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="true" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" NullDisplayText="N/A" ReadOnly="True">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="true" />
                                                        </asp:BoundField>
                                                          <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" NullDisplayText="N/A" ReadOnly="True">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                            <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="true" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select TC.* from tblTrainingCentreMaster  TC where tc.Status = 'Active' order by tc.TCUid desc" FilterExpression="CentreName LIKE '%{0}%' or MobileNumber LIKE '%{0}%' or TCCode LIKE '%{0}%'">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="CentreName" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="MobileNumber" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="TCCode" ControlID="txtSearch" PropertyName="Text" />
                                                    </FilterParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAddTC" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

