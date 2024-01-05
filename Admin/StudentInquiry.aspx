<%@ Page Title="Student Inquiry Details | e-IMS | Smart ERP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="StudentInquiry.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <asp:Label ID="lblText" runat="server" Visible="true"></asp:Label>
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Student Inquiry Details</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Training Centre</li>
                <li class="active">Student Inquiry Details</li>
            </ol>
        </section>
    </div>
   <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>--%>
            <asp:Label ID="lblUid" runat="server" visible="false"></asp:Label>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="row">
                                        <div class="col-lg-9 col-md-6 col-sm-6 col-xs-6">
                                            <div class="pull-left">
                                                <h4 class="BoldFont">Student Inquiry Details</h4>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6">
                                          <%--  <asp:UpdateProgress runat="server" ID="ProgressBar" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
                                                    <div class="progress-bar progress-bar-striped active">
                                                        Please Wait... 
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>--%>
                                            <asp:Label ID="lblMessage" EnableViewState="true" runat="server"></asp:Label>
                                            
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="Body">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListTrainingCentre" OnSelectedIndexChanged="DropDownListTrainingCentre_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataTextField="CentreName" DataValueField="TCUid" CssClass="form-control select2 DropDown" runat="server">
                                                    <asp:ListItem Value="0">Choose Centre Name</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListTrainingCentre">
                                                    Centre Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" InitialValue="0" ControlToValidate="DropDownListTrainingCentre" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="textstudentName" CssClass="form-control text-capitalize" placeholder="select Financial Year" runat="server"></asp:TextBox>
                                                <label>
                                                    Name Of Stundent                                                    
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="textstudentName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownFinancialYear" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose</asp:ListItem>
                                                    <asp:ListItem>2023-24</asp:ListItem>
                                                    <asp:ListItem>2022-23</asp:ListItem>
                                                    <asp:ListItem>2021-22</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownFinancialYear">
                                                    Financial Year                                           
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="DropDownFinancialYear" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtAdress" CssClass="form-control text-capitalize" placeholder="Type Guardian Name" runat="server"></asp:TextBox>
                                                <label>
                                                    Adress of Student                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtAdress" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtDateOfInquire" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfInquire_CalendarExtender11" TargetControlID="txtDateOfInquire"></ajaxToolkit:CalendarExtender>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderss6" TargetControlID="txtDateOfInquire" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                <label for="txtDateOfInquire">
                                                    Inquiry Date                                                       
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8ss" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfInquire" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtInquireTime" CssClass="form-control timepicker" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                                <label for="txtInquireTime">
                                                    Inquire Time                                                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtInquireTime" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtMobileNumber" CssClass="form-control" placeholder="Type Mobile Number" MaxLength="10" runat="server"></asp:TextBox>
                                                <label for="txtMobileNumber">
                                                    Mobile      
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtMobileNumber" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="Error" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Invalid Mobile" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtMobileNumber" FilterType="Numbers" ValidChars="0123456789" runat="server" />
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="textWNumber" CssClass="form-control" placeholder="Type Mobile Number" MaxLength="10" runat="server"></asp:TextBox>
                                                <label for="textWNumber">
                                                    What's App No     
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="textWNumber" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="Error" runat="server" ControlToValidate="textWNumber" ErrorMessage="Invalid Mobile" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="textWNumber" FilterType="Numbers" ValidChars="0123456789" runat="server" />
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownInquireOn" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose</asp:ListItem>
                                                    <asp:ListItem>Computer</asp:ListItem>
                                                    <asp:ListItem>Compitative</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownInquireOn">
                                                    Inquiry on                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="DropDownInquireOn" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownInquireCourse" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" DataValueField="SubjectUid" DataTextField="SubjectName" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownInquireCourse">
                                                    Inquiry course                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="DropDownInquireCourse" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownEnquireMode" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose</asp:ListItem>
                                                    <asp:ListItem>Physical</asp:ListItem>
                                                    <asp:ListItem>Mobile</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownEnquireMode">
                                                    Inquiry Mode                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="DropDownEnquireMode" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="textCounselerName" CssClass="form-control text-capitalize" placeholder="select Financial Year" runat="server"></asp:TextBox>
                                                <label>
                                                    Counseling Done by                                                  
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="textCounselerName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownInquireReference" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose</asp:ListItem>
                                                    <asp:ListItem>Reffered</asp:ListItem>
                                                    <asp:ListItem>Direct</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownInquireReference">
                                                    Inquiry Reference                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DropDownInquireReference" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <asp:LinkButton ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="Error" CssClass="btn btn-info btn-lg" runat="server"><i class="fa fa-check"></i> Submit</asp:LinkButton>
                                                 <asp:LinkButton ID="btnUpdate" visible="false"  CssClass="btn btn-sucess btn-lg" runat="server"><i class="fa fa-check"></i> Update</asp:LinkButton>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                   
                   <div class="row">
                        <div class="col-lg-12 form-group">
                            <div class="table-responsive">
                                <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="IQUid" AutoGenerateColumns="False" AllowPaging="True"
                                    AllowSorting="false" PageSize="50" DataSourceID="SqlDataSource2" CssClass="table table-condensed table-bordered table-striped">
                                    <HeaderStyle />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                            <ItemStyle Font-Size="Medium" Font-Bold="true" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server"  Height="13px" ImageUrl="../img/EditIcon.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                        <asp:BoundField DataField="SubjectName" HeaderText="Sub Name" SortExpression="FullName" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="FullName" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FinancialYear" HeaderText="Year" SortExpression="FullName" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InquireDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Inquire Date" SortExpression="FullName" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InquireTime" HeaderText="Inquire Time" SortExpression="Mobile" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" SortExpression="Age" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="WhatsApp" HeaderText="WhatsApp" SortExpression="Age" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="CounselingBy" HeaderText="Counseling By" SortExpression="Age" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InquireMode" HeaderText="Inquire Mode" SortExpression="Age" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium" />
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ReferenceBy" HeaderText="Reference By" SortExpression="Age" NullDisplayText="N/A" ReadOnly="True">
                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Medium"/>
                                            <ItemStyle Font-Size="Medium" Wrap="false" Font-Bold="true" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select i.IQUid, s.SubjectName,i.ReferenceBy,i.CounselingBy, i.WhatsApp,i.InquireTime, i.InquireMode,i.StudentName,i.FinancialYear,i.Adress,i.InquireDate,i.MobileNo from tblSubjectMaster s, tblInquireMaster i where s.SubjectUid = i.SubjectUid and i.Status= 'Active' "></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
       <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>

</asp:Content>

