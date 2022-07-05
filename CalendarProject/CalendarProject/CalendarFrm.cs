using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CalendarProject
{
    public partial class CalendarFrm : Form
    {
        int month, year;
        public CalendarFrm()
        {
            InitializeComponent();
        }
 

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void CalendarFrm_Load(object sender, EventArgs e)
        {
            DisplayDays();
        }
        private void DisplayDays()
        {
            DateTime now = DateTime.Now;
            month = now.Month;
            year = now.Year;
            String monthName = DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
            lbDate.Text = monthName + " " + year;
            //get first day of month
            DateTime startOfMonth = new DateTime(year, month, 1);
            //get the number of day in the month
            int days = DateTime.DaysInMonth(year,month);
            //convert the startofmonth to integer
            int daysoftheweek = Convert.ToInt32(startOfMonth.DayOfWeek.ToString("d"));

            for(int i = 1; i < daysoftheweek; i++)
            {
                UserControlBlank ucBlank = new UserControlBlank();
                dayContainer.Controls.Add(ucBlank);
            }

            for(int i = 1; i <= days; i++)
            {
                UserControlDay ucDays = new UserControlDay();
                ucDays.day(i);
                dayContainer.Controls.Add(ucDays);
            }
        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            dayContainer.Controls.Clear();
            month--;
            String monthName = DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
            lbDate.Text = monthName + " " + year;
            //get first day of month
            DateTime startOfMonth = new DateTime(year, month, 1);
            //get the number of day in the month
            int days = DateTime.DaysInMonth(year, month);
            //convert the startofmonth to integer
            int daysoftheweek = Convert.ToInt32(startOfMonth.DayOfWeek.ToString("d"));

            for (int i = 1; i < daysoftheweek; i++)
            {
                UserControlBlank ucBlank = new UserControlBlank();
                dayContainer.Controls.Add(ucBlank);
            }

            for (int i = 1; i <= days; i++)
            {
                UserControlDay ucDays = new UserControlDay();
                ucDays.day(i);
                dayContainer.Controls.Add(ucDays);
            }
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            dayContainer.Controls.Clear();
            month++;
            String monthName = DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
            lbDate.Text = monthName + " " + year;
            //get first day of month
            DateTime startOfMonth = new DateTime(year, month, 1);
            //get the number of day in the month
            int days = DateTime.DaysInMonth(year, month);
            //convert the startofmonth to integer
            int daysoftheweek = Convert.ToInt32(startOfMonth.DayOfWeek.ToString("d")) ;

            for (int i = 1; i < daysoftheweek; i++)
            {
                UserControlBlank ucBlank = new UserControlBlank();
                dayContainer.Controls.Add(ucBlank);
            }

            for (int i = 1; i <= days; i++)
            {
                UserControlDay ucDays = new UserControlDay();
                ucDays.day(i);
                dayContainer.Controls.Add(ucDays);
            }
        }
    }
}
