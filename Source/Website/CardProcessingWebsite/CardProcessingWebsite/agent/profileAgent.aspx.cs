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
    public partial class profileAgent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/agent/profileAgent.aspx");
            }
            else
            {
                if (IsPostBack == false)
                {
                    loadProfileAgent();
                }

            }
           
        }

        private void loadProfileAgent()
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
                    lblName.Text = list[0].AgentName;
                    lblAddress.Text = list[0].Address;
                    lblPhone.Text = list[0].Phone;
                    lblEmail.Text = list[0].Email;
                    lblAgentID.Text = list[0].AgentID;
                }
            }
        }
    }
}