﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLayer;
using DomainModel;
using System.Collections.Generic;
using BusinessLayer.Helpers;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest
    {
        BusinessLayerClass bus = new BusinessLayerClass();

        //account
        [TestMethod]
        public void Test_ChangePassword_WrongOldPassword()
        {
            Account acc = new Account()
            {
                Username = "agent01",
                OldPassword = "123456",
                Password = "123456789"
            };

            string result = bus.ChangePassword(acc);

            Assert.AreEqual("Mật khẩu cũ không trùng khớp!", result);
        }
        [TestMethod]
        public void Test_ChangePassword_CorrectData()
        {
            Account acc = new Account()
            {
                Username = "agent01",
                OldPassword = "12345",
                Password = "123456789"
            };

            string result = bus.ChangePassword(acc);

            Assert.AreEqual("Đổi mật khẩu thành công!", result);
        }
        [TestMethod]
        public void Test_Login_NotNull()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            IList<Account> ac = bus.GetAccountBy_Username_Password("agent01", "123456789");
            Assert.IsNotNull(ac[0]);
        }
        [TestMethod]
        public void Test_Login_CorrectData()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            IList<Account> ac = bus.GetAccountBy_Username_Password("merchant01", "12345");
            Assert.AreEqual("merchant01", ac[0].Username);
        }
        [TestMethod]
        public void Test_GetAll_Account()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            IList<Account> ac = bus.getAllAccount();
            Assert.AreNotEqual(0, ac.Count);
        }

        [TestMethod]
        public void Test_GetAccountBy_Username()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            IList<Account> ac = bus.GetAccountBy_Username("merchant01");
            Assert.AreEqual("merchant01", ac[0].Username);
        }

        [TestMethod]
        public void Test_Check_Account_UserName_Exist()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            bool ac = bus.Is_Account_UserName_Exist("merchant01");
            Assert.AreEqual(false, ac);
        }

        [TestMethod]
        public void Test_addAccount()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            Account ac = new Account();
            ac.Username = "b";
            ac.Password = "12345";
            ac.Role = "merchant";
            ac.UserID = "MERCH00001";
            bus.AddAccount(ac);
            IList<Account> tmp = bus.GetAccountBy_Username("b");
            Assert.AreEqual("merchant", tmp[0].Role);
            Assert.AreEqual("b", tmp[0].Username);
            Assert.AreEqual("MERCH00001", tmp[0].UserID);

            string en_pass = StringUtils.Md5("12345");
            Assert.AreEqual(en_pass, tmp[0].Password);
            bus.RemoveAccount(ac);
            
        }


        [TestMethod]
        public void Test_GetMerchant_NotHave_Account()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            IList<Merchant> ac = bus.getMerchant_NotHave_Account();
            Assert.AreEqual(0, ac[0].Accounts.Count);
        }
        [TestMethod]
        public void Test_GetMaster_NotHave_Account()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            IList<Master> ac = bus.getMaster_NotHave_Account();
            Assert.AreEqual(0, ac[0].Accounts.Count);
        }

        //agent
        [TestMethod]
        public void Test_generateAgentID_Success()
        {
            string ageID = bus.generateAgentID();
            Assert.AreEqual("AGENT00008", ageID);
        }
        [TestMethod]
        public void Test_getAllAgent_Success()
        {
            IList<Agent> list = bus.GetAllAgent();
            Assert.IsNotNull(list);
            Assert.AreNotEqual(0, list.Count);
        }
        [TestMethod]
        public void Test_getAgentByAgentID_Success()
        {
            Agent agent = bus.getAgentByAgentID("AGENT00005");
            Assert.IsNotNull(agent);
            Assert.AreEqual("agent05@gmail.com", agent.Email);
        }
        [TestMethod]
        public void Test_addAgent_Success()
        {
            string id = bus.generateAgentID();
            Agent agent = new Agent()
            {
                AgentID = id,
                AgentName = "Đại lý 8",
                Address = "3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh",
                Phone = "090.686.3336",
                Email = "agentTest@gmail.com",
                Status = true
            };

            bus.AddAgent(agent);
            Agent agentTest = bus.getAgentByAgentID("AGENT00008");
            Assert.IsNotNull(agentTest);
            Assert.AreEqual("AGENT00008", agentTest.AgentID);
        }

        // merchant
        [TestMethod]
        public void Test_generateMerchantID_Success()
        {
            string merID = bus.generateMerchantID();
            Assert.AreEqual("MERCH00011", merID);
        }
        [TestMethod]
        public void Test_getAllMerchant_Success()
        {
            IList<Merchant> list = bus.getAllMerchant();
            Assert.IsNotNull(list);
            Assert.AreNotEqual(0, list.Count);
        }
        [TestMethod]
        public void Test_getMerchantByMerchantID_Success()
        {
            Merchant _mer = bus.getMerchantByMerchantID("MERCH00010");
            Assert.IsNotNull(_mer);
            Assert.AreEqual("merchant10@gmail.com", _mer.Email);
        }
        [TestMethod]
        public void Test_getMerchantByMerchantIDtoList_Success()
        {
            IList<Merchant> list = bus.getMerchantByMerchantIDtoList("MERCH00010");
            Assert.IsNotNull(list);
            Assert.AreNotEqual(0, list.Count);
            Assert.AreEqual("merchant10@gmail.com", list[0].Email);
        }
        [TestMethod]
        public void Test_addMerchant_Success()
        {
            string id = bus.generateMerchantID();
            Merchant mer = new Merchant()
            {
                MerchantID = id,
                MerchantName = "Nhà hàng Thủy Tạ",
                Address = "3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh",
                Phone = "090.686.3336",
                Email = "merchantTest@gmail.com",
                Status = true,
                MerchantTypeID = "MCT00004",
                MerchantRegionID = "MCR00001",
                AgentID = "AGENT00004"
            };

            bus.addMerchant(mer);
            Merchant merTest = bus.getMerchantByMerchantID(id);
            Assert.IsNotNull(merTest);
            Assert.AreEqual("MERCH00011", merTest.MerchantID);
        }
        [TestMethod]
        public void Test_updateMerchant_UnSuccess()
        {
            string id = "MERCH00011";
            Merchant mer = new Merchant()
            {
                MerchantID = id,
                MerchantName = "Nhà hàng Thủy Tạ",
                Address = "3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh",
                Phone = "090.686.3336",
                Email = "merchantTest@gmail.com",
                Status = true,
                MerchantTypeID = "MCT00004",
                MerchantRegionID = "MCR00001",
                AgentID = "AGENT00004"
            };

            string result = bus.updateMerchant(mer);
            Assert.AreEqual("Không có dữ liệu Merchant!", result);
        }
        [TestMethod]
        public void Test_updateMerchant_Success()
        {
            string id = "MERCH00010";
            Merchant mer = new Merchant()
            {
                MerchantID = id,
                MerchantName = "Nhà hàng Thủy Tạ",
                Address = "3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh",
                Phone = "090.686.3336",
                Email = "merchantTest@gmail.com",
                Status = true,
                MerchantTypeID = "MCT00004",
                MerchantRegionID = "MCR00001",
                AgentID = "AGENT00004"
            };

            string result = bus.updateMerchant(mer);
            Assert.AreEqual("Cập nhật Merchant thành công!", result);
        }
        [TestMethod]
        public void Test_getMerchantByAgent_Success()
        {
            IList<Merchant> list = bus.getMerchantByAgent("AGENT00001");
            Assert.IsNotNull(list);
            Assert.AreNotEqual(0, list.Count);
            Assert.AreEqual(2, list.Count);
        }
        [TestMethod]
        public void Test_getMerchantNotHaveAgent_Success()
        {
            IList<Merchant> list = bus.getMerchantNotHaveAgent();
            Assert.IsNotNull(list);
            Assert.AreNotEqual(0, list.Count);
            Assert.AreEqual(1, list.Count);
        }
       
        
        //notification
        [TestMethod]
        public void Test_getAllNotificationByReceiveID_Success()
        {
            IList<Notification> list = bus.getAllNotificationByReceiveID("MERCH00001");
            Assert.IsNotNull(list);
            Assert.AreNotEqual(0, list.Count);
            Assert.AreEqual(4, list.Count);
        }
        [TestMethod]
        public void Test_getLastThreeNotificationByReceiveID_Success()
        {
            IList<Notification> list = bus.getLastThreeNotificationByReceiveID("MERCH00001");
            Assert.IsNotNull(list);
            Assert.AreNotEqual(0, list.Count);
            Assert.AreEqual(3, list.Count);
        }

        // Report Merchant
        [TestMethod]
        public void Test_GetDailyReport_By_MerID_Date()
        {
            DateTime dt = new DateTime(2017,5,7);
            DailyReport dl = bus.GetDailyReport_By_MerID_Date("MERCH00001", dt);
            Assert.IsNotNull(dl);
            Assert.AreEqual("MERCH00001", dl.MerchantID);
            Assert.AreEqual(dt.AddDays(-1), dl.Date);
        }

        [TestMethod]
        public void Test_GetMonthlyReport_By_MerID_Date()
        {
            DateTime dt = new DateTime(2017, 6, 7);
            MonthlyReport dl = bus.GetMonthlyReport_By_MerID("MERCH00001", 4,2017);
            Assert.IsNotNull(dl);
            Assert.AreEqual("MERCH00001", dl.MerchantID);
            Assert.AreEqual(dt.AddMonths(-1).Month, dl.Date.Value.Month);
        }

        [TestMethod]
        public void Test_GetYearlyReport_By_MerID_Date()
        {
            DateTime dt = new DateTime(2017, 6, 7);
            YearlyReport dl = bus.GetYearlyReport_By_MerID_Date("MERCH00001", 2017);
            Assert.IsNotNull(dl);
            Assert.AreEqual("MERCH00001", dl.MerchantID);
            Assert.AreEqual(dt.AddYears(-1).Year, dl.Date.Value.Year);
        }

        [TestMethod]
        public void Test_GetMonthlyQuarterReport_By_MerID_Date()
        {
            DateTime dt = new DateTime(2017, 7, 7);
            DailyReport dl = bus.GetMonthlyQuarterReport_By_MerID_Date("MERCH00001",4,2017);
            Assert.IsNotNull(dl);
            Assert.AreEqual("MERCH00001", dl.MerchantID);
            Assert.AreEqual(4, dl.Date.Value.Month);
            Assert.AreEqual(203000*3 + 185000*2, dl.NetAmount);
        }

        [TestMethod]
        public void Test_Get_MonthtoDate_Report_By_MerID_Date()
        {
            DateTime dt = new DateTime(2017, 5, 10);
            DailyReport dl = bus.Get_MonthtoDate_Report_By_MerID_Date("MERCH00001", dt);
            Assert.IsNotNull(dl);
            Assert.AreEqual("MERCH00001", dl.MerchantID);
            Assert.AreEqual(1, dl.Date.Value.Day);
            Assert.AreEqual(5, dl.Date.Value.Month);
            Assert.AreEqual(2017, dl.Date.Value.Year);
            Assert.AreEqual(203000 * 3 + 185000, dl.NetAmount);
        }

        [TestMethod]
        public void Test_Get_YeartoDate_Report_By_MerID_Date()
        {
            DateTime dt = new DateTime(2017, 5, 7);
            DailyReport dl = bus.Get_YeartoDate_Report_By_MerID_Date("MERCH00001", dt);
            Assert.IsNotNull(dl);
            Assert.AreEqual("MERCH00001", dl.MerchantID);
            Assert.AreEqual(2017, dl.Date.Value.Year);
            Assert.AreEqual(203000 * 2 + 185000* 3, dl.NetAmount);
        }
    }
}
