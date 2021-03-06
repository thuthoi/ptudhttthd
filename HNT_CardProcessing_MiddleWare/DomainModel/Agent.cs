//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DomainModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Agent
    {
        public Agent()
        {
            this.Account = new HashSet<Account>();
            this.Merchants = new HashSet<Merchant>();
            this.NotificationsSend = new HashSet<Notification>();
            this.NotificationsReceive = new HashSet<Notification>();
        }
    
        public string AgentID { get; set; }
        public string AgentName { get; set; }
        public string Owner { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public bool Status { get; set; }
    
        public virtual ICollection<Account> Account { get; set; }
        public virtual ICollection<Merchant> Merchants { get; set; }
        public virtual ICollection<Notification> NotificationsSend { get; set; }
        public virtual ICollection<Notification> NotificationsReceive { get; set; }
    }
}
