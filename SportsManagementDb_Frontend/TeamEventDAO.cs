using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class TeamEventDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<TeamEvent> getAllTeamEvents()
        {
            List<TeamEvent> returnTeamEvents = new List<TeamEvent>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all team events
            MySqlCommand command = new MySqlCommand("SELECT * FROM team_event_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    TeamEvent t = new TeamEvent
                    {
                        team_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        event_id = reader.IsDBNull(1) ? 0 : reader.GetInt32(1)
                    };
                    returnTeamEvents.Add(t);
                }
            }

            connection.Close();

            return returnTeamEvents;
        }
    }
}
