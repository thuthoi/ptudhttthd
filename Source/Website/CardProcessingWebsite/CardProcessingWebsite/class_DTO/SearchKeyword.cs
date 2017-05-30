using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardProcessingWebsite.class_DTO
{
    public class SearchKeyword
    {
        public string Keyword { get; set; }
        public string MerchantType { get; set; }
        public string MerchantRegion { get; set; }
        public string AgentID { get; set; }
    }
}