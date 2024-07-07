using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sportsmanagementdb
{
    internal class Event
    {
        public int event_id { get; set; }
        public string event_name { get; set; }
        public int sport_id { get; set; }
        public int venue_id { get; set; }
        public DateTime date { get; set; }
        public string previous_record { get; set; }
        public int no_of_participants { get; set; }
    }
}
