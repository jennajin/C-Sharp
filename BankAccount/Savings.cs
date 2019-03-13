using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;

namespace _BankAccount
{
    public class Savings
    {
        //fixed by bank
        public const double INTEREST_RATE = 1.00;
        public const double TRANSACTION_FEE = 5.00;
        public const double ANNUAL_FEE = 60.00;

        //account information
        private string firstName;
        private string lastName;
        private string sin;
        private string homeAddress;
        private string monthReport;
        private string yearReport;
        private double openingBalance;
        private double totalDeposit;
        private double totalWithdrawal;
        private int numberOfTransactions;

        //default constructor
        public Savings()
        {
        }

        //overloaded constructor
        public Savings(string fname, string lname, string sinum, string addr, string mreport, string yreport, double balance, double deposit, double withdrawal, int transaction)
        {
            firstName = fname;
            lastName = lname;
            sin = sinum;
            homeAddress = addr;
            monthReport = mreport;
            yearReport = yreport;
            openingBalance = balance;
            totalDeposit = deposit;
            totalWithdrawal = withdrawal;
            numberOfTransactions = transaction;
        }

        //properties
        public string FirstName
        {
            get
            {
                return firstName;
            }
            set
            {
                firstName = value;
            }
        }

        public string LastName
        {
            get
            {
                return lastName;
            }
            set
            {
                lastName = value;
            }
        }

        public string SIN
        {
            get
            {
                return sin;
            }
            set
            {
                sin = value;
            }
        }

        public string HomeAddress
        {
            get
            {
                return homeAddress;
            }
            set
            {
                homeAddress = value;
            }
        }
       
        public string MonthReport
        {
            get
            {
                return monthReport;
            }
            set
            {
                monthReport = value;
            }
        }

        public string YearReport
        {
            get
            {
                return yearReport;
            }
            set
            {
                yearReport = value;
            }
        }

        //mutator: sets a value
        public void SetOpeningBalance(double balance)
        {
            openingBalance = balance;
        }

        public void SetTotalDeposit(double deposit)
        {
            totalDeposit = deposit;
        }

        public void SetTotalWithdrawal(double withdrawal)
        {
            totalWithdrawal = withdrawal;
        }

        public void SetNumberOfTransactions(int transaction)
        {
            numberOfTransactions = transaction;
        }

        //accessor: retrieves a value
        public double GetOpeningBalance()
        {
            return openingBalance;
        }

        public double GetTotalDeposit()
        {
            return totalDeposit;
        }

        public double GetTotalWithdrawal()
        {
            return totalWithdrawal;
        }

        public int GetNumberOfTransactions()
        {
            return numberOfTransactions;
        }

        //transaction fee
        public double TransactionFee()
        {
            return numberOfTransactions * TRANSACTION_FEE;
        }

        //annual fee per month
        public double AnnualFee()
        {
            return ANNUAL_FEE / 12;
        }

        //updated balance
        public double UpdatedBalance()
        {
            double fees = TransactionFee() + AnnualFee();
            return openingBalance + totalDeposit - totalWithdrawal - fees;
        }

        //interest amount
        public double InterestRate()
        {
            return UpdatedBalance() * INTEREST_RATE / 100;
        }

        //closing balance
        public double ClosingBalance()
        {
            return UpdatedBalance() + InterestRate();
        }

        //display
        public override string ToString()
        {
            return
                "\n\n================================================================================" +
                "\n==   ***************************                                               ==" +
                "\n==   ***  ┏┓ ┏┓   △▷ 　***            JJ BANK                                 ==" +
                "\n==   **   ┃┃ ┃┃  ◁▽ 　****                                                    ==" +
                "\n==   **  ㅇ≡▽≡ㅇノ  *********   The Smart savings account                      ==" +
                "\n==   ***************************                                  Manager: Jin ==" +
                "\n=================================================================================" +
                "\n\tFirst Name:                    " + firstName + 
                "\n\tLast Name:                     " + lastName +
                "\n\tSocial Insurance Number:       " + sin +
                "\n\tHome address:                  " + homeAddress +
                "\n\tMonth of Report:               " + monthReport +
                "\n\tYear of Report:                " + yearReport +
                "\n\tOpening balance:               " + openingBalance.ToString("c") +
                "\n\tTotal deposit amount:          " + totalDeposit.ToString("c") +
                "\n\tTotal withdrawal amount:       " + totalWithdrawal.ToString("c") +
                "\n\tNumber of transactions:        " + numberOfTransactions.ToString("n0");
        }
    }
}
