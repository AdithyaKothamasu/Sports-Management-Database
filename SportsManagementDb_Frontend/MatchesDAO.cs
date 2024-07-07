using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class MatchesDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Match> getAllMatches()
        {
            List<Match> returnMatches = new List<Match>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all matches
            MySqlCommand command = new MySqlCommand("SELECT * FROM match_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Match m = new Match
                    {
                        match_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        win_player_id = reader.IsDBNull(1) ? 0 : reader.GetInt32(1),
                        lose_player_id = reader.IsDBNull(2) ? 0 : reader.GetInt32(2),
                        win_team_id = reader.IsDBNull(3) ? 0 : reader.GetInt32(3),
                        lose_team_id = reader.IsDBNull(4) ? 0 : reader.GetInt32(4),
                        event_id = reader.IsDBNull(5) ? 0 : reader.GetInt32(5)
                    };
                    returnMatches.Add(m);
                }
            }

            connection.Close();

            return returnMatches;
        }
    }
}