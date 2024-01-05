<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true" CodeFile="Academic.aspx.cs" Inherits="Home_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .bdrbox{
            background:border-box;
            min-height:220px;
            margin:20px;
        }
        h5{
            color:white;
            background-color:#04044c;
            font-size:40px;
            font-weight:bold;
        }
        p{
            color:black;
            text-align:justify;
            font-weight:bold;
        }
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
        .txth5{
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" Visible="false" runat="server" Text="Label"></asp:Label>
    <div class="container-fluid">
        <div class="bdrbox">
         <div class="row">
        <div class="col-lg-9">
            <h5 class="text-center">Bsc ITM</h5>
           <p>BSc IT stands for Bachelor of Science in Information Technology. BSc Information Technology is an undergraduate science course of 3 years dealing with software, databases, and networking designed to impart theoretical and practical knowledge on storing, processing and managing information securely.</p>
            <p>BSc IT Eligibility for BSc Admission requires successful completion of 10+2 or equivalent examinations from a recognized board. Admission is mostly done on the basis of merit. However, there are few BSc IT Colleges in India that take admissions on the basis of entrance exams such as NEST, IISER etc. BSc IT course fees range between INR 90,000 to INR 4.3 Lakhs.</p>
        </div>
        <div class="col-lg-3">
             <img src="../Img/academic.png"  height="200"/>
        </div>
    </div>
        </div>
       <div class="bdrbox">
         <div class="row">
                     <div class="col-lg-9">
            <h5 class="text-center">Bsc DSM</h5>
           <p>BSc Data Science is offered with the aim of exposing students to broad areas and subjects of Applied Statistics, Data Mining, Predictive Modelling, Big Data Analytics, Machine Learning, Data Visualization across various sectors such as Business, Marketing, Supply Chain, Manufacturing, Operations, Human Resources, Genomics, Healthcare, Banking etc. using hands-on experience.</p>
            <p>producing agile and skilled professionals to understand, collect, extract, analyze and predict the given set of data to solve the major problems through real-time data analysis.</p>
        </div>
                     <div class="col-lg-3">
             <img src="../Img/1a.png"  height="200"/>
        </div>
    </div>
        </div>
          <div class="bdrbox">
         <div class="row">
                     <div class="col-lg-9">
            <h5 class="text-center">Msc IT</h5>
           <p>Master of Science or MSc in information technology IT is a 2 years long post-graduate level master degree program. MSc IT aims to provide theoretical as well as practical knowledge on topics like software development, data mining, computer systems, analytics etc.</p>
            <p>The candidates willing to join the MSc IT program should possess a Bachelor’s degree in relevant disciplines like BSc in IT/ CS, BCA, BE/ BTech in IT or CS from a recognized university.They must also score a minimum of 50% percent marks in graduation to be eligible for the course.</p>
                         <p>The MSc IT Syllabus includes important topics like web-development, OS, database management, project management, cybersecurity, object-oriented programming languages and other related concepts.</p>
        </div>
                     <div class="col-lg-3">
             <center><img src="../Img/1b.png"  height="200"/></center>
        </div>
    </div>
        </div>
            <div class="container">
                <div class="row">
          <div class="well">
          <div class="col-lg-12">
              <h3 class="text-center head">syllabus Details</h3>
              </div>
              <div class="border">
                                  <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SYUid" AutoGenerateColumns="False" AllowPaging="False"
                                                AllowSorting="false" DataSourceID="dsDetails" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                                <HeaderStyle />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                        <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Subject" HeaderText="Notice Title" SortExpression="NoticeTitle" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="PapaerCode" HeaderText=" Notice Date" SortExpression="NoticeDate" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                 <asp:TemplateField HeaderText="View">
                                                        <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Larger" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                <asp:LinkButton ID="btnMaterial" OnClick="btnMaterial_Click" Font-Bold="true" runat="server"><%#Eval("Syllabus").ToString().Substring(12) %></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="SELECT * FROM tbl_SyllabusMaster WHERE Status='Active'  order by SYUid DESC"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                  </div>
              </div>
                    </div>
</div>
       </div>
    

</asp:Content>

