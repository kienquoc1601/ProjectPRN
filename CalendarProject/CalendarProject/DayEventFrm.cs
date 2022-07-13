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
    public partial class DayEventFrm : Form
    {
        User currentUser;
        List<Event> eventList = new List<Event>();
        public DayEventFrm(List<Event> list , User inputUser)
        {
            InitializeComponent();
            eventList = list;
            currentUser = inputUser;
            DisplayEvent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {

        }
        public void DisplayEvent()
        {
            

            var events =(from e in eventList
                        select new {e.EventName , e.Description}).ToList();
            dgvEvent.DataSource = events;
            //var categories = (from item in _context.Categories
            //                  select new { item.CategoryId, item.CategoryName }).ToList();
            ////List<Category> categories = _context.Categories.ToList();
            //dgvCategory.DataSource = categories;
            //txtCategoryID.DataBindings.Clear();
            //txtCategoryID.DataBindings.Add("Text", categories, "CategoryID");
            //txtCategoryName.DataBindings.Clear();
            //txtCategoryName.DataBindings.Add("Text", categories, "CategoryName");
        }
    }
}
