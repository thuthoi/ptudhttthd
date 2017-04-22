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

            IList<Agent> agents = businessLayer.GetAllAgent();
            foreach (Agent agent in agents)
                Console.WriteLine(string.Format("{0} - {1}", agent.AgentName, agent.Address));

            Console.ReadLine();
        }
    }
}
