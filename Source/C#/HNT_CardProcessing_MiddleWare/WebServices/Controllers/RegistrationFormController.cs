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
    public class RegistrationFormController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpPost]
        [Route("api/registrationForm/add")]
        public HttpResponseMessage addRegistrationForm([FromBody]RegistrationForm reg)
        {
            bus.addRegistrationForm(reg);
            return Request.CreateResponse(HttpStatusCode.Created);
        }

        [HttpGet]
        [Route("api/registrationForm/getNewID")]
        public HttpResponseMessage getNewID()
        {
            return Request.CreateResponse(HttpStatusCode.OK, bus.generateRegID());
        }
    }
}
