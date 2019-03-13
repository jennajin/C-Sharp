using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;

namespace _BankAccount
{
    class SavingsApp
    {
        public static void Main(string[] args)
        {
            //Enter information from client1
            Savings client1 = new Savings();
            WriteLine("\t\t\t\tClient 1\n");
            client1.FirstName = AskClient("first name");
            client1.LastName = AskClient("last name");
            client1.SIN = AskClient("Social Insurance Number");
            client1.HomeAddress = AskClient("Home address");
            client1.MonthReport = AskClient("month");
            client1.YearReport = AskClient("year");
            Write("Enter opening balance: ");
            client1.SetOpeningBalance(double.Parse(ReadLine()));
            Write("Enter amount of deposit: ");
            client1.SetTotalDeposit(double.Parse(ReadLine()));
            Write("Enter amount of withdrawal: ");
            client1.SetTotalWithdrawal(double.Parse(ReadLine()));
            Write("Enter number of debit transactions: ");
            client1.SetNumberOfTransactions(int.Parse(ReadLine()));

            //Display monthly report of client 1
            DisplayClient1(client1);
            ReadKey();

            //clear client 1 information   
            Clear();

            //Enter information from client 2
            WriteLine("\t\t\t\tClient 2\n");
            Savings client2 = new Savings("", "", "", "", "3", "2017", 10000, 5000, 3000, 2);
            client2.FirstName = AskClient("first name");
            client2.LastName = AskClient("last name");
            client2.SIN = AskClient("Social Insurance Number");
            client2.HomeAddress = AskClient("Home address");

            //Display monthly report of client 2
            DisplayClient2(client2);
            ReadKey();
        }

        public static string AskClient(string info)
        {
            Write("Enter {0}: ", info);
            string value1 = ReadLine();
            return value1;
        }

        public static void DisplayClient1(Savings client1)
        {
            Write(client1.ToString());
            WriteLine("\n\tClosing balance:               {0:c}" +
                      "\n\tInterest rate:                 {1:c}" +
                      "\n\tDebit transaction fee:         {2:c}" +
                      "\n\tAnnual fee:                    {3:c}",
            client1.ClosingBalance(), client1.InterestRate(), client1.TransactionFee(), client1.AnnualFee());
        }

        public static void DisplayClient2(Savings client2)
        {
            WriteLine(client2.ToString());
            WriteLine("\tClosing balance:                {0:c}" +
                     "\n\tInterest rate:                 {1:c}" +
                     "\n\tDebit transaction fee:         {2:c}" +
                     "\n\tAnnual fee:                    {3:c}",
           client2.ClosingBalance(), client2.InterestRate(), client2.TransactionFee(), client2.AnnualFee());
        }
    }
}
