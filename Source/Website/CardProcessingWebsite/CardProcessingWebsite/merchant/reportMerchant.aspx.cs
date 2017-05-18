using CardProcessingWebsite.class_DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CardProcessingWebsite.merchant
{
    public partial class reportMerchant : System.Web.UI.Page
    {
        List<String> list_rp_type = new List<String>{"Hàng ngày","Tháng trước", "Năm trước", "Quý trước"};
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                loadReportType();
            }
        }

        private void loadReportType()
        {
            dpnReportType.DataSource = list_rp_type;
            dpnReportType.DataBind();
        }
    }
}