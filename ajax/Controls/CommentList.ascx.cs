using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Controls_CommentList : System.Web.UI.UserControl
{
    public static int ArticleID = 702;
    protected int pageIndex = 1;
    public int pageSize = 1;
    public int totalRows = 0;
    public DataTable dtComment = new DataTable();
    public string cookieValue= ""; 
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!string.IsNullOrWhiteSpace(Request["pi"])) { pageIndex = ConvertUtility.ToInt32(Request["pi"]); }
        if (!string.IsNullOrWhiteSpace(Request["ps"])) { pageSize = ConvertUtility.ToInt32(Request["ps"]); }
        if (!string.IsNullOrWhiteSpace(Request["article"]))
        {
            ArticleID = ConvertUtility.ToInt32(Request["article"]);
        } 
        if (!Page.IsPostBack)
        {
            LoadComment();
        }

        if (CookieUtility.GetValueFromCookie("LikeCommentIDList") != null)
            cookieValue = CookieUtility.GetValueFromCookie("LikeCommentIDList");
    }
    protected void LoadComment()
    {
        dtComment = SqlHelper.SQLToDataTable(C.COMMENT_TABLE, "", string.Format("ArticleID={0} AND Hide=0", ArticleID),"ID DESC",pageIndex,pageSize,out totalRows);
        if(dtComment.Rows.Count==0)
        {
            Response.Clear();
            Response.Write(string.Empty);
            Response.End(); 
        }
    }
    public DataTable LoadSubComment(int parentiD)
    {
        return SqlHelper.SQLToDataTable(C.COMMENT_TABLE, "", string.Format("ParentID={0} AND Hide=0", parentiD),"ID DESC");
    }
    protected string FillLikeCount(string like)
    {
        string _retu = "";
        if(!string.IsNullOrWhiteSpace(like))
        {
            _retu = string.Format("<i class='fas fa-thumbs-up' ></i> {0}", like);
        }
        return _retu;
    }
}