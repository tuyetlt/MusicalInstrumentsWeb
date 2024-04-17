<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VnpayFinish.ascx.cs" Inherits="Controls_VnpayFinish" %>

<div id="divfail" runat="server" visible="false" class="page-content checkout-page">
    <div id="container" class="bg-custom">
        <div class="v-page-heading v-bg-stylish v-bg-stylish-v1 title-bg-custom">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <ol class="breadcrumb">
                            <li><a href="<%=C.ROOT_URL %>">Trang chủ</a></li>
                            <li><a href="<%=C.ROOT_URL+C.DS+"hoan-tat-don-hang"+C.SEO_EXTENSION %>">Hoàn tất</a></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-border">
            <p style="text-align: center">
                <a href="<%=C.ROOT_URL %>">
                <img src="<%= C.TEMPLATE_PATH_FULL %>img/cancelled.jpg" alt="Hủy đơn hàng" style="width:500px" /></a>
            </p>
            <p style="text-align: center">
                <strong>Bạn đã hủy đơn hàng bấm vào <a href="<%=C.ROOT_URL %>">đây </a>để trở về trang chủ</strong>
            </p>
        </div>
    </div>
</div>

<div id="divsuccess" runat="server" visible="false">

    
</div>


