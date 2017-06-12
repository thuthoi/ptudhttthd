using CardProcessingWebsite.class_DTO;
using CardProcessingWebsite.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CardProcessingWebsite
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                txtPassWord.Attributes.Add("onKeyPress", "doClick('" + btnLogin.ClientID + "',event)");
				txtUserName.Attributes.Add("onKeyPress", "doClick('" + btnLogin.ClientID + "',event)");
            }
            if (CurrentContext.IsLogged())
            {
                string role = CurrentContext.GetCurUser().Role.ToString();
                if (role == "master")
                {
                    ChuyenTrang("~/master/reportMaster.aspx");
                }
                else if (role == "agent")
                {
                    ChuyenTrang("~/agent/reportAgent.aspx");
                }
                else if (role == "merchant")
                {
                    ChuyenTrang("~/merchant/reportMerchant.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                
                string url = localhost.hostname() + "api/account/login";
                var response = c.PostAsJsonAsync(url, new
                {
                    UserID = "",
                    Username = txtUserName.Text,
                    Password = txtPassWord.Text,
                    OldPassword = "",
                    Role = ""
                }).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var ac = response.Content.ReadAsAsync<Account[]>().Result;
                    Account _ac = (Account)ac[0];
                    if(_ac.Master_Agent_Merchant_Status == false)
                    {
                        lbErr.Text = "Your account is not active";
                    }
                    else
                    {
                        XuLyDangNhap(ac[0]);
                    }
                    
                }
                else
                {
                    lbErr.Text = "UserName or password is Incorrect";
                }

            }
        }

        void XuLyDangNhap(Account ac)
        {
            Session["IsLogin"] = 1;
            Session["CurUser"] = ac;

            if (ckRemember.Checked)
            {
                Response.Cookies["Username"].Value = ac.Username;
                Response.Cookies["Username"].Expires = DateTime.Now.AddDays(7);
            }
            if (ac.Role == "master")
            {
                ChuyenTrang("~/master/reportMaster.aspx");
            }
            else if (ac.Role == "agent")
            {
                ChuyenTrang("~/agent/reportAgent.aspx");
            }
            else if (ac.Role == "merchant")
            {
                ChuyenTrang("~/merchant/reportMerchant.aspx");
            }

        }

        private void ChuyenTrang(string url)
        {
            string retUrl = Request.QueryString["retUrl"];
            if (string.IsNullOrEmpty(retUrl))
                retUrl = url;

            Response.Redirect(retUrl);
        }
    }
}