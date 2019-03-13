using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;

namespace _AirportTraffic
{
    class AirportApp
    {
        static void Main(string[] args)
        {
            //Default constructor
            Airport airport1 = new Airport();

            //initialize arrays
            airport1.MonthOfYearArr = new int[100];
            airport1.NumberOfFlightsArr = new int[100];
            airport1.NumberOfFlightsArr = new int[100];
            airport1.NumberOfPassengersArr = new int[100];
            airport1.TotalRevenueArr = new double[100];

            //User input menu
            UserMenu(airport1);
            ReadKey();
        }

        //menu
        public static void UserMenu(Airport airport)
        {
            Clear();
            int list;
            bool validation = false;
            WriteLine("*****************************************************************");
            WriteLine("**               Airport Monitoring System (2017)              **");
            WriteLine("**                                                             **");
            WriteLine("**     1. Add Airport Data      2. Display       3. Exit:      **");
            WriteLine("*****************************************************************");
            
            while (!validation)
            {
                Write("\t\tEnter a number of list (1~3): ");
                if (Int32.TryParse(ReadLine(), out list))
                {
                    switch (list)
                    {
                        case 1:
                            validation = true;
                            AddAirportData(airport);
                            break;
                        case 2:
                            validation = true;
                            DisplayUserInput(airport);
                            break;
                        case 3:
                            validation = true;
                            System.Environment.Exit(-1);
                            break;
                        default:
                            WriteLine("\tPlease select correct number.");
                            break;
                    }
                }
                else
                {
                    WriteLine("\tPlease select correct number.");
                }
                
            }
        }

        //User input data
        public static void AddAirportData(Airport airport)
        {
            Clear();
            int i = 0;
            bool multiMonth = true;

            //call user input method
            airport.AirportName = AskUserAirport(airport);
            airport.RunwayFee = AskUserFee();

            while (multiMonth) {
                airport.MonthOfYearArr[i] = AskUserMonth(airport);
                airport.NumberOfFlightsArr[i] = AskUserNumber("Flights");
                airport.NumberOfPassengersArr[i] = AskUserNumber("Passengers");

                //calculate total revenue
                airport.TotalRevenueArr[i] = airport.RunwayFee * airport.NumberOfFlightsArr[i];
                //input another month
                multiMonth = EnterMultipleMonths();
                i++;
                airport.ArrayLength = i; //actual array
            }
            DisplayUserInput(airport);
        }

        //Enter airport name
        public static string AskUserAirport(Airport airport)
        {
            string inputValue = ".";
            do
            {
                Write("Enter airport name: ");
                inputValue = ReadLine();
                if (inputValue != "")
                {
                    //clear previous array
                    Array.Clear(airport.MonthOfYearArr, 0, airport.MonthOfYearArr.Length);
                    Array.Clear(airport.NumberOfFlightsArr, 0, airport.NumberOfFlightsArr.Length);
                    Array.Clear(airport.NumberOfPassengersArr, 0, airport.NumberOfPassengersArr.Length);
                    Array.Clear(airport.TotalRevenueArr, 0, airport.TotalRevenueArr.Length);
                }
                else
                {
                    WriteLine("\tAirport name cannot be blank.");
                }
            } while (inputValue == "");

            return inputValue;
        }

        //Enter runway fee
        public static double AskUserFee()
        {
            bool validation = false;
            double inputValue = 0;
            do
            {
                Write("Enter runway fee ($1,500 ~ $3,500): ");
                if (double.TryParse(ReadLine(), out inputValue))
                {
                    if(inputValue > 1499.99 && inputValue <= 3500)
                    {
                        validation = true;
                    }
                    else
                    {
                        validation = false;
                        WriteLine("\tRunway charge must be greater than $1,499.99 and less than or equal to $3,500.00");
                    }
                }
                else
                {
                    validation = false;
                    WriteLine("\tPlease enter numeric value.");
                }
            } while (!validation);
            return inputValue;
        }

        //Enter a month
        public static int AskUserMonth(Airport airport)
        {
            bool validation = false;
            int month = 0;           
            do
            {
                Write("Enter a month of 2016 (1~12): ");
                if (int.TryParse(ReadLine(), out month) && month > 0 && month < 13)
                {                 
                    if (Array.IndexOf(airport.MonthOfYearArr, month) < 0)
                    {
                        validation = true;
                    }
                    else
                    {
                        WriteLine("\tThe month is already entered.");
                        validation = false;
                    }
                } else
                {
                    WriteLine("\tYou need to enter a valid month (1~12).");
                    validation = false;
                }
            } while (!validation);
            return month;
        }

        //Enter number of flights and passengers
        public static int AskUserNumber(string ask)
        {
            bool validation = false;
            int num=0;
            do
            {
                Write("Enter total number of {0}: ", ask);
                if (int.TryParse(ReadLine(), out num) && num >= 0)
                {
                    validation = true;
                } else if(num < 0)
                {
                    WriteLine("\tThe number is cannot be negative.");
                    validation = false;
                }
                else
                {
                    WriteLine("\tPlease Enter a number.");
                    validation = false;
                }
            } while (!validation);
            return num;
        }

        //Ask user to enter multiple months
        public static bool EnterMultipleMonths()
        {
            bool multi = false;
            char answer = 'N';
            Write("Do you want to enter another month? (Y/N) ");
            if (char.TryParse(ReadLine(), out answer))
            {
                if(char.ToUpper(answer) == 'Y')
                {
                    multi = true;
                } else if (char.ToUpper(answer) == 'N')
                {
                    multi = false;
                }
                else
                {
                    WriteLine("\tPlease Enter Y or N.");
                    EnterMultipleMonths();
                }
            }
            else
            {
                WriteLine("\tPlease Enter Y or N.");
                EnterMultipleMonths();
            }
            return multi;
        }

        //Display Airport Report
        public static void DisplayUserInput(Airport airport)
        {
            Clear();
            bool validation = false;
            char answer = 'N';
            if (airport.ArrayLength != 0)
            {
                WriteLine(airport.ToString());
                for (int j = 0; j < airport.ArrayLength; j++)
                {
                    WriteLine("           {0}            {1}            {2}            {3:C}",
                            airport.MonthOfYearArr[j].ToString("00"),                    
                            airport.NumberOfFlightsArr[j].ToString("0000"), 
                            airport.NumberOfPassengersArr[j].ToString("000000"),
                            airport.TotalRevenueArr[j]);
                 }
                WriteLine(" ___________________________________________________________________________");
            }
            else
            {
                WriteLine("\n ___________________________________________________________________________");
                WriteLine("\n\t\t\tThere is no traffic information.");
                WriteLine(" ___________________________________________________________________________");
            }

            //Return to main menu
            while (!validation)
            {
                Write("\nReturn to menu? (Y/N): ");
                if(char.TryParse(ReadLine(), out answer))
                {
                    if (char.ToUpper(answer) == 'Y')
                    {
                        validation = true;
                        UserMenu(airport);
                    }
                    else if (char.ToUpper(answer) == 'N')
                    {
                        System.Environment.Exit(-1);
                    }
                    else
                    {
                        Write("\tPlease enter Y or N.");
                    }
                }
                else
                {
                    Write("\tPlease enter Y or N.");
                }
            }
        }
    }
}
