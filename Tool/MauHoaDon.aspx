<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MauHoaDon.aspx.cs" Inherits="Tool_MauHoaDon" %>

<div style="width:755px; margin:0 auto">
<div style="font-family: Arial,sans-serif;">
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;border-bottom:2px solid #999;padding-bottom:5px;font-size: 10pt;line-height:100%">
	<tbody>
		<tr>
			<td style="width: 20%;"><span style="font-size:10px;">{logo_cua_hang}</span></td>
			<td style="width: 55%; text-align: left; padding-left:15px"><span style="font-size:10px;">H&agrave; Nội: Số 71 Phố Quan Hoa, P.Quan Hoa, Q.Cầu Giấy<br />
			Tel: 024.321.23.195<br />
			Tp. HCM: 118 Điện Bi&ecirc;n Phủ, P.17, Q.B&igrave;nh Thạnh<br />
			Tel: 0904.831.381</span></td>
			<td style="width: 35%; text-align: center;"><span style="font-size:10px;"><strong>PHIẾU GIAO H&Agrave;NG</strong><br />
			Số :&nbsp;{so_hoa_don}<br />
			{ngay_ban_hang}</span></td>
		</tr>
	</tbody>
</table>

<div style="width: 100%; margin: 5px 0">
<table border="0" cellpadding="1" cellspacing="1" style="width: 100%; font-size: 11pt;line-height:17px">
	<tbody>
		<tr>
			<td colspan="7" style="width: 50%;"><span style="font-size:10px;"><strong>T&ecirc;n kh&aacute;ch h&agrave;ng</strong>:&nbsp;&nbsp;{ten_cong_ty}</span></td>
		</tr>
		<tr>
			<td colspan="3"><span style="font-size:10px;"><strong>Đơn vị:&nbsp;{ten_khach_hang}</strong></span></td>
			<td colspan="3"><span style="font-size:10px;"><strong>MST</strong>: {ma_so_thue_cong_ty}</span></td>
			<td><span style="font-size:10px;"><b>Điện thoại:</b>&nbsp;{so_dien_thoai_khach}</span></td>
		</tr>
		<tr>
			<td colspan="7" style="width: 100%;"><span style="font-size:10px;"><strong>Địa chỉ</strong>: {dia_chi_nguoi_nhan}</span></td>
		</tr>
	</tbody>
</table>
</div>

<table cellpadding="0" cellspacing="0" style="width: 100%; border-left: 1px solid #7a7676; border-top: 1px solid #7a7676;font-size: 11pt;line-height:15px">
	<tbody>
		<tr style="font-weight: 600; font-size:9pt; background:#f2f2f2">
			<td style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 5%;"><span style="font-size:10px;">STT</span></td>
			<td colspan="3" rowspan="1" style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width:35%"><span style="font-size:10px;">H&Agrave;NG HO&Aacute;</span></td>
			<td colspan="2" rowspan="1" style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 10%;"><span style="font-size:10px;">MODEL</span></td>
			<td style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 10%;"><span style="font-size:10px;">SERIAL</span></td>
			<td colspan="2" rowspan="1" style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;"><span style="font-size:10px;">SL</span></td>
			<td colspan="2" rowspan="1" style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;"><span style="font-size:10px;">ĐƠN GI&Aacute;</span></td>
			<td style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width:16%"><span style="font-size:10px;">TH&Agrave;NH TIỀN</span></td>
		</tr>
		<!--<#assign lines = model.orderLineItems>--><!--<#list lines as line>-->
		<tr>
			<td style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 5%;"><span style="font-size:10px;">{stt}</span></td>
			<td colspan="3" rowspan="1" style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;"><span style="font-size:10px;">{ten_hang_rut_gon}</span></td>
			<td colspan="2" rowspan="1" style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 10%;">
			<p><span style="font-size:10px;">{ma_sku}</span></p>

			<p><span style="font-size:10px;">{ghi_chu_hh}</span></p>
			</td>
			<td style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width: 10%;"><span style="font-size:10px;">{serials}</span></td>
			<td colspan="2" rowspan="1" style="padding: 1%; width: 8%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;"><span style="font-size:10px;">{so_luong}</span></td>
			<td colspan="2" rowspan="1" style="padding: 1%; width: 16%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center;"><span style="font-size:10px;">{don_gia}</span></td>
			<td style="padding: 1%; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); text-align: center; width:16%"><span style="font-size:10px;">{thanh_tien_truoc_km}</span></td>
		</tr>
		<!--</#list>-->
	</tbody>
</table>

<table cellpadding="0" cellspacing="0" style="width: 100%; border-left: 1px solid #7a7676; border-top: 1px solid #7a7676;font-size: 11pt;line-height:10px">
	<tbody>
		<tr style="font-weight: 600">
			<td rowspan="1" style="padding: 1%; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 80%;"><span style="font-size:10px;">Tổng tiền h&agrave;ng</span></td>
			<td style="padding: 1%; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118);"><span style="font-size:10px;">{tien_hang}</span></td>
		</tr>
		<tr>
			<td style="padding: 1%; text-align: center; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width: 84%;"><span style="font-size:10px;">TỔNG CỘNG Đ&Atilde; GỒM THUẾ VAT</span></td>
			<td style="padding: 1%; width: 20%; text-align: right; border-bottom: 1px solid rgb(122, 118, 118); border-right: 1px solid rgb(122, 118, 118); width:16%"><span style="font-size:10px;">{tong_thanh_toan}</span></td>
		</tr>
	</tbody>
</table>

<table style="width: 100%;font-size: 11pt;line-height:21px">
	<tbody>
		<tr>
			<td style="width: 100%; text-align: right;"><span style="font-size:10px;"><em>Số tiền bằng chữ:&nbsp;{tien_bang_chu}</em></span></td>
		</tr>
		<tr>
			<td style="line-height:22px">
			<p><span style="font-size:10px;">Thời hạn thanh to&aacute;n: Thanh to&aacute;n ngay khi nhận h&agrave;ng<br />
			H&igrave;nh thức thanh to&aacute;n: TM/CK<br />
			Địa chỉ giao h&agrave;ng:&nbsp;{dia_chi_nguoi_nhan}<br />
			Địa chỉ nhận HĐ:&nbsp;<br />
			* Đơn vị hưởng s&eacute;c: <b>C&Ocirc;NG TY THƯƠNG MẠI V&Agrave; DỊCH VỤ KỸ THUẬT TH&Agrave;NH ĐẠT</b><br />
			* Trụ sở: Số 71 Đường Bờ S&ocirc;ng Quan Hoa, P Quan Hoa, Q Cầu Giấy, TP H&agrave; Nội</span></p>
			</td>
		</tr>
	</tbody>
</table>

<table style="width: 100%; margin-bottom: 0px; padding-bottom: 20px;font-size: 11pt;line-height:21px">
	<tbody>
		<tr>
			<td style="width: 28%; text-align: center;"><span style="font-size:10px;"><strong>NGƯỜI NHẬN H&Agrave;NG<br />
			(k&yacute;, họ t&ecirc;n)</strong></span></td>
			<td style="width: 27%; text-align: center;"><span style="font-size:10px;"><strong>NGƯỜI GIAO H&Agrave;NG<br />
			(k&yacute;, họ t&ecirc;n)</strong></span></td>
			<td style="width: 25%; text-align: center;"><span style="font-size:10px;"><strong>NGƯỜI B&Aacute;N H&Agrave;NG<br />
			(k&yacute;, họ t&ecirc;n)</strong></span></td>
			<td style="width: 20%; text-align: center;"><span style="font-size:10px;"><strong>THỦ KHO<br />
			(k&yacute;, họ t&ecirc;n)</strong></span></td>
		</tr>
		<tr>
			<td colspan="4" style="height:40px">&nbsp;</td>
		</tr>
	</tbody>
</table>
</div>
</div>
<%= Utils.UrlEncode(C.ROOT_URL) %>