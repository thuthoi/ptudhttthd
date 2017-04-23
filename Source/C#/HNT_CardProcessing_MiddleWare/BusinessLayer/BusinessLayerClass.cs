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

        public BusinessLayerClass()
        {
            _agentRepository = new AgentRepository();
            _accountRepository = new AccountRepository();
        }

        public BusinessLayerClass(IAgentRepository agentRepository,
            IAccountRepository accountRepository)
        {
            _agentRepository = agentRepository;
            _accountRepository = accountRepository;
        }

        //Định nghĩa các hàm đã khai báo bên !BusinessLayer

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

        public void UpdateAgent(Agent agent)
        {
            /* Validation and error handling omitted */
            _agentRepository.Update(agent);
        }

        public void RemoveAgent(Agent agent)
        {
            /* Validation and error handling omitted */
            _agentRepository.Remove(agent);
        }

        public void AddAccount(Account account)
        {
            /* Validation and error handling omitted */
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
            if (acc.Password != account.OldPassword)
            {
                return "Mật khẩu cũ không trùng khớp!";
            }
            else
            {
                acc.Password = account.Password;
                _accountRepository.Update(acc);
                return "Đổi mật khẩu thành công!";
            }
        }

        public Account GetAccountBy_Username_Password(String username, String pass)
        {

            return _accountRepository.GetSingle(
                            a => a.Username.Equals(username) &&
                            a.Password.Equals(pass)); //include related agent
        }

        //Merchant
        public void addMerchant(Merchant merchant)
        {
            _merchantRepository.Add(merchant);
        }
    }
}
