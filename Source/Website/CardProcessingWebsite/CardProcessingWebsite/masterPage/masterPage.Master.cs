using CardProcessingWebsite.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CardProcessingWebsite.masterPage
{
    public partial class masterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged())
            {
                string role = CurrentContext.GetCurUser().Role.ToString();
                lblUsername.Text = CurrentContext.GetCurUser().Username.ToString();
                if (role != "master")
                {
                    if (role == "agent")
                    {
                        pnlAgent.Visible = true;
                        pnlMaster.Visible = false;
                        lblNamePage.Text = "CardProcessing Agent";
                    }
                    else
                    {
                        pnlMerchant.Visible = true;
                        pnlMaster.Visible = false;
                        lblNamePage.Text = "CardProcessing Merchant";
                    }
                }
                else
                {
                    lblNamePage.Text = "CardProcessing Master";
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            CurrentContext.Destroy();
            ChuyenTrang("~/login/login.aspx");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            if (CurrentContext.GetCurUser().Role.ToString() == "merchant")
            {
                ChuyenTrang("~/merchant/profileMerchant.aspx");
            }
        }

        protected void lblMerchantManagementforMaster_Click(object sender, EventArgs e)
        {
                ChuyenTrang("~/master/merchantList.aspx");
        }

        
        private void ChuyenTrang(string url)
        {
            string retUrl = Request.QueryString["retUrl"];
            if (string.IsNullOrEmpty(retUrl))
                retUrl = url;

            Response.Redirect(retUrl);
        }
    }
}