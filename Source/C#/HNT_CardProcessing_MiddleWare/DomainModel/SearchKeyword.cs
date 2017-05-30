using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class SearchKeyword
    {
        public string Keyword { get; set; }
        public string MerchantType { get; set; }
        public string MerchantRegion { get; set; }
        public string AgentID { get; set; }
        public int Active { get; set; }
    }
}
