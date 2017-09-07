using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DbUp;
using System.Reflection;
using System.Configuration;
using DbUp.Helpers;

namespace DNBMigration
{
    class Program
    {
        static int Main(string[] args)
        {

            var connectionString = "Data Source="+ConfigurationManager.AppSettings["RDS_HOSTNAME"]+"; Database="+ConfigurationManager.AppSettings["RDS_DATABASE"]+"; User ID="+ConfigurationManager.AppSettings["RDS_USERNAME"]+"; Password="+ConfigurationManager.AppSettings["RDS_PASSWORD"];
            EnsureDatabase.For.SqlDatabase(connectionString);
            //var upgrader =
            //    DeployChanges.To
            //        .SqlDatabase(connectionString)
            //        .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
            //        .LogToConsole()
            //        .Build();

  //          var upgrader = DeployChanges.To
  //.SqlDatabase(connectionString)
  //.WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
  //.LogToConsole()
  //.LogScriptOutput()
  //.Build();

            //var result = upgrader.PerformUpgrade();
            var schemaUpgrader =
    DeployChanges.To
        .SqlDatabase(connectionString)
        .WithScriptsEmbeddedInAssembly(typeof (Program).Assembly, s => IsSchemaScriptName(s))
        .WithTransaction()
        .LogToConsole()
        .LogScriptOutput()
        .Build();

var schemaResult = schemaUpgrader.PerformUpgrade();

if (!schemaResult.Successful)
{
    Console.ForegroundColor = ConsoleColor.Red;
    Console.WriteLine(schemaResult.Error);
    Console.ResetColor();
#if DEBUG
    Console.ReadLine();
#endif
    return -1;
}

var storedProcUpgrader =
    DeployChanges.To
        .SqlDatabase(connectionString)
        .WithScriptsEmbeddedInAssembly(typeof(Program).Assembly, s => IsStoredProcScriptName(s))
        .JournalTo(new NullJournal())
        .WithTransaction()
        .LogToConsole()
        .LogScriptOutput()
        .Build();

var storedProcResult = storedProcUpgrader.PerformUpgrade();



if (!storedProcResult.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(storedProcResult.Error);
                Console.ResetColor();
#if DEBUG
                Console.ReadLine();
#endif
                return -1;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
            return 0;
        }

        private static bool IsStoredProcScriptName(string s)
        {
            if (s.Contains("proc"))
                return true;
            else
                return false;    
        }

        private static bool IsSchemaScriptName(string s)
        {
            if(s.Contains("Schema"))
                return true;
                    else
                return false;                     
        }
    }
}
