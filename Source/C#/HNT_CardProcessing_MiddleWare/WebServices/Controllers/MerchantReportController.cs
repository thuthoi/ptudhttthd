using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebServices.Controllers
{
    public class MerchantReportController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();
        [HttpGet]
        [Route("api/merchant_report/getDaily/{merID}/{dt:datetime}")]
        public HttpResponseMessage getDailyReport(string merID, DateTime dt)
        {
            var dl = bus.GetDailyReport_By_MerID_Date(merID,dt);
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }
        [HttpGet]
        [Route("api/merchant_report/getMonthly/{merID}/{month}/{year}")]
        public HttpResponseMessage getMonthlyReport(string merID,string month, string year)
        {
            var dl = bus.GetMonthlyReport_By_MerID(merID, int.Parse(month),int.Parse(year));
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }
        [HttpGet]
        [Route("api/merchant_report/getYearly/{merID}/{year}")]
        public HttpResponseMessage getYearlyReport(string merID,string year)
        {
            var dl = bus.GetYearlyReport_By_MerID_Date(merID,int.Parse(year));
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }
        [HttpGet]
        [Route("api/merchant_report/getQuarter/{merID}/{quarter}/{year}")]
        public HttpResponseMessage getQuarterReport(string merID, string quarter, string year)
        {
            var dl = bus.GetMonthlyQuarterReport_By_MerID_Date(merID, int.Parse(quarter), int.Parse(year));
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }

        [HttpGet]
        [Route("api/merchant_report/getMonthtoDate/{merID}/{dt:datetime}")]
        public HttpResponseMessage getMonthtoDateReport(string merID, DateTime dt)
        {
            var dl = bus.Get_MonthtoDate_Report_By_MerID_Date(merID, dt);
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }

        [HttpGet]
        [Route("api/merchant_report/getYeartoDate/{merID}/{dt:datetime}")]
        public HttpResponseMessage getYeartoDateReport(string merID, DateTime dt)
        {
            var dl = bus.Get_YeartoDate_Report_By_MerID_Date(merID, dt);
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }
    }
}
