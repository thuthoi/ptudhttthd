using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusinessLayer;
using WebServices.Helpers;
using System.Web.Http.Cors;

namespace WebServices.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
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
            var list = bus.GetAccountBy_Username_Password(ac.Username, ac.Password).Select(c => new
            {
                c.UserID,
                c.Username,
                c.Password,
                c.OldPassword,
                c.Role
            });
            //var _ac = bus.GetAccountBy_Username_Password(ac.Username, ac.Password);
            if (list != null)
                {
                    return Request.CreateResponse(
                         HttpStatusCode.OK,
                           list
                             );
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }
        }
        [HttpGet]
        [Route("api/account/getAll")]
        public HttpResponseMessage getAllAccount()
        {
            var list = bus.getAllAccount().Select(c => new
            {
                c.UserID,
                c.Username,
                c.Password,
                c.OldPassword,
                c.Role
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }
        [HttpGet]
        [Route("api/account/Check_Account_UserName_Exist/{username}")]
        public HttpResponseMessage Check_Account_UserName_Exist(string username)
        {
            bool ck = bus.Check_Account_UserName_Exist(username);
            if(ck == true)
            {
                return Request.CreateResponse(HttpStatusCode.OK,"OK");
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }
        }
        [HttpPost]
        [Route("api/account/add")]
        public HttpResponseMessage addAccount([FromBody]Account account)
        {
            bus.AddAccount(account);
            return Request.CreateResponse(HttpStatusCode.Created);
        }
        
    }
}
