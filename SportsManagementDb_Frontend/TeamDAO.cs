using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class TeamDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Team> getAllTeams()
        {
            List<Team> returnTeams = new List<Team>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all teams
            MySqlCommand command = new MySqlCommand("SELECT * FROM teamtable", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Team t = new Team
                    {
                        team_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        name = reader.IsDBNull(1) ? null : reader.GetString(1),
                        rep_body_id = reader.IsDBNull(2) ? 0 : reader.GetInt32(2),
                        event_id = reader.IsDBNull(3) ? 0 : reader.GetInt32(3),
                        no_of_players = reader.IsDBNull(4) ? 0 : reader.GetInt32(4)
                    };
                    returnTeams.Add(t);
                }
            }

            connection.Close();

            return returnTeams;
        }
    }
}
