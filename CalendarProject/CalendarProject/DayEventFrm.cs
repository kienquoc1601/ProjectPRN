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
    public partial class DayEventFrm : Form
    {
        int selectedID ;
        User currentUser;
        List<Event> eventList = new List<Event>();
        DateTime date = new DateTime();
        calendarDBContext context = new calendarDBContext();
        public DayEventFrm(List<Event> list , User inputUser , DateTime inputDate)
        {
            InitializeComponent();
            eventList = list;
            currentUser = inputUser;
            date = inputDate;
            lbDate.Text = DateTimeFormatInfo.CurrentInfo.GetMonthName(date.Month) +" " +date.Day + " , "+date.Year;
            DisplayEvent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            AddEventFrm frm = new AddEventFrm(date , currentUser);
            frm.Show();
        }
        public void DisplayEvent()
        {
            var events =(from e in context.Events
                         where e.UserId == currentUser.UserId && e.Date == date
                        select new {e.EventId, e.EventName , e.Description}).ToList();
            //context.Users.Find(e.UserId).Username,
            dgvEvent.DataSource = events;
            
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            DisplayEvent();
        }

        private void dgvEvent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = this.dgvEvent.Rows[e.RowIndex];
            selectedID = int.Parse(row.Cells["EventId"].Value.ToString());
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            context.Events.Remove(context.Events.Find(selectedID));
            context.SaveChanges();
            DisplayEvent();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            Event nEvent = context.Events.Find(selectedID);
            EditEventFrm frm = new EditEventFrm(nEvent);
            frm.Show();
        }

        private void lbDate_Click(object sender, EventArgs e)
        {

        }
    }
}
