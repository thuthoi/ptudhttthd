using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLayer;
using DomainModel;

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
    }
}
