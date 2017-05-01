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

namespace CardProcessingWebsite.master
{
    public partial class AccountList : System.Web.UI.Page
    {
        List<Merchant> list_mer = new List<Merchant>();
        List<Agent> list_Ag = new List<Agent>();
        List<Master> list_ma = new List<Master>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                loadListAccount();
                Load_Role_Data();
                check_add_button_enable_disable();
            }
            loadListAccount();
        }

        private void check_add_button_enable_disable()
        {
            if (list_Ag.Count == 0 && list_ma.Count == 0 && list_mer.Count == 0)
            {
                btnAddAccount.Enabled = false;
                btnAddAccount.Visible = false;
            }
        }

        private void Load_Role_Data()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/getAll_NotHave_Account";
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    list_mer = response.Content.ReadAsAsync<Merchant[]>().Result.ToList();
                    cbMerchant.DataSource = list_mer;
                    cbMerchant.DataTextField = "MerchantName";
                    cbMerchant.DataValueField = "MerchantID";
                    cbMerchant.DataBind();
                    if(list_mer.Count == 0)
                    {
                        rdMerchant.Enabled = false;
                        rdMaster.Checked = true;
                        rdAgent.Checked = false;
                    }
                    else
                    {
                        rdMerchant.Checked = true;
                    }
                }

                

                url = localhost.hostname() + "api/agent/getAgent_NotHave_Account";
                response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    list_Ag = response.Content.ReadAsAsync<Agent[]>().Result.ToList();
                    cboAgent.DataSource = list_Ag;
                    cboAgent.DataTextField = "AgentName";
                    cboAgent.DataValueField = "AgentID";
                    cboAgent.DataBind();
                    if (list_Ag.Count == 0)
                    {
                        rdAgent.Enabled = false;
                    }
                    else
                    {
                        rdMaster.Checked = false;
                        rdMerchant.Checked = false;
                        rdAgent.Checked = true;
                    }
                }
                url = localhost.hostname() + "api/master/getMaster_NotHave_Account";
                response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    list_ma = response.Content.ReadAsAsync<Master[]>().Result.ToList();
                    cboMaster.DataSource = list_ma;
                    cboMaster.DataTextField = "MasterName";
                    cboMaster.DataValueField = "MasterID";
                    cboMaster.DataBind();
                    if (list_ma.Count == 0)
                    {
                        rdMaster.Enabled = false;
                    }
                    else
                    {
                        rdMaster.Checked = true;
                        rdAgent.Checked = false;
                        rdMerchant.Checked = false;
                    }
                }

            }
        }

        private void loadListAccount()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/account/getAll";
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Account[]>().Result;
                    listAccount.DataSource = list;
                    listAccount.DataBind();
                }
            }
        }
        
        protected void btnAddAccount_Click(object sender, EventArgs e)
        {
            if(Page.IsValid) 
            {
                string role = "";
                string userID = "";
                if (rdMaster.Checked == true)
                {
                    userID = cboMaster.SelectedValue;
                    role = "master";

                }
                else if (rdAgent.Checked == true)
                {
                    userID = cboAgent.SelectedValue;
                    role = "agent";
                }
                else
                {
                    userID = cbMerchant.SelectedValue;
                    role = "merchant";
                }
                using (var c = new HttpClient())
                {
                    c.DefaultRequestHeaders.Accept.Clear();
                    c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //Lưu database
                    string url = localhost.hostname() + "api/account/add";
                    var response = c.PostAsJsonAsync(url, new
                    {
                        UserID = userID,
                        Username = txtUserName.Text,
                        Password = txtPassword.Text,
                        OldPassword = txtPassword.Text,
                        Role = role
                    }).Result;
                    if (response.StatusCode == HttpStatusCode.Created)
                    {
                        clearAll();
                        Load_Role_Data();
                        loadListAccount();
                    }
                    //return res;
                }
            }
            
        }

        private void clearAll()
        {
            txtUserName.Text = txtPassword.Text = txtNLMK.Text = string.Empty;

        }

        protected void validatorUID_ServerValidate(object source, ServerValidateEventArgs args)
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/account/Check_Account_UserName_Exist/" + txtUserName.Text;
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
        }

    }
}