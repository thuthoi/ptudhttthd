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
                    txtDate.Text = (DateTime.Now.Day - 1).ToString().PadLeft(2, '0') + "/" + DateTime.Now.Month.ToString().PadLeft(2, '0') + "/" + DateTime.Now.Year;
                    LoadAgent();
                    LoadMerchantType();
                    LoadRegion();
                    LoadMerchant();
                    LoadMaster();
                    LoadYearDDL();
                    LoadQuarterDDL();
                    GoReport();
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
            GoReport();
        }

        private void GoReport()
        {
            //Generate Date
            List<Report> list = CheckReportType();
            //Generate View
            List<Report> listView = CheckReportView(list);
            //FillSource
            MasterReport res = FillSource(listView);
            //LoadTable(MasterReport masterReport);
            LoadTable(res);
            //LoadChart
            LoadChart();
        }

        private List<Report> CheckReportView(List<Report> listRe)
        {
            List<Report> lst = new List<Report>();
            if (rbMerchant.Checked)
            {
                string merID = ddlMerchant.SelectedValue.ToString();
                foreach (Report _report in listRe)
                {
                    if (_report.MerchantID == merID)
                    {
                        lst.Add(_report);
                    }
                }
            }
            if (rbOther.Checked)
            {
                string regID = ddlRegion.SelectedValue.ToString();
                string typeID = ddlType.SelectedValue.ToString();
                string agentID = ddlAgent.SelectedValue.ToString();
                foreach (Report _report in listRe)
                {
                    if (ddlRegion.SelectedIndex != 0)
                    {
                        if (ddlType.SelectedIndex != 0)
                        {
                            if (_report.MerchantRegionID == regID && _report.MerchantTypeID == typeID && _report.AgentID == agentID)
                            {
                                lst.Add(_report);
                            }
                        }
                        else
                        {
                            if (_report.MerchantRegionID == regID && _report.AgentID == agentID)
                            {
                                lst.Add(_report);
                            }
                        }
                    }
                    else
                    {
                        if (ddlType.SelectedIndex != 0)
                        {
                            if (_report.MerchantTypeID == typeID && _report.AgentID == agentID)
                            {
                                lst.Add(_report);
                            }
                        }
                        else
                        {
                            if (_report.AgentID == agentID)
                            {
                                lst.Add(_report);
                            }
                        }
                    }
                }
            }
            if (rbMaster.Checked)
            {
                string regID = ddlRegion.SelectedValue.ToString();
                string typeID = ddlType.SelectedValue.ToString();
                foreach (Report _report in listRe)
                {
                    if (ddlRegion.SelectedIndex != 0)
                    {
                        if (ddlType.SelectedIndex != 0)
                        {
                            if (_report.MerchantRegionID == regID && _report.MerchantTypeID == typeID)
                            {
                                lst.Add(_report);
                            }
                        }
                        else
                        {
                            if (_report.MerchantRegionID == regID)
                            {
                                lst.Add(_report);
                            }
                        }
                    }
                    else
                    {
                        if (ddlType.SelectedIndex != 0)
                        {
                            if (_report.MerchantTypeID == typeID)
                            {
                                lst.Add(_report);
                            }
                        }
                        else
                        {
                            lst.Add(_report);
                        }
                    }
                }
            }
            return lst;
        }

        private List<Report> Generate_Report(string api_url)
        {
            List<Report> lst = null;
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "/api/MasterReport/" + api_url;
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var dl = response.Content.ReadAsAsync<Report[]>().Result;
                    if (dl != null)
                    {
                        lst = new List<Report>();
                        foreach (Report re in dl)
                        {
                            lst.Add(re);
                        }
                    }
                }
            }
            return lst;
        }

        private List<Report> CheckReportType()
        {
            string api_url = string.Empty;
            if (rbDaily.Checked)
            {
                string day = txtDate.Text.Trim().Substring(0, 2);
                string month = txtDate.Text.Substring(3, 2);
                string year = txtDate.Text.Substring(6, 4);
                api_url = "getDailyReport/" + day + "/" + month + "/" + year;
            }
            if (rbMonthly.Checked)
            {
                string month = txtMonth.Text.Substring(0, 2);
                string year = txtMonth.Text.Substring(3, 4);
                api_url = "getMonthlyReport/" + month + "/" + year;
            }
            if (rbQuarterly.Checked)
            {
                string quarter = ddlQuarter.SelectedValue.ToString();
                string year = ddlYear.SelectedValue.ToString();
                api_url = "getQuarterlyReport/" + quarter + "/" + year;
            }
            if (rbYearly.Checked)
            {
                string year = txtYear.Text.Trim();
                api_url = "getYearlyReport/" + year;
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

        private string formatMoney(decimal money)
        {
            return money.ToString("#,##0") + " đ";
        }

        private void LoadTable(MasterReport mr)
        {
            hdReturnAmount.Value = mr.ReturnAmount.ToString();
            hdReturnCount.Value = mr.ReturnCount.ToString();
            hdSaleAmount.Value = mr.SaleAmount.ToString();
            hdSaleCount.Value = mr.SaleCount.ToString();
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

        private void LoadChart()
        {
            string script = "window.onload = function() { chart(); };";
            ClientScript.RegisterStartupScript(GetType(), "chart", script, true);
        }

        private MasterReport FillSource(List<Report> list)
        {
            MasterReport res = new MasterReport();
            if (list != null)
            {
                res.ReturnAmount = 0 + list.Sum(l => l.ReturnAmount);
                res.SaleAmount = 0 + list.Sum(l => l.SaleAmount);
                res.SaleCount = 0 + list.Sum(l => l.SaleCount);
                res.ReturnCount = 0 + list.Sum(l => l.ReturnCount);
                res.NetAmount = 0 + res.SaleAmount - res.ReturnAmount;
                res.VisaSaleAmount = 0 + list.Sum(l => l.VisaCardSaleAmount);
                res.MasterSaleAmount = 0 + list.Sum(l => l.MasterCardSaleAmount);
                res.DebitSaleAmount = 0 + list.Sum(l => l.DebitCardSaleAmount);
                res.VisaReturnAmount = 0 + list.Sum(l => l.VisaCardReturnAmount);
                res.MasterReturnAmount = 0 + list.Sum(l => l.MasterCardReturnAmount);
                res.DebitReturnAmount = 0 + list.Sum(l => l.DebitCardReturnAmount);
                res.VisaSaleCount = 0 + list.Sum(l => l.VisaCardSaleCount);
                res.MasterSaleCount = 0 + list.Sum(l => l.MasterCardSaleCount);
                res.DebitSaleCount = 0 + list.Sum(l => l.DebitCardSaleCount);
                res.VisaReturnCount = 0 + list.Sum(l => l.VisaCardReturnCount);
                res.MasterReturnCount = 0 + list.Sum(l => l.MasterCardReturnCount);
                res.DebitReturnCount = 0 + list.Sum(l => l.DebitCardReturnCount);
            }
            return res;
        }
    }
}