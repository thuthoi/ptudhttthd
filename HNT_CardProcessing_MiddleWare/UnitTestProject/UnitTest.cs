using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLayer;
using DomainModel;
using System.Collections.Generic;
using WebServices.Controllers;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
namespace UnitTestProject
{
    [TestClass]
    public class UnitTest
    {
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
