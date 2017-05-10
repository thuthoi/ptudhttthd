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
            if (IsPostBack == false)
            {
                loadListMerchant();
                loadListMasterForAdding();
            }
        }

        private void loadListMasterForAdding()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/master/getAll";
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Master[]>().Result;
                    cboMaster.DataSource = list;
                    cboMaster.DataTextField = "MasterName";
                    cboMaster.DataValueField = "MasterID";
                    cboMaster.DataBind();
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
                    Status = true,
                    MasterID = cboMaster.SelectedItem.Value
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
    }
}