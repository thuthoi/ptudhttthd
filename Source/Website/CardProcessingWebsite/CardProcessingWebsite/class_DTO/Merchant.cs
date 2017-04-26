using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardProcessingWebsite.class_DTO
{
    public class Merchant
    {
        public string MerchantID { get; set; }
        public string MerchantName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public bool Status { get; set; }
        public string MerchantTypeID { get; set; }
        public string MerchantRegionID { get; set; }
        public string AgentID { get; set; }
    }
}