using System;

namespace sportsmanagementdb
{
    internal class Team
    {
        public int team_id { get; set; }
        public string name { get; set; }
        public int rep_body_id { get; set; }
        public int event_id { get; set; }
        public int no_of_players { get; set; }
    }
}
