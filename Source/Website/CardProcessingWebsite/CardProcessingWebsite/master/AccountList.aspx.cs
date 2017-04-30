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
    public partial class AccountList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                loadListAccount();
                loadRoleforAdding();
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
        private void loadRoleforAdding()
        {
            List<string> list = new List<string> { "agent", "master", "merchant" };

            cboRole.DataSource = list;
            cboRole.DataBind();
            
        }
        protected void btnAddAccount_Click(object sender, EventArgs e)
        {

        }
    }
}