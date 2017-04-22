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

        //Account
        void AddAccount(Account account);
        void UpdateAccount(Account account);
        void RemoveAccount(Account account);
    }
}

