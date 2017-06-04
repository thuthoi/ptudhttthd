using BusinessLayer;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebServices.Controllers
{
    public class MasterReportController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpGet]
        [Route("api/MasterReport/getDailyReport/{day}/{month}/{year}")]
        public HttpResponseMessage getDailyReport(string day, string month, string year)
        {
            var list = bus.getDailyReportInMaster(int.Parse(day), int.Parse(month), int.Parse(year)).Select(d => new
            {
                d.ReportID,
                d.MerchantID,
                d.MerchantTypeID,
                d.MerchantRegionID,
                d.SaleAmount,
                d.ReturnAmount,
                d.SaleCount,
                d.ReturnCount,
                d.DebitCardSaleAmount,
                d.MasterCardSaleAmount,
                d.VisaCardSaleAmount,
                d.DebitCardReturnAmount,
                d.MasterCardReturnAmount,
                d.VisaCardReturnAmount,
                d.DebitCardSaleCount,
                d.MasterCardSaleCount,
                d.VisaCardSaleCount,
                d.DebitCardReturnCount,
                d.MasterCardReturnCount,
                d.VisaCardReturnCount,
                d.NetAmount,
                d.NetCount,
                d.Date,
                d.AgentID
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpGet]
        [Route("api/MasterReport/getMonthlyReport/{month}/{year}")]
        public HttpResponseMessage getMonthlyReport(string month, string year)
        {
            var list = bus.getMonthlyReportInMaster(int.Parse(month), int.Parse(year)).Select(d => new
            {
                d.ReportID,
                d.MerchantID,
                d.MerchantTypeID,
                d.MerchantRegionID,
                d.SaleAmount,
                d.ReturnAmount,
                d.SaleCount,
                d.ReturnCount,
                d.DebitCardSaleAmount,
                d.MasterCardSaleAmount,
                d.VisaCardSaleAmount,
                d.DebitCardReturnAmount,
                d.MasterCardReturnAmount,
                d.VisaCardReturnAmount,
                d.DebitCardSaleCount,
                d.MasterCardSaleCount,
                d.VisaCardSaleCount,
                d.DebitCardReturnCount,
                d.MasterCardReturnCount,
                d.VisaCardReturnCount,
                d.NetAmount,
                d.NetCount,
                d.Date,
                d.AgentID
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpGet]
        [Route("api/MasterReport/getQuarterlyReport/{quarter}/{year}")]
        public HttpResponseMessage getQuarterlyReport(string quarter, string year)
        {
            var list = bus.getQuarterlyReportInMaster(int.Parse(quarter), int.Parse(year)).Select(d => new
            {
                d.ReportID,
                d.MerchantID,
                d.MerchantTypeID,
                d.MerchantRegionID,
                d.SaleAmount,
                d.ReturnAmount,
                d.SaleCount,
                d.ReturnCount,
                d.DebitCardSaleAmount,
                d.MasterCardSaleAmount,
                d.VisaCardSaleAmount,
                d.DebitCardReturnAmount,
                d.MasterCardReturnAmount,
                d.VisaCardReturnAmount,
                d.DebitCardSaleCount,
                d.MasterCardSaleCount,
                d.VisaCardSaleCount,
                d.DebitCardReturnCount,
                d.MasterCardReturnCount,
                d.VisaCardReturnCount,
                d.NetAmount,
                d.NetCount,
                d.Date,
                d.AgentID
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpGet]
        [Route("api/MasterReport/getYearlyReport/{year}")]
        public HttpResponseMessage getYearlyReport(string year)
        {
            var list = bus.getYearlyReportInMaster(int.Parse(year)).Select(d => new
            {
                d.ReportID,
                d.MerchantID,
                d.MerchantTypeID,
                d.MerchantRegionID,
                d.SaleAmount,
                d.ReturnAmount,
                d.SaleCount,
                d.ReturnCount,
                d.DebitCardSaleAmount,
                d.MasterCardSaleAmount,
                d.VisaCardSaleAmount,
                d.DebitCardReturnAmount,
                d.MasterCardReturnAmount,
                d.VisaCardReturnAmount,
                d.DebitCardSaleCount,
                d.MasterCardSaleCount,
                d.VisaCardSaleCount,
                d.DebitCardReturnCount,
                d.MasterCardReturnCount,
                d.VisaCardReturnCount,
                d.NetAmount,
                d.NetCount,
                d.Date,
                d.AgentID
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpGet]
        [Route("api/MasterReport/getMonthToDateReport/{day}")]
        public HttpResponseMessage getMonthToDateReport(string day)
        {
            var list = bus.getMonthToDateReportInMaster(int.Parse(day)).Select(d => new
            {
                d.ReportID,
                d.MerchantID,
                d.MerchantTypeID,
                d.MerchantRegionID,
                d.SaleAmount,
                d.ReturnAmount,
                d.SaleCount,
                d.ReturnCount,
                d.DebitCardSaleAmount,
                d.MasterCardSaleAmount,
                d.VisaCardSaleAmount,
                d.DebitCardReturnAmount,
                d.MasterCardReturnAmount,
                d.VisaCardReturnAmount,
                d.DebitCardSaleCount,
                d.MasterCardSaleCount,
                d.VisaCardSaleCount,
                d.DebitCardReturnCount,
                d.MasterCardReturnCount,
                d.VisaCardReturnCount,
                d.NetAmount,
                d.NetCount,
                d.Date,
                d.AgentID
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpGet]
        [Route("api/MasterReport/getYearToDateReport/{day}/{month}")]
        public HttpResponseMessage getYearToDateReport(string day, string month)
        {
            var list = bus.getYearToDateReportInMaster(int.Parse(day),int.Parse(month)).Select(d => new
            {
                d.ReportID,
                d.MerchantID,
                d.MerchantTypeID,
                d.MerchantRegionID,
                d.SaleAmount,
                d.ReturnAmount,
                d.SaleCount,
                d.ReturnCount,
                d.DebitCardSaleAmount,
                d.MasterCardSaleAmount,
                d.VisaCardSaleAmount,
                d.DebitCardReturnAmount,
                d.MasterCardReturnAmount,
                d.VisaCardReturnAmount,
                d.DebitCardSaleCount,
                d.MasterCardSaleCount,
                d.VisaCardSaleCount,
                d.DebitCardReturnCount,
                d.MasterCardReturnCount,
                d.VisaCardReturnCount,
                d.NetAmount,
                d.NetCount,
                d.Date,
                d.AgentID
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }
    }
}
