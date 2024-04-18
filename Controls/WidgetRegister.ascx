<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetRegister.ascx.cs" Inherits="Controls_WidgetRegister" %>
<%@ Import Namespace="System.Data" %>
<div class="section4 section_newsletter">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="tit_newsletter">LIÊN HỆ</div>
				<div class="desc_newsletter">Chúng tôi sẽ giúp bạn tìm đúng giải pháp cho đam mê của bạn.</div>
				<div class="group_btn_newsletter">
					<a href="mailto:info@nhaccutiendat.vn" class="send_mail">Gửi Email</a>
					<a href="tel:0904.82.1381" class="send_mail">Hotline</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="tit_newsletter">ĐĂNG KÝ NHẬN EMAIL CẬP NHẬT</div>
				<div class="desc_newsletter">Để lại email để nhận thông tin mới nhất.</div>
				<div id="frm_newsletter">
	                <div class="line_newsletter">
	                   <input type="email" name="newsletter" value="" placeholder="Địa chỉ email" class="input_newsletter" id="input_newsletter">
	                    <button type="submit" class="btn_newsletter" id="btn_newsletter"><span>ĐĂNG KÝ</span></button>

	                </div>
	                <div class="label_accept"><input type="checkbox" name="check_newsletter" id="check_newsletter" value="1">Tôi đồng ý chia sẻ thông tin cá nhân của mình.</div>
	           		<div id="message-newsletter"><span></span></div>
	          </div>


			</div>

		</div>
	</div>
</div>