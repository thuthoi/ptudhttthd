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
    
    public partial class MerchantRegion
    {
        public MerchantRegion()
        {
            this.Merchants = new HashSet<Merchant>();
            this.TransactionDetails = new HashSet<TransactionDetail>();
        }
    
        public string MerchantRegionID { get; set; }
        public string MerchantRegionName { get; set; }
    
        public virtual ICollection<Merchant> Merchants { get; set; }
        public virtual ICollection<TransactionDetail> TransactionDetails { get; set; }
    }
}
