using DomainModel;
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
        Agent GetAgentByUsername(string username);
        void AddAgent(Agent agent);
        void UpdateAgent(Agent agent);
        void RemoveAgent(Agent agent);
        IList<Agent> GetAllAgent();
        string generateAgentID();
        Agent getAgentByAgentID(string id);

        //Account
        void AddAccount(Account account);
        void UpdateAccount(Account account);
        void RemoveAccount(Account account);
        string ChangePassword(Account account);
        IList<Account> GetAccountBy_Username_Password(String username, String passs);
        IList<Account> getAllAccount();
        string getRoleByUsername(string _username);

        //Merchant
        void addMerchant(Merchant _merchant);
        Merchant getMerchantByMerchantID(string id);
        IList<Merchant> getAllMerchant();
        IList<Merchant> getMerchantByMerchantIDtoList(string id);
        string generateMerchantID();
        string updateMerchant(Merchant merchant);
        IList<Merchant> getMerchant_NotHave_Account();
        //RegistrationForm
        void addRegistrationForm(RegistrationForm _registrationForm);
        string generateRegID();
        IList<RegistrationForm> getAllRegistionForm();
        RegistrationForm getAllRegistrationFormByRegID(string id);

        //MerchantType 
        IList<MerchantType> getAllMerchantType();

        //MerchantRegion
        IList<MerchantRegion> getAllMerchantRegion();

        // Master
        IList<Master> getAllMaster();
        IList<Master> getMaster_NotHave_Account();

        // Agent
        IList<Agent> getAgent_NotHave_Account();
    }
}

