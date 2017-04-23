using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusinessLayer;

namespace WebServices.Controllers
{
    public class AccountController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpGet]
        [Route("api/account/hello")]
        public IHttpActionResult Hello()
        {
            return Ok("hello");
        }

        [HttpPost]
        [Route("api/account/changepassword")]
        public IHttpActionResult ChangePassword([FromBody]Account acc)
        {
            string result = bus.ChangePassword(acc);

            return Ok(result);
        }
        [HttpPost]
        [Route("api/account/login")]
        public HttpResponseMessage login([FromBody]Account ac)
        {
            Account _ac = bus.GetAccountBy_Username_Password(ac.Username, ac.Password);
                if (_ac != null)
                {
                    return Request.CreateResponse(
                         HttpStatusCode.OK,
                           _ac
                             );
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }
        }
    }
}
