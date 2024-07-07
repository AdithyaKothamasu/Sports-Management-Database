using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class EventsDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Event> getAllEvents()
        {
            List<Event> returnEvents = new List<Event>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all events
            MySqlCommand command = new MySqlCommand("SELECT * FROM event_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Event e = new Event
                    {
                        event_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        event_name = reader.IsDBNull(1) ? null : reader.GetString(1),
                        sport_id = reader.IsDBNull(2) ? 0 : reader.GetInt32(2),
                        venue_id = reader.IsDBNull(3) ? 0 : reader.GetInt32(3),
                        date = reader.IsDBNull(4) ? DateTime.MinValue : reader.GetDateTime(4),
                        previous_record = reader.IsDBNull(5) ? null : reader.GetString(5),
                        no_of_participants = reader.IsDBNull(6) ? 0 : reader.GetInt32(6)
                    };
                    returnEvents.Add(e);
                }
            }

            connection.Close();

            return returnEvents;
        }
    }
}