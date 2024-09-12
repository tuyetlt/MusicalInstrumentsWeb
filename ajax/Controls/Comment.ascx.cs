using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Controls_Comment : System.Web.UI.UserControl
{
    Hashtable hashtable = new Hashtable();
    string action = string.Empty; 
    protected void Page_Load(object sender, EventArgs e)
    {
        action = RequestHelper.GetString("action", string.Empty);
        if (action == "post")
        {
            
            int star = 0;
            string hdfRating = RequestHelper.GetString("hdfRating", ""); 
            if(!string.IsNullOrWhiteSpace(hdfRating))
            {
                star = ConvertUtility.ToInt32(hdfRating);
            }
            string name = Utils.BadTextFilter(RequestHelper.GetString("name", string.Empty));
            string comment = Utils.BadTextFilter(RequestHelper.GetString("comment", string.Empty));
            string articleID = RequestHelper.GetString("articleid", "");
            var avatar =  Request.Files["fileavatar"];
            string image_file = string.Empty;
            string CustomerID = "";
            if (avatar !=null)
            {
                CustomerID = Utils.RandomStringNumberANDCharacter(10);
                Utils.Upload_Avatar("avatar", avatar, ref image_file, CustomerID); 
            }  
            //lưu comment
            SaveComment(articleID, comment, name, image_file, 0, CustomerID, star);
            return;
        }
        else if (action == "reply")
        {
            int parentiD = RequestHelper.GetInt("currid", 0); 
            int star = 0;
            string hdfRating = RequestHelper.GetString("hdfRating1", "");
            if (!string.IsNullOrWhiteSpace(hdfRating))
            {
                star = ConvertUtility.ToInt32(hdfRating);
            }

            string name = Utils.BadTextFilter(RequestHelper.GetString("name1", string.Empty));
            string comment = Utils.BadTextFilter(RequestHelper.GetString("comment1", string.Empty));
            string articleID = RequestHelper.GetString("articleid", "");
            var avatar = Request.Files["fileavatar1"];
            string image_file = string.Empty;
            string CustomerID = "";
            if (avatar != null)
            {
                CustomerID = Utils.RandomStringNumberANDCharacter(10);
                Utils.Upload_Avatar("avatar", avatar, ref image_file, CustomerID);
            }
            //lưu comment
            SaveComment(articleID, comment, name, image_file, parentiD, CustomerID, star);
            return;
        }
        else if (action == "like")
        {
            UpdateLike();
            return;
        } 
        else if (action == "delete")
        {
            DeleteComment();
            return;
        }else if(action== "getweather")
        {
            GetWeather();
            return;
        }
    }
    protected void UpdateLike()
    {
        //Like của User hiện tại sẽ được lưu vào Cookie của Client dạng _123_456_789_
        Hashtable hashtable = new Hashtable();
        string cookieValue = string.Empty, html=string.Empty;
        int commentID = ConvertUtility.ToInt32(Request["id"]);
        int currLike = ConvertUtility.ToInt32(Request["currLike"]);

        if (CookieUtility.GetValueFromCookie("LikeCommentIDList") != null)
            cookieValue = CookieUtility.GetValueFromCookie("LikeCommentIDList");
        else
            cookieValue = "_";

        if (cookieValue.Contains("_" + ConvertUtility.ToString(commentID) + "_")) //Nếu đã like rồi
        {
            currLike = currLike - 1;
            hashtable.Add("active", "false");
            string newCookieValue = cookieValue.Replace(commentID + "_", "");
            CookieUtility.SetValueToCookie("LikeCommentIDList", newCookieValue);
        }
        else
        {
            currLike = currLike + 1;
            hashtable.Add("active", "true");
            string newCookieValue = cookieValue + commentID + "_";
            CookieUtility.SetValueToCookie("LikeCommentIDList", newCookieValue);
        }

        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        {
            db.Reset();
            string sqlHide = @"Update tblComment set LikeCount=@totalLike WHERE Id=@id";
            db.AddParameter("@id", SqlDbType.Int, commentID);
            db.AddParameter("@totalLike", SqlDbType.Int, currLike);
            db.ExecuteSql(sqlHide);
        }
        

        hashtable.Add("currLike", currLike);
        Response.Clear();
        Response.Headers.Add("Content-type", "application/json");
        Response.Write(JSONHelper.ToJSON(hashtable)); // Trả về dạng Json để JS xử lý (dạng {"active":"true","currLike":31})
        Response.End();
    }

    protected void DeleteComment()
    {
        string ret = "";
        try
        {
            using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
            {
                int articeID = ConvertUtility.ToInt32(Request["delid"]);
                int parentID = ConvertUtility.ToInt32(Request["parent"]);
                if (parentID == 0 && articeID > 0)
                {
                    //ẩn các danh mục con
                    string sqlHide = @"Update tblComment set Hide=1 WHERE Id=@id  OR ParentID=@pid";
                    db.AddParameter("@id", SqlDbType.Int, articeID);
                    db.AddParameter("@pid", SqlDbType.Int, articeID);
                    db.ExecuteSql(sqlHide);
                }
                else
                {
                    db.Reset();
                    string sqlHide = @"Update tblComment set Hide=1 WHERE Id=@id";
                    db.AddParameter("@id", SqlDbType.Int, articeID); 
                    db.ExecuteSql(sqlHide);
                }
                ret = "ok";
            }
        }
        catch(Exception ex)
        {
            ret = string.Format("<span style='color:Red'>"+ex.Message + "<br/>"+ ex.StackTrace + "</span>");
        }
        Response.Clear();
        Response.Write(ret);
        Response.End();
    }
    protected void SaveComment(string arcID,string comment,string title,string img,int parId,string cusID,int start)
    {
        string ret= "";
        try
        { 
            using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
            {

                string sqlQuery = @"INSERT INTO [dbo].[tblComment] ([Name],[ArticleID],[Moduls],[ParentID],[Point],[LikeCount],[DisLikeCount],
                [IsApproved],[Hide],[CreatedDate],[HtmlContent],[MemberID],[Email],[FullName],[IPAddress],[Gallery],[Avatar],
            [Sort]) OUTPUT INSERTED.ID VALUES (@Name,@ArticleID,@Moduls,@ParentID,@Point,@LikeCount,@DisLikeCount,@IsApproved,@Hide,
                    @CreatedDate,@HtmlContent,@MemberID,@Email,@FullName,@IPAddress,@Gallery,@Avatar,@Sort)";
                db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, string.Empty);
                db.AddParameter("@ArticleID", System.Data.SqlDbType.Int, arcID);
                db.AddParameter("@Moduls", System.Data.SqlDbType.NVarChar,"article");
                db.AddParameter("@ParentID", System.Data.SqlDbType.Int, parId);
                db.AddParameter("@Point", System.Data.SqlDbType.Decimal, start);
                db.AddParameter("@LikeCount", System.Data.SqlDbType.Int, DBNull.Value);
                db.AddParameter("@DisLikeCount", System.Data.SqlDbType.Int, DBNull.Value);
                db.AddParameter("@IsApproved", System.Data.SqlDbType.Bit, false);
                db.AddParameter("@Hide", System.Data.SqlDbType.Bit, false);
                db.AddParameter("@HtmlContent", System.Data.SqlDbType.NVarChar,comment);
                db.AddParameter("@MemberID", System.Data.SqlDbType.Int, 0);
                db.AddParameter("@Email", System.Data.SqlDbType.NVarChar, string.Empty);
                db.AddParameter("@FullName", System.Data.SqlDbType.NVarChar, title);
                db.AddParameter("@IPAddress", System.Data.SqlDbType.NVarChar, string.Empty);
                db.AddParameter("@Gallery", System.Data.SqlDbType.NVarChar, string.Empty);
                db.AddParameter("@Avatar", System.Data.SqlDbType.NVarChar, img);
                db.AddParameter("@Sort", System.Data.SqlDbType.Int, DBNull.Value);
                db.AddParameter("@CreatedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                db.ExecuteSqlScalar<int>(sqlQuery, 0);
                ret = "ok|"+ img;
            }
        }
        catch(Exception ex)
        {
            ret = ex.Message + "." + ex.StackTrace;
        }
        Response.Clear();
        Response.Write(ret);
        Response.End();

    }
    protected void GetWeather()
    {
        try
        {
            DateTime now = DateTime.Now;
            using (var dbx = MetaNET.DataHelper.SqlService.GetSqlService())
            {
                dbx.AddParameter("@fromdate", SqlDbType.VarChar, now.ToString("yyyy-MM-dd ") +  "00:00");
                dbx.AddParameter("@todate", SqlDbType.VarChar, now.ToString("yyyy-MM-dd ") + now.Hour + ":59");
                var dtWeather = dbx.ExecuteSPDataTable("Prc_GetListweathe"); 
                Response.Clear();
                Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(dtWeather));
                Response.End();
            }
        }
        catch (System.Threading.ThreadAbortException exx)
        {
            // ignore it
        } 
        catch (Exception ex)
        {
            Response.Write(ex.Message +" " + ex.StackTrace);
        }
    }
    
}