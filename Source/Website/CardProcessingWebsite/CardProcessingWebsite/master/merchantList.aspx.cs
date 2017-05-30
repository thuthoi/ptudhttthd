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
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/master/merchantList.aspx");
            }
            else
            {

                if (IsPostBack == false)
                {
                    loadListMerchant();
                    loadMerchantTypeforAdding();
                    loadMerchantRegionforAdding();
                    loadAgentforAdding();

                    loadMerchantTypeforEditing();
                    loadMerchantRegionforEditing();
                    loadAgentforEditing();
                }
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
                string url = localhost.hostname() + "api/agent/getAgentbyMaster/" + CurrentContext.GetCurUser().UserID.ToString();
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Agent[]>().Result;
                    cboAgent.DataSource = list;
                    cboAgent.DataTextField = "AgentName";
                    cboAgent.DataValueField = "AgentID";
                    cboAgent.DataBind();
                    ListItem nullItem = new ListItem("Select later", "");
                    cboAgent.Items.Insert(0, nullItem);
                }
            }
        }

        private void loadMerchantTypeforEditing()
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
                    cboMerchantTypeE.DataSource = list;
                    cboMerchantTypeE.DataTextField = "MerchantTypeName";
                    cboMerchantTypeE.DataValueField = "MerchantTypeID";
                    cboMerchantTypeE.DataBind();
                }
            }
        }

        private void loadMerchantRegionforEditing()
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
                    cboMerchantRegionE.DataSource = list;
                    cboMerchantRegionE.DataTextField = "MerchantRegionName";
                    cboMerchantRegionE.DataValueField = "MerchantRegionID";
                    cboMerchantRegionE.DataBind();
                }
            }
        }

        private void loadAgentforEditing()
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
                    cboAgentE.DataSource = list;
                    cboAgentE.DataTextField = "AgentName";
                    cboAgentE.DataValueField = "AgentID";
                    cboAgentE.DataBind();
                    ListItem nullItem = new ListItem("Select later", "");
                    cboAgentE.Items.Insert(0, nullItem);
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
                    Status = chbxActive.Checked == true ? true : false,
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
            if (UpdateMerchant())
            {
                clearAll();
                loadListMerchant();
            }
        }

        private bool UpdateMerchant()
        {
            string _merID = txtMerchantIDE.Text.Trim();
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //Lưu database
                string url = localhost.hostname() + "api/merchant/update";
                var response = c.PutAsJsonAsync(url, new
                {
                    MerchantID = _merID,
                    MerchantName = txtMerchantNameE.Text.Trim(),
                    Address = txtAddressE.Text.Trim(),
                    Phone = txtPhoneE.Text.Trim(),
                    Email = txtEmailE.Text.Trim(),
                    Status = chbxActiveE.Checked == true ? true : false,
                    MerchantTypeID = cboMerchantTypeE.SelectedItem.Value,
                    MerchantRegionID = cboMerchantRegionE.SelectedItem.Value,
                    AgentID = cboAgentE.SelectedItem.Value
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
                        var merchant = response.Content.ReadAsAsync<Merchant[]>().Result;
                        txtMerchantIDE.Text = merchant[0].MerchantID;
                        txtMerchantNameE.Text = merchant[0].MerchantName;
                        txtAddressE.Text = merchant[0].Address;
                        txtPhoneE.Text = merchant[0].Phone;
                        txtEmailE.Text = merchant[0].Email;
                        if (merchant[0].AgentID == "")
                        {
                            cboAgentE.SelectedIndex = 0;

                        }
                        else
                        {
                            cboAgentE.SelectedValue = merchant[0].AgentID;
                        }
                        cboMerchantRegionE.SelectedValue = merchant[0].MerchantRegionID;
                        cboMerchantTypeE.SelectedValue = merchant[0].MerchantTypeID;
                        chbxActiveE.Checked = merchant[0].Status;
                    }

                    string script = "$('#editMerchantModal').modal('show');";
                    if (ClientScript.IsStartupScriptRegistered("editMerchantModal") == false)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "editMerchantModal", script, true);
                    }
                }
            }
        }

        protected void listMerchant_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            string id = e.Keys["MerchantID"].ToString();
            if (deleteMerchant(id))
            {
                loadListMerchant();
            }
        }

        private bool deleteMerchant(string id)
        {
            bool res = false;
            Merchant mer = getProfileMerchantForDelete(id);
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/delete";
                var response = c.PutAsJsonAsync(url, new
                {
                    MerchantID = id,
                    MerchantName = mer.MerchantName,
                    Address = mer.Address,
                    Phone = mer.Phone,
                    Email = mer.Email,
                    Status = mer.Status,
                    MerchantTypeID = mer.MerchantTypeID,
                    MerchantRegionID = mer.MerchantRegionID,
                    AgentID = mer.MerchantRegionID
                }).Result;
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    res = true;
                }
                return res;
            }
        }

        private Merchant getProfileMerchantForDelete(string id)
        {
            Merchant mer = new Merchant();
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/getProfileMerchant/" + id;
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    mer = response.Content.ReadAsAsync<Merchant[]>().Result.FirstOrDefault();
                }
                return mer;
            }
        }
    }
}