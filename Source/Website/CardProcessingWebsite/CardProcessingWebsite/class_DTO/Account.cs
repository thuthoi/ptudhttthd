using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardProcessingWebsite.class_DTO
{
    public class Account
    {
        public string UserID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string OldPassword { get; set; }
        public string Role { get; set; }
    }
}