using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sportsmanagementdb
{
    internal class Player
    {
        public int player_ID { get; set; }
        public string player_name { get; set; }
        public DateTime dob {  get; set; }
        public string player_gender {  get; set; }
        public int rep_body_id {  get; set; }
        public int team_id {  get; set; }
        public int event_id {  get; set; }
        public int player_age { get; set; }   
        public int exp {  get; set; }
    }
}
