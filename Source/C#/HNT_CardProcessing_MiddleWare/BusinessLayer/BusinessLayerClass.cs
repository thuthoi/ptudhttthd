using BusinessLayer.Helpers;
using DataAccessLayer;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class BusinessLayerClass : IBusinessLayer
    {
        private readonly IAgentRepository _agentRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IMerchantRepository _merchantRepository;
        private readonly IRegistrationFormRepository _registrationFormRepository;
        private readonly IMerchantTypeRepository _merchantTypeRepository;
        private readonly IMerchantRegionRepository _merchantRegionRepository;
        private readonly IMasterRepository _masterRepository;
        private readonly INotificationRepository _notificationRepository;

        private readonly IDailyReportRepository _dailyReportRepository;
        private readonly IMonthlyReportRepository _monthlyReportRepository;
        private readonly IYearlyReportRepository _yearlyReportRepository;
        public BusinessLayerClass()
        {
            _agentRepository = new AgentRepository();
            _accountRepository = new AccountRepository();
            _merchantRepository = new MerchantRepository();
            _registrationFormRepository = new RegistrationFormRepository();
            _merchantRegionRepository = new MerchantRegionRepository();
            _merchantTypeRepository = new MerchantTypeRepository();
            _masterRepository = new MasterRepository();
            _notificationRepository = new NotificationRepository();

            _dailyReportRepository = new DailyReportRepository();
            _monthlyReportRepository = new MonthlyReportRepository();
            _yearlyReportRepository = new YearlyReportRepository();
        }

        public BusinessLayerClass(IAgentRepository agentRepository,
            IAccountRepository accountRepository, IMerchantRepository merchantRepository, IRegistrationFormRepository registrationFormRepository,
            IMerchantTypeRepository merchantTypeRepository, IMerchantRegionRepository merchantRegionRepository, INotificationRepository notificationRepository)
        {
            _agentRepository = agentRepository;
            _accountRepository = accountRepository;
            _merchantRepository = merchantRepository;
            _registrationFormRepository = registrationFormRepository;
            _merchantTypeRepository = merchantTypeRepository;
            _merchantRegionRepository = merchantRegionRepository;
            _notificationRepository = notificationRepository;
        }

        //Định nghĩa các hàm đã khai báo bên !BusinessLayer

        //Agent
        public IList<Agent> GetAllAgent()
        {
            return _agentRepository.GetAll();
        }
        public Agent GetAgentByUsername(string username)
        {
            return _accountRepository.GetSingle(
                a => a.Username.Equals(username),
                a => a.Agent).Agent; //include related agent
        }
        public void AddAgent(Agent agent)
        {
            /* Validation and error handling omitted */
            _agentRepository.Add(agent);
        }
        public string UpdateAgent(Agent agent)
        {
            /* Validation and error handling omitted */
            Agent _agent = getAgentByAgentID(agent.AgentID);
            if (_agent == null)
            {
                return "Không có dữ liệu Agent!";
            }
            else
            {
                _agent.AgentName = agent.AgentName;
                _agent.Address = agent.Address;
                _agent.Phone = agent.Phone;
                _agent.Email = agent.Email;
                _agent.Status = agent.Status;
                _agent.MasterID = agent.AgentID;
                _agentRepository.Update(agent);
                return "Cập nhật Agent thành công!";
            }
        }
        public void RemoveAgent(Agent agent)
        {
            /* Validation and error handling omitted */
            _agentRepository.Remove(agent);
        }
        public string generateAgentID()
        {
            string res = "";
            string oldAgentID = GetAllAgent().OrderByDescending(a => a.AgentID).FirstOrDefault().AgentID.ToString();
            if (oldAgentID != "")
            {
                res = "AGENT" + Convert.ToString((Convert.ToInt32(oldAgentID.Substring(5)) + 1)).PadLeft(5, '0');
            }
            else
            {
                res = "AGENT00001";
            }
            return res;
        }
        public Agent getAgentByAgentID(string id)
        {
            return _agentRepository.GetSingle(a => a.AgentID.Equals(id));
        }
        public IList<Agent> getAgent_NotHave_Account()
        {
            return _agentRepository.GetAll(c => c.Accounts).Where(m => m.Accounts.Count == 0).ToList();
        }
        public IList<Agent> getAgentbyMasterID(string id)
        {
            return _agentRepository.GetAll().Where(a => a.MasterID == id && a.Status == true).ToList();
        }

        public IList<Agent> getAgentByAgentIDtoList(string id)
        {
            return _agentRepository.GetAll().Where(a => a.AgentID == id).Take(1).ToList();
        }

        //Account
        public void AddAccount(Account account)
        {
            /* Validation and error handling omitted */
            string en_pass = StringUtils.Md5(account.Password);
            account.Password = en_pass;
            _accountRepository.Add(account);
        }
        public void UpdateAccount(Account account)
        {
            /* Validation and error handling omitted */
            _accountRepository.Update(account);
        }
        public void RemoveAccount(Account account)
        {
            /* Validation and error handling omitted */
            _accountRepository.Remove(account);
        }
        public string ChangePassword(Account account)
        {
            Account acc = _accountRepository.GetSingle(a => a.Username == account.Username);

            string opw = StringUtils.Md5(account.OldPassword);
            if (acc.Password != opw)
            {
                return "Mật khẩu cũ không trùng khớp!";
            }
            else
            {
                acc.Password = StringUtils.Md5(account.Password);
                _accountRepository.Update(acc);
                return "Đổi mật khẩu thành công!";
            }
        }
        public IList<Account> GetAccountBy_Username_Password(String username, String pass)
        {
            string en_pass = StringUtils.Md5(pass);
            return _accountRepository.GetList(
                            a => a.Username.Equals(username) &&
                            a.Password.Equals(en_pass));
        }
        public IList<Account> GetAccountBy_Username(String username)
        {
            return _accountRepository.GetList(
                            a => a.Username.Equals(username));
        }
        public IList<Account> getAllAccount()
        {
            IList<Account> lst = _accountRepository.GetAll(acc => acc.Agent, acc => acc.Merchant, acc => acc.Master);
            if (lst.Count != 0)
            {
                for (int i = 0; i < lst.Count; i++)
                {
                    if (lst[i].Role == "master")
                    {
                        lst[i].Master_Agent_Merchant_Name = lst[i].Master.MasterName;
                    }
                    else if (lst[i].Role == "agent")
                    {
                        lst[i].Master_Agent_Merchant_Name = lst[i].Agent.AgentName;
                    }
                    else if (lst[i].Role == "merchant")
                    {
                        lst[i].Master_Agent_Merchant_Name = lst[i].Merchant.MerchantName;
                    }
                }

            }
            return lst;
        }
        public bool Check_Account_UserName_Exist(string username)
        {
            IList<Account> ck = _accountRepository.GetList(
                            a => a.Username.Equals(username));
            if (ck.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //Merchant
        public void addMerchant(Merchant merchant)
        {
            _merchantRepository.Add(merchant);
        }
        public Merchant getMerchantByMerchantID(string id)
        {
            return _merchantRepository.GetSingle(
                m => m.MerchantID.Equals(id));
        }
        public IList<Merchant> getMerchantByMerchantIDtoList(string id)
        {
            return _merchantRepository.GetAll().Where(m => m.MerchantID == id).Take(1).ToList();
        }
        public IList<Merchant> getAllMerchant()
        {
            return _merchantRepository.GetAll();
        }
        public string generateMerchantID()
        {
            string res = "";
            string oldMerchantID = getAllMerchant().OrderByDescending(m => m.MerchantID).FirstOrDefault().MerchantID.ToString();
            if (oldMerchantID != "")
            {
                res = "MERCH" + Convert.ToString((Convert.ToInt32(oldMerchantID.Substring(5)) + 1)).PadLeft(5, '0');
            }
            else
            {
                res = "MERCH00001";
            }
            return res;
        }
        public string updateMerchant(Merchant merchant)
        {
            Merchant _merchant = getMerchantByMerchantID(merchant.MerchantID);
            if (_merchant == null)
            {
                return "Không có dữ liệu Merchant!";
            }
            else
            {
                _merchant.MerchantName = merchant.MerchantName;
                _merchant.Address = merchant.Address;
                _merchant.Phone = merchant.Phone;
                _merchant.Email = merchant.Email;
                _merchant.Status = merchant.Status;
                _merchant.MerchantTypeID = merchant.MerchantTypeID;
                _merchant.MerchantRegionID = merchant.MerchantRegionID;
                _merchant.AgentID = merchant.AgentID;

                _merchantRepository.Update(merchant);
                return "Cập nhật Merchant thành công!";
            }
        }
        public IList<Merchant> getMerchant_NotHave_Account()
        {
            //IList<Account> list_ac = _accountRepository.GetAll();
            //List<String> list_userID = new List<string>();
            //foreach (Account ac in list_ac)
            //{
            //    list_userID.Add(ac.UserID);
            //}

            //return _merchantRepository.GetAll().Where(m => !list_userID.Contains(m.MerchantID)).ToList();
            return _merchantRepository.GetAll(c => c.Accounts).Where(m => m.Accounts.Count == 0).ToList();
        }
        public IList<Merchant> getMerchantByAgent(string _agentID)
        {
            return _merchantRepository.GetAll().Where(m => m.AgentID == _agentID).ToList();
        }
        public IList<Merchant> getMerchantNotHaveAgent()
        {
            return _merchantRepository.GetAll().Where(m => m.AgentID == string.Empty).ToList();
        }
        public void updateAgentforMerchant(Merchant merchant)
        {
            Merchant mer = _merchantRepository.GetSingle(m => m.MerchantID == merchant.MerchantID);
            mer.AgentID = merchant.AgentID;
            _merchantRepository.Update(mer);
        }
        public void removeMerchant(Merchant merchant)
        {
            _merchantRepository.Remove(merchant);
        }

        //RegistrationForm
        public void addRegistrationForm(RegistrationForm registrationForm)
        {
            _registrationFormRepository.Add(registrationForm);
        }
        public IList<RegistrationForm> getAllRegistionForm()
        {
            return _registrationFormRepository.GetAll();
        }
        public string generateRegID()
        {
            string res = "";
            string oldRegID = getAllRegistionForm().OrderByDescending(m => m.RegID).FirstOrDefault().RegID.ToString();
            if (oldRegID != "")
            {
                res = "REG" + Convert.ToString((Convert.ToInt32(oldRegID.Substring(3)) + 1)).PadLeft(5, '0');
            }
            else
            {
                res = "REG00001";
            }
            return res;
        }
        public RegistrationForm getAllRegistrationFormByRegID(string id)
        {
            return _registrationFormRepository.GetSingle(
                m => m.RegID.Equals(id));
        }

        //MerchantType
        public IList<MerchantType> getAllMerchantType()
        {
            return _merchantTypeRepository.GetAll();
        }

        //MerchantRegion
        public IList<MerchantRegion> getAllMerchantRegion()
        {
            return _merchantRegionRepository.GetAll();
        }

        // Master
        public IList<Master> getAllMaster()
        {
            return _masterRepository.GetAll();
        }
        public IList<Master> getMaster_NotHave_Account()
        {
            return _masterRepository.GetAll(c => c.Accounts).Where(m => m.Accounts.Count == 0).ToList();
        }

        public IList<Master> getMasterByMasterID(string id)
        {
            return _masterRepository.GetAll().Where(m => m.MasterID == id).Take(1).ToList();
        }

        //Notification
        public IList<Notification> getAllNotificationByReceiveID(string _receiveID)
        {
            return _notificationRepository.GetAll().Where(n => n.ReceiverID == _receiveID).OrderByDescending(n => n.Date).ToList();
        }
        public IList<Notification> getLastThreeNotificationByReceiveID(string _receiveID)
        {
            return _notificationRepository.GetAll().Where(n => n.ReceiverID == _receiveID).OrderByDescending(n => n.Date).Take(3).ToList();
        }



        // Report Merchant
        public DailyReport GetDailyReport_By_MerID(String MerID)
        {
            DateTime dt = DateTime.Now.AddDays(-1);
            return _dailyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(MerID) &&
                            d.Date.Equals(dt));
        }

        public MonthlyReport GetMonthlyReport_By_MerID(String MerID)
        {
            DateTime dt = DateTime.Now.AddMonths(-1);
            return _monthlyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(MerID) &&
                            d.Date.Value.Month.Equals(dt.Month));
        }

        public YearlyReport GetYearlyReport_By_MerID(String MerID)
        {
            DateTime dt = DateTime.Now.AddYears(-1);
            return _yearlyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(MerID) &&
                            d.Date.Value.Year.Equals(dt.Year));
        }


        public DailyReport GetMonthlyQuarterReport_By_MerID(String MerID)
        {
            DailyReport lst = new DailyReport();
            DateTime dt = DateTime.Now;
            int quarter = GetQuarter(dt);
            if(quarter == 1)
            {
                lst = Caculate_fromMonth_toMonth_Report(MerID, dt, 10, 12, dt.AddYears(-1).Year);
            }
            else
            {
                int quarter_previous = quarter - 1;
                if (quarter_previous == 1)
                {
                    lst = Caculate_fromMonth_toMonth_Report(MerID, dt, 1, 3, dt.Year);
                }
                else if (quarter_previous == 2)
                {
                    lst = Caculate_fromMonth_toMonth_Report(MerID, dt, 4, 6, dt.Year);
                }
                else if (quarter_previous == 3)
                {
                    lst = Caculate_fromMonth_toMonth_Report(MerID, dt, 7, 9, dt.Year);
                }
                else if (quarter_previous == 4)
                {
                    lst = Caculate_fromMonth_toMonth_Report(MerID, dt, 11, 12, dt.Year);
                }
            }
            return lst;
        }
        private DailyReport Caculate_fromMonth_toMonth_Report(String MerID, DateTime dt, int fromMonth, int toMonth, int year)
        {
            return _monthlyReportRepository.GetList(
                         d => d.MerchantID.Equals(MerID) && ((
                         d.Date.Value.Month >= fromMonth) && d.Date.Value.Month <= toMonth)
                         && d.Date.Value.Year.Equals(year))
                         .GroupBy(d => new { d.MerchantID, d.MerchantTypeID, d.MerchantRegionID })
                         .Select(s => new DailyReport
                         {
                             MerchantID = s.Key.MerchantID,
                             MerchantTypeID = s.Key.MerchantTypeID,
                             MerchantRegionID = s.Key.MerchantRegionID,
                             SaleAmount = s.Sum(w => w.SaleAmount),
                             ReturnAmount = s.Sum(w => w.ReturnAmount),
                             SaleCount = s.Sum(w => w.SaleCount),
                             ReturnCount = s.Sum(w => w.ReturnCount),
                             DebitCardSaleAmount = s.Sum(w => w.DebitCardSaleAmount),
                             MasterCardSaleAmount = s.Sum(w => w.MasterCardSaleAmount),
                             VisaCardSaleAmount = s.Sum(w => w.VisaCardSaleAmount),
                             DebitCardReturnAmount = s.Sum(w => w.DebitCardReturnAmount),
                             MasterCardReturnAmount = s.Sum(w => w.MasterCardReturnAmount),
                             VisaCardReturnAmount = s.Sum(w => w.VisaCardReturnAmount),
                             DebitCardSaleCount = s.Sum(w => w.DebitCardSaleCount),
                             MasterCardSaleCount = s.Sum(w => w.MasterCardSaleCount),
                             VisaCardSaleCount = s.Sum(w => w.VisaCardSaleCount),
                             DebitCardReturnCount = s.Sum(w => w.DebitCardReturnCount),
                             MasterCardReturnCount = s.Sum(w => w.MasterCardReturnCount),
                             VisaCardReturnCount = s.Sum(w => w.VisaCardReturnCount),
                             NetAmount = s.Sum(w => w.NetAmount),
                             NetCount = s.Sum(w => w.NetCount),
                             Date = dt
                         }).FirstOrDefault();
        }

        public static int GetQuarter(DateTime date)
        {
            if (date.Month >= 4 && date.Month <= 6)
                return 1;
            else if (date.Month >= 7 && date.Month <= 9)
                return 2;
            else if (date.Month >= 10 && date.Month <= 12)
                return 3;
            else
                return 4;

        }

        public DailyReport Get_MonthtoDate_Report_By_MerID_Date(String MerID, DateTime custom_Day)
        {
            DateTime now = DateTime.Now;
            DateTime firstDayOfMonth = new DateTime(now.Year, now.Month, 1);
            return Caculate_MonthtoDate_Report(MerID, now, firstDayOfMonth, custom_Day);
        }

        private DailyReport Caculate_MonthtoDate_Report(String MerID, DateTime dt, DateTime fromDate, DateTime toDate)
        {
            return _dailyReportRepository.GetList(
                         d => d.MerchantID.Equals(MerID) && ((
                         d.Date.Value >= fromDate) && d.Date.Value <= toDate)
                         )
                         .GroupBy(d => new { d.MerchantID, d.MerchantTypeID, d.MerchantRegionID })
                         .Select(s => new DailyReport
                         {
                             MerchantID = s.Key.MerchantID,
                             MerchantTypeID = s.Key.MerchantTypeID,
                             MerchantRegionID = s.Key.MerchantRegionID,
                             SaleAmount = s.Sum(w => w.SaleAmount),
                             ReturnAmount = s.Sum(w => w.ReturnAmount),
                             SaleCount = s.Sum(w => w.SaleCount),
                             ReturnCount = s.Sum(w => w.ReturnCount),
                             DebitCardSaleAmount = s.Sum(w => w.DebitCardSaleAmount),
                             MasterCardSaleAmount = s.Sum(w => w.MasterCardSaleAmount),
                             VisaCardSaleAmount = s.Sum(w => w.VisaCardSaleAmount),
                             DebitCardReturnAmount = s.Sum(w => w.DebitCardReturnAmount),
                             MasterCardReturnAmount = s.Sum(w => w.MasterCardReturnAmount),
                             VisaCardReturnAmount = s.Sum(w => w.VisaCardReturnAmount),
                             DebitCardSaleCount = s.Sum(w => w.DebitCardSaleCount),
                             MasterCardSaleCount = s.Sum(w => w.MasterCardSaleCount),
                             VisaCardSaleCount = s.Sum(w => w.VisaCardSaleCount),
                             DebitCardReturnCount = s.Sum(w => w.DebitCardReturnCount),
                             MasterCardReturnCount = s.Sum(w => w.MasterCardReturnCount),
                             VisaCardReturnCount = s.Sum(w => w.VisaCardReturnCount),
                             NetAmount = s.Sum(w => w.NetAmount),
                             NetCount = s.Sum(w => w.NetCount),
                             Date = dt
                         }).FirstOrDefault();
        }


        public DailyReport Get_YeartoDate_Report_By_MerID_Date(String MerID, DateTime custom_Day)
        {
            DateTime now = DateTime.Now;
            DateTime firstDayOfYear = new DateTime(now.Year, 1, 1);
            int previous_month = now.AddMonths(-1).Month;
            DailyReport dl_1_pre_month = Caculate_fromMonth_toMonth_Report(MerID, now, 1, previous_month, now.Year);
            DailyReport dl_FDOM_CD = Get_MonthtoDate_Report_By_MerID_Date(MerID, custom_Day);
            DailyReport dl_YeartoDate = Sum_2_DailyReport(dl_1_pre_month, dl_FDOM_CD);
            return dl_YeartoDate;
        }

        private static DailyReport Sum_2_DailyReport(DailyReport dl_1, DailyReport dl_2)
        {
            DailyReport dl = new DailyReport();
            dl.MerchantID = dl_1.MerchantID;
            dl.MerchantTypeID = dl_1.MerchantTypeID;
            dl.MerchantRegionID = dl_1.MerchantRegionID;
            dl.SaleAmount = dl_1.SaleAmount + dl_1.SaleAmount;
            dl.ReturnAmount = dl_1.SaleAmount + dl_1.SaleAmount;
            dl.SaleCount = dl_1.SaleCount + dl_1.SaleCount;
            dl.ReturnCount = dl_1.ReturnCount + dl_1.ReturnCount;
            dl.DebitCardSaleAmount = dl_1.DebitCardSaleAmount + dl_1.DebitCardSaleAmount;
            dl.MasterCardSaleAmount = dl_1.MasterCardSaleAmount + dl_1.MasterCardSaleAmount;
            dl.VisaCardSaleAmount = dl_1.VisaCardSaleAmount + dl_1.VisaCardSaleAmount;
            dl.DebitCardReturnAmount = dl_1.DebitCardReturnAmount + dl_1.DebitCardReturnAmount;
            dl.MasterCardReturnAmount = dl_1.MasterCardReturnAmount + dl_1.MasterCardReturnAmount;
            dl.VisaCardReturnAmount = dl_1.VisaCardReturnAmount + dl_1.VisaCardReturnAmount;
            dl.DebitCardSaleCount = dl_1.DebitCardSaleCount + dl_1.DebitCardSaleCount;
            dl.MasterCardSaleCount = dl_1.MasterCardSaleCount + dl_1.MasterCardSaleCount;
            dl.VisaCardSaleCount = dl_1.VisaCardSaleCount + dl_1.VisaCardSaleCount;
            dl.DebitCardReturnCount = dl_1.DebitCardReturnCount + dl_1.DebitCardReturnCount;
            dl.MasterCardReturnCount = dl_1.MasterCardReturnCount + dl_1.MasterCardReturnCount;
            dl.VisaCardReturnCount = dl_1.VisaCardReturnCount + dl_1.VisaCardReturnCount;
            dl.NetAmount = dl_1.NetAmount + dl_1.NetAmount;
            dl.NetCount = dl_1.NetCount + dl_1.NetCount;
            dl.Date = DateTime.Now;
            return dl;
        }
    }
}
