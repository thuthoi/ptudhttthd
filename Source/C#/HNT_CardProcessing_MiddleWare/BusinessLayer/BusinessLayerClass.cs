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
            _merchantRegionRepository = new MerchantRegionRepository();
            _merchantTypeRepository = new MerchantTypeRepository();
            _masterRepository = new MasterRepository();
            _notificationRepository = new NotificationRepository();

            _dailyReportRepository = new DailyReportRepository();
            _monthlyReportRepository = new MonthlyReportRepository();
            _yearlyReportRepository = new YearlyReportRepository();
        }

        public BusinessLayerClass(IAgentRepository agentRepository,
            IAccountRepository accountRepository, IMerchantRepository merchantRepository,
            IMerchantTypeRepository merchantTypeRepository, IMerchantRegionRepository merchantRegionRepository, INotificationRepository notificationRepository)
        {
            _agentRepository = agentRepository;
            _accountRepository = accountRepository;
            _merchantRepository = merchantRepository;
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


        public IList<Agent> getAgentByAgentIDtoList(string id)
        {
            return _agentRepository.GetAll().Where(a => a.AgentID == id).Take(1).ToList();
        }

        public IList<Agent> searchAgent(SearchKeyword keyword)
        {
            string key = keyword.Keyword.ToLower();
            bool active = true;
            if (keyword.Active == 2)
            {
                return _agentRepository.GetList(a => a.AgentID.ToLower().Contains(key) ||
                                                     a.AgentName.ToLower().Contains(key) ||
                                                     a.Email.ToLower().Contains(key) ||
                                                     a.Phone.ToLower().Contains(key) ||
                                                     a.Address.ToLower().Contains(key)).ToList();
            }
            else
            {
                if (keyword.Active == 0)
                {
                    active = false;
                }

                return _agentRepository.GetList(a => (a.AgentID.ToLower().Contains(key) ||
                                                      a.AgentName.ToLower().Contains(key) ||
                                                      a.Email.ToLower().Contains(key) ||
                                                      a.Phone.ToLower().Contains(key) ||
                                                      a.Address.ToLower().Contains(key)) &&
                                                      a.Status == active).ToList();
            }
        }


        //Account
        public void AddAccount(Account account)
        {
            if(Is_Account_UserName_Exist(account.Username) == false)
            {
                /* Validation and error handling omitted */
                string en_pass = StringUtils.Md5(account.Password);
                account.Password = en_pass;
                _accountRepository.Add(account);
            }
            
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
        public bool Is_Account_UserName_Exist(string username)
        {
            IList<Account> ck = _accountRepository.GetList(
                            a => a.Username.Equals(username));
            if (ck.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
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

        public IList<Merchant> searchMerchant(SearchKeyword keyword)
        {
            string key = keyword.Keyword.ToLower();
            bool active = true;
            if (keyword.Active == 2)
            {
                return _merchantRepository.GetList(m => m.AgentID.Contains(keyword.AgentID) &&
                                                   (m.MerchantID.ToLower().Contains(key) ||
                                                    m.MerchantName.ToLower().Contains(key) ||
                                                    m.Phone.ToLower().Contains(key) ||
                                                    m.Address.ToLower().Contains(key) ||
                                                    m.Email.ToLower().Contains(key)) &&
                                                    m.MerchantRegionID.Contains(keyword.MerchantRegion) &&
                                                    m.MerchantTypeID.Contains(keyword.MerchantType)
                                                    ).ToList();
            }
            else
            {
                if (keyword.Active == 0)
                {
                    active = false;
                }

                return _merchantRepository.GetList(m => m.AgentID.Contains(keyword.AgentID) &&
                                                   (m.MerchantID.ToLower().Contains(key) ||
                                                    m.MerchantName.ToLower().Contains(key) ||
                                                    m.Phone.ToLower().Contains(key) ||
                                                    m.Address.ToLower().Contains(key) ||
                                                    m.Email.ToLower().Contains(key)) &&
                                                    m.MerchantRegionID.Contains(keyword.MerchantRegion) &&
                                                    m.MerchantTypeID.Contains(keyword.MerchantType) &&
                                                    m.Status == active
                                                    ).ToList();
            }
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

        //Daily Report
        public IList<DailyReport> getDailyReportInMaster(int day, int month, int year)
        {
            return _dailyReportRepository.GetAll().Where(d => d.Date.Value.Day == day && 
                                                              d.Date.Value.Month == month &&
                                                              d.Date.Value.Year == year).ToList();
        }

        //Monthly Report
        public IList<MonthlyReport> getMonthlyReportInMaster(int month, int year)
        {
            return _monthlyReportRepository.GetAll().Where(m => m.Date.Value.Month == month &&
                                                            m.Date.Value.Year == year).ToList();
        }

        //Quarterly Report
        public IList<MonthlyReport> getQuarterlyReportInMaster(int quarter, int year)
        {
            return _monthlyReportRepository.GetAll().Where(m => GetQuarter(m.Date.Value) == quarter &&
                                                            m.Date.Value.Year == year).ToList();
        }

        //Yearly Report
        public IList<YearlyReport> getYearlyReportInMaster(int year)
        {
            return _yearlyReportRepository.GetAll().Where(y => y.Date.Value.Year == year).ToList();
        }
        
        //Month To Date Report
        public IList<DailyReport> getMonthToDateReportInMaster(int day)
        {
            return _dailyReportRepository.GetAll().Where(d => d.Date.Value.Day  <= day &&
                                                              d.Date.Value.Month == DateTime.Now.Month &&
                                                              d.Date.Value.Year == DateTime.Now.Year).ToList();
        }

        //Year To Date Report
        public IList<DailyReport> getYearToDateReportInMaster(int day, int month)
        {
            return _dailyReportRepository.GetAll().Where(d => d.Date.Value.Day <= day &&
                                                              d.Date.Value.Month <= month &&
                                                              d.Date.Value.Year == DateTime.Now.Year).ToList();
        }

        //Report Agent
        /// <summary>
        /// Lấy thống kê hàng ngày dựa theo agtID và dt.
        /// thống kê hàng ngày nhưng lấy dữ liệu của ngày hôm qua, ko phải ngày hiện tại của dt. 
        /// VD: dt là ngày 19 thì dữ liệu lấy là ngày 18
        /// </summary>
        /// <param name="AgtID">mã số agent</param>
        /// <param name="dt">ngày muốn lấy thống kê</param>
        /// <returns></returns>

        public DailyReport GetDailyReport_By_AgtID_Date(String AgtID, DateTime dt)
        {
            // AddDays(-1) để có được ngày hôm trước
            DateTime previous = dt.AddDays(-1);
            return _dailyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(AgtID) &&
                            d.Date.Equals(previous));
        }
        /// <summary>
        /// Lấy thống kê tháng dựa theo agtID và dt.
        /// thống kê tháng nhưng lấy dữ liệu của tháng trước ko phải tháng hiện tại của dt. 
        /// VD: dt là ngày 19/5/2017 thì dữ liệu lấy là của tháng 4
        /// </summary>
        /// <param name="AgtID"></param>
        /// <param name="dt"></param>
        /// <returns></returns>
        public MonthlyReport GetMonthlyReport_By_AgtID_Date(String AgtID, DateTime dt)
        {
            // AddMonths(-1) để có được tháng trước
            DateTime previous = dt.AddMonths(-1);
            return _monthlyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(AgtID) &&
                            d.Date.Value.Month.Equals(previous.Month)
                            && d.Date.Value.Year.Equals(previous.Year));
        }
        /// <summary>
        /// Lấy thống kê năm dựa theo agtID và dt.
        /// thống kê năm nhưng lấy dữ liệu của năm trước ko phải năm hiện tại của dt. 
        /// VD: dt là ngày 19/5/2017 thì dữ liệu lấy là của năm 2016
        /// </summary>
        /// <param name="AgtID"></param>
        /// <param name="dt"></param>
        /// <returns></returns>
        public YearlyReport GetYearlyReport_By_AgtID_Date(String AgtID, DateTime dt)
        {
            // AddYears(-1) để có được năm trước
            DateTime previous = dt.AddYears(-1);
            return _yearlyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(AgtID) &&
                            d.Date.Value.Year.Equals(previous.Year));
        }

        // Report Merchant
        /// <summary>
        /// Lấy thống kê hàng ngày dựa theo merID và dt.
        /// thống kê hàng ngày nhưng lấy dữ liệu của ngày hôm qua, ko phải ngày hiện tại của dt. 
        /// VD: dt là ngày 19 thì dữ liệu lấy là ngày 18
        /// </summary>
        /// <param name="MerID">mã số merchant</param>
        /// <param name="dt">ngày muốn lấy thống kê</param>
        /// <returns></returns>

        public DailyReport GetDailyReport_By_MerID_Date(String MerID, DateTime dt)
        {
            // AddDays(-1) để có được ngày hôm trước
            //DateTime previous = dt.AddDays(-1);
            return _dailyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(MerID) &&
                            d.Date.Equals(dt));
        }
  
        /// <summary>
        /// Lấy thống kê tháng dựa theo merID và dt.
        /// thống kê tháng nhưng lấy dữ liệu của tháng trước ko phải tháng hiện tại của dt. 
        /// VD: dt là ngày 19/5/2017 thì dữ liệu lấy là của tháng 4
        /// </summary>
        /// <param name="MerID"></param>
        /// <param name="dt"></param>
        /// <returns></returns>
        public MonthlyReport GetMonthlyReport_By_MerID_Date(String MerID, DateTime dt)
        {
            // AddMonths(-1) để có được tháng trước
            DateTime previous = dt.AddMonths(-1);
            return _monthlyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(MerID) &&
                            d.Date.Value.Month.Equals(previous.Month)
                            && d.Date.Value.Year.Equals(previous.Year));
        }
        /// <summary>
        /// Lấy thống kê năm dựa theo merID và dt.
        /// thống kê năm nhưng lấy dữ liệu của năm trước ko phải năm hiện tại của dt. 
        /// VD: dt là ngày 19/5/2017 thì dữ liệu lấy là của năm 2016
        /// </summary>
        /// <param name="MerID"></param>
        /// <param name="dt"></param>
        /// <returns></returns>
        public YearlyReport GetYearlyReport_By_MerID_Date(String MerID, DateTime dt)
        {
            // AddYears(-1) để có được năm trước
            DateTime previous = dt.AddYears(-1);
            return _yearlyReportRepository.GetSingle(
                            d => d.MerchantID.Equals(MerID) &&
                            d.Date.Value.Year.Equals(previous.Year));
        }
        /// <summary>
        /// Lấy thống kê quý dựa theo merID và dt.
        /// thống kê quý nhưng lấy dữ liệu của quý trước ko phải quý hiện tại của dt. 
        /// VD: dt là ngày 19/5/2017 là quý 2 nên dữ liệu sẽ lấy là của tháng 1
        /// nếu rơi vào quý 1 thì lấy quý 4 của năm trước
        /// quý 1: 1,2,3
        /// quý 2: 4,5,6
        /// quý 3: 7,8,9
        /// quý 4: 10,11,12
        /// </summary>
        /// <param name="MerID"></param>
        /// <param name="dt"></param>
        /// <returns></returns>

        public DailyReport GetMonthlyQuarterReport_By_MerID_Date(String MerID, DateTime dt)
        {
            DailyReport lst = new DailyReport();
            //DateTime dt = DateTime.Now;

            // tính xem hiện tại đang ở quý nào
            int quarter = GetQuarter(dt);
            // rơi quý 1 nên lấy thống kê của quý 4 năm trước 
            if (quarter == 1)
            {
                lst = Caculate_fromMonth_toMonth_Report(MerID, 10, 12, dt.AddYears(-1).Year);
            }
            else
            {
                // tính quý cần lấy dữ liệu 
                int quarter_previous = quarter - 1;
                if (quarter_previous == 1)
                {
                    lst = Caculate_fromMonth_toMonth_Report(MerID, 1, 3, dt.Year);
                }
                else if (quarter_previous == 2)
                {
                    lst = Caculate_fromMonth_toMonth_Report(MerID, 4, 6, dt.Year);
                }
                else if (quarter_previous == 3)
                {
                    lst = Caculate_fromMonth_toMonth_Report(MerID, 7, 9, dt.Year);
                }

            }
            return lst;
        }
        /// <summary>
        /// Hàm lấy thống kê báo cáo từ tháng bắt đầu (fromMonth) đến tháng kết thúc (toMonth)
        /// Chọn DailyReport để trả về do 3 cái Daily, Monthly, Yearly có thuộc tính giống nhau nên chọn đại 1 cái
        /// </summary>
        /// <param name="MerID">mã số merchant</param>
        /// <param name="fromMonth">tháng bắt đầu</param>
        /// <param name="toMonth">tháng kết thúc</param>
        /// <param name="year">nănm</param>
        /// <returns></returns>
        private DailyReport Caculate_fromMonth_toMonth_Report(String MerID, int fromMonth, int toMonth, int year)
        {
            // do thống kê được tạo từ nhiều tháng nên thuộc tính Date trong DailyReport
            // nên tạo đại 1 ngày là ngày bắt đầu của tháng bắt đầu(fromMonth) để gắn vào
            DateTime tmp_dt = new DateTime(year, fromMonth, 1);
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
                             Date = tmp_dt
                         }).FirstOrDefault();
        }
        /// <summary>
        /// Hàm tính quý dựa trên hàm truyền vào
        /// </summary>
        /// <param name="date">ngày muốn tính quý</param>
        /// <returns></returns>
        public static int GetQuarter(DateTime date)
        {
            return (date.Month + 2) / 3;
        }
        /// <summary>
        /// hàm tính thống kê từ đầu tháng của ngày truyền vào (custom_Day) đến sau ngày truyền vào 1 ngày
        /// VD: ngày truyền vào là 19/5/2017 thì hàm sẽ tính từ ngày 1/5/2017 đến 18/5/2017
        /// Chọn DailyReport để trả về do 3 cái Daily, Monthly, Yearly có thuộc tính giống nhau nên chọn đại 1 cái
        /// </summary>
        /// <param name="MerID"></param>
        /// <param name="custom_Day">ngày truyền vào</param>
        /// <returns></returns>
        public DailyReport Get_MonthtoDate_Report_By_MerID_Date(String MerID, DateTime custom_Day)
        {
            //DateTime now = DateTime.Now;
            // Tạo ngày đầu của tháng
            DateTime firstDayOfMonth = new DateTime(custom_Day.Year, custom_Day.Month, 1);
            return Caculate_MonthtoDate_Report(MerID, firstDayOfMonth, custom_Day);
        }
        /// <summary>
        /// hàm tính thống kê từ ngày bắt đầu (fromDate) đến ngày kết thúc (toDate)
        /// 
        /// </summary>
        /// <param name="MerID"></param>
        /// <param name="fromDate">ngày bắt đầu</param>
        /// <param name="toDate">ngày kết thúc</param>
        /// <returns></returns>
        private DailyReport Caculate_MonthtoDate_Report(String MerID, DateTime fromDate, DateTime toDate)
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
                             Date = fromDate
                         }).FirstOrDefault();
        }

        /// <summary>
        /// hàm tính thống kê từ đầu năm của ngày truyền vào (custom_Day) đến sau ngày truyền vào 1 ngày
        /// VD: ngày truyền vào là 19/5/2017 thì hàm sẽ tính từ ngày 1/1/2017 đến 18/5/2017
        /// Cách tính là tính thống kê từ ngày ngầy đâu tiên của năm (1/1/2017 ) tới tháng trước của ngày truyền vào (custom_Day) (30/4/2017 )
        /// sau đó tính thống kê từ ngày đâu tháng (1/5/2017 ) tới ngày truyền vào  (18/5/2017)
        /// cộng 2 cái lại được kết quả
        /// 1/1/2017 - 30/4/2017 => dl_1_pre_month
        /// 1/5/2017 - 18/5/2017 => dl_FDOM_CD
        /// dl_YeartoDate = dl_1_pre_month + dl_FDOM_CD
        /// Chọn DailyReport để trả về do 3 cái Daily, Monthly, Yearly có thuộc tính giống nhau nên chọn đại 1 cái
        /// </summary>
        /// <param name="MerID"></param>
        /// <param name="custom_Day">ngày truyền vào</param>
        /// <returns></returns>
        public DailyReport Get_YeartoDate_Report_By_MerID_Date(String MerID, DateTime custom_Day)
        {
            // DateTime now = DateTime.Now;
            DateTime firstDayOfYear = new DateTime(custom_Day.Year, 1, 1);
            // tính xem tháng trước đó là tháng mấy
            int previous_month = custom_Day.AddMonths(-1).Month;

            DailyReport dl_1_pre_month = null;
            // nếu tháng trước là tháng 12 thì ko cần tính thống kê từ đầu năm tới tháng trước của ngày truyền vào
            // do đó dl_1_pre_month chỉ được tính khi tháng trước ko phải là tháng 12
            if (previous_month != 12)
            {
                dl_1_pre_month = Caculate_fromMonth_toMonth_Report(MerID, 1, previous_month, custom_Day.Year);
            }

            DailyReport dl_FDOM_CD = Get_MonthtoDate_Report_By_MerID_Date(MerID, custom_Day);
            DailyReport dl_YeartoDate = Sum_2_DailyReport(dl_1_pre_month, dl_FDOM_CD, firstDayOfYear);
            return dl_YeartoDate;
        }
        /// <summary>
        /// Hàm cộng dữ liệu của 2 DailyReport
        /// </summary>
        /// <param name="dl_1">DailyReport1</param>
        /// <param name="dl_2">DailyReport2</param>
        /// <param name="firstDayOfYear"> ngày đầu của năm</param>
        /// <returns></returns>
        private static DailyReport Sum_2_DailyReport(DailyReport dl_1, DailyReport dl_2, DateTime firstDayOfYear)
        {
            // do thống kê được tạo từ nhiều tháng nên thuộc tính Date trong DailyReport
            // nên tạo đại 1 ngày là ngày bắt đầu của năm (firstDayOfYear) để gắn vào
            DailyReport dl = null;
            // nếu dl_1, dl_2 dều khác null thì mới cộng lại
            if (dl_1 != null && dl_2 != null)
            {
                dl = new DailyReport();
                dl.MerchantID = dl_1.MerchantID;
                dl.MerchantTypeID = dl_1.MerchantTypeID;
                dl.MerchantRegionID = dl_1.MerchantRegionID;
                dl.SaleAmount = dl_1.SaleAmount + dl_2.SaleAmount;
                dl.ReturnAmount = dl_1.SaleAmount + dl_2.SaleAmount;
                dl.SaleCount = dl_1.SaleCount + dl_2.SaleCount;
                dl.ReturnCount = dl_1.ReturnCount + dl_2.ReturnCount;
                dl.DebitCardSaleAmount = dl_1.DebitCardSaleAmount + dl_2.DebitCardSaleAmount;
                dl.MasterCardSaleAmount = dl_1.MasterCardSaleAmount + dl_2.MasterCardSaleAmount;
                dl.VisaCardSaleAmount = dl_1.VisaCardSaleAmount + dl_2.VisaCardSaleAmount;
                dl.DebitCardReturnAmount = dl_1.DebitCardReturnAmount + dl_2.DebitCardReturnAmount;
                dl.MasterCardReturnAmount = dl_1.MasterCardReturnAmount + dl_2.MasterCardReturnAmount;
                dl.VisaCardReturnAmount = dl_1.VisaCardReturnAmount + dl_2.VisaCardReturnAmount;
                dl.DebitCardSaleCount = dl_1.DebitCardSaleCount + dl_2.DebitCardSaleCount;
                dl.MasterCardSaleCount = dl_1.MasterCardSaleCount + dl_2.MasterCardSaleCount;
                dl.VisaCardSaleCount = dl_1.VisaCardSaleCount + dl_2.VisaCardSaleCount;
                dl.DebitCardReturnCount = dl_1.DebitCardReturnCount + dl_2.DebitCardReturnCount;
                dl.MasterCardReturnCount = dl_1.MasterCardReturnCount + dl_2.MasterCardReturnCount;
                dl.VisaCardReturnCount = dl_1.VisaCardReturnCount + dl_2.VisaCardReturnCount;
                dl.NetAmount = dl_1.NetAmount + dl_2.NetAmount;
                dl.NetCount = dl_1.NetCount + dl_2.NetCount;
                dl.Date = firstDayOfYear;
            }
            else if (dl_1 == null) // nếu dl_1 == null thì chỉ cần trả về dl_2
            {
                return dl_2;
            }
            else if (dl_2 == null) // nếu dl_2 == null thì chỉ cần trả về dl_1
            {
                return dl_1;
            }
            return dl;
        }
    }
}
