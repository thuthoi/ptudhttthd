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

    public interface IMasterRepository : IGenericDataRepository<Master> { }

    public interface INotificationRepository : IGenericDataRepository<Notification> { }

    public interface IDailyReportRepository : IGenericDataRepository<DailyReport> { }

    public interface IMonthlyReportRepository : IGenericDataRepository<MonthlyReport> { }

    public interface IYearlyReportRepository : IGenericDataRepository<YearlyReport> { }

    public class AgentRepository : GenericDataRepository<Agent>, IAgentRepository { }

    public class AccountRepository : GenericDataRepository<Account>, IAccountRepository { }

    public class MerchantRepository : GenericDataRepository<Merchant>, IMerchantRepository { }

    public class RegistrationFormRepository : GenericDataRepository<RegistrationForm>, IRegistrationFormRepository { }

    public class MerchantTypeRepository : GenericDataRepository<MerchantType>, IMerchantTypeRepository { }

    public class MerchantRegionRepository : GenericDataRepository<MerchantRegion>, IMerchantRegionRepository { }

    public class MasterRepository : GenericDataRepository<Master>, IMasterRepository { }

    public class NotificationRepository : GenericDataRepository<Notification>, INotificationRepository { }

    public class DailyReportRepository : GenericDataRepository<DailyReport>, IDailyReportRepository { }

    public class MonthlyReportRepository : GenericDataRepository<MonthlyReport>, IMonthlyReportRepository { }

    public class YearlyReportRepository : GenericDataRepository<YearlyReport>, IYearlyReportRepository { }
}
