using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardProcessingWebsite.class_DTO
{
    public class Master
    {
        public string MasterID { get; set; }
        public string MasterName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public bool Status { get; set; }
    }
}