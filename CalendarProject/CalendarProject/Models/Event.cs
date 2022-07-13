using System;
using System.Collections.Generic;

#nullable disable

namespace CalendarProject.Models
{
    public partial class Event
    {
        public int EventId { get; set; }
        public int UserId { get; set; }
        public string EventName { get; set; }
        public string Description { get; set; }
        public DateTime Date { get; set; }

        public virtual User User { get; set; }
    }
}
