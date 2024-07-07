using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class PlayerEventDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<PlayerEvent> getAllPlayerEvents()
        {
            List<PlayerEvent> returnPlayerEvents = new List<PlayerEvent>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all player events
            MySqlCommand command = new MySqlCommand("SELECT * FROM player_event_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    PlayerEvent p = new PlayerEvent
                    {
                        player_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        event_id = reader.IsDBNull(1) ? 0 : reader.GetInt32(1)
                    };
                    returnPlayerEvents.Add(p);
                }
            }

            connection.Close();

            return returnPlayerEvents;
        }
    }
}
