using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sportsmanagementdb
{
    internal class Match
    {
        public int match_id { get; set; }
        public int win_player_id { get; set; }
        public int lose_player_id { get; set; }
        public int win_team_id { get; set; }
        public int lose_team_id { get; set; }
        public int event_id { get; set; }
    }
}
