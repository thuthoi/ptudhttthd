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
    
    public partial class TransactionDetail
    {
        public int TransactionID { get; set; }
        public string Customer { get; set; }
        public string ProductName { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<int> ProductNumber { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public string TransactionType { get; set; }
        public string CreditCardID { get; set; }
        public string CreditCardType { get; set; }
        public string MerchantID { get; set; }
        public string MerchantRegionID { get; set; }
        public string MerchantTypeID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<bool> Complete { get; set; }
    }
}
