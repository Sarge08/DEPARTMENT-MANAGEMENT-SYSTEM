<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .msg{
            font-weight:bold;
            font-family:inherit;
            padding-bottom:50px;
            font-size:45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
             <div id="carousel-example" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example" data-slide-to="1"></li>
                <li data-target="#carousel-example" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner">
                <div class="item active">
                    <a href="#">
                        <img src="../Img/ru1.jpg" class="imgslider" />
                    </a>
                    <div class="carousel-caption">
                        <h2 class="text-center msg">Welcome to Department Of ITM</h2>
                    </div>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="../Img/ru4.jpg" class="imgslider" />
                    </a>
                    <div class="carousel-caption">
                        <h2 class="text-center msg">Welcome to Department Of ITM</h2>
                    </div>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="../Img/ru2.jpg" class="imgslider" />
                    </a>
                    <div class="carousel-caption">
                        <h2 class="text-center msg">Welcome to Department Of ITM</h2>
                    </div>
                </div>
            </div>
   <a class="left carousel-control" href="#carousel-example" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#carousel-example" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    <div class="container-fluid">
            <div class="row">
            <div class="col-lg-7">
                <div class="msgbox">
                    <div class="row">
                        <div class="col-lg-3 col-xs-3">
                            <img src="../Img/logoimg1.png" class="logoimg img-responsive" /></div>
                        <div class="col-lg-9 col-xs-9">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4 class="lblmsgbox text-center">MISSION</h4>
                                </div>
                                <div class="col-lg-12">
                            <p> To develop competent, committed and compassionate manpower who actively participate
                             in transforming the society as a whole and institutions into more caring and dynamic entities.
                                To collaborate with other academic and research institutes around the world to strengthen the education and research ecosystem.
                                To provide an education that transforms students through rigorous coursework and by providing an understanding of the needs of society and industry.
                            </p></div>
                       </div>
                                 </div>
                            </div>
                </div>
                   <div class="msgbox">
                    <div class="row">
                        <div class="col-lg-3 col-xs-3">
                            <img src="../Img/careerlogo.png" class="logoimg img-responsive" /></div>
                        <div class="col-lg-9 col-xs-9">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4 class="lblmsgbox text-center">VISION</h4>
                                </div>
                                <div class="col-lg-12">
                            <p> To emerge as a leading institute for creating world class professionals.To be a leading global technology university that provides a transformative education to create leaders and innovators, and generates new knowledge for society and industry..</p></div>
                       </div>
                    </div>
                 </div>
                       </div>
                   <div class="msgbox">
                    <div class="row">
                        <div class="col-lg-3 col-xs-3">
                            <img src="../Img/visionlogo.png" class="logoimg img-responsive" /></div>
                        <div class="col-lg-9 col-xs-9">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4 class="lblmsgbox text-center">OUR CAREER</h4>
                                </div>
                                <div class="col-lg-12">
                            <p> Everyone has a dream to have a luxurious lifestyle full of comfort. To enjoy this lifestyle we have to make a good career. Developing a career plan is an integral part of managing personal development and learning. Anyone can set themselves up for a fruitful, fulfilling career if they put in some hard work, do some planning, and conduct some serious self-reflection. Choosing a career involves a number of factors like future scope, skills required, etc. These factors have an impact on a person’s final decision. Before selecting a career, it is important to identify the areas of interest.</p></div>
                       </div>
                        </div>
                    </div>
                 </div>
                </div>
            <div class="col-lg-5">
             <div class="lecturebix">
                <h3 class="text-center lechead">HOD Message</h3>
                <center><img src="../Img/1682092025035.jpg" height="130px" /></center>
                <p class="Ltext">
It is my pleasure to welcome you to Dept Of IT, a Department of of Ravenshaw University, Odisha. Over the past eighteen years , it has grown up gradually and steadily . Our college enjoying the status of a Constituent College has recently been placed at B+ grade by the National Assessment & Accreditation Council. I am duty bound to thank the Management, Staff and the students for these achievements.

The reputation, the college has acquired and established over these years is due to the dedication and selfless commitment of teachers, supporting staff and the students. I personally appreciate the dedication of the past teachers too in taking the Institute ahead. This rich legacy is carried on by the present generation of teachers who are striving sincerely to take the college to even greater heights.

The infrastructure facilities and state-of-the-art equipments combined with a galaxy of competent, talented and dedicated faculty contribute to an enjoyable and an easy learning experience. We mould our students to be self confident and pragmatic so that when they want to build their career after their studies , they face the challenges with courage, conviction and success. It has in fact moulded the destiny of hundreds of people for a better tomorrow.

Creating better and focused Human beings’ is our motto.. Soft skills and educational skills is what the institution seeks to provide every student at the campus itself. We are all poised to enable students to develop an analytical mind, moral integrity, a strong sense of values, a disciplined life style and a feeling of companionship among students.</p>
                
            </div>
                </div>
        </div>

        </div>
</asp:Content>

