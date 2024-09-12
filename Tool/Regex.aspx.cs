using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
public partial class Tool_Regex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Console.Write(Test("the quick brown [{#fox#}] jumps over the lazy dog."));
    }

    public static string Test(string str)
    {

        if (string.IsNullOrEmpty(str))
            return string.Empty;


        var result = System.Text.RegularExpressions.Regex.Replace(str, @".*\[{#", string.Empty, RegexOptions.Singleline);
        result = System.Text.RegularExpressions.Regex.Replace(result, @"\#}].*", string.Empty, RegexOptions.Singleline);

        return result;

    }
}