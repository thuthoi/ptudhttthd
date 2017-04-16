using BusinessLayer;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            IBusinessLayer businessLayer = new BusinessLayerClass();

            /* Create agent and insert them to the database through the business layer */
            Agent agent01 = new Agent()
            {
                AgentID = "AGENT0001",
                AgentName = "AGENT 01"
            };

            businessLayer.AddAgent(agent01);

            Agent agent02 = new Agent()
            {
                AgentID = "AGENT0002",
                AgentName = "AGENT 02"
            };

            businessLayer.AddAgent(agent02);


            /* Create some accounts and insert them to the database through the business layer */
            Account account01 = new Account()
            {
                Username = "ptcthu",
                UserID = agent01.AgentID
            };

            businessLayer.AddAccount(account01);

            Account account02 = new Account()
            {
                Username = "thuthoi",
                UserID = agent01.AgentID
            };

            businessLayer.AddAccount(account02);

            /* Get a single agent by username */
            Agent it = businessLayer.GetAgentByUsername(account01.Username);
            if (it != null)
            {
                Console.WriteLine(string.Format("{0} -  {1}", it.AgentID, it.AgentName));
            };

            /* Remove agent*/
            businessLayer.RemoveAgent(agent02);

            /* Update an existing agent */
            it.AgentName = "NEW AGENT 01";
            businessLayer.UpdateAgent(it);

            Console.WriteLine(string.Format("{0} -  {1}", it.AgentID, it.AgentName));


            /* Remove account*/
            businessLayer.RemoveAccount(account01);

            /* Update an existing account */
            account02.UserID = "AGENT0003";
            businessLayer.UpdateAccount(account02);

            Console.WriteLine(string.Format("{0} -  {1}", account02.UserID, account02.Username));

            Console.ReadLine();
        }
    }
}
