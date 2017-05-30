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
    public partial class profileMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/master/profileMaster.aspx");
            }
            else
            {

                if (IsPostBack == false)
                {
                    loadProfileMaster();
                }
            }
            
        }

        private void loadProfileMaster()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/master/getProfileMaster/" + CurrentContext.GetCurUser().UserID.ToString();
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Master[]>().Result;
                    lblName.Text = list[0].MasterName;
                    lblPhone.Text = list[0].Phone;
                    lblEmail.Text = list[0].Email;
                    lblMasterID.Text = list[0].MasterID;
                }
            }
        }
    }
}