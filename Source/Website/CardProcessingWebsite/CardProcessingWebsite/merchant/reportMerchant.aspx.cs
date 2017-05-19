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

namespace CardProcessingWebsite.merchant
{
    public partial class reportMerchant : System.Web.UI.Page
    {
        List<String> list_rp_type = new List<String>{"Hàng ngày","Tháng trước", "Năm trước", "Quý trước"};
        Merchant mr_current = new Merchant();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                loadReportType();
                // test chuc năng MERCH00001
                if (CurrentContext.IsLogged() == true)
                {
                    string userID = CurrentContext.GetCurUser().UserID.ToString();
                    loadProfileMerchant(userID);
                }
                else
                {
                    loadProfileMerchant("MERCH00001");
                }
                   
                dpnReportType_TextChanged(null, null);
               
            }
        }

        private void loadReportType()
        {
            dpnReportType.DataSource = list_rp_type;
            dpnReportType.DataBind();
        }

        protected void dpnReportType_TextChanged(object sender, EventArgs e)
        {
            List<DailyReport> lst = new List<DailyReport>();
            List<DailyReport> lst_Report_card = new List<DailyReport>();
            string merID = mr_current.MerchantID;
            DateTime now = DateTime.Now;
 
            if(dpnReportType.Text == "Hàng ngày")
            {
                // test
                DateTime dt = new DateTime(2017, 5, 11);
                string api_url = String.Format("api/merchant_report/getDaily/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
                // correct code
                //string api_url = String.Format("api/merchant_report/getDaily/{0}/{1}", merID, now.ToString("yyyy-MM-dd"));
                lst = Get_Report(api_url);
                if (lst != null)
                {
                    string strDay = "ngày " + lst[0].Date.ToString("dd/MM/yyyy");
                    SetHeader(lst, strDay);
                }
            }
            else if (dpnReportType.Text == "Tháng trước")
            {
                // test
                DateTime dt = new DateTime(2017, 5, 1);
                string api_url = String.Format("api/merchant_report/getMonthly/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
                // correct code
                // string api_url = String.Format("api/merchant_report/getMonthly/{0}/{1}", merID, now.ToString("yyyy-MM-dd"));

                lst = Get_Report(api_url);
                if (lst != null)
                {
                    string strDay = "tháng " + lst[0].Date.Month;
                    SetHeader(lst, strDay);
                }
            }
            else if (dpnReportType.Text == "Năm trước")
            {
                // test
                DateTime dt = new DateTime(2017, 5, 1);
                string api_url = String.Format("api/merchant_report/getYearly/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
                // correct code
                //  string api_url = String.Format("api/merchant_report/getYearly/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
                lst = Get_Report(api_url);
                if (lst != null)
                {
                    string strDay = "năm " + lst[0].Date.Year;
                    SetHeader(lst, strDay);
                }
            }
            else
            {
                // test
                DateTime dt = new DateTime(2017, 7, 1);
                string api_url = String.Format("api/merchant_report/getQuarter/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
                // correct code
                //string api_url = String.Format("api/merchant_report/getQuarter/{0}/{1}", merID, now.ToString("yyyy-MM-dd"));
                lst = Get_Report(api_url);
                if (lst != null)
                {
                    int quarter = (lst[0].Date.Month + 2) / 3;
                    string strDay = "quý " + quarter + " năm " + lst[0].Date.Year.ToString();
                    SetHeader(lst, strDay);
                }
            }
            
            
            list_Report_general.DataSource = lst;
            list_Report_general.DataBind();

            list_Report_Visa.DataSource = lst;
            list_Report_Visa.DataBind();

            list_Report_Debit.DataSource = lst;
            list_Report_Debit.DataBind();

            list_Report_Master.DataSource = lst;
            list_Report_Master.DataBind();
        }

        private void SetHeader(List<DailyReport> lst, string dt)
        {
            lbReport.Text = " Thống kê chung " + dt;
            lbReport_Debit.Text = "Thống kê theo Card DEBIT " + dt;
            lbReport_Visa.Text = "Thống kê theo Card VISA " + dt;
            lbReport_Master.Text = "Thống kê theo Card MASTER " + dt;
        }

        private void loadProfileMerchant(string UserID)
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/getProfileMerchant/" + UserID;
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Merchant[]>().Result;
                    lblMerchantID.Text = list[0].MerchantName;
                    mr_current = list[0];
                }
            }
        }

        private List<DailyReport> Get_Report(string api_url)
        {
            List<DailyReport> lst = null;
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + api_url;
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var dl = response.Content.ReadAsAsync<DailyReport>().Result;
                    if (dl != null)
                    {
                        lst = new List<DailyReport>();
                        lst.Add(dl);
                    }
                }             
            }
            return lst;
        }
    }
}