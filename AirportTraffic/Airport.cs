using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;

namespace _AirportTraffic
{
    class Airport
    {
        //traffic information
        private string airportName;
        private double runwayFee;
        private int[] monthOfYearArr;
        private int[] numberOfFlightsArr;
        private int[] numberOfPassengersArr;
        private double[] totalRevenueArr;
        private int arrayLength;

        //properties
        public string AirportName
        {
            get
            {
                return airportName;
            }
            set
            {
                airportName = value;
            }
        }

        public double RunwayFee
        {
            get
            {
                return runwayFee;
            }
            set
            {
                runwayFee = value;
            }
        }

        public int[] MonthOfYearArr
        {
            get
            {
                return monthOfYearArr;
            }
            set
            {
                monthOfYearArr = value;
            }
        }

        public int[] NumberOfFlightsArr
        {
            get
            {
                return numberOfFlightsArr;
            }
            set
            {
                numberOfFlightsArr = value;
            }
        }

        public int[] NumberOfPassengersArr
        {
            get
            {
                return numberOfPassengersArr;
            }
            set
            {
                numberOfPassengersArr = value;
            }
        }

        public double[] TotalRevenueArr
        {
            get
            {
                return totalRevenueArr;
            }
            set
            {
                totalRevenueArr = value;
            }
        }

        public int ArrayLength
        {
            get
            {
                return arrayLength;
            }
            set
            {
                arrayLength = value;
            }
        }

        //Convert month to a string
        public string MonthConvert(int num)
        {
            string month = "";
            switch (monthOfYearArr[num])
            {
                case 1:
                    month = "January";
                        break;
                case 2:
                    month = "February";
                        break;
                case 3:
                    month = "March";
                    break;
                case 4:
                    month = "April";
                    break;
                case 5:
                    month = "May";
                    break;
                case 6:
                    month = "June";
                    break;
                case 7:
                    month = "July";
                    break;
                case 8:
                    month = "August";
                    break;
                case 9:
                    month = "September";
                    break;
                case 10:
                    month = "October";
                    break;
                case 11:
                    month = "November";
                    break;
                case 12:
                    month = "December";
                    break;
            }
            return month;
        }

        //Statics: the lowest number
        public int LowestNumber(int[] num)
        {
            int lowest = num[0], index;

            for (int k = 0; k < arrayLength; k++)
            {
                if (num[k] < lowest)
                {
                    lowest = num[k];
                }
            }
            index = Array.IndexOf(num, lowest);
            return index;
        }

        //Statics: the highest number
        public int HighestAirportRevenue(double[] num)
        {
            int index;
            double highest = num[0];
            for (int k = 0; k < arrayLength; k++)
            {
                if (num[k] > highest)
                {
                    highest = num[k];
                }
            }
            index = Array.IndexOf(num, highest);
            return index;
        }

        public override string ToString()
        {
            //Get the lowest number of index
            int flight = LowestNumber(numberOfFlightsArr);
            int passenger = LowestNumber(numberOfPassengersArr);
            int revenue = HighestAirportRevenue(totalRevenueArr);

            return
                "\n ___________________________________________________________________________" +
                "\n\n                       Air Traffic Monitoring (2017)" +
                "\n\n  ----- Location ----------------------------------------------------------" +
                "\n        Airport Name:                      " + airportName +
                "\n        Runway fee:                        " + runwayFee.ToString("C") +
                "\n\n  ------ Statistics -------------------------------------------------------" +
                "\n        The lowest number of flights:      " + MonthConvert(flight) +", " + numberOfFlightsArr[flight]+ " flights"+
                "\n        The lowest number of passengers:   " + MonthConvert(passenger) + ", " + numberOfPassengersArr[passenger] + " passengers"+
                "\n        The highest airport revenue:       " + MonthConvert(revenue) + ", " + totalRevenueArr[revenue].ToString("C") +
                "\n\n  ----- Data for each month -----------------------------------------------" +
                "\n          month         flights        passengers           revenue";
        }
    }
}
