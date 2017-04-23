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
        //Agent
        Agent GetAgentByUsername(string username);
        void AddAgent(Agent agent);
        void UpdateAgent(Agent agent);
        void RemoveAgent(Agent agent);

        //Account
        void AddAccount(Account account);
        void UpdateAccount(Account account);
        void RemoveAccount(Account account);

        Account GetAccountBy_Username_Password(String username, String passs);
    }
}

