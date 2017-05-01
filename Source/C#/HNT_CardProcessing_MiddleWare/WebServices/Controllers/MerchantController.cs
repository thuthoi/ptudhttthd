using BusinessLayer;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebServices.Controllers
{
    public class MerchantController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpPost]
        [Route("api/merchant/add")]
        public HttpResponseMessage addMerchant([FromBody]Merchant merchant)
        {
            bus.addMerchant(merchant);
            return Request.CreateResponse(HttpStatusCode.Created);
        }

        [HttpGet]
        [Route("api/merchant/getNewID")]
        public HttpResponseMessage getNewID()
        {
            return Request.CreateResponse(HttpStatusCode.OK, bus.generateMerchantID());
        }

        [HttpPut]
        [Route("api/merchant/update")]
        public HttpResponseMessage updateMerchant([FromBody] Merchant merchant)
        {
            string result = bus.updateMerchant(merchant);
            return Request.CreateResponse(HttpStatusCode.OK, result);
        }

        [HttpGet]
        [Route("api/merchant/getAll")]
        public HttpResponseMessage getAllMerchant()
        {
            var list = bus.getAllMerchant().Select(c => new {
                c.MerchantID,
                c.MerchantName,
                c.Address,
                c.Phone,
                c.Email,
                c.Status,
                c.MerchantTypeID,
                c.MerchantRegionID,
                c.AgentID
            }) ;
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpGet]
        [Route("api/merchant/getProfileMerchant/{merID}")]
        public HttpResponseMessage getProfileMerchant(string merID)
        {
            var list = bus.getMerchantByMerchantIDtoList(merID).Select(c => new
            {
                c.MerchantID,
                c.MerchantName,
                c.Address,
                c.Phone,
                c.Email,
                c.Status,
                c.MerchantTypeID,
                c.MerchantRegionID,
                c.AgentID
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }


        [HttpGet]
        [Route("api/merchant/getAll_NotHave_Account")]
        public HttpResponseMessage getMerchant_NotHave_Account()
        {
            var list = bus.getMerchant_NotHave_Account().Select(c => new
            {
                c.MerchantID,
                c.MerchantName,
                c.Address,
                c.Phone,
                c.Email,
                c.Status,
                c.MerchantTypeID,
                c.MerchantRegionID,
                c.AgentID
            }) ;
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }
    }
}
