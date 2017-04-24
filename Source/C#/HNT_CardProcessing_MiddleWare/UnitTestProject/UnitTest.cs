using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLayer;
using DomainModel;
using System.Collections.Generic;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest
    {
        BusinessLayerClass bus = new BusinessLayerClass();

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
            Account ac = bus.GetAccountBy_Username_Password("tuantai", "123456");
            Assert.IsNotNull(ac);
        }

        [TestMethod]
        public void Test_Login_CorrectData()
        {
            BusinessLayerClass bus = new BusinessLayerClass();
            Account ac = bus.GetAccountBy_Username_Password("tuantai", "123456");
            Assert.AreEqual("tuantai", ac.Username);
        }

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
        public void Test_generateRegID_Success()
        {
            string regID = bus.generateRegID();
            Assert.AreEqual("REG00002", regID);
        }

        [TestMethod]
        public void Test_addRegistrationForm_Success()
        {
            string id = bus.generateRegID();
            RegistrationForm reg = new RegistrationForm()
            {
                RegID = id,
                Name = "Nhan",
                Email = "nhan@gmail.com",
                Phone = "0901111222",
                Detail = "abc"
            };
            bus.addRegistrationForm(reg);
            RegistrationForm regTest = bus.getAllRegistrationFormByRegID(id);
            Assert.IsNotNull(regTest);
            Assert.AreEqual("REG00002", regTest.RegID);
        }
    }
}
