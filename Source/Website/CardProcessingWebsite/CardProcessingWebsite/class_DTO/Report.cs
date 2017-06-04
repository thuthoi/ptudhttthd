using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardProcessingWebsite.class_DTO
{
    public class Report
    {
        public int ReportID { get; set; }
        public string MerchantID { get; set; }
        public string MerchantTypeID { get; set; }
        public string MerchantRegionID { get; set; }
        public decimal SaleAmount { get; set; }
        public decimal ReturnAmount { get; set; }
        public int SaleCount { get; set; }
        public int ReturnCount { get; set; }
        public decimal DebitCardSaleAmount { get; set; }
        public decimal MasterCardSaleAmount { get; set; }
        public decimal VisaCardSaleAmount { get; set; }
        public decimal DebitCardReturnAmount { get; set; }
        public decimal MasterCardReturnAmount { get; set; }
        public decimal VisaCardReturnAmount { get; set; }
        public decimal DebitCardSaleCount { get; set; }
        public decimal MasterCardSaleCount { get; set; }
        public decimal VisaCardSaleCount { get; set; }
        public decimal DebitCardReturnCount { get; set; }
        public decimal MasterCardReturnCount { get; set; }
        public decimal VisaCardReturnCount { get; set; }
        public decimal NetAmount { get; set; }
        public int NetCount { get; set; }
        public System.DateTime Date { get; set; }
        public string AgentID { get; set; }
    }
}