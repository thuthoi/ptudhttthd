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
    public partial class agentSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/master/agentSearch.aspx");
            }
            else
            {

                if (CurrentContext.GetCurUser().Role.ToString() != "master")
                {
                    Response.Redirect("~/login/login.aspx");
                }
                else if (IsPostBack == false)
                {
                    
                }
            }
           
        }

        private void loadListAgent()
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
                    listAgent.DataSource = list;
                    listAgent.DataBind();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (UpdateAgent())
            {
                btnSearch_Click(null, null);
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

        protected void listAgent_ItemCommand(object sender, ListViewCommandEventArgs e)
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

            if (e.CommandName.Equals("ReportAgent"))
            {
                string agentID = e.CommandArgument.ToString();
                //Response.Write("<script>alert('Hello');</script>");

                Response.Redirect("~/master/reportMaster.aspx?AgentID=" + agentID);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {


            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string url = localhost.hostname() + "api/agent/searchAgent";
                var response = c.PostAsJsonAsync(url, new
                {
                    Keyword = txtKeyword.Text,
                    Active = rbActive.SelectedValue
                }).Result;

                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Agent[]>().Result;
                    listAgent.DataSource = list;
                    listAgent.DataBind();
                    resultTable.Style.Add("display", "block");
                }
            }

            //Response.Write("<script>alert('" + keyword + " " + type + " " + region + "');</script>");
            //resultTable.Style.Add("display", "block");
        }

        protected void btnViewDetailMerchant_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/master/merchantOfAgent.aspx?AgentID=" + txtAgentIDE.Text);
            //Response.Write("<script>alert('" + txtAgentIDE.Text+"');</script>");
        }
    }
}