using CardProcessingWebsite.class_DTO;
using CardProcessingWebsite.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CardProcessingWebsite.master
{
    public partial class reportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/master/reportMaster.aspx");
            }
            else
            {

                if (CurrentContext.GetCurUser().Role.ToString() != "master")
                {
                    Response.Redirect("~/login/login.aspx");
                }
                else if (IsPostBack == false)
                {
                    LoadAgent();
                    LoadMerchantType();
                    LoadRegion();
                    LoadMerchant();
                    LoadMaster();
                    LoadYearDDL();
                    LoadQuarterDDL();
                }
            }
        }

        private void LoadYearDDL()
        {
            int year = DateTime.Now.Year;
            int month = ((DateTime.Now.Month + 2) / 3);
            if (month <= 1)
            {
                year = year - 1;
            }
            for (int i = 1970; i <= year; i++)
            {
                ddlYear.Items.Insert(i - 1970, new ListItem(i.ToString(), i.ToString()));
            }
            ddlYear.SelectedValue = year.ToString();
        }

        private void LoadQuarterDDL()
        {
            int month = ((DateTime.Now.Month + 2) / 3);
            for (int i = 1; i <= 4; i++)
            {
                ddlQuarter.Items.Insert(i - 1, new ListItem(i.ToString(), i.ToString()));
            }
        }

        private void LoadMaster()
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
                    ddlMaster.DataSource = list;
                    ddlMaster.DataTextField = "MasterName";
                    ddlMaster.DataValueField = "MasterID";
                    ddlMaster.DataBind();
                }
            }
        }

        private void LoadMerchant()
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
                    var datasource = from x in list
                                     select new
                                     {
                                         x.MerchantID,
                                         x.MerchantName,
                                         DisplayField = String.Format("{0} - {1}", x.MerchantID, x.MerchantName)
                                     };
                    ddlMerchant.DataSource = datasource;
                    ddlMerchant.DataTextField = "DisplayField";
                    ddlMerchant.DataValueField = "MerchantID";
                    ddlMerchant.DataBind();
                }
            }
        }

        private void LoadRegion()
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
                    ddlRegion.DataSource = list;
                    ddlRegion.DataTextField = "MerchantRegionName";
                    ddlRegion.DataValueField = "MerchantRegionID";
                    ddlRegion.DataBind();
                    ListItem nullItem = new ListItem("Select", "");
                    ddlRegion.Items.Insert(0, nullItem);
                }
            }
        }

        private void LoadMerchantType()
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
                    ddlType.DataSource = list;
                    ddlType.DataTextField = "MerchantTypeName";
                    ddlType.DataValueField = "MerchantTypeID";
                    ddlType.DataBind();
                    ListItem nullItem = new ListItem("Select", "");
                    ddlType.Items.Insert(0, nullItem);
                }
            }
        }

        private void LoadAgent()
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
                    ddlAgent.DataSource = list;
                    ddlAgent.DataTextField = "AgentName";
                    ddlAgent.DataValueField = "AgentID";
                    ddlAgent.DataBind();
                }
            }
        }

        protected void btnChangeFilter_Click(object sender, EventArgs e)
        {

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    string script = "window.onload = function() { chart(); };";
        //    ClientScript.RegisterStartupScript(GetType(), "chart", script, true);
        //}
    }
}