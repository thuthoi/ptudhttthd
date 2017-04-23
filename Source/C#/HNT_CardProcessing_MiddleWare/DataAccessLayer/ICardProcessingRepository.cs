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

    public interface IMerchantRepository : IGenericDataRepository<Merchant>
    { }

    public interface IRegistrationFormRepository : IGenericDataRepository<RegistrationForm>
    { }

    public class AgentRepository : GenericDataRepository<Agent>, IAgentRepository
    {
    }

    public class AccountRepository : GenericDataRepository<Account>, IAccountRepository
    {
    }

    public class MerchantRepository : GenericDataRepository<Merchant>, IMerchantRepository { }

    public class RegistrationFormRepository : GenericDataRepository<RegistrationForm>, IRegistrationFormRepository { }
}
