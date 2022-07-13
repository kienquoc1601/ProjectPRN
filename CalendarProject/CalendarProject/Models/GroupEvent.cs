using System;
using System.Collections.Generic;

#nullable disable

namespace CalendarProject.Models
{
    public partial class GroupEvent
    {
        public GroupEvent()
        {
            GroupUsers = new HashSet<GroupUser>();
        }

        public int GroupId { get; set; }
        public int AdminId { get; set; }
        public string EventName { get; set; }
        public string Description { get; set; }
        public DateTime Date { get; set; }

        public virtual Admin Admin { get; set; }
        public virtual ICollection<GroupUser> GroupUsers { get; set; }
    }
}
