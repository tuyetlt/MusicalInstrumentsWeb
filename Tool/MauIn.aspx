<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MauIn.aspx.cs" Inherits="Tool_MauIn" %>


<div style="font-family: Arial,sans-serif;">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; border-bottom: 2px solid #999; padding-bottom: 5px; font-size: 9pt; line-height: 12px">
        <tbody>
            <tr>
                <td style="width: 20%;">{store_logo}</td>
                <td style="width: 55%; text-align: left; padding-left: 15px"><span><span>Hà Nội: Số 71 Phố Quan Hoa, P.Quan Hoa, Q.Cầu Giấy</span></span><br />
                    Tel: 024.321.23.195<br />
                    <span><span>Tp. HCM: 118 Điện Biên Phủ, P.17, Q.Bình Thạnh</span></span><br />
                    Tel: 0904.831.381</td>
                <td style="width: 25%; text-align: center;"><span><span><strong>PHIẾU GIAO HÀNG</strong></span></span><br />
                    <span><span>Số :&nbsp;{order_code}<br />
                        Ngày:&nbsp;{created_on}</span></span></td>
            </tr>
        </tbody>
    </table>

    <div style="width: 100%; margin: 5px 0">
        <table border="0" cellpadding="1" cellspacing="1" style="width: 100%; font-size: 9pt; line-height: 10px">
            <tbody>
                <tr>
                    <td colspan="6" style="width: 50%;"><span><strong>Tên khách hàng</strong>:&nbsp;{customer_name}</span></td>
                </tr>
                <tr>
                    <td colspan="3"><strong><span>Đơn vị:&nbsp;</span></strong></td>
                    <td colspan="3"><strong>MST</strong>: {customer_tax_number}</td>
                </tr>
                <tr>
                    <td colspan="6" style="width: 100%;"><strong>Địa chỉ</strong>: {billing_address}</td>
                </tr>
                <tr>
                    <td colspan="2"><b>Điện thoại</b>:&nbsp;{customer_phone_number}</td>
                    <td colspan="2"><strong>Di động</strong>:&nbsp;{customer_phone_number}</td>
                    <td colspan="2"><strong>Email</strong>: {customer_email}</td>
                </tr>
                <tr>
                    <td colspan="6" style="width: 100%;"><strong>Địa chỉ giao hàng</strong>: {billing_address}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <table cellpadding="0" cellspacing="0" style="width: 100%; border-left: 1px solid #7a7676; border-top: 1px solid #7a7676; font-size: 9pt; line-height: 12px; border-spacing: 0px;">
        <tbody>
            <tr style="font-weight: 600; font-size: 9pt; background: #f2f2f2">
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">STT</td>
                <td colspan="3" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 35%">HÀNG HOÁ</td>
                <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">MODEL</td>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">SERIAL</td>
                <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">SL</td>
                <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">ĐƠN GIÁ</td>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 16%">THÀNH TIỀN</td>
            </tr>
            <!--<#assign lines = model.orderLineItems>-->
            <!--<#list lines as line>-->
            <tr>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_stt}</td>
                <td colspan="3" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_variant}</td>
                <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_variant_code}</td>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{serials}</td>
                <td colspan="2" rowspan="1" style="padding: 5px; width: 8%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_quantity}</td>
                <td colspan="2" rowspan="1" style="padding: 5px; width: 16%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_price}</td>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 16%">{line_amount}</td>
            </tr>
            <!--</#list>-->
        </tbody>
    </table>

    <table cellpadding="0" cellspacing="0" style="width: 100%; border-left: 1px solid #7a7676; border-top: 1px solid #7a7676; font-size: 9pt; line-height: 9px; border-spacing: 0px;">
        <tbody>
            <tr style="font-weight: 600">
                <td rowspan="1" style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 80%;">Tổng tiền hàng</td>
                <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118);">{total}</td>
            </tr>
            <tr>
                <td style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 80%;">Tiền thuế VAT</td>
                <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118);">{total_tax}</td>
            </tr>
            <tr>
                <td style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 84%;">TỔNG CỘNG ĐÃ GỒM THUẾ VAT</td>
                <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 16%">{total_amount}</td>
            </tr>
        </tbody>
    </table>

    <table style="width: 100%; font-size: 9pt; line-height: 12px; border-spacing: 0px;">
        <tbody>
            <tr>
                <td style="width: 100%; text-align: right;"><em>Số tiền bằng chữ:&nbsp;{total_text}</em></td>
            </tr>
            <tr>
                <td>- Thời hạn thanh toán:<br />
                    - Hình thức thanh toán: {payment_name} {expected_payment_method}<br />
                    * Đơn vị hưởng séc: <b>CÔNG TY THƯƠNG MẠI VÀ DỊCH VỤ KỸ THUẬT THÀNH ĐẠT</b><br />
                    * Trụ sở: Số 71 Đường Bờ Sông Quan Hoa, P Quan Hoa, Q Cầu Giấy, TP Hà Nội</td>
            </tr>
        </tbody>
    </table>

    <table style="width: 100%; margin-bottom: 0px; padding-bottom: 20px; font-size: 8pt; line-height: 21px">
        <tbody>
            <tr>
                <td style="width: 28%; text-align: center;"><strong>NGƯỜI NHẬN HÀNG<br />
                    (ký, họ tên)</strong></td>
                <td style="width: 27%; text-align: center;"><strong>NGƯỜI GIAO HÀNG<br />
                    (ký, họ tên)</strong></td>
                <td style="width: 25%; text-align: center;"><strong>NGƯỜI BÁN HÀNG<br />
                    (ký, họ tên)</strong></td>
                <td style="width: 20%; text-align: center;"><strong>THỦ KHO<br />
                    (ký, họ tên)</strong></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 40px">&nbsp;</td>
            </tr>
        </tbody>
    </table>
</div>






















<div style="font-family: Arial,sans-serif;">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; border-bottom: 2px solid #999; padding-bottom: 5px; font-size: 9pt; line-height: 12px">
        <tbody>
            <tr>
                <td style="width: 20%;">
                    <img src="https://banner.thadaco.vn/upload/images/Thadaco/logo/thadaco.png" style="width: 150px" /></td>
                <td style="width: 55%; text-align: left; padding-left: 15px"><span><span>Hà Nội: 85A Nguyễn Văn Huyên kéo dài, Q.Cầu Giấy</span></span><br />
                    Tel: 0243.767.1380<br />
                    <span><span>Tp. HCM: 91 Điện Biên Phủ, Phường 15, Quận Bình Thạnh</span></span><br />
                    Tel: 02835 144 875</td>
                <td style="width: 25%; text-align: center;"><span><span><strong>PHIẾU GIAO HÀNG</strong></span></span><br />
                    <span><span>Số :&nbsp;{order_code}<br />
                        Ngày:&nbsp;{created_on}</span></span></td>
            </tr>
        </tbody>
    </table>

    <div style="width: 100%; margin: 5px 0">
        <table border="0" cellpadding="1" cellspacing="1" style="width: 100%; font-size: 9pt; line-height: 10px">
            <tbody>
                <tr>
                    <td colspan="6" style="width: 50%;"><span><strong>Tên khách hàng</strong>:&nbsp;{customer_name}</span></td>
                </tr>
                <tr>
                    <td colspan="3"><strong><span>Đơn vị:&nbsp;</span></strong></td>
                    <td colspan="3"><strong>MST</strong>: {customer_tax_number}</td>
                </tr>
                <tr>
                    <td colspan="6" style="width: 100%;"><strong>Địa chỉ</strong>: {billing_address}</td>
                </tr>
                <tr>
                    <td colspan="2"><b>Điện thoại</b>:&nbsp;{customer_phone_number}</td>
                    <td colspan="2"><strong>Di động</strong>:&nbsp;{customer_phone_number}</td>
                    <td colspan="2"><strong>Email</strong>: {customer_email}</td>
                </tr>
                <tr>
                    <td colspan="6" style="width: 100%;"><strong>Địa chỉ giao hàng</strong>: {billing_address}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <table cellpadding="0" cellspacing="0" style="width: 100%; border-left: 1px solid #7a7676; border-top: 1px solid #7a7676; font-size: 9pt; line-height: 12px; border-spacing: 0px;">
        <tbody>
            <tr style="font-weight: 600; font-size: 9pt; background: #f2f2f2">
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">STT</td>
                <td colspan="3" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 35%">HÀNG HOÁ</td>
                <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">MODEL</td>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">SERIAL</td>
                <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">SL</td>
                <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">ĐƠN GIÁ</td>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 16%">THÀNH TIỀN</td>
            </tr>
            <!--<#assign lines = model.orderLineItems>-->
            <!--<#list lines as line>-->
            <tr>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_stt}</td>
                <td colspan="3" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_variant}</td>
                <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_variant_code}</td>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{serials}</td>
                <td colspan="2" rowspan="1" style="padding: 5px; width: 8%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_quantity}</td>
                <td colspan="2" rowspan="1" style="padding: 5px; width: 16%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_price}</td>
                <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 16%">{line_amount}</td>
            </tr>
            <!--</#list>-->
        </tbody>
    </table>

    <table cellpadding="0" cellspacing="0" style="width: 100%; border-left: 1px solid #7a7676; border-top: 1px solid #7a7676; font-size: 9pt; line-height: 9px; border-spacing: 0px;">
        <tbody>
            <tr style="font-weight: 600">
                <td rowspan="1" style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 80%;">Tổng tiền hàng</td>
                <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118);">{total}</td>
            </tr>
            <tr>
                <td style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 80%;">Tiền thuế VAT</td>
                <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118);">{total_tax}</td>
            </tr>
            <tr>
                <td style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 84%;">TỔNG CỘNG ĐÃ GỒM THUẾ VAT</td>
                <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 16%">{total_amount}</td>
            </tr>
        </tbody>
    </table>

    <table style="width: 100%; font-size: 9pt; line-height: 12px; border-spacing: 0px;">
        <tbody>
            <tr>
                <td style="width: 100%; text-align: right;"><em>Số tiền bằng chữ:&nbsp;{total_text}</em></td>
            </tr>
            <tr>
                <td>- Thời hạn thanh toán:<br />
                    - Hình thức thanh toán: {payment_name} {expected_payment_method}<br />
                    * Đơn vị hưởng séc: <b>CÔNG TY THƯƠNG MẠI VÀ DỊCH VỤ KỸ THUẬT THÀNH ĐẠT</b><br />
                    * Trụ sở: Số 71 Đường Bờ Sông Quan Hoa, P Quan Hoa, Q Cầu Giấy, TP Hà Nội</td>
            </tr>
        </tbody>
    </table>

    <table style="width: 100%; margin-bottom: 0px; padding-bottom: 20px; font-size: 8pt; line-height: 21px">
        <tbody>
            <tr>
                <td style="width: 28%; text-align: center;"><strong>NGƯỜI NHẬN HÀNG<br />
                    (ký, họ tên)</strong></td>
                <td style="width: 27%; text-align: center;"><strong>NGƯỜI GIAO HÀNG<br />
                    (ký, họ tên)</strong></td>
                <td style="width: 25%; text-align: center;"><strong>NGƯỜI BÁN HÀNG<br />
                    (ký, họ tên)</strong></td>
                <td style="width: 20%; text-align: center;"><strong>THỦ KHO<br />
                    (ký, họ tên)</strong></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 40px">&nbsp;</td>
            </tr>
        </tbody>
    </table>
</div>






<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div style="margin: 0 auto">
        <div style="font-family: Arial,sans-serif;">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; border-bottom: 2px solid #999; padding-bottom: 5px; font-size: 10pt; line-height: 17px">
                <tbody>
                    <tr>
                        <td style="width: 20%;"><img src="https://banner.thadaco.vn/upload/images/Thadaco/logo/thadaco.png" style="width:150px" /></td>
                        <td style="width: 55%; text-align: left; padding-left: 15px"><span><span>Hà Nội: 85A Nguyễn Văn Huyên kéo dài, Q.Cầu Giấy</span></span><br />
                            Tel: 0243.767.1380<br />
                            <span><span>Tp. HCM: 91 Điện Biên Phủ, Phường 15, Quận Bình Thạnh</span></span><br />
                            Tel: 02835 144 875</td>
                        <td style="width: 25%; text-align: center;"><span><span><strong>PHIẾU GIAO HÀNG</strong></span></span><br />
                            <span><span>Số :&nbsp;{order_code}<br />
                                Ngày:&nbsp;{created_on}</span></span></td>
                    </tr>
                </tbody>
            </table>

            <div style="width: 100%; margin: 5px 0">
                <table border="0" cellpadding="1" cellspacing="1" style="width: 100%; font-size: 11pt; line-height: 17px">
                    <tbody>
                        <tr>
                            <td colspan="6" style="width: 50%;"><span><strong>Tên khách hàng</strong>:&nbsp;{customer_name}</span></td>
                        </tr>
                        <tr>
                            <td colspan="3"><strong><span>Đơn vị:&nbsp;</span></strong></td>
                            <td colspan="3"><strong>MST</strong>: {customer_tax_number}</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="width: 100%;"><strong>Địa chỉ</strong>: {billing_address}</td>
                        </tr>
                        <tr>
                            <td colspan="2"><b>Điện thoại</b>:&nbsp;{customer_phone_number}</td>
                            <td colspan="2"><strong>Di động</strong>:&nbsp;{customer_phone_number}</td>
                            <td colspan="2"><strong>Email</strong>:{customer_email}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <table cellpadding="0" cellspacing="0" style="width: 100%; border-left: 1px solid #7a7676; border-top: 1px solid #7a7676; font-size: 11pt; line-height: 15px">
                <tbody>
                    <tr style="font-weight: 600; font-size: 9pt; background: #f2f2f2">
                        <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">STT</td>
                        <td colspan="3" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 35%">HÀNG HOÁ</td>
                        <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">MODEL</td>
                        <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">SERIAL</td>
                        <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">SL</td>
                        <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">ĐƠN GIÁ</td>
                        <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 16%">THÀNH TIỀN</td>
                    </tr>
                    <!--<#assign lines = model.orderLineItems>-->
                    <!--<#list lines as line>-->
                    <tr>
                        <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_stt}</td>
                        <td colspan="3" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_variant}</td>
                        <td colspan="2" rowspan="1" style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_variant_code}</td>
                        <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{serials}</td>
                        <td colspan="2" rowspan="1" style="padding: 5px; width: 8%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_quantity}</td>
                        <td colspan="2" rowspan="1" style="padding: 5px; width: 16%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;">{line_price}</td>
                        <td style="padding: 5px; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 16%">{line_amount}</td>
                    </tr>
                    <!--</#list>-->
                </tbody>
            </table>

            <table cellpadding="0" cellspacing="0" style="width: 100%; border-left: 1px solid #7a7676; border-top: 1px solid #7a7676; font-size: 11pt; line-height: 10px">
                <tbody>
                    <tr style="font-weight: 600">
                        <td rowspan="1" style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 80%;">Tổng tiền hàng</td>
                        <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118);">{total}</td>
                    </tr>
                    <tr>
                        <td style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 80%;">Tiền thuế VAT</td>
                        <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118);">{total_tax}</td>
                    </tr>
                    <tr>
                        <td style="padding: 5px; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 84%;">TỔNG CỘNG ĐÃ GỒM THUẾ VAT</td>
                        <td style="padding: 5px; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 16%">{total_amount}</td>
                    </tr>
                </tbody>
            </table>

            <table style="width: 100%; font-size: 11pt; line-height: 21px">
                <tbody>
                    <tr>
                        <td style="width: 100%; text-align: right;"><em>Số tiền bằng chữ:&nbsp;{total_text}</em></td>
                    </tr>
                    <tr>
                        <td style="line-height: 22px">- Thời hạn thanh toán:<br />
                            - Hình thức thanh toán: {payment_name} {expected_payment_method}<br />
                            * Đơn vị hưởng séc: <b>CÔNG TY THƯƠNG MẠI VÀ DỊCH VỤ KỸ THUẬT THÀNH ĐẠT</b><br />
                            * Trụ sở: Số 71 Đường Bờ Sông Quan Hoa, P Quan Hoa, Q Cầu Giấy, TP Hà Nội</td>
                    </tr>
                </tbody>
            </table>

            <table style="width: 100%; margin-bottom: 0px; padding-bottom: 20px; font-size: 11pt; line-height: 21px">
                <tbody>
                    <tr>
                        <td style="width: 28%; text-align: center;"><strong>NGƯỜI NHẬN HÀNG<br />
                            (ký, họ tên)</strong></td>
                        <td style="width: 27%; text-align: center;"><strong>NGƯỜI GIAO HÀNG<br />
                            (ký, họ tên)</strong></td>
                        <td style="width: 25%; text-align: center;"><strong>NGƯỜI BÁN HÀNG<br />
                            (ký, họ tên)</strong></td>
                        <td style="width: 20%; text-align: center;"><strong>THỦ KHO<br />
                            (ký, họ tên)</strong></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 40px">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</body>
</html>--%>
