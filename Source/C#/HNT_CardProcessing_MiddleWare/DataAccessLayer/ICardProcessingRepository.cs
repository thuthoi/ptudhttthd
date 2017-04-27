using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DomainModel;

namespace DataAccessLayer
{
    public interface IAgentRepository : IGenericDataRepository<Agent> { }

    public interface IAccountRepository : IGenericDataRepository<Account> { }

    public interface IMerchantRepository : IGenericDataRepository<Merchant> { }

    public interface IRegistrationFormRepository : IGenericDataRepository<RegistrationForm> { }

    public interface IMerchantTypeRepository : IGenericDataRepository<MerchantType> { }

    public interface IMerchantRegionRepository : IGenericDataRepository<MerchantRegion> { }

    public class AgentRepository : GenericDataRepository<Agent>, IAgentRepository { }

    public class AccountRepository : GenericDataRepository<Account>, IAccountRepository { }

    public class MerchantRepository : GenericDataRepository<Merchant>, IMerchantRepository { }

    public class RegistrationFormRepository : GenericDataRepository<RegistrationForm>, IRegistrationFormRepository { }

    public class MerchantTypeRepository : GenericDataRepository<MerchantType>, IMerchantTypeRepository { }

    public class MerchantRegionRepository : GenericDataRepository<MerchantRegion>, IMerchantRegionRepository { }
}
