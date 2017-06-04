using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardProcessingWebsite.class_DTO
{
    public class MasterReport
    {
        public decimal SaleAmount { get; set; }
        public decimal ReturnAmount { get; set; }
        public int SaleCount { get; set; }
        public int ReturnCount { get; set; }
        public decimal NetAmount { get; set; }
        public decimal VisaSaleAmount { get; set; }
        public decimal MasterSaleAmount { get; set; }
        public decimal DebitSaleAmount { get; set; }
        public decimal VisaReturnAmount { get; set; }
        public decimal MasterReturnAmount { get; set; }
        public decimal DebitReturnAmount { get; set; }
        public decimal VisaSaleCount { get; set; }
        public decimal MasterSaleCount { get; set; }
        public decimal DebitSaleCount { get; set; }
        public decimal VisaReturnCount { get; set; }
        public decimal MasterReturnCount { get; set; }
        public decimal DebitReturnCount { get; set; }
    }
}