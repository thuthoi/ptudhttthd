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
            this.Accounts = new HashSet<Account>();
        }
    
        public string AgentID { get; set; }
        public string AgentName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public Nullable<bool> Status { get; set; }
    
        public virtual ICollection<Account> Accounts { get; set; }
    }
}
