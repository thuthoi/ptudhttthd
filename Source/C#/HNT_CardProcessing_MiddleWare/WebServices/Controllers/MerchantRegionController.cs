using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebServices.Controllers
{
    public class MerchantRegionController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpGet]
        [Route("api/merchantRegion/getAll")]
        public HttpResponseMessage getAllMerchantRegion()
        {
            var list = bus.getAllMerchantRegion().Select(mr => new {
                mr.MerchantRegionID,
                mr.MerchantRegionName
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }
    }
}
