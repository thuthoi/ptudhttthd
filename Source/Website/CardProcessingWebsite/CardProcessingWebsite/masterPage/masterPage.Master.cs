using CardProcessingWebsite.class_DTO;
using CardProcessingWebsite.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CardProcessingWebsite.masterPage
{
    public partial class masterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Page_Init(object sender, EventArgs e) {
            if (CurrentContext.IsLogged())
            {
                string role = CurrentContext.GetCurUser().Role.ToString();
                lblUsername.Text = CurrentContext.GetCurUser().Username.ToString();
                if (role != "master")
                {
                    if (role == "agent")
                    {
                        pnlAgent.Visible = true;
                        pnlMaster.Visible = false;
                        lblNamePage.Text = "CardProcessing Agent";
                    }
                    else
                    {
                        pnlMerchant.Visible = true;
                        pnlMaster.Visible = false;
                        lblNamePage.Text = "CardProcessing Merchant";
                    }
                }
                else
                {
                    lblNamePage.Text = "CardProcessing Master";
                }
            }
            // 
            else
            {
                //Response.Redirect("~/login/login.aspx");

            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            CurrentContext.Destroy();
            ChuyenTrang("~/login/login.aspx");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            

            if (CurrentContext.GetCurUser().Role.ToString() == "merchant")
            {
                using (var c = new HttpClient())
                {
                    c.DefaultRequestHeaders.Accept.Clear();
                    c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    string url = localhost.hostname() + "api/merchant/getProfileMerchant/" + CurrentContext.GetCurUser().UserID.ToString();
                    var response = c.GetAsync(url).Result;
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var list = response.Content.ReadAsAsync<Merchant[]>().Result;
                        lblName.Text = list[0].MerchantName;
                        lblAddress.Text = list[0].Address;
                        lblPhone.Text = list[0].Phone;
                        lblEmail.Text = list[0].Email;
                        lblID.Text = list[0].MerchantID;
                        lblRole.Text = "Merchant";
                        labelAddress.Style.Add("display", "block");
                    }
                }
            }

            if (CurrentContext.GetCurUser().Role.ToString() == "agent")
            {
                using (var c = new HttpClient())
                {
                    c.DefaultRequestHeaders.Accept.Clear();
                    c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    string url = localhost.hostname() + "api/agent/getProfileAgent/" + CurrentContext.GetCurUser().UserID.ToString();
                    var response = c.GetAsync(url).Result;
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var list = response.Content.ReadAsAsync<Agent[]>().Result;
                        lblID.Text = list[0].AgentID;
                        lblName.Text = list[0].AgentName;
                        lblAddress.Text = list[0].Address;
                        lblPhone.Text = list[0].Phone;
                        lblEmail.Text = list[0].Email;
                        lblRole.Text = "Agent";
                        labelAddress.Style.Add("display", "block");
                    }
                }
            }

            if (CurrentContext.GetCurUser().Role.ToString() == "master")
            {
                using (var c = new HttpClient())
                {
                    c.DefaultRequestHeaders.Accept.Clear();
                    c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    string url = localhost.hostname() + "api/master/getProfileMaster/" + CurrentContext.GetCurUser().UserID.ToString();
                    var response = c.GetAsync(url).Result;
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var list = response.Content.ReadAsAsync<Master[]>().Result;
                        lblName.Text = list[0].MasterName;
                        lblPhone.Text = list[0].Phone;
                        lblEmail.Text = list[0].Email;
                        lblID.Text = list[0].MasterID;
                        lblRole.Text = "Master";
                    }
                }
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openProfileModal();", true);
        }

        protected void lblMerchantManagementforMaster_Click(object sender, EventArgs e)
        {
            ChuyenTrang("~/master/merchantList.aspx");
        }
        protected void lblAgentManagementforMaster_Click(object sender, EventArgs e)
        {
            ChuyenTrang("~/master/agentList.aspx");
        }

        protected void lbAccountManager_Click(object sender, EventArgs e)
        {
            ChuyenTrang("~/master/AccountList.aspx");
        }

        protected void lbSearchMerchant_Click(object sender, EventArgs e)
        {
            ChuyenTrang("~/master/merchantSearch.aspx");
        }

        protected void lbSearchAgent_Click(object sender, EventArgs e)
        {
            ChuyenTrang("~/master/agentSearch.aspx");
        }

        
        private void ChuyenTrang(string url)
        {
            string retUrl = Request.QueryString["retUrl"];
            if (string.IsNullOrEmpty(retUrl))
                retUrl = url;

            Response.Redirect(retUrl);
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            failDisplay.Style.Add("display", "none");
            successDisplay.Style.Add("display", "none");

            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string url = localhost.hostname() + "api/account/changepassword";
                var response = c.PostAsJsonAsync(url, new
                {
                    Username = CurrentContext.GetCurUser().Username.ToString(),
                    Password = txtNewPassword.Text.Trim(),
                    OldPassword = txtOldPassword.Text.Trim(),
                }).Result;
                string rest = "";
                using (HttpContent content = response.Content)
                {
                    // ... Read the string.
                    Task<string> result = content.ReadAsStringAsync();
                    rest = result.Result;
                }

                if (rest == "\"Mật khẩu cũ không trùng khớp!\"")
                {
                    failDisplay.Style.Add("display", "block");
                    
                }
                else
                {
                    successDisplay.Style.Add("display", "block");
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
      
            }
        
        }

        protected void btnSearchonAgent_Click(object sender, EventArgs e)
        {
            ChuyenTrang("~/agent/searchMerchant.aspx");
        }

    }
}