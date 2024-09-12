using System;
using System.Data;
using Ebis.Utilities;
using System.Collections;
using MetaNET.DataHelper;
using QRCoder;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using System.Linq;
using System.Threading.Tasks;

public partial class admin_Controls_dangky_DangkyUpdate : System.Web.UI.UserControl
{

    #region Variable
    public DataRow dr;
    public Hashtable hashtable = new Hashtable();
    public bool IsUpdate = false;
    int ID = 0, IDCopy = 0;
    public string click_action, control, table = "tblDangKy", qrImage = "";
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
            dr = db.NewRow("tblDangKy");
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
                string sqlQuery = string.Format("SELECT * FROM tblDangKy Where ID='{0}'", SqlFilterID);
                var ds = db.ExecuteSqlDataTable(sqlQuery);
                if (ds.Rows.Count > 0)
                {
                    dr = ds.Rows[0];
                }
            }
        }

        
    }

    #endregion

    #region Update Database
    protected void UpdateDatabase()
    {
        if (!String.IsNullOrEmpty(click_action) && (click_action == "save" || click_action == "saveandback" || click_action == "saveandcopy" || click_action == "saveandadd"))
        {
            hashtable["Name"] = Utils.KillChars(Request.Form["name"]);
            hashtable["DienThoai"] = Utils.KillChars(Request.Form["dienthoai"]);
            hashtable["Zalo"] = Utils.KillChars(Request.Form["zalo"]);
            hashtable["Email"] = Utils.KillChars(Request.Form["email"]);
            hashtable["Facebook"] = Utils.KillChars(Request.Form["facebook"]);
            hashtable["DonVi"] = Utils.KillChars(Request.Form["donvi"]);
            hashtable["SoNguoi"] = Utils.KillChars(Request.Form["songuoi"]);
            hashtable["TaiTro"] = Utils.KillChars(Request.Form["taitro"]);
            hashtable["LuuY"] = Utils.KillChars(Request.Form["luuy"]);
            hashtable["ChuyenKhoan"] = Utils.KillChars(Request.Form["chuyenkhoan"]);
            hashtable["Token"] = ConvertUtility.ToString(Utils.RandomNumber(1234,1234567));
            hashtable["TicketImage"] = Utils.KillChars(Request.Form["ticketimage"]);
            hashtable["QRImage"] = Utils.KillChars(Request.Form["qrimage"]);


            if (!string.IsNullOrEmpty(Request.Form["chuyenkhoan"]) && Request.Form["chuyenkhoan"] == "on")
                hashtable["ChuyenKhoan"] = true;
            else
                hashtable["ChuyenKhoan"] = false;

            if (!string.IsNullOrEmpty(Request.Form["gioitinh"]) && Request.Form["gioitinh"] == "nam")
                hashtable["GioiTinh"] = true;
            else
                hashtable["GioiTinh"] = false;





            using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
            {
                string sqlQuery = string.Empty;
                if (IsUpdate)
                {
                    sqlQuery = @"UPDATE [dbo].[tblDangKy] SET [Name]=@Name, [GioiTinh]=@GioiTinh, [DienThoai]=@DienThoai, [Zalo]=@Zalo, [Email]=@Email, [Facebook]=@Facebook, [DonVi]=@DonVi, [SoNguoi]=@SoNguoi, [TaiTro]=@TaiTro, [LuuY]=@LuuY, [ChuyenKhoan]=@ChuyenKhoan,[Token]=@Token, [TicketImage]=@TicketImage, [QRImage]=@QRImage WHERE [ID] = @ID";
                }
                else
                {
                    sqlQuery = @"INSERT INTO [dbo].[tblDangKy] ([Name],[GioiTinh],[DienThoai],[Zalo],[Email],[Facebook],[DonVi],[SoNguoi],[TaiTro],[LuuY],[ChuyenKhoan],[Token],[TicketImage],[QRImage]) OUTPUT INSERTED.ID VALUES (@Name,@GioiTinh,@DienThoai,@Zalo,@Email,@Facebook,@DonVi,@SoNguoi,@TaiTro,@LuuY,@ChuyenKhoan,@Token,@TicketImage,@QRImage)";
                }

                db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, hashtable["Name"].ToString());
                db.AddParameter("@GioiTinh", System.Data.SqlDbType.Bit, hashtable["GioiTinh"].ToString());
                db.AddParameter("@DienThoai", System.Data.SqlDbType.NVarChar, hashtable["DienThoai"].ToString());
                db.AddParameter("@Zalo", System.Data.SqlDbType.NVarChar, hashtable["Zalo"].ToString());
                db.AddParameter("@Email", System.Data.SqlDbType.NVarChar, hashtable["Email"].ToString());
                db.AddParameter("@Facebook", System.Data.SqlDbType.NVarChar, hashtable["Facebook"].ToString());
                db.AddParameter("@DonVi", System.Data.SqlDbType.NVarChar, hashtable["DonVi"].ToString());
                db.AddParameter("@SoNguoi", System.Data.SqlDbType.NVarChar, hashtable["SoNguoi"].ToString());
                db.AddParameter("@TaiTro", System.Data.SqlDbType.NVarChar, hashtable["TaiTro"].ToString());
                db.AddParameter("@LuuY", System.Data.SqlDbType.NVarChar, hashtable["LuuY"].ToString());
                db.AddParameter("@ChuyenKhoan", System.Data.SqlDbType.Bit, hashtable["ChuyenKhoan"].ToString());
                db.AddParameter("@TicketImage", System.Data.SqlDbType.NVarChar, hashtable["TicketImage"].ToString());
                db.AddParameter("@QRImage", System.Data.SqlDbType.NVarChar, hashtable["QRImage"].ToString());
                db.AddParameter("@Token", System.Data.SqlDbType.NVarChar, hashtable["Token"].ToString());

                string Token = hashtable["Token"].ToString();
                


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
                    ID = db.ExecuteSqlScalar<int>(sqlQuery, 0);
                    Token = ConvertUtility.ToString(Utils.RandomNumber(1234,123456));

                    if (click_action == "saveandcopy")
                        CookieUtility.SetValueToCookie("notice", "insert_copy_success");
                    else
                        CookieUtility.SetValueToCookie("notice", "insert_success");
                }



                string LinkCheck = "https://thukyvscnmienbac.website/?token=" + Token;

                string sex = "Anh";
                if (ConvertUtility.ToBoolean(hashtable["GioiTinh"]) == false)
                    sex = "Chi";

                string textQr = LinkCheck + "\n";

                textQr += sex + ": " + TextChanger.Translate(hashtable["Name"].ToString()," ");
                textQr += "\n" + TextChanger.Translate(hashtable["DienThoai"].ToString(), " ");

                if (ConvertUtility.ToBoolean(hashtable["ChuyenKhoan"]) == true)
                    textQr += "\nDa chuyen khoan";
                else if (ConvertUtility.ToBoolean(hashtable["ChuyenKhoan"]) == false)
                    textQr += "\nTrang thai: chua chuyen khoan";

                QRCode(textQr, sex + " " + TextChanger.Translate(hashtable["Name"].ToString(), " ") + "_", Token);
            }
        }
        else if (click_action == "delete")
        {
            DeleteRecord();
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

    protected void DeleteRecord()
    {
        using (var dbx = MetaNET.DataHelper.SqlService.GetSqlService())
        {
            string sqlQuery = string.Format("DELETE FROM tblDangKy WHERE ID={0}", ID);
            dbx.ExecuteSql(sqlQuery);
        }
    }

    #endregion

    protected void QRCode(string text, string name, string ID)
    {
       
        QRCodeGenerator qrGenerator = new QRCodeGenerator();
        QRCodeGenerator.QRCode qrCode = qrGenerator.CreateQrCode(text, QRCodeGenerator.ECCLevel.Q);
        System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
        imgBarCode.Height = 350;
        imgBarCode.Width = 350;
        string image1 = "";
        using (Bitmap bitMap = qrCode.GetGraphic(20))
        {
            using (MemoryStream ms = new MemoryStream())
            {
                bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = ms.ToArray();
                imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                image1 = Convert.ToBase64String(byteImage);
            }

            qrImage = imgBarCode.ImageUrl;
        }

        //string imageOut = "";
        SaveImage(image1, ID);
        MergeImage(ID, name);

    }

    protected void MergeImage(string imgName, string name)
    {
        Image backImg = Image.FromFile(Server.MapPath("~/upload/hhvs/") + "template.jpg");
        Image mrkImg = Image.FromFile(Server.MapPath("~/upload/") + imgName + ".jpg");
        mrkImg = BitmapExtension.ResizeImage(mrkImg, new Size(297, 297));
        Graphics g = Graphics.FromImage(backImg);
        g.DrawImage(mrkImg, 169, 410);
        SolidBrush brush = new SolidBrush(Color.FromArgb(255, 255, 255, 255));
        g.DrawString("GK 123", new Font("Tahoma", 38, FontStyle.Bold), brush, new PointF(215, 302));
        SolidBrush brush1 = new SolidBrush(Color.FromArgb(255, 211, 0));
        g.DrawString("GK 123", new Font("Tahoma", 28, FontStyle.Bold), brush1, new PointF(540, 2105));
        backImg.Save(Server.MapPath("~/upload/") + name + imgName + "_result.png");

        qrImage = "/upload/" + name + imgName + "_result.png";





    }

    public bool SaveImage(string ImgStr, string ImgName)
    {
        String path = Server.MapPath("~/upload"); //Path

        //Check if directory exist
        if (!System.IO.Directory.Exists(path))
        {
            System.IO.Directory.CreateDirectory(path); //Create directory if it doesn't exist
        }

        string imageName = ImgName + ".jpg";

        //set the image path
        string imgPath = Path.Combine(path, imageName);

        byte[] imageBytes = Convert.FromBase64String(ImgStr);

        File.WriteAllBytes(imgPath, imageBytes);

        return true;
    }



}


public static class BitmapExtension
{
    public static byte[] BitmapToByteArray(this Bitmap bitmap)
    {
        using (MemoryStream ms = new MemoryStream())
        {
            bitmap.Save(ms, ImageFormat.Png);
            return ms.ToArray();
        }
    }

    public static Image ResizeImage(Image imgToResize, Size size)
    {
        return (Image)(new Bitmap(imgToResize, size));
    }
}