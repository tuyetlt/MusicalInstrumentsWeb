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
            <input id="btnSubmitComment" type="submit" value="Gửi đánh giá" />
         </div>
    </div>
</form>
<div class="clear"></div>
<div class="content-comment-view">
   <div id="review-item-525762" class="comment-row-item view-comments-item level1">
        <div class="comment-user-name">
            <div class="comment-item-left block">
                <span class="sort-name-cm">H</span>
                <span class="full-name-cm ava-name user-normal">Nguyễn Hạnh</span>
                <span class="comment-item-star" title="5 sao">
                        <i class="fa fa-star rated" data-point="1"></i>
                        <i class="fa fa-star rated" data-point="2"></i>
                        <i class="fa fa-star rated" data-point="3"></i>
                        <i class="fa fa-star rated" data-point="4"></i>
                        <i class="fa fa-star rated" data-point="5"></i>
                </span>
            </div>
                                    
        </div>
        <div class="comment-user-body">
            <div class="comment-ask-box level1">
                <div class="comment-ask">Mình muốn tư vấn về đàn này</div>
                                        
                <div class="relate-comment">
                    <input class="rep-comment relate-com-item" value="525762" id="reply-comment-525762" type="radio" name="rdo-reply">
                    <label for="reply-comment-525762"><span></span>Trả lời</label>

                    <div class="like-comment block"><i class="far fa-thumbs-up"></i><a href="#" class="review-like rvw-lk-525762" data-id="525762">Thích</a></div>
                    <div class="time-comment block"><span title="05:02 07-04-2024">15 ngày</span></div>                     
                    <div class="more-info-checked" id="reply-comment-525762-form">
                    </div>
                </div>
                                        
            </div>
                                    
    <div data-id="525846" class="comment-ask-box member-rep level2">
        <div class="comment-replied">
            <div class="ava-name user-staff">Nhạc cụ Tiến Đạt</div>
            <div class="show-replied">
                Chào Anh/Chị,<div><span style="font-size: 10pt;">Anh/Chị có nhu cầu đặt mua sản phẩm, vui lòng cung cấp số điện thoại tại đây (bảo mật, không hiện web), nhân viên bán hàng META sẽ liên hệ tư vấn cụ thể về sản phẩm.</span></div>
            </div>
        </div>
                                
        <div class="relate-comment">
            <input class="rep-comment relate-com-item" value="525846" id="reply-comment-525846" type="radio" name="rdo-reply">
            <label for="reply-comment-525846"><span></span>Trả lời</label>

            <div class="like-comment block"><i class="far fa-thumbs-up"></i><a href="#" class="review-like rvw-lk-525846" data-id="525846">Thích</a></div>
            <div class="time-comment block"><span title="15:17 07-04-2024">15 ngày</span></div>

                                    

            <div class="more-info-checked" id="reply-comment-525846-form">
            </div>
        </div>
                                
    </div>
                            
                        
        </div>
    </div>
   
</div>

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