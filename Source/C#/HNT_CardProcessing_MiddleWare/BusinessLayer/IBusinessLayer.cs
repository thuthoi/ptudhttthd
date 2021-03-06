﻿using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public interface IBusinessLayer
    {
        //Khai báo hàm cần định nghĩa ở đây

        //Agent
        void AddAgent(Agent agent);
        string UpdateAgent(Agent agent);
        void RemoveAgent(Agent agent);
        IList<Agent> GetAllAgent();
        string generateAgentID();
        Agent getAgentByAgentID(string id);
        IList<Agent> getAgentByAgentIDtoList(string id);
        IList<Agent> getAgent_NotHave_Account();

        IList<Agent> searchAgent(SearchKeyword keyword);



        //Account
        void AddAccount(Account account);
        void UpdateAccount(Account account);
        void RemoveAccount(Account account);
        string ChangePassword(Account account);
        IList<Account> GetAccountBy_Username_Password(String username, String passs);
        IList<Account> getAllAccount();

        //Merchant
        void addMerchant(Merchant _merchant);
        Merchant getMerchantByMerchantID(string id);
        IList<Merchant> getAllMerchant();
        IList<Merchant> getMerchantByMerchantIDtoList(string id);
        string generateMerchantID();
        string updateMerchant(Merchant merchant);
        IList<Merchant> getMerchant_NotHave_Account();
        IList<Merchant> getMerchantByAgent(string _agentID);
        IList<Merchant> getMerchantNotHaveAgent();
        void updateAgentforMerchant(Merchant merchant);
        void removeMerchant(Merchant merchant);

        IList<Merchant> searchMerchant(SearchKeyword keyword);

        //MerchantType 
        IList<MerchantType> getAllMerchantType();

        //MerchantRegion
        IList<MerchantRegion> getAllMerchantRegion();

        // Master
        IList<Master> getAllMaster();
        IList<Master> getMaster_NotHave_Account();
        IList<Master> getMasterByMasterID(string id);

        //Notification
        IList<Notification> getAllNotificationByReceiveID(string _receiveID);
        IList<Notification> getLastThreeNotificationByReceiveID(string _receiveID);

        //Daily Report
        IList<DailyReport> getDailyReportInMaster(int day, int month, int year);

        //Monthly Report
        IList<MonthlyReport> getMonthlyReportInMaster(int month, int year);

        //Quater Report
        IList<MonthlyReport> getQuarterlyReportInMaster(int quater, int year);

        //Yearly Report
        IList<YearlyReport> getYearlyReportInMaster(int year);

        //Month To Date Report
        IList<DailyReport> getMonthToDateReportInMaster(int day);

        //Year To Date Report
        IList<DailyReport> getYearToDateReportInMaster(int day, int month);
    }
}

