using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebServices.Controllers
{
    public class NotificationController : ApiController
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        [HttpGet]
        [Route("api/merchant/getAllNotificationByReceiveID/{receiveID}")]
        public HttpResponseMessage getAllNotificationByReceiveID(string receiveID)
        {
            var list = bus.getAllNotificationByReceiveID(receiveID).Select(n => new {
                n.NotiID,
                n.Detail,
                n.Summary,
                n.Date,
                n.SenderID,
                n.ReceiverID,
                n.Status
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }

        [HttpGet]
        [Route("api/merchant/getLastThreeNotificationByReceiveID/{receiveID}")]
        public HttpResponseMessage getLastThreeNotificationByReceiveID(string receiveID)
        {
            var list = bus.getLastThreeNotificationByReceiveID(receiveID).Select(n => new {
                n.NotiID,
                n.Detail,
                n.Summary,
                n.Date,
                n.SenderID,
                n.ReceiverID,
                n.Status
            });
            return Request.CreateResponse(HttpStatusCode.OK, list);
        }
    }
}
