using System;
using System.Collections.Generic;
using System.Data;
using Ebis.Utilities;
using System.Collections;
using MetaNET.DataHelper;
public partial class Tool_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = SqlHelper.SQLToDataTable("tblOrder", "", "", "ID DESC", 1, 999999);
        foreach (DataRow dr in dt.Rows)
        {
            string strProductList = string.Empty;
            string json = ConvertUtility.ToString(dr["Json"]);
            decimal Price = 0;
            if (!string.IsNullOrEmpty(json))
            {
                List<OrderInfo> orderInfoList = Newtonsoft.Json.JsonConvert.DeserializeObject<List<OrderInfo>>(json);
                if (orderInfoList.Count > 0)
                {
                    foreach (OrderInfo orderInfo in orderInfoList)
                    {
                        DataTable dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", "ID=" + orderInfo.ProductID);
                        if (Utils.CheckExist_DataTable(dtProduct))
                        {
                            Price += ConvertUtility.ToDecimal(dtProduct.Rows[0]["Price"]);

                            string link = TextChanger.GetLinkRewrite_Products(dtProduct.Rows[0]["FriendlyUrlCategory"], dtProduct.Rows[0]["FriendlyUrl"]);
                            strProductList += string.Format(@"<tr align=""center"">
                                                        <td>
                                                            <a href=""{0}""><img src=""{1}"" /></a>
                                                        </td>
                                                         <td align=""left"">
                                                            <a href=""{0}"">{2}</a>
                                                            {3}
                                                        </td>
                                                        <td>
                                                            {4}
                                                        </td>
                                                      
                                                        <td align=""right"">
                                                            <span style=""color: #FF0000"">{5} VNĐ</span>
                                                        </td>
                                                        <td align=""right"">
                                                            <span style=""color: #FF0000"">{6} VNĐ</span>
                                                        </td>
                                                    </tr>", link, orderInfo.Image + "?width=100&height=100&quality=100", orderInfo.Name, "", orderInfo.Quantity, string.Format("{0:N0}", orderInfo.Price), string.Format("{0:N0}", orderInfo.TotalPrice));
                        }
                    }



                    using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQuery = @"UPDATE [dbo].[tblOrder] SET [PriceFinal]=@PriceFinal WHERE [ID] = @ID";
                        db.AddParameter("@PriceFinal", System.Data.SqlDbType.Money, Price);
                        db.AddParameter("@ID", System.Data.SqlDbType.Int, dr["ID"].ToString());
                        db.ExecuteSqlScalar<int>(sqlQuery, 0);
                    }
                }
            }
        }
    }
}