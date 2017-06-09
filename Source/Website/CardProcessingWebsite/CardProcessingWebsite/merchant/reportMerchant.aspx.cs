using CardProcessingWebsite.class_DTO;
using CardProcessingWebsite.helpers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
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
        List<String> list_rp_type = new List<String> { "Hàng ngày", "Tháng trước", "Năm trước", "Quý trước" };
        Merchant mr_current = new Merchant();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login/login.aspx?retUrl=~/merchant/reportMerchant.aspx");
            }
            else
            {
                if (CurrentContext.GetCurUser().Role.ToString() != "merchant")
                {
                    Response.Redirect("~/login/login.aspx");
                }
                else
                {
                    string userID = CurrentContext.GetCurUser().UserID.ToString();
                    loadProfileMerchant(userID);
                    if (IsPostBack == false)
                    {
                        txtDate.Text = (DateTime.Now.Day - 1).ToString().PadLeft(2, '0') + "/" + DateTime.Now.Month.ToString().PadLeft(2, '0') + "/" + DateTime.Now.Year;
                        LoadYearDDL();
                        LoadQuarterDDL();
                        GoReport();
                        // test chuc năng MERCH00001
                        //if (CurrentContext.IsLogged() == true)
                        //{
                        //string userID = CurrentContext.GetCurUser().UserID.ToString();
                        //loadProfileMerchant(userID);
                        //}
                        //else
                        //{
                        //    loadProfileMerchant("MERCH00001");
                        //}
                        //if (IsPostBack == false)
                        //{
                        //    loadReportType();
                        //    //dpnReportType_TextChanged(null, null);
                        //    //rdMonthToDate.Attributes.Add("onClick", "return handleClick();");
                        //    //rdYearToDate.Attributes.Add("onClick", "return handleClick();");
                        //}
                    }
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
                //  i - 1970 để tính số thứ tự của măng (index)
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

        private void GoReport()
        {
            //Generate Date
            Report rp = CheckReportType();
            //Generate View
            //List<Report> listView = CheckReportView(list);
            //FillSource
            MasterReport res = FillSource(rp);
            //LoadTable(MasterReport masterReport);
            LoadTable(res);
            //LoadChart
            LoadChart();
        }

        private Report CheckReportType()
        {
            string api_url = string.Empty;
            string merID = mr_current.MerchantID;
            DateTime now = DateTime.Now;
            // test
            DateTime dt = new DateTime(2017, 5, 11);
            //string api_url = String.Format("api/merchant_report/getDaily/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
            // correct code
            dt = now;
            //string api_url = String.Format("api/merchant_report/getDaily/{0}/{1}", merID, now.ToString("yyyy-MM-dd"));

            if (rbDaily.Checked)
            {
                string day = txtDate.Text.Trim().Substring(0, 2);
                string month = txtDate.Text.Substring(3, 2);
                string year = txtDate.Text.Substring(6, 4);
                //api_url = "getDailyReport/" + day + "/" + month + "/" + year;
                DateTime myDate = DateTime.ParseExact(txtDate.Text.Trim(), "dd/MM/yyyy",
                                       System.Globalization.CultureInfo.InvariantCulture);
                api_url = String.Format("getDaily/{0}/{1}", merID, myDate.ToString("yyyy-MM-dd"));

            }
            if (rbMonthly.Checked)
            {
                string month = txtMonth.Text.Substring(0, 2);
                string year = txtMonth.Text.Substring(3, 4);
                api_url = String.Format("getMonthly/{0}/{1}/{2}", merID, month, year);
            }
            if (rbQuarterly.Checked)
            {
                string quarter = ddlQuarter.SelectedValue.ToString();
                string year = ddlYear.SelectedValue.ToString();
                api_url = String.Format("getQuarter/{0}/{1}/{2}", merID, quarter, year);
            }
            if (rbYearly.Checked)
            {
                string year = txtYear.Text.Trim();
                api_url = String.Format("getYearly/{0}/{1}", merID, year);
            }
            if (rbMtDate.Checked)
            {
                string day = txtDate.Text.Trim().Substring(0, 2);
                api_url = "getMonthToDateReport/" + day;
            }
            if (rbYtDate.Checked)
            {
                string day = txtDate.Text.Trim().Substring(0, 2);
                string month = txtDate.Text.Substring(3, 2);
                api_url = "getYearToDateReport/" + day + "/" + month;
            }
            return Generate_Report(api_url);
        }

        private Report Generate_Report(string api_url)
        {
            //List<Report> lst = null;
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "/api/merchant_report/" + api_url;
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var dl = response.Content.ReadAsAsync<Report>().Result;
                    if (dl != null)
                    {
                        //lst = new List<Report>();
                        //lst.Add(dl);
                        return dl;
                    }
                }
            }
            return null;

        }

        private MasterReport FillSource(Report rp)
        {
            MasterReport res = new MasterReport();
            if (rp != null)
            {
                res.ReturnAmount = 0 + rp.ReturnAmount;
                res.SaleAmount = 0 + rp.SaleAmount;
                res.SaleCount = 0 + rp.SaleCount;
                res.ReturnCount = 0 + rp.ReturnCount;
                res.NetAmount = 0 + res.SaleAmount - res.ReturnAmount;
                res.VisaSaleAmount = 0 + rp.VisaCardSaleAmount;
                res.MasterSaleAmount = 0 + rp.MasterCardSaleAmount;
                res.DebitSaleAmount = 0 + rp.DebitCardSaleAmount;
                res.VisaReturnAmount = 0 + rp.VisaCardReturnAmount;
                res.MasterReturnAmount = 0 + rp.MasterCardReturnAmount;
                res.DebitReturnAmount = 0 + rp.DebitCardReturnAmount;
                res.VisaSaleCount = 0 + rp.VisaCardSaleCount;
                res.MasterSaleCount = 0 + rp.MasterCardSaleCount;
                res.DebitSaleCount = 0 + rp.DebitCardSaleCount;
                res.VisaReturnCount = 0 + rp.VisaCardReturnCount;
                res.MasterReturnCount = 0 + rp.MasterCardReturnCount;
                res.DebitReturnCount = 0 + rp.DebitCardReturnCount;
            }
            return res;
        }

        private void LoadTable(MasterReport mr)
        {
            hdReturnAmount.Value = mr.ReturnAmount.ToString();
            hdReturnCount.Value = mr.ReturnCount.ToString();
            hdSaleAmount.Value = mr.SaleAmount.ToString();
            hdSaleCount.Value = mr.SaleCount.ToString();
            hdVisaAmount.Value = (mr.VisaSaleAmount - mr.VisaReturnAmount).ToString();
            hdMasterAmount.Value = (mr.MasterSaleAmount - mr.MasterReturnAmount).ToString();
            hdDebitAmount.Value = (mr.DebitSaleAmount - mr.DebitReturnAmount).ToString();
            hdVisaCount.Value = (mr.VisaSaleCount + mr.VisaReturnCount).ToString();
            hdMasterCount.Value = (mr.MasterSaleCount + mr.MasterReturnCount).ToString();
            hdDebitCount.Value = (mr.DebitSaleCount + mr.DebitReturnCount).ToString();

            lblSaleAmount.Text = formatMoney(mr.SaleAmount);
            lblReturnAmount.Text = "-" + formatMoney(mr.ReturnAmount);
            lblSaleCount.Text = mr.SaleCount.ToString();
            lblReturnCount.Text = mr.ReturnCount.ToString();
            lblNetAmount.Text = formatMoney(mr.NetAmount);
            lblVisaSaleAmount.Text = formatMoney(mr.VisaSaleAmount);
            lblMasterSaleAmount.Text = formatMoney(mr.MasterSaleAmount);
            lblDebitSaleAmount.Text = formatMoney(mr.DebitSaleAmount);
            lblVisaSaleCount.Text = Decimal.ToInt32(mr.VisaSaleCount).ToString();
            lblMasterSaleCount.Text = Decimal.ToInt32(mr.MasterSaleCount).ToString();
            lblDebitSaleCount.Text = Decimal.ToInt32(mr.DebitSaleCount).ToString();
            lblVisaReturnAmount.Text = "-" + formatMoney(mr.VisaReturnAmount);
            lblMasterReturnAmount.Text = "-" + formatMoney(mr.MasterReturnAmount);
            lblDebitReturnAmount.Text = "-" + formatMoney(mr.DebitReturnAmount);
            lblVisaReturnCount.Text = Decimal.ToInt32(mr.VisaReturnCount).ToString();
            lblMasterReturnCount.Text = Decimal.ToInt32(mr.MasterReturnCount).ToString();
            lblDebitReturnCount.Text = Decimal.ToInt32(mr.DebitReturnCount).ToString();
        }

        private string formatMoney(decimal money)
        {
            return money.ToString("#,##0") + " đ";
        }

        private void LoadChart()
        {
            string script = "window.onload = function() { chart(); };";
            ClientScript.RegisterStartupScript(GetType(), "chart", script, true);
        }
        private void loadReportType()
        {
            //dpnReportType.DataSource = list_rp_type;
            //dpnReportType.DataBind();
        }

        //protected void dpnReportType_TextChanged(object sender, EventArgs e)
        //{
        //    List<DailyReport> lst = new List<DailyReport>();
        //    List<DailyReport> lst_Report_card = new List<DailyReport>();
        //    string merID = mr_current.MerchantID;
        //    DateTime now = DateTime.Now;

        //    if (dpnReportType.Text == "Hàng ngày")
        //    {
        //        // test
        //        DateTime dt = new DateTime(2017, 5, 11);
        //        //string api_url = String.Format("api/merchant_report/getDaily/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
        //        // correct code
        //        dt = now;
        //        string api_url = String.Format("api/merchant_report/getDaily/{0}/{1}", merID, now.ToString("yyyy-MM-dd"));
        //        lst = Get_Report(api_url);
        //        DateTime previous = dt.AddDays(-1);
        //        //string strDay = "ngày " + lst[0].Date.ToString("dd/MM/yyyy");
        //        string strDay = "ngày " + previous.Date.ToString("dd/MM/yyyy");
        //        SetHeader(strDay);

        //    }
        //    else if (dpnReportType.Text == "Tháng trước")
        //    {
        //        // test
        //        DateTime dt = new DateTime(2017, 5, 1);
        //        //string api_url = String.Format("api/merchant_report/getMonthly/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
        //        // correct code
        //        dt = now;
        //        string api_url = String.Format("api/merchant_report/getMonthly/{0}/{1}", merID, now.ToString("yyyy-MM-dd"));

        //        lst = Get_Report(api_url);

        //        DateTime previous = dt.AddMonths(-1);
        //        string strDay = "tháng " + previous.Month;
        //        SetHeader(strDay);
        //        hdSaleAmount.Value = lst[0].SaleAmount.ToString();
        //        hdReturnAmount.Value = lst[0].ReturnAmount.ToString();

        //    }
        //    else if (dpnReportType.Text == "Năm trước")
        //    {
        //        // test
        //        DateTime dt = new DateTime(2017, 5, 1);
        //        //string api_url = String.Format("api/merchant_report/getYearly/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
        //        // correct code
        //        dt = now;
        //        string api_url = String.Format("api/merchant_report/getYearly/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
        //        lst = Get_Report(api_url);

        //        int pre_year = dt.Date.Year - 1;
        //        string strDay = "năm " + pre_year;
        //        SetHeader(strDay);

        //    }
        //    else
        //    {
        //        // test
        //        DateTime dt = new DateTime(2017, 1, 1);
        //        //string api_url = String.Format("api/merchant_report/getQuarter/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
        //        // correct code
        //        dt = now;
        //        string api_url = String.Format("api/merchant_report/getQuarter/{0}/{1}", merID, now.ToString("yyyy-MM-dd"));
        //        lst = Get_Report(api_url);

        //        int cur_quarter = (dt.Date.Month + 2) / 3;
        //        int pre_quarter = cur_quarter - 1;
        //        int year = dt.Date.Year;
        //        if (pre_quarter == 0)
        //        {
        //            pre_quarter = 4;
        //            year = (dt.Date.AddYears(-1)).Date.Year;
        //        }
        //        //string strDay = "quý " + pre_quarter + " năm " + lst[0].Date.Year.ToString();
        //        string strDay = "quý " + pre_quarter + " năm " + year;
        //        SetHeader(strDay);

        //    }
        //    SetListView(lst);
        //}

        //private void SetHeader(string dt)
        //{
        //    lbReport.Text = " Thống kê chung " + dt;
        //    lbReport_Debit.Text = "Thống kê theo Card DEBIT " + dt;
        //    lbReport_Visa.Text = "Thống kê theo Card VISA " + dt;
        //    lbReport_Master.Text = "Thống kê theo Card MASTER " + dt;
        //}

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

        protected void btnChangeFilter_Click(object sender, EventArgs e)
        {
            GoReport();
        }

        //protected void btnViewReport_customDay_Click(object sender, EventArgs e)
        //{
        //    List<DailyReport> lst = new List<DailyReport>();
        //    List<DailyReport> lst_Report_card = new List<DailyReport>();
        //    string merID = mr_current.MerchantID;


        //    if (rdMonthToDate.Checked == true)
        //    {
        //        // test
        //        // DateTime dt = new DateTime(2017, 5, 11);
        //        //string api_url = String.Format("api/merchant_report/getMonthtoDate/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
        //        // correct code
        //        string customDay = txtCustomDay.Text;
        //        DateTime myDate = DateTime.ParseExact(customDay, "dd/MM/yyyy",
        //                               System.Globalization.CultureInfo.InvariantCulture);
        //        string api_url = String.Format("api/merchant_report/getMonthtoDate/{0}/{1}", merID, myDate.ToString("yyyy-MM-dd"));
        //        lst = Get_Report(api_url);

        //        DateTime firstDayOfMonth = new DateTime(myDate.Year, myDate.Month, 1);
        //        string strDay = "từ ngày " + firstDayOfMonth.ToString("dd/MM/yyyy") + " tới ngày " + customDay;
        //        SetHeader(strDay);

        //    }
        //    else
        //    {
        //        // test
        //        //DateTime dt = new DateTime(2017, 5, 1);
        //        //string api_url = String.Format("api/merchant_report/getYeartoDate/{0}/{1}", merID, dt.ToString("yyyy-MM-dd"));
        //        // correct code
        //        string customDay = txtCustomDay.Text;
        //        DateTime myDate = DateTime.ParseExact(customDay, "dd/MM/yyyy",
        //                               System.Globalization.CultureInfo.InvariantCulture);

        //        string api_url = String.Format("api/merchant_report/getYeartoDate/{0}/{1}", merID, myDate.ToString("yyyy-MM-dd"));
        //        lst = Get_Report(api_url);

        //        DateTime firstDayOfYear = new DateTime(myDate.Year, 1, 1);
        //        string strDay = "từ ngày " + firstDayOfYear.Date.ToString("dd/MM/yyyy") + " tới ngày " + customDay;
        //        SetHeader(strDay);


        //    }
        //    SetListView(lst);
        //}

        //private void SetListView(List<DailyReport> lst)
        //{
        //    list_Report_general.DataSource = lst;

        //    list_Report_general.DataBind();

        //    list_Report_Visa.DataSource = lst;
        //    list_Report_Visa.DataBind();

        //    list_Report_Debit.DataSource = lst;
        //    list_Report_Debit.DataBind();

        //    list_Report_Master.DataSource = lst;
        //    list_Report_Master.DataBind();
        //}
    }
}