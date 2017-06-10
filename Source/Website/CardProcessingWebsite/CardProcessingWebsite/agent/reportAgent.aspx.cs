using CardProcessingWebsite.class_DTO;
using CardProcessingWebsite.helpers;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.IO;
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
        public string merchantID = "";
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
                    LoadYearDDL();
                    LoadQuarterDDL();

                    if (!string.IsNullOrEmpty(Request.QueryString["MerchantID"]))
                    {
                        merchantID = Request.QueryString["MerchantID"].ToString();
                        rbMerchant.Checked = true;
                        rbOther.Checked = false;
                        ddlMerchant.SelectedValue = merchantID;
                    }
                    GetCurrentAgent();
                    GoReport();

                }

            }

        }

        private void GetCurrentAgent()
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
                    lbName.Text = list[0].AgentName;
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
                string url = localhost.hostname() + "/api/AgentReport/" + api_url;
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

        protected void btnChangeFilter_Click(object sender, EventArgs e)
        {
            GoReport();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            MasterReport res = FillSource(CheckReportView(CheckReportType()));
            Session["reportAgent"] = "";
            string str = string.Empty;
            str += @"<div><table style='width: 100%; font-size: 10pt; padding-left: 5px'>
            <tr><td colspan='2' style='text-align: center;'><span style='font-size: 18pt; font-weight: bold'>MASTER REPORT</span><br />
             </td></tr><tr><td colspan='2'><table style='width: 50%; margin:auto' cellpadding='0' cellspacing='0'><tr><td style='font-size:14pt;'>";
            str += @"" + exportType() + @"<br />" + exportView() + @"<br />" + exportRegion() + @"<br />" + exportMerchantType() + @"</td>
                            <td style='width:20%;'></td></tr></table></td></tr><tr><td colspan='2'>&nbsp;</td></tr>";
            str += @"<tr><td colspan='2'><table style='width: 80%; margin:auto' cellpadding='0' cellspacing='0'><tr style='font-weight: bold; text-align: center'>
                        <td style='width: 20%; padding: 2px; border: 0.1em solid #000; border-right: none'>Sale Amount</td>
                        <td style='width: 20%; padding: 2px; border: 0.1em solid #000; border-right: none'>Return Amount</td>
                        <td style='width: 20%; padding: 2px; border: 0.1em solid #000; border-right: none'>Sale Count</td>
                        <td style='width: 20%; padding: 2px; border: 0.1em solid #000; border-right: none'>Return Count</td>
                        <td style='width: 20%; padding: 2px; border: 0.1em solid #000;'>Net Amount</td></tr>";

            str += @"<tr><td style='text-align: center; padding: 2px; border: 0.1em solid #000; border-right: none; border-top: none'>
                     " + res.SaleAmount.ToString("#,##0") + @"</td><td style='padding: 2px; text-align: center; border: 0.1em solid #000; border-right: none; border-top: none'>
                     " + res.ReturnAmount.ToString("#,##0") + @"</td><td style='padding: 2px; text-align: center; border: 0.1em solid #000; border-right: none; border-top: none'>
                     " + res.SaleCount.ToString("#,##0") + @"</td><td style='padding: 2px; text-align: center; border: 0.1em solid #000; border-right: none; border-top: none'>
                     " + res.ReturnCount.ToString("#,##0") + @"</td><td style='padding: 2px; text-align: center; border: 0.1em solid #000; border-top: none'>
                     " + res.NetAmount.ToString("#,##0") + @"</td></tr></table></td></tr><tr><td colspan='2'>&nbsp;</td></tr>";

            str += @"<tr><td colspan= '2' style = 'text-align:center'><table style = 'width: 96%; margin:auto' cellpadding = '0' cellspacing = '0'>
                    <tr style = 'font-weight: bold; text-align: center'><td colspan = '3' style = 'padding: 2px; border: 0.1em solid #000; border-right: none'>
                    Card Sale Amount</td><td colspan = '3' style = 'padding: 2px; border: 0.1em solid #000; border-right: none'>
                    Card Sale Count</td><td colspan = '3' style = 'padding: 2px; border: 0.1em solid #000; border-right: none'>
                    Card Return Amount</td><td colspan = '3' style = 'padding: 2px; border: 0.1em solid #000;'>
                    Card Return Count</td></tr><tr style = 'font-weight: bold; text-align: center'><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Visa</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Master</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Debit</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Visa</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Master</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Debit</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Visa</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Master</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Debit</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Visa</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    Master</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-top: none'>
                    Debit</td></tr><tr style = 'text-align: center'><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.VisaSaleAmount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.MasterSaleAmount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.DebitSaleAmount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.VisaSaleCount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.MasterSaleCount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.DebitSaleCount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.VisaReturnAmount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.MasterReturnAmount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 10%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.DebitReturnAmount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.VisaReturnCount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-right: none; border-top: none'>
                    " + res.MasterReturnCount.ToString("#,##0") + @"</td><td style = 'padding: 2px; text-align: center; width: 6%; border: 0.1em solid #000; border-top: none'>
                    " + res.DebitReturnCount.ToString("#,##0") + @"</td></tr></table></td></tr></table></div>";
            Session["reportAgent"] = str;
            string script = "window.onload = function() { getSesionPrint(); };";
            ClientScript.RegisterStartupScript(GetType(), "chart", script, true);
        }

        [System.Web.Services.WebMethod()]
        public static string fn_Print()
        {
            return HttpContext.Current.Session["reportAgent"].ToString();
        }
        private string exportType()
        {
            string res = "- Report Type: ";
            if (rbDaily.Checked)
            {
                res += "Daily (" + txtDate.Text.Trim() + ")";
            }
            if (rbMonthly.Checked)
            {
                res += "Monthly (" + txtMonth.Text.Trim() + ")";
            }
            if (rbQuarterly.Checked)
            {
                res += "Quarterly (" + ddlQuarter.SelectedValue.ToString() + "/" + ddlYear.SelectedValue.ToString() + ")";
            }
            if (rbYearly.Checked)
            {
                res += "Yearly (" + txtYear.Text.Trim() + ")";
            }
            if (rbMtDate.Checked)
            {
                res += "Month to Date (" + txtDate.Text.Trim() + ")";
            }
            if (rbYtDate.Checked)
            {
                res += "Year to Date (" + txtDate.Text.Trim() + ")";
            }
            return res;
        }

        private string exportView()
        {
            string res = "- View by ";
            if (rbMerchant.Checked)
            {
                res += "Merchant: " + ddlMerchant.SelectedItem.Text.ToString();
            }
          
            return res;
        }

        private string exportRegion()
        {
            string res = "- Region: ";
            if (rbMerchant.Checked)
            {
                res += "None";
            }
            else
            {
                res += ddlRegion.SelectedItem.Text.ToString();
            }
            return res;
        }

        private string exportMerchantType()
        {
            string res = "- Merchant Type: ";
            if (rbMerchant.Checked)
            {
                res += "None";
            }
            else
            {
                res += ddlType.SelectedItem.Text.ToString();
            }
            return res;
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            MasterReport res = FillSource(CheckReportView(CheckReportType()));
            using (ExcelPackage pck = new ExcelPackage())
            {
                string filenameSave = "RpAgentReport_" + DateTime.Now.ToString("_HH-mm_dd-MM-yyyy") + ".xlsx";
                var wsList = pck.Workbook.Worksheets.Add("Sheet1");

                wsList.Cells["A1"].LoadFromText("AGENT REPORT");

                wsList.Cells[1, 1, 1, 13].Merge = true;
                wsList.Cells[1, 1, 1, 13].Style.Font.Bold = true;
                wsList.Cells[1, 1, 1, 13].Style.Font.Size = 18;
                wsList.Cells[1, 1, 1, 13].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                wsList.Cells[2, 5, 2, 9].Merge = true;
                wsList.Cells[2, 1, 2, 9].Style.Font.Size = 14;

                wsList.Cells[3, 5, 3, 9].Merge = true;
                wsList.Cells[3, 1, 3, 9].Style.Font.Size = 14;

                wsList.Cells[4, 5, 4, 9].Merge = true;
                wsList.Cells[4, 1, 4, 9].Style.Font.Size = 14;

                wsList.Cells[5, 5, 5, 9].Merge = true;
                wsList.Cells[5, 1, 5, 9].Style.Font.Size = 14;

                wsList.Cells[11, 2, 11, 4].Merge = true;
                wsList.Cells[11, 5, 11, 7].Merge = true;
                wsList.Cells[11, 8, 11, 10].Merge = true;
                wsList.Cells[11, 11, 11, 13].Merge = true;

                wsList.Cells["E2"].LoadFromText(exportType());
                wsList.Cells["E3"].LoadFromText(exportView());
                wsList.Cells["E4"].LoadFromText(exportRegion());
                wsList.Cells["E5"].LoadFromText(exportMerchantType());

                wsList.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                wsList.Column(1).Width = 20;
                wsList.Column(2).Width = 20;
                wsList.Column(3).Width = 20;
                wsList.Column(4).Width = 20;
                wsList.Column(5).Width = 20;
                wsList.Column(6).Width = 20;
                wsList.Column(7).Width = 20;
                wsList.Column(8).Width = 20;
                wsList.Column(9).Width = 20;
                wsList.Column(10).Width = 20;
                wsList.Column(11).Width = 20;
                wsList.Column(12).Width = 20;
                wsList.Column(13).Width = 20;

                var cellTitle1 = wsList.Cells["E7:I7"];
                var cellAll1 = wsList.Cells["E7:I8"];
                cellTitle1.Style.Font.Color.SetColor(System.Drawing.Color.FromArgb(255, 255, 255));
                cellTitle1.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                cellTitle1.Style.Fill.PatternType = ExcelFillStyle.Solid;
                cellTitle1.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(51, 122, 183));
                var border1 = cellAll1.Style.Border;
                border1.Bottom.Style = ExcelBorderStyle.Thin;
                border1.Top.Style = ExcelBorderStyle.Thin;
                border1.Left.Style = ExcelBorderStyle.Thin;
                border1.Right.Style = ExcelBorderStyle.Thin;

                wsList.Cells["E7"].LoadFromText("Sale Amount");
                wsList.Cells["F7"].LoadFromText("Return Amount");
                wsList.Cells["G7"].LoadFromText("Sale Count");
                wsList.Cells["H7"].LoadFromText("Return Count");
                wsList.Cells["I7"].LoadFromText("Net Amount");
                wsList.Cells["I8"].Style.Font.Bold = true;

                wsList.Cells["E8"].LoadFromText(res.SaleAmount.ToString());
                wsList.Cells["E8"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["F8"].LoadFromText(res.ReturnAmount.ToString());
                wsList.Cells["F8"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["G8"].LoadFromText(res.SaleCount.ToString());
                wsList.Cells["G8"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["H8"].LoadFromText(res.ReturnCount.ToString());
                wsList.Cells["H8"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["I8"].LoadFromText(res.NetAmount.ToString());
                wsList.Cells["I8"].Style.Numberformat.Format = "#,##0";

                var cellTitle2 = wsList.Cells["B11:M11"];
                var cellAll2 = wsList.Cells["B11:M13"];
                var cellTitle3 = wsList.Cells["B12:M12"];
                cellTitle2.Style.Fill.PatternType = ExcelFillStyle.Solid;
                cellTitle2.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(51, 122, 183));
                cellTitle2.Style.Font.Color.SetColor(System.Drawing.Color.FromArgb(255, 255, 255));
                cellTitle2.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                cellTitle3.Style.Fill.PatternType = ExcelFillStyle.Solid;
                cellTitle3.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(244, 243, 248));
                cellTitle3.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                var border2 = cellAll2.Style.Border;
                border2.Bottom.Style = ExcelBorderStyle.Thin;
                border2.Top.Style = ExcelBorderStyle.Thin;
                border2.Left.Style = ExcelBorderStyle.Thin;
                border2.Right.Style = ExcelBorderStyle.Thin;

                wsList.Cells["B11"].LoadFromText("Card Sale Amount");
                wsList.Cells["E11"].LoadFromText("Card Sale Count");
                wsList.Cells["H11"].LoadFromText("Card Return Amount");
                wsList.Cells["K11"].LoadFromText("Card Return Count");

                wsList.Cells["B12"].LoadFromText("Visa");
                wsList.Cells["C12"].LoadFromText("Master");
                wsList.Cells["D12"].LoadFromText("Debit");
                wsList.Cells["E12"].LoadFromText("Visa");
                wsList.Cells["F12"].LoadFromText("Master");
                wsList.Cells["G12"].LoadFromText("Debit");
                wsList.Cells["H12"].LoadFromText("Visa");
                wsList.Cells["I12"].LoadFromText("Master");
                wsList.Cells["J12"].LoadFromText("Debit");
                wsList.Cells["K12"].LoadFromText("Visa");
                wsList.Cells["L12"].LoadFromText("Master");
                wsList.Cells["M12"].LoadFromText("Debit");

                wsList.Cells["B13"].LoadFromText(res.VisaSaleAmount.ToString());
                wsList.Cells["C13"].LoadFromText(res.MasterSaleAmount.ToString());
                wsList.Cells["D13"].LoadFromText(res.DebitSaleAmount.ToString());
                wsList.Cells["E13"].LoadFromText(res.VisaSaleCount.ToString());
                wsList.Cells["F13"].LoadFromText(res.MasterSaleCount.ToString());
                wsList.Cells["G13"].LoadFromText(res.DebitSaleCount.ToString());
                wsList.Cells["H13"].LoadFromText(res.VisaReturnAmount.ToString());
                wsList.Cells["I13"].LoadFromText(res.MasterReturnAmount.ToString());
                wsList.Cells["J13"].LoadFromText(res.DebitReturnAmount.ToString());
                wsList.Cells["K13"].LoadFromText(res.VisaReturnCount.ToString());
                wsList.Cells["L13"].LoadFromText(res.MasterReturnCount.ToString());
                wsList.Cells["M13"].LoadFromText(res.DebitReturnCount.ToString());
                wsList.Cells["B13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["C13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["D13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["E13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["F13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["G13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["H13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["I13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["J13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["K13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["L13"].Style.Numberformat.Format = "#,##0";
                wsList.Cells["M13"].Style.Numberformat.Format = "#,##0";

                string path = Server.MapPath("/ExportFiles/" + filenameSave);
                Stream stream = File.Create(path);
                pck.SaveAs(stream);
                stream.Close();
                Response.Redirect("/ExportFiles/" + filenameSave);
                File.Delete(path);
            }
        }
    }
}