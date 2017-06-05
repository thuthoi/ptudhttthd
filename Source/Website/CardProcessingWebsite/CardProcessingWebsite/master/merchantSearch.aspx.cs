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
    public partial class merchantSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/master/merchantSearch.aspx");
            }
            else
            {

                if (CurrentContext.GetCurUser().Role.ToString() != "master")
                {
                    Response.Redirect("~/login/login.aspx");
                }
                else if (!Page.IsPostBack)
                {

                    loadMerchantType();
                    loadMerchantRegion();

                    loadMerchantTypeforEditing();
                    loadMerchantRegionforEditing();
                    loadAgentforEditing();

                }
            }

            
                
        
        }

        private void loadMerchantType()
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
                    ListItem nullItem = new ListItem("Select type", "");
                    cboMerchantType.Items.Insert(0, nullItem);
                }
            }
        }

        private void loadMerchantRegion()
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
                    ListItem nullItem = new ListItem("Select region", "");
                    cboMerchantRegion.Items.Insert(0, nullItem);

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
                    //list = null;
                    listMerchant.DataSource = list;
                    listMerchant.DataBind();
                    
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
                    cboAgentList.DataSource = list;
                    cboAgentList.DataTextField = "AgentName";
                    cboAgentList.DataValueField = "AgentID";
                    cboAgentList.DataBind();
                    ListItem nullItem = new ListItem("Select later", "");
                    cboAgentE.Items.Insert(0, nullItem);
                    ListItem nullItemSearch = new ListItem("Select agent", "");
                    cboAgentList.Items.Insert(0, nullItemSearch);

                }
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (UpdateMerchant())
            {
                btnSearch_Click(null, null);
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

            if (e.CommandName.Equals("ReportMerchant"))
            {
                string merchantID = e.CommandArgument.ToString();
                //Response.Write("<script>alert('Hello');</script>");

                Response.Redirect("~/master/reportMaster.aspx?MerchantID=" + merchantID);

            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string url = localhost.hostname() + "api/merchant/searchMerchant";
                var response = c.PostAsJsonAsync(url, new
                {
                    Keyword = txtKeyword.Text,
                    AgentID = cboAgentList.SelectedValue.ToString(),
                    MerchantRegion = cboMerchantRegion.SelectedValue.ToString(),
                    MerchantType = cboMerchantType.SelectedValue.ToString(),
                    Active = rbActive.SelectedValue
                }).Result;

                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Merchant[]>().Result;
                    listMerchant.DataSource = list;
                    listMerchant.DataBind();
                    resultTable.Style.Add("display", "block");
                }
            } 
        }
    }
}