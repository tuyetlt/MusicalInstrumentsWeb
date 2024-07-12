using System;
using System.Data;
using System.Collections;
using MetaNET.DataHelper;

public partial class admin_Controls_home_certificate_CertificateUpdate : System.Web.UI.UserControl
{
    #region Variable
    public DataRow dr;
    public Hashtable hashtable = new Hashtable();
    public bool IsUpdate = false;
    int ID = 0, IDCopy = 0;
    public string click_action, control, table = "tblHome_Certificate";


    public string image_1 = C.NO_IMG_PATH;
    public BannerPositionFlag bannerPositionFlag;


    #endregion

    #region BindData

    protected void Page_Load(object sender, EventArgs e)
    {
        ProccessParameter();
        if (!IsPostBack)
        {
            BindData();
            UpdateDatabase();
        }
    }

    protected void ProccessParameter()
    {
        ID = RequestHelper.GetInt("id", 0);
        IDCopy = RequestHelper.GetInt("idCopy", 0);
        control = ConvertUtility.ToString(Page.RouteData.Values["control"]).ToLower();
        click_action = Request.Form["done"];
    }

    protected void BindData()
    {
        using (var db = SqlService.GetSqlService())
        {
            dr = db.NewRow(table);
        }
        int SqlFilterID = 0;
        if (ID > 0 || IDCopy > 0)
        {
            if (ID > 0)
            {
                IsUpdate = true;
                SqlFilterID = ID;
            }
            else
            {
                SqlFilterID = IDCopy;
            }

            using (var db = SqlService.GetSqlService())
            {
                string sqlQuery = string.Format("SELECT * FROM {0} Where ID='{1}'", table, SqlFilterID);
                var ds = db.ExecuteSqlDataTable(sqlQuery);
                if (ds.Rows.Count > 0)
                {
                    dr = ds.Rows[0];
                    image_1 = ds.Rows[0]["Image_1"].ToString();
                }
            }

            int BannerPositionINT = 0;

            DataTable dtFlag = SqlHelper.SQLToDataTable(table, "Flags", string.Format("ID='{0}'", SqlFilterID), "ID", 1, 1);
            if (Utils.CheckExist_DataTable(dtFlag))
            {
                BannerPositionINT = ConvertUtility.ToInt32(dtFlag.Rows[0]["Flags"]);
            }
            bannerPositionFlag = (BannerPositionFlag)BannerPositionINT;
        }
    }

    #endregion

    #region Update Database
    protected void UpdateDatabase()
    {
        if (!String.IsNullOrEmpty(click_action) && (click_action == "save" || click_action == "saveandback" || click_action == "saveandcopy" || click_action == "saveandadd"))
        {
            #region Flags
            string HomeSlider = Request.Form["HomeSlider"];
            string RightSlider = Request.Form["RightSlider"];
            string ByCategory = Request.Form["ByCategory"];
            string OpenNewWindows = Request.Form["OpenNewWindows"];
            string RightProductDetail = Request.Form["RightProductDetail"];
            string TopBanner = Request.Form["TopBanner"];
            string Popup = Request.Form["Popup"];

            int Position_INT = 0;

            if (!string.IsNullOrEmpty(HomeSlider) && HomeSlider == "on")
                Position_INT += (int)BannerPositionFlag.HomeSlider;
            if (!string.IsNullOrEmpty(RightSlider) && RightSlider == "on")
                Position_INT += (int)BannerPositionFlag.RightSlider;
            if (!string.IsNullOrEmpty(ByCategory) && ByCategory == "on")
                Position_INT += (int)BannerPositionFlag.ByCategory;
            if (!string.IsNullOrEmpty(HomeSlider) && HomeSlider == "on")
                Position_INT += (int)BannerPositionFlag.OpenNewWindows;
            if (!string.IsNullOrEmpty(RightProductDetail) && RightProductDetail == "on")
                Position_INT += (int)BannerPositionFlag.RightProductDetail;
            if (!string.IsNullOrEmpty(TopBanner) && TopBanner == "on")
                Position_INT += (int)BannerPositionFlag.TopBanner;
            if (!string.IsNullOrEmpty(Popup) && Popup == "on")
                Position_INT += (int)BannerPositionFlag.Popup;


            if (!string.IsNullOrEmpty(Request.Form["hide"]) && Request.Form["hide"] == "on")
                hashtable["Hide"] = true;
            else
                hashtable["Hide"] = false;

            #endregion

            CacheUtility.PurgeCacheItems(table);

            hashtable["ID"] = Utils.KillChars(Request.Form["ID"]);
            hashtable["Name"] = Utils.KillChars(Request.Form["Name"]);
            hashtable["Description"] = Utils.KillChars(Request.Form["Description"]);
            hashtable["Sort"] = Utils.KillChars(Request.Form["Sort"]);
            hashtable["Flags"] = Position_INT;

            hashtable["Image_1"] = Utils.KillChars(Request.Form["Image_1"]);
            hashtable["Alt"] = Utils.KillChars(Request.Form["Alt"]);


            CacheUtility.PurgeCacheItems(table);


            using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
            {
                string sqlQuery = string.Empty;
                if (IsUpdate)
                    sqlQuery = @"UPDATE[dbo].[tblHome_Certificate] SET [ID]=@ID,[Name]=@Name,[Description]=@Description,[Sort]=@Sort,[Flags]=@Flags,[Hide]=@Hide,[Image_1]=@Image_1,[Alt]=@Alt,[CreatedDate]=@CreatedDate,[EditedDate]=@EditedDate,[CreatedBy]=@CreatedBy,[EditedBy]=@EditedBy WHERE [ID] = @ID";
                else
                    sqlQuery = @"INSERT INTO [dbo].[tblHome_Certificate]([Name],[Description],[Sort],[Flags],[Hide],[Image_1],[Alt],[CreatedDate],[EditedDate],[CreatedBy],[EditedBy]) OUTPUT INSERTED.ID VALUES (@Name,@Description,@Sort,@Flags,@Hide,@Image_1,@Alt,@CreatedDate,@EditedDate,@CreatedBy,@EditedBy)";

                db.AddParameter("@ID", System.Data.SqlDbType.Int, hashtable["ID"].ToString());
                db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, hashtable["Name"].ToString());
                db.AddParameter("@Description", System.Data.SqlDbType.NVarChar, hashtable["Description"].ToString());
                db.AddParameter("@Sort", System.Data.SqlDbType.Int, hashtable["Sort"].ToString());
                db.AddParameter("@Flags", System.Data.SqlDbType.Int, hashtable["Flags"].ToString());
                db.AddParameter("@Hide", System.Data.SqlDbType.Bit, hashtable["Hide"].ToString());
                db.AddParameter("@Image_1", System.Data.SqlDbType.NVarChar, hashtable["Image_1"].ToString());
                db.AddParameter("@Alt", System.Data.SqlDbType.NVarChar, hashtable["Alt"].ToString());

                db.AddParameter("@EditedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                db.AddParameter("@EditedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);

                if (IsUpdate)
                {
                    db.AddParameter("@ID", System.Data.SqlDbType.Int, ID);
                    db.ExecuteSql(sqlQuery);

                    if (click_action == "saveandcopy")
                        CookieUtility.SetValueToCookie("notice", "update_copy_success");
                    else
                        CookieUtility.SetValueToCookie("notice", "update_success");
                }
                else
                {
                    db.AddParameter("@CreatedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                    db.AddParameter("@CreatedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);
                    ID = db.ExecuteSqlScalar<int>(sqlQuery, 0);

                    if (click_action == "saveandcopy")
                        CookieUtility.SetValueToCookie("notice", "insert_copy_success");
                    else
                        CookieUtility.SetValueToCookie("notice", "insert_success");
                }
                SqlHelper.LogsToDatabase_ByID(ID, table, Utils.GetFolderControlAdmin(), ControlAdminInfo.ShortName, ConvertUtility.ToInt32(IsUpdate), Request.RawUrl);
            }
        }
        else if (click_action == "delete")
        {
            CookieUtility.SetValueToCookie("notice", "delete_success");
        }
        ActionAfterUpdate();
    }
    #endregion

    #region Orther Action
    protected void ActionAfterUpdate()
    {
        if (click_action == "saveandback" || click_action == "cancel" || click_action == "delete")
        {
            Response.Redirect(Utils.GetViewControl());
        }
        if (click_action == "saveandadd")
        {
            Response.Redirect(Utils.GetEditControl());
        }
        else if (click_action == "saveandcopy")
        {
            Response.Redirect(Utils.GetEditControl() + "?idCopy=" + ID);
        }
        else if (click_action == "save")
        {
            BindData();
        }
    }

    #endregion

}