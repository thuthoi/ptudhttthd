using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DomainModel;

namespace DataAccessLayer
{
    public interface IAgentRepository : IGenericDataRepository<Agent>
    {
    }

    public interface IAccountRepository : IGenericDataRepository<Account>
    {
    }

    public class AgentRepository : GenericDataRepository<Agent>, IAgentRepository
    {
    }

    public class AccountRepository : GenericDataRepository<Account>, IAccountRepository
    {
    }
}
