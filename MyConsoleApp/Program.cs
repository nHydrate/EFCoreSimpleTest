using Acme.TestProject.EFDAL;
using Acme.TestProject.EFDAL.Entity;
using System;
using System.Linq;

namespace MyConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var connectionString = "server=.;initial catalog=TestProject;Integrated Security=SSPI;";
            using (var context = new TestProjectEntities(connectionString))
            {
                var newCustomer = new Customer
                {
                    FirstName = "John",
                    LastName = "Doe"
                };
                context.AddItem(newCustomer);
                context.SaveChanges();
            }
        }
    }
}
