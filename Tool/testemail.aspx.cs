using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ebis.Utilities;
using System.Net.Mail;
using System.Xml;
using System.Data.SqlClient;
using System.IO;


public partial class Tool_testemail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SMTP_SERVER.Text = C.SMTP_SERVER;
        SMTP_USERNAME.Text = C.SMTP_USERNAME;
        SMTP_PORT.Text = C.SMTP_PORT;
        SMTP_SENDER.Text = C.SMTP_SENDER;
       
    }


    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            SendMail();

            lblInfo.Text = "Gửi thành công";
            lblInfo.ForeColor = System.Drawing.Color.Green;

        }
        catch (Exception ex)
        {
            lblInfo.Text = "Lỗi" + ex;
            lblInfo.ForeColor = System.Drawing.Color.Red;
        }
    }




    #region Send Mail
    protected string mail_body()
    {
        string templateMail = "Test " + Utils.RandomString(12);
        return templateMail;
    }

    protected void SendMail()
    {
        try
        {
            string from = SMTP_SENDER.Text.Trim();
            string to = SMTP_TO.Text.Trim();
            string subject = "Đơn hàng của quý khách tại " + ConfigWeb.SiteName + Utils.RandomString(12);
            string content = mail_body();

            string[] Email_Receiving_List = to.Split(';');
            
            string SMTPServer = C.SMTP_SERVER;
            string SMTPUser = C.SMTP_USERNAME;
            string SMTPPass = SMTP_PASSWORD.Text.Trim();
            int SMTPPort = ConvertUtility.ToInt32(SMTP_PORT.Text.Trim());

            using (MailMessage emailMessage = new MailMessage())
            {
                emailMessage.From = new MailAddress(from, ConfigWeb.SiteName);
                if (!string.IsNullOrEmpty(to))
                    emailMessage.To.Add(new MailAddress(to,"Tên người nhận"));

                if (Email_Receiving_List != null && Email_Receiving_List.Length > 0)
                {
                    foreach (string EmailReciving in Email_Receiving_List)
                    {
                        emailMessage.CC.Add(new MailAddress(EmailReciving));
                    }
                }

                emailMessage.IsBodyHtml = true;

                emailMessage.Subject = subject;
                emailMessage.Body = content;
                emailMessage.Priority = MailPriority.High;
                using (SmtpClient MailClient = new SmtpClient(SMTPServer, SMTPPort))
                {
                    MailClient.EnableSsl = ConvertUtility.ToBoolean(C.SMTP_SSL);
                    MailClient.Credentials = new System.Net.NetworkCredential(SMTPUser, SMTPPass);
                    MailClient.Send(emailMessage);
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    #endregion
}