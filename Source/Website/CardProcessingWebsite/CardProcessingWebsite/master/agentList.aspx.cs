using CardProcessingWebsite.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CardProcessingWebsite.class_DTO;
using System.Net;

namespace CardProcessingWebsite.master
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/master/agentList.aspx");
            }
            else
            {

                if (CurrentContext.GetCurUser().Role.ToString() != "master")
                {
                    Response.Redirect("~/login/login.aspx");
                }
                else if (IsPostBack == false)
                {
                    loadListMerchant();
                }
            }
            
        }


        protected void btnAddAgent_Click(object sender, EventArgs e)
        {
            string _agentID = string.Empty;
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/agent/getNewID";
                var response = c.GetAsync(url).Result;
                //Tạo MerchantID 
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    _agentID = response.Content.ReadAsStringAsync().Result;
                }
            }

            if (AddAgent(_agentID))
            {
                clearAll();
                loadListMerchant();
            }
        }

        private void loadListMerchant()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/agent/getAll";
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Agent[]>().Result;
                    listMerchant.DataSource = list;
                    listMerchant.DataBind();
                }
            }
        }

        private bool AddAgent(string _agentID)
        {
            bool res = false;
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //Lưu database
                string url = localhost.hostname() + "api/agent/add";
                var response = c.PostAsJsonAsync(url, new
                {
                    AgentID = _agentID.Substring(1, 10),
                    AgentName = txtAgentName.Text.Trim(),
                    Address = txtAddress.Text.Trim(),
                    Phone = txtPhone.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    Status = true
                }).Result;
                if (response.StatusCode == HttpStatusCode.Created)
                {
                    res = true;
                }
            }
            return res;
        }

        private void clearAll()
        {
            txtAddress.Text = txtPhone.Text = txtEmail.Text = txtAgentName.Text = string.Empty;
        }

        private void ChuyenTrang(string url)
        {
            string retUrl = Request.QueryString["retUrl"];
            if (string.IsNullOrEmpty(retUrl))
                retUrl = url;

            Response.Redirect(retUrl);
        }

        protected void btnPhanQuyen_Click(object sender, EventArgs e)
        {
            ChuyenTrang("~/master/agentManagementMerchant.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (UpdateAgent())
            {
                clearAll();
                loadListMerchant();
            }
        }

        private bool UpdateAgent()
        {
            string _merID = txtAgentIDE.Text.Trim();
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //Lưu database
                string url = localhost.hostname() + "api/agent/update";
                var response = c.PutAsJsonAsync(url, new
                {
                    AgentID = _merID,
                    AgentName = txtAgentNameE.Text.Trim(),
                    Address = txtAddressE.Text.Trim(),
                    Phone = txtPhoneE.Text.Trim(),
                    Email = txtEmailE.Text.Trim(),
                    Status = chbxActiveE.Checked == true ? true : false,
                    
                    
                }).Result;
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    return true;
                }
                return false;
            }
        }

        protected void listMerchant_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("EditAgent"))
            {
                string agentID = e.CommandArgument.ToString();
                using (var c = new HttpClient())
                {
                    c.DefaultRequestHeaders.Accept.Clear();
                    c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    string url = localhost.hostname() + "api/agent/getProfileAgent/" + agentID;
                    var response = c.GetAsync(url).Result;
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var agent = response.Content.ReadAsAsync<Agent[]>().Result;
                        txtAgentIDE.Text = agent[0].AgentID;
                        txtAgentNameE.Text = agent[0].AgentName;
                        txtAddressE.Text = agent[0].Address;
                        txtPhoneE.Text = agent[0].Phone;
                        txtEmailE.Text = agent[0].Email;
                        chbxActiveE.Checked = agent[0].Status;
                    }

                    string script = "$('#editAgentModal').modal('show');";
                    if (ClientScript.IsStartupScriptRegistered("editAgentModal") == false)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "editAgentModal", script, true);
                    }
                }
            }
        }

    }
}