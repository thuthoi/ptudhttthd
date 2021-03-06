﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccessLayer
{
    using DomainModel;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CardProcessingEntities : DbContext
    {
        public CardProcessingEntities()
            : base("name=CardProcessingEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Agent> Agents { get; set; }
        public virtual DbSet<DailyReport> DailyReports { get; set; }
        public virtual DbSet<Master> Masters { get; set; }
        public virtual DbSet<Merchant> Merchants { get; set; }
        public virtual DbSet<MerchantRegion> MerchantRegions { get; set; }
        public virtual DbSet<MerchantType> MerchantTypes { get; set; }
        public virtual DbSet<MonthlyReport> MonthlyReports { get; set; }
        public virtual DbSet<Notification> Notifications { get; set; }
        public virtual DbSet<Parameter> Parameters { get; set; }
        public virtual DbSet<TransactionDetail> TransactionDetails { get; set; }
        public virtual DbSet<TransactionDetail_Temp> TransactionDetail_Temp { get; set; }
        public virtual DbSet<YearlyReport> YearlyReports { get; set; }
    }
}
