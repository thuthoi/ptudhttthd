using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DomainModel;

namespace WebServices.Controllers
{
    public class AgentController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpGet]
        [Route("api/agent/getAll")]
        public HttpResponseMessage getAllAgent()
        {
            var list = bus.GetAllAgent().Select(a => new
            {
                a.AgentID,
                a.AgentName,
                a.Address,
                a.Phone,
                a.Email,
                a.Status,
                a.MasterID
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpPost]
        [Route("api/agent/add")]
        public HttpResponseMessage addAgent([FromBody]Agent agent)
        {
            bus.AddAgent(agent);
            return Request.CreateResponse(HttpStatusCode.Created);
        }

        [HttpGet]
        [Route("api/agent/getNewID")]
        public HttpResponseMessage getNewID()
        {
            return Request.CreateResponse(HttpStatusCode.OK, bus.generateAgentID());
        }
    }
}
