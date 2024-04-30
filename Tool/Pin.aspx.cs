using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tool_Pin : System.Web.UI.Page
{
    public DataRow drCat, drProduct;
    public DataTable dtCat, dtProduct;
    public int ID, RootID, RootChild, _totalProduct;
    public string caturl;
    public List<string> RootList = new List<string>();
    public int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        caturl = RequestHelper.GetString("caturl", "tranh-bo");
        
        if(RequestHelper.GetInt("pid", 0)>0)
            UpdateDataBase();
        BindData();
    }

    protected void BindData()
    {
        //Response.Write("ok");
        dtCat = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("FriendlyUrl=N'{0}'", caturl));
        if (Utils.CheckExist_DataTable(dtCat))
        {
            drCat = dtCat.Rows[0];
            PageInfo.CategoryID = ConvertUtility.ToInt32(drCat["ID"]);
            string fileterNotIn = "ID NOT IN (SELECT ProductID FROM tblPined)";
            string filterProduct = string.Format(@"TagIDList Like N'%,{0},%' AND {1}", drCat["ID"], fileterNotIn);
            dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID,Name,FriendlyUrlCategory,FriendlyUrl,Gallery", filterProduct, "ID DESC", 1, 1, out _totalProduct);


         
        }
    }

    protected void UpdateDataBase()
    {
        CacheUtility.PurgeCacheItems(C.PRODUCT_TABLE);
        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        {
            bool IsUpdate = false;
            string sqlQuery = string.Empty;
            if (IsUpdate)
            {
                sqlQuery = @"UPDATE [dbo].[tblPined] SET [ProductID]=@ProductID WHERE [ID] = @ID";
            }
            else
            {
                sqlQuery = @"INSERT INTO [dbo].[tblPined] ([ProductID]) OUTPUT INSERTED.ID VALUES (@ProductID)";
            }

            db.AddParameter("@ProductID", System.Data.SqlDbType.Int, RequestHelper.GetInt("pid", 0));

            if (IsUpdate)
            {
                db.AddParameter("@ID", System.Data.SqlDbType.Int, ID);
                db.ExecuteSql(sqlQuery);
            }
            else
            {
                ID = db.ExecuteSqlScalar<int>(sqlQuery, 0);
            }
        }
    }
}