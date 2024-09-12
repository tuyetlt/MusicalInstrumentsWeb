using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MetaNET.DataHelper;
using System.IO;
public partial class Tool_Shopping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID,Name,FriendlyUrl,Price,Gallery, Hide,FriendlyUrlCategory", Utils.CreateFilterHide + " AND Len(FriendlyUrlCategory)>0", "ID DESC");
        if (Utils.CheckExist_DataTable(dt))
        {
            string link = "/upload/gg-shopping-list.txt";
            string savepath = Server.MapPath("~" + link);
            TextWriter writer = new StreamWriter(savepath);
            writer.WriteLine("id\ttiêu đề\tmô tả\tliên kết\ttình trạng\tgiá	còn hàng\tliên kết hình ảnh\tnhãn hiệu", System.Text.Encoding.Unicode);

            foreach (DataRow dr in dt.Rows)
            {
                DataTable dtCat = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "FriendlyUrl", Utils.CreateFilterHide + " AND FriendlyUrl='" + dr["FriendlyUrlCategory"] + "'", "ID DESC");
                if (Utils.CheckExist_DataTable(dtCat))
                {
                    int Price = ConvertUtility.ToInt32(dr["Price"]);
                    string imgPath = Utils.GetFirstImageInGallery_Json(dr["Gallery"].ToString());
                    if (Price > 0)
                    {
                        //string mota = Utils.StripHTML(p.Description);
                        //mota = mota.Replace(System.Environment.NewLine, " ");

                        //char tab = '\u0009';
                        //mota = mota.Replace(tab.ToString(), "");

                        writer.WriteLine(string.Format("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}\t{8}",
                            dr["ID"].ToString(),
                            dr["Name"].ToString(),
                            dr["Name"] + ", Nhạc cụ Tiến Đạt, Đại lý Yamaha số 1 Việt Nam",
                            TextChanger.GetLinkRewrite_Products(dtCat.Rows[0]["FriendlyUrl"].ToString(), dr["FriendlyUrl"]),
                            "mới",
                            Price.ToString().Replace(",0000", "") + " VND",
                            "còn hàng",
                            imgPath,
                            "Nhạc cụ Tiến Đạt"),
                            System.Text.Encoding.Unicode);
                    }
                }
            }
            writer.Close();

            Response.Write(String.Format("<script>window.open('{0}','_blank')</script>", ResolveUrl(link)));
        }
    }
}