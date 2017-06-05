using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebServices.Controllers
{
    public class AgentReportController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();
        [HttpGet]
        [Route("api/agent_report/getDaily/{agtID}/{dt:datetime}")]
        public HttpResponseMessage getDailyReport(string agtID, DateTime dt)
        {
            var dl = bus.GetDailyReport_By_AgtID_Date(agtID, dt);
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }
        [HttpGet]
        [Route("api/agent_report/getMonthly/{agtID}/{dt:datetime}")]
        public HttpResponseMessage getMonthlyReport(string merID, DateTime dt)
        {
            var dl = bus.GetMonthlyReport_By_AgtID_Date(merID, dt);
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }
        [HttpGet]
        [Route("api/agent_report/getYearly/{agtID}/{dt:datetime}")]
        public HttpResponseMessage getYearlyReport(string merID, DateTime dt)
        {
            var dl = bus.GetYearlyReport_By_AgtID_Date(merID, dt);
            return Request.CreateResponse(HttpStatusCode.OK, dl);
        }
    }
}
