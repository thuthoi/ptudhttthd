using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using CardProcessingWebsite.class_DTO;
using CardProcessingWebsite.helpers;

namespace CardProcessingWebsite
{
    public partial class merchantList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                loadListMerchant();
                loadMerchantTypeforAdding();
                loadMerchantRegionforAdding();
                loadAgentforAdding();
            }
        }
        private void loadMerchantTypeforAdding()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchantType/getAll";
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<MerchantType[]>().Result;
                    cboMerchantType.DataSource = list;
                    cboMerchantType.DataTextField = "MerchantTypeName";
                    cboMerchantType.DataValueField = "MerchantTypeID";
                    cboMerchantType.DataBind();
                }
            }
        }

        private void loadMerchantRegionforAdding()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchantRegion/getAll";
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<MerchantRegion[]>().Result;
                    cboMerchantRegion.DataSource = list;
                    cboMerchantRegion.DataTextField = "MerchantRegionName";
                    cboMerchantRegion.DataValueField = "MerchantRegionID";
                    cboMerchantRegion.DataBind();
                }
            }
        }

        private void loadAgentforAdding()
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
                    cboAgent.DataSource = list;
                    cboAgent.DataTextField = "AgentName";
                    cboAgent.DataValueField = "AgentID";
                    cboAgent.DataBind();
                }
            }
        }

        private void loadListMerchant()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/getAll";
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Merchant[]>().Result;
                    listMerchant.DataSource = list;
                    listMerchant.DataBind();
                }
            }
        }

        private void clearAll()
        {
            txtAddress.Text = txtPhone.Text = txtEmail.Text = txtMerchantName.Text = string.Empty;
        }

        protected void btnAddMerchant_Click(object sender, EventArgs e)
        {
            string _merID = string.Empty;
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/getNewID";
                var response = c.GetAsync(url).Result;
                //Tạo MerchantID 
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    _merID = response.Content.ReadAsStringAsync().Result;
                }
            }
            if (AddMerchant(_merID))
            {
                clearAll();
                loadListMerchant();
            }
        }

        bool AddMerchant(string id)
        {
            bool res = false;
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //Lưu database
                string url = localhost.hostname() + "api/merchant/add";
                var response = c.PostAsJsonAsync(url, new
                {
                    MerchantID = id.Substring(1, 10),
                    MerchantName = txtMerchantName.Text.Trim(),
                    Address = txtAddress.Text.Trim(),
                    Phone = txtPhone.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    Status = true,
                    MerchantTypeID = cboMerchantType.SelectedItem.Value,
                    MerchantRegionID = cboMerchantRegion.SelectedItem.Value,
                    AgentID = cboAgent.SelectedItem.Value
                }).Result;
                if (response.StatusCode == HttpStatusCode.Created)
                {
                    res = true;
                }
                return res;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void listMerchant_ItemCommand(object sender, ListViewCommandEventArgs e)
        {                        
            if (e.CommandName.Equals("EditMerchant"))
            {
                string merchantID = e.CommandArgument.ToString();
                using (var c = new HttpClient())
                {
                    c.DefaultRequestHeaders.Accept.Clear();
                    c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    string url = localhost.hostname() + "api/merchant/getProfileMerchant/" + merchantID;
                    var response = c.GetAsync(url).Result;
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var merchant = response.Content.ReadAsAsync<Merchant>().Result;
                        txtMerchantIDE.Text = merchant.MerchantID;
                        txtMerchantNameE.Text = merchant.MerchantName;
                        txtAddressE.Text = merchant.Address;
                        txtPhoneE.Text = merchant.Phone;
                        txtEmailE.Text = merchant.Email;
                        cboAgentE.SelectedValue = merchant.AgentID;
                        cboMerchantRegionE.SelectedValue = merchant.MerchantRegionID;
                        cboMerchantTypeE.SelectedValue = merchant.MerchantTypeID;
                    }

                    string script = "$('#editMerchantModal').modal('show');";
                    if (ClientScript.IsStartupScriptRegistered("editMerchantModal") == false)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "editMerchantModal", script, true);
                    }
                }
            }
        }

        protected void listMerchant_ItemCommand1(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "EditMerchant")
            {
                string merchantID = e.CommandArgument.ToString();
                using (var c = new HttpClient())
                {
                    c.DefaultRequestHeaders.Accept.Clear();
                    c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    string url = localhost.hostname() + "api/merchant/getProfileMerchant/" + merchantID;
                    var response = c.GetAsync(url).Result;
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var merchant = response.Content.ReadAsAsync<Merchant>().Result;
                        txtMerchantIDE.Text = merchant.MerchantID;
                        txtMerchantNameE.Text = merchant.MerchantName;
                        txtAddressE.Text = merchant.Address;
                        txtPhoneE.Text = merchant.Phone;
                        txtEmailE.Text = merchant.Email;
                        cboAgentE.SelectedValue = merchant.AgentID;
                        cboMerchantRegionE.SelectedValue = merchant.MerchantRegionID;
                        cboMerchantTypeE.SelectedValue = merchant.MerchantTypeID;
                    }

                    string script = "$('#editMerchantModal').modal('show');";
                    if (ClientScript.IsStartupScriptRegistered("editMerchantModal") == false)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "editMerchantModal", script, true);
                    }
                }
            }
        }
    }
}