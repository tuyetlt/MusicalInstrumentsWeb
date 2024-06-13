﻿using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ebis.Utilities;
using MetaNET.DataHelper;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
public partial class admin_ajax_Controls_Select2Control : System.Web.UI.UserControl
{
    string filter = "", json = "", tableSql = "", moduls="";
    int multilevel;
    bool addAllInFirst;

    DataTable dataTable = new DataTable();
    List<Select2Data> tagsSelect2List = new List<Select2Data>();
    List<CategoryJson0> catJson0List = new List<CategoryJson0>();
    List<CategoryJson1> catJson1List = new List<CategoryJson1>();
    List<CategoryJson2> catJson2List = new List<CategoryJson2>();
    List<CategoryJson3> catJson3List = new List<CategoryJson3>();

    protected void Page_Load(object sender, EventArgs e)
    {
        string ID_Attr = string.Empty;
        string attr = RequestHelper.GetString("attr", "");
        string key = RequestHelper.GetString("key", "");
        string where_sql = RequestHelper.GetString("filter", "");
        string id_return = RequestHelper.GetString("id_return", "ID");
        tableSql = RequestHelper.GetString("table", "");
        moduls = RequestHelper.GetString("moduls", "");
        multilevel = RequestHelper.GetInt("multilevel", 0);

        string control = RequestHelper.GetString("control", "");
        string folder = RequestHelper.GetString("folder", "");
        addAllInFirst = RequestHelper.GetBoolean("addAllInFirst", false);
        string filterJson = RequestHelper.GetString("filterJson", "");

        if (!string.IsNullOrEmpty(key))
        {
            filter = "Name like N'%" + key + "%'";
            multilevel = 0; //Nếu lọc có điều kiện thì không phân cấp nữa
        }
        else
            filter = "1=1";

        if (!string.IsNullOrEmpty(filterJson))
        {
            string decodeUrl = System.Text.RegularExpressions.Regex.Replace(filterJson, @"\\", "");
            List<JsonListPageAjax> jsonList = Newtonsoft.Json.JsonConvert.DeserializeObject<List<JsonListPageAjax>>(decodeUrl);
            if (jsonList != null && jsonList.Count > 0)
            {
                if (!string.IsNullOrEmpty(filter))
                    filter += " AND ";
                else
                    filter += " WHERE ";
                foreach (JsonListPageAjax json in jsonList)
                {
                    if (json != jsonList[0])
                        filter += " OR ";

                    filter += "(";
                    int count = 0;
                    string Key = json.Field;
                    string Value = json.Value;
                    string Type = json.Type;
                    string[] IDList = Value.Trim(',').Split(',');

                    if (IDList != null && IDList.Length > 0)
                    {
                        if (Type == "equal")
                        {
                            foreach (string item in IDList)
                            {
                                count++;
                                filter += string.Format("{0}=N'{1}'", Key, item);
                                if (count < IDList.Length)
                                    filter += " OR ";
                            }
                        }
                        else
                        {
                            foreach (string item in IDList)
                            {
                                count++;
                                filter += string.Format("{0} LIKE N'%,{1},%'", Key, item);
                                if (count < IDList.Length)
                                    filter += " OR ";
                            }
                        }
                    }
                    filter += ")";
                }
            }
        }




        if (addAllInFirst)
        {
            Select2Data data_all = new Select2Data();
            data_all.id = "all";
            data_all.text = "Tất cả";
            tagsSelect2List.Add(data_all);
        }


        if (tableSql == "tblAttributeConfigs")
        {
            filter += string.Format(" AND (Moduls Like N'%,_all,%' OR Moduls Like N'%,{0},%')", folder);
        }
        else if (tableSql == "tblCategories" && moduls == "hashtag")
        {
            filter += " AND Moduls=N'hashtag'";
        }
        else if (tableSql == "tblCategories" && moduls == "tag")
        {
            filter += " AND Moduls=N'tag'";
        }

        else if (tableSql == "tblCategories" && moduls == "category")
        {
            filter += " AND Moduls=N'category'";
        }
        else if (tableSql == "tblCategories" && moduls == "article")
        {
           filter += string.Format("AND LinkTypeMenuFlag & {0} <> 0", (int)LinkTypeMenuFlag.Article);
        } 
        


        if (multilevel == 0)
        {
            using (var dbx = SqlService.GetSqlService())
            {
                dataTable = SqlHelper.SQLToDataTable(tableSql, "", filter);   
                if (Utils.CheckExist_DataTable(dataTable))
                {
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        Select2Data data = new Select2Data();
                        data.id = dr[id_return].ToString();
                        data.text = dr["Name"].ToString();
                        tagsSelect2List.Add(data);
                    }
                }
            }
            json = JsonConvert.SerializeObject(tagsSelect2List, Formatting.Indented);
        }
        else if (multilevel == 2) // lấy cấp đầu tiên
        {
            using (var dbx = SqlService.GetSqlService())
            {
                if (!string.IsNullOrEmpty(filter))
                    filter += " AND ";
                filter += "ParentID=0";
                string sqlQuery = string.Format("SELECT * FROM {0} WHERE {1}", tableSql, filter);
                dataTable = dbx.ExecuteSqlDataTable(sqlQuery);
                foreach (DataRow dr in dataTable.Rows)
                {
                    Select2Data data = new Select2Data();
                    data.id = dr[id_return].ToString();
                    data.text = dr["Name"].ToString();
                    tagsSelect2List.Add(data);
                }
            }

            json = JsonConvert.SerializeObject(tagsSelect2List, Formatting.Indented);
        }
        else
        {
            using (var dbx = SqlService.GetSqlService())
            {
                DataTable dataTable = new DataTable();
                //string sqlQuery = string.Format("SELECT * FROM {0} Where {1} AND ParentID=0", tableSql, filter);
                //dataTable = dbx.ExecuteSqlDataTable(sqlQuery);

                //if(SqlHelper.IsLeafCategory())




                dataTable = SqlHelper.SQLToDataTable(tableSql, id_return + ",Name", "ParentID=0 AND " + filter);
                if (dataTable != null && dataTable.Rows.Count > 0)
                {
                    foreach (DataRow dr0 in dataTable.Rows)
                    {
                        Select2Data data = new Select2Data();
                        data.id = dr0[id_return].ToString();
                        data.text = dr0["Name"].ToString();
                        tagsSelect2List.Add(data);

                        string sqlQuery1 = string.Format("SELECT * FROM {0} Where {1} AND ParentID={2}", tableSql, filter, dr0["ID"].ToString());
                        dataTable = new DataTable();
                        dataTable = dbx.ExecuteSqlDataTable(sqlQuery1);
                        if (dataTable != null && dataTable.Rows.Count > 0)
                        {
                            foreach (DataRow dr1 in dataTable.Rows)
                            {
                                Select2Data data1 = new Select2Data();
                                data1.id = dr1[id_return].ToString();
                                data1.text = " ⟶ " + dr1["Name"].ToString();
                                tagsSelect2List.Add(data1);

                                string sqlQuery2 = string.Format("SELECT * FROM {0} Where {1} AND ParentID={2}", tableSql, filter, dr1["ID"].ToString());
                                dataTable = new DataTable();
                                dataTable = dbx.ExecuteSqlDataTable(sqlQuery2);
                                if (dataTable != null && dataTable.Rows.Count > 0)
                                {
                                    foreach (DataRow dr2 in dataTable.Rows)
                                    {

                                        Select2Data data2 = new Select2Data();
                                        data2.id = dr2[id_return].ToString();
                                        data2.text = " ⟶ ⟶ " + dr2["Name"].ToString();
                                        tagsSelect2List.Add(data2);


                                        string sqlQuery3 = string.Format("SELECT * FROM {0} Where {1} AND ParentID={2}", tableSql, filter, dr2["ID"].ToString());
                                        dataTable = new DataTable();
                                        dataTable = dbx.ExecuteSqlDataTable(sqlQuery3);
                                        if (dataTable != null && dataTable.Rows.Count > 0)
                                        {
                                            foreach (DataRow dr3 in dataTable.Rows)
                                            {
                                                Select2Data data3 = new Select2Data();
                                                data3.id = dr3[id_return].ToString();
                                                data3.text = "⟶ ⟶ ⟶ " + dr3["Name"].ToString();
                                                tagsSelect2List.Add(data3);


                                                CategoryJson3 cat3 = new CategoryJson3();
                                                cat3.id = ConvertUtility.ToString(dr3[id_return]);
                                                cat3.text = dr3["Name"].ToString();
                                                catJson3List.Add(cat3);

                                            }
                                        }

                                        CategoryJson2 cat2 = new CategoryJson2();
                                        cat2.id = ConvertUtility.ToString(dr2[id_return]);
                                        cat2.text = dr2["Name"].ToString();
                                        if (catJson3List.Count > 0)
                                            cat2.children = catJson3List;
                                        catJson2List.Add(cat2);
                                        catJson3List = new List<CategoryJson3>();

                                    }
                                }
                                CategoryJson1 cat1 = new CategoryJson1();
                                cat1.id = ConvertUtility.ToString(dr1[id_return]);
                                cat1.text = dr1["Name"].ToString();
                                if (catJson2List.Count > 0)
                                    cat1.children = catJson2List;
                                catJson1List.Add(cat1);
                                catJson2List = new List<CategoryJson2>();
                            }
                        }

                        CategoryJson0 cat0 = new CategoryJson0();
                        cat0.id = ConvertUtility.ToString(dr0[id_return]);
                        cat0.text = dr0["Name"].ToString();
                        if (catJson1List.Count > 0)
                            cat0.children = catJson1List;

                        catJson0List.Add(cat0);
                        catJson1List = new List<CategoryJson1>();
                    }
                }
            }
            json = JsonConvert.SerializeObject(catJson0List, Formatting.Indented, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            });
        }

        Response.Clear();
        Response.ContentType = "application/json; charset=utf-8";
        Response.Write(json);
        Response.End();
    }
}


public static class JSONHelper
{
    public static string ToJSON(this object obj)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        return serializer.Serialize(obj);
    }

    public static string ToJSON(this object obj, int recursionDepth)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        serializer.RecursionLimit = recursionDepth;
        return serializer.Serialize(obj);
    }


}




class CategoryJson0
{
    public string id { get; set; }
    public string text { get; set; }
    public List<CategoryJson1> children { get; set; }

}


class CategoryJson1
{
    public string id { get; set; }
    public string text { get; set; }
    public List<CategoryJson2> children { get; set; }

}

class CategoryJson2
{
    public string id { get; set; }
    public string text { get; set; }
    public List<CategoryJson3> children { get; set; }
}


class CategoryJson3
{
    public string id { get; set; }
    public string text { get; set; }

}

