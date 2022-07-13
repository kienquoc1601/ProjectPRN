using CalendarProject.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CalendarProject
{
    public partial class UserControlDay : UserControl
    {
        int month , year , day ;
        List<Event> list = new List<Event>();
        User currentUser;

        public UserControlDay()
        {
            InitializeComponent();
        }
        private void Today()
        {
            this.BackColor = SystemColors.Window;
        }

        private void UserControlDay_DoubleClick(object sender, EventArgs e)
        {
            DayEventFrm frm = new DayEventFrm(list , currentUser);
            frm.Show();
        }

        private void UserControlDay_Load(object sender, EventArgs e)
        {

        }
        public void ViewDay(int inputDay , int inputMonth , int inputYear, List<Event> eventList ,User inputUser)
        {
            currentUser = inputUser;
            list = (from e in eventList
                    where e.Date.Day == inputDay
                    select e).ToList();
            DateTime now = DateTime.Now;
            day = inputDay;
            month = inputMonth;
            year = inputYear;
            lbDay.Text = day+"";
            lbEvent.Text = list.Count + " events";
            if(day == now.Day && month == now.Month && year == now.Year)
            {
                this.BackColor = SystemColors.Highlight;
            }
        }
    }
}
