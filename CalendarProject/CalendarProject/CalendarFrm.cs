using CalendarProject.Models;
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
        calendarDBContext context = new calendarDBContext();
        int month, year;
        User currentUser;
        Account currentAccount;

        public CalendarFrm(User inputUser , Account inputAccount)
        {
            
            InitializeComponent();
            currentUser = inputUser;
            currentAccount = inputAccount;
            userMenu.Text = currentUser.Username;
            if (currentAccount.Admin)
            {
                adminMenu.Text = "Admin";
            }
            else
            {
                adminMenu.Text = "User";
            }
            DateTime now = DateTime.Now;
            DisplayDays(now.Month, now.Year);
        }
 

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void CalendarFrm_Load(object sender, EventArgs e)
        {
            
        }
        
        private void DisplayDays(int inputMonth , int inputYear)
        {
            dayContainer.Controls.Clear();
            month = inputMonth;
            year = inputYear;
            DateTime startDate = new DateTime(year, month, 1);
            DateTime endDate = new DateTime(year, month, DateTime.DaysInMonth(year, month));
            List<Event> monthEvent = (from e in context.Events 
                                      where e.Date >= startDate && e.Date <= endDate && e.UserId == currentUser.UserId
                                      select e).ToList();
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
                ucDays.ViewDay(i , month ,year , monthEvent,currentUser);
                dayContainer.Controls.Add(ucDays);
            }
        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            
            if (month == 1)
            {
                year--;
                month = 12;
            }
            else
            {
                month--;
            }
            //loadEvent(month, year);
            DisplayDays(month, year);
            
        }

        private void addEventToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            AddEventFrm frm = new AddEventFrm(now , currentUser);
            
            frm.Show();
        }

        private void refreshViewToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            
            DisplayDays(now.Month, now.Year);
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            
            if(month == 12)
            {
                year++;
                month = 1;
            }
            else
            {
                month++;
            }
            //loadEvent(month, year);
            DisplayDays(month, year);
            
        }
    }
}
