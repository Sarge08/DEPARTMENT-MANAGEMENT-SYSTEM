<%@ Page Title="Add Study Material | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddStudyMaterial.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Add Study Material</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Study Material</li>
                <li class="active">Add Study Material</li>
            </ol>
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblUid" runat="server" Visible="false"></asp:Label>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="row">
                                        <div class="col-lg-9 col-md-6 col-sm-6 col-xs-6">
                                            <div class="pull-left">
                                                <h4 class="BoldFont">Add Study Material</h4>
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
                                                <asp:DropDownList ID="DropDownListTrainingCentre" OnSelectedIndexChanged="DropDownListTrainingCentre_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataSourceID="SqlDataSource4" DataTextField="CentreName" DataValueField="TCUid" CssClass="form-control select2 DropDown" runat="server">
                                                    <asp:ListItem Value="0">Choose Centre Name</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HMS %>" SelectCommand="SELECT CentreName+' ('+TCCode+') ' as CentreName, TCUid FROM tblTrainingCentreMaster where Status = 'Active' and TCStatus = 'Regd. Done' order by CentreName desc"></asp:SqlDataSource>
                                                <label for="DropDownListTrainingCentre">
                                                    Centre Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" ControlToValidate="DropDownListTrainingCentre" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="false" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:DropDownList ID="DropDownCourseName" Enabled="false" Width="100%" AppendDataBoundItems="true" DataTextField="SubjectName" DataValueField="SubjectUid" CssClass="form-control select2 DropDown" runat="server">
                                                            <asp:ListItem Value="0">Choose Subject Name</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <label>
                                                            Subject Name
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error" InitialValue="0" runat="server" ErrorMessage="Required" ControlToValidate="DropDownCourseName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtStudyMaterialName" CssClass="form-control" placeholder="Type Study Material Name" runat="server"></asp:TextBox>
                                                        <label for="txtStudyMaterialName">
                                                            Study Material Name                                                     
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtStudyMaterialName" ValidationGroup="Error" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:FileUpload ID="FileUpload1Phtoto" EnableViewState="true" ViewStateMode="Enabled" CssClass="form-control" runat="server" />
                                                        <label>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorStudentPhoto" Font-Bold="true" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="FileUpload1Phtoto" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:LinkButton ID="btnUploadStudyMaterial" OnClick="btnUploadStudyMaterial_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Upload Study Material</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="gvDetails" DataSourceID="dsDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Candidate Found..." runat="server" DataKeyNames="SMUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" PageSize="100" CssClass="table table-condensed table-bordered table-striped">
                                                            <HeaderStyle />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Delete">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" Height="15px" ImageUrl="../img/DeleteImageBlack.png" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="CentreName" HeaderText="Centre Name" SortExpression="CentreName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" SortExpression="SubjectName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Name" HeaderText="Material" SortExpression="Name" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Material">
                                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" />
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="btnMaterial" OnClick="btnMaterial_Click" Font-Bold="true" runat="server"><%#Eval("Material").ToString().Substring(12) %></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select sm.SMUid,sm.Material, tc.CentreName, s.SubjectName,sm.Name from tblStudyMaterialMaster sm, tblSubjectMaster s, tblTrainingCentreMaster tc where sm.SubjectUid=s.SubjectUid and s.TCUid = tc.TCUid and sm.Status = 'Active' order by sm.SMUid desc"></asp:SqlDataSource>
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUploadStudyMaterial" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

