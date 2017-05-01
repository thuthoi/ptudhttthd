using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusinessLayer;

namespace WebServices.Controllers
{
    public class MasterController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpGet]
        [Route("api/master/getAll")]
        public HttpResponseMessage getAllMaster()
        {
            var list = bus.getAllMaster().Select(m => new {
                m.MasterID,
                m.MasterName
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpGet]
        [Route("api/master/getMaster_NotHave_Account")]
        public HttpResponseMessage getMaster_NotHave_Account()
        {
            var list = bus.getMaster_NotHave_Account().Select(m => new
            {
                m.MasterID,
                m.MasterName
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }
    }
}
