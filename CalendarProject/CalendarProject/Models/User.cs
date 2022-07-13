using System;
using System.Collections.Generic;

#nullable disable

namespace CalendarProject.Models
{
    public partial class User
    {
        public User()
        {
            Events = new HashSet<Event>();
            GroupUsers = new HashSet<GroupUser>();
        }

        public int UserId { get; set; }
        public string Username { get; set; }

        public virtual Account UsernameNavigation { get; set; }
        public virtual ICollection<Event> Events { get; set; }
        public virtual ICollection<GroupUser> GroupUsers { get; set; }
    }
}
