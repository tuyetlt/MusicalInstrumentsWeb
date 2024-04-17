using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_VnpayFinish : System.Web.UI.UserControl
{
    //public ShoppingCart cart;
    //PaymentHistory paymentHistory;
    //VnPayLibrary vnpay = new VnPayLibrary();
    //string payment_method_mail = "";
    //string payment_status_mail = "";
    //string transactionId = "";
    //string bank = "";
    //string ExpDownloadDate = "";
    //int customerID = 0;

    //log4net.ILog logger = log4net.LogManager.GetLogger(typeof(Controls_VnpayNapxengfinish).Name);

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    logger.InfoFormat("Begin VnPayNapxeng VNPAY Return, URL={0}", Request.RawUrl);
    //    string option_payment = string.Empty;
    //    string bank_code = string.Empty;
    //    customerID = ConvertUtility.ToInt32(Page.User.Identity.Name);

    //    if (Request.QueryString.Count > 0)
    //    {
    //        string vnp_HashSecret = C.VNP_HASHSECRET; //Chuoi bi mat
    //        var vnpayData = Request.QueryString;

    //        foreach (string s in vnpayData)
    //        {
    //            //get all querystring data
    //            if (!string.IsNullOrEmpty(s) && s.StartsWith("vnp_"))
    //            {
    //                vnpay.AddResponseData(s, vnpayData[s]);
    //            }
    //        }

    //        //vnp_TxnRef: Ma don hang merchant gui VNPAY tai command=pay    
    //        long paymentHistoryID = Convert.ToInt64(vnpay.GetResponseData("vnp_TxnRef").Replace("napxeng_", ""));
    //        //vnp_TransactionNo: Ma GD tai he thong VNPAY
    //        transactionId = vnpay.GetResponseData("vnp_TransactionNo");
    //        //vnp_ResponseCode:Response code from VNPAY: 00: Thanh cong, Khac 00: Xem tai lieu
    //        string vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode");
    //        //vnp_SecureHash: MD5 cua du lieu tra ve
    //        String vnp_SecureHash = Request.QueryString["vnp_SecureHash"];
    //        //vnp_OrderType: other
    //        string vnp_OrderType = vnpay.GetResponseData("vnp_OrderType");
    //        string vnp_BankCode = vnpay.GetResponseData("vnp_BankCode");
    //        bool checkSignature = vnpay.ValidateSignature(vnp_SecureHash, vnp_HashSecret);
    //        Customer customer = CustomerBL.GetCustomerByID(ConvertUtility.ToInt32(customerID));
    //        if (paymentHistoryID > 0)
    //        {
    //            paymentHistory = PaymentHistoryBL.GetPaymentHistoryByID(paymentHistoryID);
    //            if (paymentHistory != null)
    //            {
    //                Ebis.Utilities.CookieUtility.SetValueToCookie("paymentHistoryID", ConvertUtility.ToString(paymentHistory.PaymentHistoryID));
    //                option_payment = paymentHistory.PaymentMethod;
    //                bank_code = vnp_BankCode;
    //                if (option_payment == "IB")
    //                    payment_method_mail = "Thanh toán bằng Internet Banking";
    //                else if (option_payment == "VNPAYQR")
    //                    payment_method_mail = "Thanh toán qua QR CODE";
    //                else if (option_payment == "VNMART")
    //                    payment_method_mail = "Thanh toán bằng Ví điện tử VNMART";
    //                else if (option_payment == "INTCARD")
    //                    payment_method_mail = "Thanh toán bằng thẻ thanh toán quốc tế";
    //                else if (option_payment == "TheCao")
    //                    payment_method_mail = "Trừ Xu trong tài khoản";
    //                else if (option_payment == "ATM")
    //                {
    //                    payment_method_mail = "Thanh toán Online bằng thẻ ngân hàng nội địa ATM";
    //                    bank_code = paymentHistory.BankCode;
    //                }
    //                bank = Utils.GetBankNameByID(bank_code);
    //                paymentHistory.BankCode = bank_code;
    //                paymentHistory.BankName = bank;
    //                payment_status_mail = "Đang xử lý đơn hàng";
    //                paymentHistory.Desciption = payment_status_mail;

    //                Transaction transaction = TransactionBL.GetTransactionByID(paymentHistory.TransactionID);
    //                transaction.MerchantTransactionID = transactionId;
    //                paymentHistory.Steps = paymentHistory.Steps + "===>Đang xử lý đơn hàng";
    //                logger.Info("Steps =======>" + paymentHistory.Steps);
    //                logger.Info("MerchantTransactionID VNPAY tạo =======>" + transactionId);
    //                int i = TransactionBL.UpdateTransaction(transaction);
    //                if (i == 1)
    //                {
    //                    paymentHistory.PaymentType = vnp_OrderType;
    //                    PaymentHistoryBL.UpdatePaymentHistory(paymentHistory);
    //                }
    //            }
    //        }

    //        if (checkSignature)
    //        {
    //            if (vnp_ResponseCode != "00" && vnp_ResponseCode != "24")
    //            {
    //                logger.Info("VnpayNapxeng! Giao dịch không thành công do: Các lỗi xảy ra khác.");
    //                Ebis.Utilities.CookieUtility.SetValueToCookie("ErrorCode", vnp_ResponseCode);
    //            }
    //            else
    //            {
    //                if (vnp_ResponseCode == "00")
    //                {
    //                    logger.InfoFormat("VnPayNapxeng Return, vnp_ResponseCode={0}, paymentHistoryID={1}", vnp_ResponseCode, paymentHistoryID);
    //                    //Thanh toan thanh cong. Ma loi: vnp_ResponseCode
    //                    logger.InfoFormat("VnpayNapxeng Thanh toan thanh cong, OrderId={0}, VNPAY TranId={1},ResponseCode={2}", paymentHistoryID, transactionId, vnp_ResponseCode);
    //                    logger.Info("VnpayNapxeng! Giao dịch thành công.");
    //                    Ebis.Utilities.CookieUtility.SetValueToCookie("ErrorCode", "00");
    //                    if (paymentHistory == null)
    //                    {
    //                        logger.Info("VnpayNapxeng! Đơn hàng không tồn tại.");
    //                        Ebis.Utilities.CookieUtility.SetValueToCookie("ErrorCode", "100");
    //                    }
    //                    if (customer != null)
    //                    {
    //                        SendMail(customer, customer.FullName, customer.EmailAddress);
    //                    }
    //                }
    //                else if (vnp_ResponseCode == "24")
    //                {
    //                    logger.Info("VnpayNapxeng! Giao dịch không thành công do: Khách hàng hủy giao dịch.");
    //                    Ebis.Utilities.CookieUtility.SetValueToCookie("ErrorCode", "24");
    //                    if (customer != null)
    //                    {
    //                        SendMailCancel(customer, customer.FullName, customer.EmailAddress);
    //                    }
    //                }
    //            }
    //        }
    //        else
    //        {
    //            logger.InfoFormat("Mã lỗi {0}: , {1}", 97, VnPayLibrary.GetErrorMessagePayment("97"));
    //            Ebis.Utilities.CookieUtility.SetValueToCookie("ErrorCode", "97");
    //        }
    //    }
    //    else
    //    {
    //        logger.InfoFormat("Mã lỗi {0}: , {1}", 99, VnPayLibrary.GetErrorMessagePayment("99"));
    //        Ebis.Utilities.CookieUtility.SetValueToCookie("ErrorCode", "99");
    //    }
    //    Response.Redirect(PageWeb.OrderInfoPayment);
    //}

    //#region Send Mail
    //protected void SendMail(Customer customer, string name, string email)
    //{
    //    try
    //    {
    //        EmailUtilities emailUltilities = new EmailUtilities();

    //        if (emailUltilities.EmailIsValid())
    //        {
    //            string siteName = Globals.GetValueFromRegistry("SiteName");
    //            string from = emailUltilities.Get_EmailSend();
    //            string to = email;
    //            string subject = string.Format("Thanh toán thành công cho nạp xèng #{0} của quý khách tại {1} ", paymentHistory.PaymentHistoryID, siteName);
    //            string content = mail_body(customer);

    //            string SMTPServer = emailUltilities.Get_EmailSMTPServer();
    //            string SMTPUser = emailUltilities.Get_EmailUsername();
    //            string SMTPPass = emailUltilities.Get_EmailPassword();
    //            string ccEmail = emailUltilities.Get_EmailReceive();


    //            MailAddress fromMail = new MailAddress(from, siteName);
    //            MailAddress toMail = new MailAddress(email, name);

    //            MailMessage message = new MailMessage();
    //            message.From = fromMail;
    //            message.To.Add(toMail);
    //            message.Subject = subject;
    //            message.IsBodyHtml = true;
    //            message.Body = content;

    //            if (ccEmail.Length > 3)
    //            {
    //                message.Bcc.Add(new MailAddress(ccEmail));
    //                message.ReplyToList.Add(new MailAddress(ccEmail, siteName));
    //            }

    //            SmtpClient emailClient = new SmtpClient(SMTPServer);
    //            if (emailUltilities.Get_EmailSSL())
    //            {
    //                emailClient.EnableSsl = true;
    //            }
    //            if (!string.IsNullOrEmpty(emailUltilities.Get_EmailPort()))
    //            {
    //                emailClient.Port = ConvertUtility.ToInt32(emailUltilities.Get_EmailPort());
    //            }

    //            System.Net.NetworkCredential SMTPUserInfo = new System.Net.NetworkCredential(SMTPUser, SMTPPass);
    //            emailClient.Credentials = SMTPUserInfo;
    //            message.IsBodyHtml = true;
    //            emailClient.Send(message);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex);
    //    }

    //}
    //protected string GetFormatMail()
    //{
    //    return Globals.GetValueFromRegistry("Email_DepositeSuccess");
    //}
    //protected string mail_body(Customer customer)
    //{
    //    string templateMail = GetFormatMail();

    //    if (paymentHistory != null)
    //    {
    //        string OrderID = ConvertUtility.ToString(paymentHistory.PaymentHistoryID);
    //        string BillingName = customer.FullName;
    //        string BillingAddress = customer.Address;
    //        string BillingTel = customer.Phone;
    //        string BillingEmail = customer.EmailAddress;
    //        string xengList = GetDepositeDetails();

    //        templateMail = templateMail.Replace("{{OrderID}}", OrderID);
    //        templateMail = templateMail.Replace("{{Name}}", BillingName);
    //        templateMail = templateMail.Replace("{{Tel}}", BillingTel);
    //        templateMail = templateMail.Replace("{{Email}}", BillingEmail);
    //        templateMail = templateMail.Replace("{{Bank}}", bank);
    //        templateMail = templateMail.Replace("{{Img_Payment_Success}}", C.TEMPLATE_PATH_FULL + "img/payment-success.jpg");
    //        templateMail = templateMail.Replace("{{TransactionId}}", transactionId);
    //        //templateMail = templateMail.Replace("{{Link_History_Order}}", PageWeb.OrderHistory);
    //        templateMail = templateMail.Replace("{{ProductList}}", xengList);
    //        templateMail = templateMail.Replace("{{Date}}", DateTime.Now.ToShortTimeString() + " ngày " + DateTime.Now.ToShortDateString());

    //        string sitename = Globals.GetValueFromRegistry("SiteName");
    //        string SiteLink = Globals.GetValueFromRegistry("WebAddress");
    //        templateMail = templateMail.Replace("{{SiteName}}", sitename);
    //        templateMail = templateMail.Replace("{{Website}}", SiteLink);

    //        templateMail = templateMail.Replace("{{tel_web}}", Globals.GetValueFromRegistry("Hotline1so"));
    //        templateMail = templateMail.Replace("{{email_web}}", Globals.GetValueFromRegistry("emailcongty"));
    //        templateMail = templateMail.Replace("{{facebook_web}}", Globals.GetValueFromRegistry("FacebookLink"));

    //        templateMail = templateMail.Replace("{{PaymentMethod}}", payment_method_mail);
    //        templateMail = templateMail.Replace("{{TongTien}}", Exchange_Rate.GetPrice1000Separator(paymentHistory.Deposite) + "VNĐ");
    //    }

    //    return templateMail;
    //}
    //#endregion

    //#region Send Mail Cancel
    //protected void SendMailCancel(Customer customer, string name, string email)
    //{
    //    try
    //    {
    //        EmailUtilities emailUltilities = new EmailUtilities();

    //        if (emailUltilities.EmailIsValid())
    //        {
    //            string siteName = Globals.GetValueFromRegistry("SiteName");
    //            string from = emailUltilities.Get_EmailSend();
    //            string to = email;
    //            string subject = string.Format("Giao dịch thất bại - Hủy nạp xèng #{0} tại {1} ", paymentHistory.PaymentHistoryID, siteName);
    //            string content = mail_body_cancel(customer);

    //            string SMTPServer = emailUltilities.Get_EmailSMTPServer();
    //            string SMTPUser = emailUltilities.Get_EmailUsername();
    //            string SMTPPass = emailUltilities.Get_EmailPassword();
    //            string ccEmail = emailUltilities.Get_EmailReceive();


    //            MailAddress fromMail = new MailAddress(from, siteName);
    //            MailAddress toMail = new MailAddress(email, name);

    //            MailMessage message = new MailMessage();
    //            message.From = fromMail;
    //            message.To.Add(toMail);
    //            message.Subject = subject;
    //            message.IsBodyHtml = true;
    //            message.Body = content;

    //            if (ccEmail.Length > 3)
    //            {
    //                message.Bcc.Add(new MailAddress(ccEmail));
    //                message.ReplyToList.Add(new MailAddress(ccEmail, siteName));
    //            }

    //            SmtpClient emailClient = new SmtpClient(SMTPServer);
    //            if (emailUltilities.Get_EmailSSL())
    //            {
    //                emailClient.EnableSsl = true;
    //            }
    //            if (!string.IsNullOrEmpty(emailUltilities.Get_EmailPort()))
    //            {
    //                emailClient.Port = ConvertUtility.ToInt32(emailUltilities.Get_EmailPort());
    //            }

    //            System.Net.NetworkCredential SMTPUserInfo = new System.Net.NetworkCredential(SMTPUser, SMTPPass);
    //            emailClient.Credentials = SMTPUserInfo;
    //            message.IsBodyHtml = true;
    //            emailClient.Send(message);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex);
    //    }

    //}
    //protected string GetFormatMailCancel()
    //{
    //    return Globals.GetValueFromRegistry("Email_DepositeCancel");
    //}
    //protected string mail_body_cancel(Customer customer)
    //{
    //    string templateMail = GetFormatMail();

    //    if (paymentHistory != null)
    //    {
    //        string BillingName = customer.FullName;
    //        string BillingAddress = customer.Address;
    //        string BillingTel = customer.Phone;
    //        string BillingEmail = customer.EmailAddress;
    //        string xengList = GetDepositeDetails();

    //        //Ngày hết hạn của link
    //        DateTime ExpDate = paymentHistory.StartDate.AddDays(C.SoNgayLuuFile); //Ngày hết hạn
    //        ExpDate = Utils.AbsoluteEnd(ExpDate); //Cho đến hết ngày luôn

    //        templateMail = templateMail.Replace("{{OrderID}}", ConvertUtility.ToString(paymentHistory.PaymentHistoryID));
    //        templateMail = templateMail.Replace("{{Name}}", BillingName);
    //        templateMail = templateMail.Replace("{{Tel}}", BillingTel);
    //        templateMail = templateMail.Replace("{{Email}}", BillingEmail);
    //        templateMail = templateMail.Replace("{{Bank}}", bank);
    //        //templateMail = templateMail.Replace("{{ExpDownloadDate}}", ExpDate.ToString("dd/MM/yyyy"));
    //        templateMail = templateMail.Replace("{{Img_Payment_Cancel}}", C.TEMPLATE_PATH_FULL + "img/cancelled.jpg");
    //        templateMail = templateMail.Replace("{{TransactionId}}", transactionId);
    //        //templateMail = templateMail.Replace("{{Link_History_Order}}", PageWeb.OrderHistory);


    //        templateMail = templateMail.Replace("{{ProductList}}", xengList);
    //        templateMail = templateMail.Replace("{{Date}}", DateTime.Now.ToShortTimeString() + " ngày " + DateTime.Now.ToShortDateString());


    //        string sitename = Globals.GetValueFromRegistry("SiteName");
    //        string SiteLink = Globals.GetValueFromRegistry("WebAddress");
    //        templateMail = templateMail.Replace("{{SiteName}}", sitename);
    //        templateMail = templateMail.Replace("{{Website}}", SiteLink);
    //        templateMail = templateMail.Replace("{{tel_web}}", Globals.GetValueFromRegistry("Hotline1so"));
    //        templateMail = templateMail.Replace("{{email_web}}", Globals.GetValueFromRegistry("emailcongty"));
    //        templateMail = templateMail.Replace("{{facebook_web}}", Globals.GetValueFromRegistry("FacebookLink"));
    //        templateMail = templateMail.Replace("{{PaymentMethod}}", payment_method_mail);
    //        templateMail = templateMail.Replace("{{TongTien}}", Exchange_Rate.GetPrice1000Separator(paymentHistory.Deposite) + "VNĐ");
    //    }

    //    return templateMail;
    //}

    //protected string GetDepositeDetails()
    //{
    //    string totalPayString = Exchange_Rate.GetPrice1000Separator(paymentHistory.Deposite) + " VNĐ";
    //    string strProductList = string.Format(@"<tr align=""center"">
    //                                                                        <td>
    //                                                                            {0}
    //                                                                        </td>
    //                                                                         <td align=""left"">
    //                                                                            {1}
    //                                                                        </td>
                                                                          
                                                                          
    //                                                                        <td align=""right"">
    //                                                                            <span style=""color: #FF0000"">{2}</span>
    //                                                                        </td>
    //                                                                    </tr>", "Nạp xèng", paymentHistory.DepositeName, totalPayString);
    //    return strProductList;
    //}
    //#endregion

}