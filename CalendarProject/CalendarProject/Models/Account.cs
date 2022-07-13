using System;
using System.Collections.Generic;

#nullable disable

namespace CalendarProject.Models
{
    public partial class Account
    {
        public Account()
        {
            Admins = new HashSet<Admin>();
            Users = new HashSet<User>();
        }

        public string Username { get; set; }
        public string Password { get; set; }
        public bool Admin { get; set; }

        public virtual ICollection<Admin> Admins { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
