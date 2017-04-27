using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardProcessingWebsite.class_DTO
{
    public class Agent
    {
        public string AgentID { get; set; }
        public string AgentName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public bool Status { get; set; }
        public string MasterID { get; set; }
    }
}