<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CommentList.ascx.cs" Inherits="ajax_Controls_CommentList" %>

<% for (int i = 0; i < dtComment.Rows.Count; i++)
    {
        string activeClass = string.Empty;
         string avtMain = "/themes/images/no-avatar.png";
                if (!string.IsNullOrWhiteSpace(dtComment.Rows[i]["Avatar"].ToString())) avtMain ="/upload/avatar/"+ dtComment.Rows[i]["Avatar"] + "";
%>

<div class="commentpost item<%= i %>">
    <div class="avatar">
            <img src="<%=avtMain %>" alt='<%=dtComment.Rows[i]["FullName"].ToString()%>'>
    </div>
    <div class="comment-right">
        <div class="title">
            <div class="ratingComp">
                <div class="name">
                    <span><b>
                        <a href="javascript:;" target="_blank"><%=dtComment.Rows[i]["FullName"].ToString()%></a></b></span>
                    <span class="font_date_comment"><%=ConvertUtility.ToDateTime(dtComment.Rows[i]["CreatedDate"]).ToString("dd/MM/yyyy HH:mm") %></span>
                </div>
                <div class="clear"></div>
                <div class="rating-box">
                    <%
                        Response.Write(string.Format(@"<div class='rating1' style='width:{0}'></div>", ConvertUtility.ToInt32(dtComment.Rows[i]["Point"]+"")*2 + "0%"));
                    %>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="content">
            <p><%=dtComment.Rows[i]["HtmlContent"] .ToString()%></p>
        </div>
        <div class="action" data-id="<%= i %>">
            <%
                if (cookieValue.Contains("_" + ConvertUtility.ToString(dtComment.Rows[i]["ID"].ToString()) + "_"))
                    activeClass = " active";
                else
                    activeClass = string.Empty;
                %>
            <a href="javascript:;" class="comment_like<%= activeClass %>" data-id="<%= dtComment.Rows[i]["ID"].ToString() %>" data-like="<%= dtComment.Rows[i]["LikeCount"].ToString() %>">
                <i class="fad fa-thumbs-up"></i><span><%= dtComment.Rows[i]["LikeCount"].ToString() %></span>
            </a>
            | <a href="javascript:;" class="reply_comment" data-id='<%=dtComment.Rows[i]["ID"].ToString() %>'>Trả lời</a>
            <%if (Page.User.Identity.IsAuthenticated)
                { %>
            | <a href="javascript:;" class="delete_comment" onclick="DelComment(<%=dtComment.Rows[i]["ID"] + "" %>,0)">Xoá</a>
            <%} %>
        </div>
    </div>
    <div class="clear"></div>
    <%
        var dtSub = LoadSubComment(ConvertUtility.ToInt32(dtComment.Rows[i]["ID"].ToString()));
        if (dtSub.Rows.Count > 0)
        {
            for (int j = 0; j < dtSub.Rows.Count; j++)
            {
                string avt = "/themes/images/no-avatar.png";
                if (!string.IsNullOrWhiteSpace(dtSub.Rows[j]["Avatar"].ToString())) avt ="/upload/avatar/"+ dtSub.Rows[j]["Avatar"] + "";
    %>
    <div class="subcomment">
        <div class="avatar">
                <img src='<%=avt %>' alt="<%=dtSub.Rows[j]["FullName"] %>">

        </div>
        <div class="comment-right">
            <div class="name">
                <span><b>
                    <a href="javascript:;" target="_blank"><%=dtSub.Rows[j]["FullName"] %></a></b></span>
                <span class="font_date_comment"><%=ConvertUtility.ToDateTime(dtSub.Rows[j]["CreatedDate"]).ToString("dd/MM/yyyy HH:mm") %></span>
            </div>

            <div class="content">
                <%= dtSub.Rows[j]["HtmlContent"] .ToString() %>
            </div>
            <div class="action" data-id="<%= i %>">
                 <%
                if (cookieValue.Contains("_" + ConvertUtility.ToString(dtSub.Rows[j]["ID"].ToString()) + "_"))
                    activeClass = " active";
                else
                    activeClass = string.Empty;
                %>
                <a href="javascript:;" class="comment_like<%= activeClass %>" data-id="<%= dtSub.Rows[j]["ID"].ToString() %>" data-like="<%= dtSub.Rows[j]["LikeCount"].ToString() %>">
                    <i class="fad fa-thumbs-up"></i><span><%= dtSub.Rows[j]["LikeCount"].ToString() %></span>
                </a>
                | <a href="javascript:;" class="reply_comment" data-id='<%=dtSub.Rows[j]["ID"].ToString() %>'>Trả lời</a>
                <%if (Page.User.Identity.IsAuthenticated)
                    { %>
                | <a href="javascript:;" class="delete_comment" onclick="DelComment(<%=dtSub.Rows[j]["ID"] + "" %>,<%=dtSub.Rows[j]["ID"] + "" %>)">Xoá</a>
                <%} %>
            </div>

        </div>
    </div>
    <%}
        }%>
</div>

<% } %> 

<input type="hidden" id="hdfpageIndex" value="1" />
<input type="hidden" id="hdfTotal" value='<%= totalRows %>' />
<input type="hidden" id="hdfPageSize" value='<%= pageSize %>' />
<script type="text/javascript">
    $(document).ready(function () {

        $(".reply_comment").click(function () {
            //var id = $(this).parent().attr("data-id");
            var id = $(this).data("id");
            var current = $("#hdfCurrentComment");
            current.val(id);
            var modal = $("#model_reply_comment");
            modal.show();

        });
        var modal = document.getElementById("model_reply_comment");
        var btn = $(".reply_comment");
        var span = document.getElementsByClassName("close")[0];
        btn.onclick = function () {
            modal.style.display = "block";
        }
        span.onclick = function () {
            modal.style.display = "none";
        }
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        var ps = 3;
         var totalRow = parseInt($('#hdfTotal').val()); 
        var totalPage = parseInt(totalRow / ps); 
        if (totalPage<1)   $('.view_more_comment').hide();
    });
</script>

