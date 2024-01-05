<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddIcon.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Add Icon Details</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Master</li>
                <li class="active">Add Icon Details</li>
            </ol>
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <asp:Label ID="lblUid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbluid1" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbluid2" runat="server" Visible="false"></asp:Label>
        
            <asp:Label ID="lblpassword" runat="server" Visible="false" Text="Label"></asp:Label>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4 class="BoldFont">Add Icon Details</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-floating mb-3">
                                                    <asp:DropDownList ID="DropDownDesignation" Width="100%" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="Designation" DataValueField="DEGUid" CssClass="form-control select2 DropDown" runat="server">
                                                        <asp:ListItem Value="0">Choose Designation </asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HMS %>" SelectCommand="SELECT Designation, DEGUid FROM tblDesignation where Status = 'Active' ORDER BY DEGUid desc"></asp:SqlDataSource>
                                                    <label for="DropdownProjectnamr">
                                                        Designation                                                     
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" ControlToValidate="DropDownDesignation" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txticontitle" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txticontitle">
                                                        Icon Title                                                      
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txticontitle" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                                   <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail Photo" ImageUrl="../img/profileimg.jpg" Width="150" Height="115px" />
                                                <div class="form-group">
                                                    <label>
                                                        Photo
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="imgIcon" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </label>  
                                    <div class="custom-file">
                                        <asp:FileUpload ID="imgIcon" runat="server" CssClass="custom-file-input" onchange="ShowImagePreview(this);" />
                                        <label class="custom-file-label"></label>
                                             </div>
                                                </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <asp:LinkButton ID="btnAddIcon" OnClick="btnAddIcon_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Add Icon</asp:LinkButton>
                                                    <asp:LinkButton ID="btnUpdate" OnClick="btnUpdate_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-success" runat="server"><i class="fa fa-check"></i> Update Icon</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 form-group">
                                                <div class="table-responsive">
                                                    <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="ICuid" AutoGenerateColumns="False" AllowPaging="False"
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
                                                                    <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" Height="13px"  ImageUrl="../img/EditIcon.png" />
                                                                 </ItemTemplate>
                                                              </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Delete">                                                                
                                                                 <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="ImgBtnDelete" OnClick="ImgBtnDelete_Click" runat="server" Height="13px" ImageUrl="../img/download.jpg" />
                                                                 </ItemTemplate>
                                                              </asp:TemplateField>
                                                            <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" NullDisplayText="N/A" ReadOnly="True">
                                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="IconTitle" HeaderText="Icon Title" SortExpression="IconTitle" NullDisplayText="N/A" ReadOnly="True">
                                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="IconURL" HeaderText="Icon URL" SortExpression="IconURL" NullDisplayText="N/A" ReadOnly="True">
                                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select f.*,p.Designation from tbl_iconMaster f,tblDesignation p where f.DEGUid=p.DEGUid and f.Status='Active' order by f.ICuid desc"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-floating mb-3">
                                                    <asp:DropDownList ID="DropdownIcon" Width="100%" AppendDataBoundItems="true" DataSourceID="SqlDataSource4" DataTextField="IconTitle" DataValueField="ICuid" CssClass="form-control select2 DropDown" runat="server">
                                                        <asp:ListItem Value="0">Choose Icon </asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HMS %>" SelectCommand="SELECT IconTitle, ICuid FROM tbl_iconMaster where Status = 'Active' ORDER BY ICuid desc"></asp:SqlDataSource>
                                                    <label for="DropdownIcon">
                                                        Icon                                                     
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" ControlToValidate="DropdownIcon" ValidationGroup="Error1" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtsubmenu" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtIconUrl">
                                                        Sub Menu                                                      
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Error1" runat="server" ErrorMessage="Required" ControlToValidate="txtsubmenu" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtsubmenuurl" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtsubmenuurl">
                                                        Sub Menu URL                                                    
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error1" runat="server" ErrorMessage="Required" ControlToValidate="txtsubmenuurl" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <asp:LinkButton ID="btnAddSubmenu" OnClick="btnAddSubmenu_Click" ValidationGroup="Error1" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Add Submenu</asp:LinkButton>
                                                    <asp:LinkButton ID="btnupdateMenu" OnClick="btnupdateMenu_Click" Visible="false" ValidationGroup="Error1" CssClass="btn btn-success" runat="server"><i class="fa fa-check"></i> Update Submenu</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 form-group">
                                                <div class="table-responsive">
                                                    <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SMUid" AutoGenerateColumns="False" AllowPaging="False"
                                                        AllowSorting="false" DataSourceID="Datasource1" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
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
                                                                    <asp:ImageButton ID="Imagebtn2" OnClick="Imagebtn2_Click" runat="server" Height="13px" ImageUrl="../img/EditIcon.png" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Delete">
                                                       <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                         <ItemTemplate>
                                                          <asp:ImageButton ID="imgbtnDeleteSubmenu" OnClick="imgbtnDeleteSubmenu_Click" runat="server" Height="13px" ImageUrl="../img/download.jpg" />
                                                          </ItemTemplate>
                                                          </asp:TemplateField>
                                                            <asp:BoundField DataField="IconTitle" HeaderText="Icon Title" SortExpression="IconTitle" NullDisplayText="N/A" ReadOnly="True">
                                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SubMenu" HeaderText="Sub Menu" SortExpression="SubMenu" NullDisplayText="N/A" ReadOnly="True">
                                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SubMenuURL" HeaderText="SubMenu URL" SortExpression="SubMenuURL" NullDisplayText="N/A" ReadOnly="True">
                                                                <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="Datasource1" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select s.*,i.IconTitle from tbl_SubMenuMaster s, tbl_iconMaster i where s.ICuid=i.ICuid and s.Status = 'Active' ORDER BY SMUid desc"></asp:SqlDataSource>
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

