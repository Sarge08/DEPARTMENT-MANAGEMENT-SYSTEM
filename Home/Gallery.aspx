<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Home_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .gallerybody{
            min-height:300px;
            background-color:maroon;
            color:white;
            text-align:center;
        }
        h5{
            margin-top:0px;
            padding-top:120px;
            font-size:40px;
            font-family:'Baskerville Old Face';
            margin-bottom:3px;
        }
        h1{
            text-align:center;
            color:brown;
            font-weight:bold;
        }
        .img{
            min-height:80px!important;
            border:2px solid;
            border-radius:20px;
            border-color:maroon;
            margin:10px;
        }
        .txth5{
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <div class="gallerybody">
                <h5>Department of Information Technology Management</h5>
                <p>A Strategic and Transformative Approach to realise Industry Requirement, Standards and Professionalism in Times of Change and engineer more skilled Professionals.</p>
            </div>
        </div>
        <div class="col-lg-12">
            <h1>Gallery</h1>
        </div>
        <div class="col-lg-12">
            <div class="container">
              <div class="row">
                <div class="col-lg-3">
                    <img src="../Img/g1.jpeg" class="img" height="200" width="280" />
                </div>
                <div class="col-lg-3">
                    <img src="../Img/g2.jpeg" class="img" height="200" width="280"/>
                </div>
                <div class="col-lg-3">
                    <img src="../Img/g3.jpeg" class=" img" height="200" width="280"/>
                </div>
                <div class="col-lg-3">
                    <img src="../Img/g4.jpeg" class=" img" height="200" width="280"/>
                </div>
            </div>
             <div class="row">
                <div class="col-lg-3">
                    <img src="../Img/g5.jpeg" class=" img" height="200" width="280"/>
                </div>
                <div class="col-lg-3">
                    <img src="../Img/g6.jpeg" class=" img" height="200" width="280"/>
                </div>
                <div class="col-lg-3">
                    <img src="../Img/g7.jpeg" class=" img" height="200" width="280"/>
                </div>
                <div class="col-lg-3">
                    <img src="../Img/g8.jpeg" class="img" height="200" width="280"/>
                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>

