using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DomainModel;
using BusinessLayer;

namespace WebServices.Controllers
{
    public class MerchantTypeController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpGet]
        [Route("api/merchantType/getAll")]
        public HttpResponseMessage getAllMerchantType()
        {
            var list = bus.getAllMerchantType().Select(mt => new {
                mt.MerchantTypeID,
                mt.MerchantTypeName
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }
    }
}
