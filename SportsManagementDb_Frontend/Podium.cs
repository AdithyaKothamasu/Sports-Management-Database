using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sportsmanagementdb
{
    internal class Podium
    {
        public int event_id { get; set; }
        public int first_place_player_id { get; set; }
        public int second_place_player_id { get; set; }
        public int third_place_player_id { get; set; }
        public int first_place_team_id { get; set; }
        public int second_place_team_id { get; set; }
        public int third_place_team_id { get; set; }
    }
}
