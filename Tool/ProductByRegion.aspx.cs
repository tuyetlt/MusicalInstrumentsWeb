using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Tool_ProductByRegion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dtReturn = null;
        using (var db = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayvesinh_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        {
            string sqlQuery = @"select * from CMRC_Products order by ProductID DESC";
            dtReturn = db.ExecuteSqlDataTable(sqlQuery);

            if(Utils.CheckExist_DataTable(dtReturn))
            {
                Response.Write(string.Format("STT,Tên sản phẩm,link,Giá Phía Bắc (chưa giảm),Giá Phía Bắc,Giá Phía Nam (chưa giảm),Giá Phía Nam,Giá 2 miền khác nhau"));
                //writer.WriteLine("id,tiêu đề,mô tả,liên kết,tình trạng,giá,còn hàng,liên kết hình ảnh,nhãn hiệu,loại sản phẩm", System.Text.Encoding.Unicode);
                int count = 0;
                foreach (DataRow dr in dtReturn.Rows)
                {
                    count++;
                    if (ConvertUtility.ToBoolean(dr["Hide"]) == true)
                        continue;

                    string link = string.Format(@"<a href=""https://mayvesinh.vn/{0}-p{1}.aspx"">https://mayvesinh.vn/{0}-p{1}.aspx</a>", TextChanger.Translate(dr["ModelName"].ToString(), "-"), dr["ProductID"].ToString(), dr["ModelName"].ToString());

                    string khacnhau = "Không";
                    //Response.Write(dr["ModelName"] + "<br />");
                    DataTable dtRegion1 = null;
                    decimal giaphiabac = 0;
                    decimal giaphiabac1 = 0;

                    string sqlRegion1 = string.Format("Select * from CMRC_ProductByRegion where ProductID={0} And RegionID=1", dr["ProductID"]);
                    dtRegion1 = db.ExecuteSqlDataTable(sqlRegion1);
                    if (Utils.CheckExist_DataTable(dtRegion1))
                    {
                        giaphiabac = ConvertUtility.ToDecimal(dtRegion1.Rows[0]["Price"]);
                        giaphiabac1 = ConvertUtility.ToDecimal(dtRegion1.Rows[0]["Price1"]);
                    }

                    if (giaphiabac == 0)
                    {
                        giaphiabac = ConvertUtility.ToDecimal(dr["Price"]);
                    }

                    DataTable dtRegion2 = null;
                    decimal giaphianam = 0;
                    decimal giaphianam1 = 0;
                    string sqlRegion2 = string.Format("Select * from CMRC_ProductByRegion where ProductID={0} And RegionID=2", dr["ProductID"]);
                    dtRegion2 = db.ExecuteSqlDataTable(sqlRegion2);
                    if (Utils.CheckExist_DataTable(dtRegion2))
                    {
                        giaphianam = ConvertUtility.ToDecimal(dtRegion2.Rows[0]["Price"]);
                        giaphianam1 = ConvertUtility.ToDecimal(dtRegion2.Rows[0]["Price1"]);
                    }

                    if (giaphianam == 0)
                    {
                        giaphianam = ConvertUtility.ToDecimal(dr["Price"]);
                    }
                    //Response.Write(string.Format("{0}  =====   {1} =====  {2} ===== {3} <br />", dr["ModelName"], giaphiabac, giaphianam, dr["Price"]));

                    if (giaphiabac == 0)
                        giaphiabac = giaphianam;
                    if (giaphianam == 0)
                        giaphianam = giaphiabac;

                    if (giaphiabac != giaphianam)
                    {
                        khacnhau = "Có";
                    }
                    
                    Response.Write(string.Format("<br/>{0},{1},{2},{3:0},{4:0},{5:0},{6:0},{7}", count, dr["ModelName"].ToString().Replace(",","."), link, giaphiabac1, giaphiabac, giaphianam1, giaphianam, khacnhau));
                }
            }
        }
    }
}