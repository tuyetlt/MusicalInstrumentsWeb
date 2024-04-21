<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetComment.ascx.cs" Inherits="Controls_WidgetComment" %>
<input type="hidden" id="hdfCurrentComment" value="0" />

<form id="frmrating" class="form_rating" action="javascript:alert(grecaptcha.getResponse(widgetId1));">
    <%--<div class="avatar-post">
        <label for="fileavatar" style="cursor: pointer">
            <img src="/upload/avatar/no-avatar.png" alt="Hình đại diện " id="myAvatar" /></label>
        <input type="file" id="fileavatar" name="fileavatar" accept="image/*" style="display: none">
        <input type="hidden" id="hdfimg" name="hdfimg" value="" />
        <div class="fullname">
        </div>
    </div>--%>
    <div class="comment-post">
        <div class="list-social-detail-post">
            <div class="icon-share"><i class="fal fa-share-alt"></i></div>
            <ul>
                <li>
                    <a href="#"><i class="fab fa-facebook-square"></i></a>
                </li>
                <li>
                    <a href="#"><i class="fab fa-google-plus-square"></i></a>
                </li>
                <li>
                    <a href="#"><i class="fab fa-pinterest-square"></i></a>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
        <input type="text" value='<%= ArticleID %>' name="articleid" id="txtArticleID" style="display: none" />
        <input type="text" id="hdfRating" name="hdfRating" style="display: none" />
        <div class="box-comment">
            <div class="title-cmt">
                Bình luận
            </div>
            <div class="box-name-phone">
                <div>
                    <input type="text" name="name" id="name" placeholder="Tên" required />
                </div>
                <div>
                     <input type="text" name="phone" id="name" placeholder="Số điện thoại" required />
                </div>
            </div>
            
            <div style="padding: 5px 0">
                <textarea name="comment" id="comment" placeholder="Nội dung" rows="5" required></textarea>
            </div>

            <div id="dvCaptchaComment">
            </div>
            <input id="btnSubmitComment" type="submit" value="Gửi đánh giá" />
         </div>
    </div>
</form>
<div class="clear"></div>

<%-- <div class="comment-list">
    <div id="div-ajax-loading">
        <img src="/upload/img/comment-loading.gif" /></div>
</div>
<div id="model_reply_comment" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>

        <form id="frm_reply_comment" class="form_rating" action="javascript:alert(grecaptcha.getResponse(widgetId2));">
            <div class="avatar-post">
                <label for="fileavatar1" style="cursor: pointer">
                    <img src="/upload/avatar/no-avatar.png" alt="Hình đại diện " id="myAvatar1" /></label>
                <input type="file" id="fileavatar1" name="fileavatar1" accept="image/*" style="display: none">
                <input type="hidden" id="hdfimg1" name="hdfimg1" value="" />
            </div>
            <div class="comment-post">
                <div class="clear"></div>
                <input type="text" value="" id="hdfRating1" name="hdfRating1" style="display: none" />
                <div>
                    <input type="text" name="name" id="name1" placeholder="Tên hoặc bí danh" required />
                </div>
                <div style="padding: 5px 0">
                    <textarea name="comment1" id="comment1" placeholder="Phản hồi của bạn" rows="6" required></textarea>
                </div>
                <div id="dvCaptchaCommentRe">
                </div>
                <input id="btnSubmitComment1" type="submit" value="Gửi phản hồi" />
            </div>
        </form>
    </div>
</div>
<div class="view_more_comment"><a id="viewmore" href="javascript:;">Xem thêm</a></div>--%>