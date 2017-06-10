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

namespace CardProcessingWebsite.agent
{
    public partial class reportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/agent/reportAgent.aspx");
            }
            else
            {
                if (CurrentContext.GetCurUser().Role.ToString() != "agent")
                {
                    Response.Redirect("~/login/login.aspx");
                }
                else if (IsPostBack == false)
                {
                    txtDate.Text = (DateTime.Now.Day - 1).ToString().PadLeft(2, '0') + "/" + DateTime.Now.Month.ToString().PadLeft(2, '0') + "/" + DateTime.Now.Year;
                    LoadMerchant();
                    LoadRegion();
                    LoadMerchantType();
                }

            }

        }
        private void LoadMerchant()
        {
            string userID = CurrentContext.GetCurUser().UserID.ToString();
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/getMerchantByAgent/"+userID;
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
                    ListItem nullItem = new ListItem("All", "");
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
                    ListItem nullItem = new ListItem("All", "");
                    ddlType.Items.Insert(0, nullItem);
                }
            }
        }
        protected void btnChangeFilter_Click(object sender, EventArgs e)
        {

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnExport_Click(object sender, EventArgs e)
        {

        }
    }
}