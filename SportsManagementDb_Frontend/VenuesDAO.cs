using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class VenuesDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Venue> getAllVenues()
        {
            List<Venue> returnVenues = new List<Venue>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all venues
            MySqlCommand command = new MySqlCommand("SELECT * FROM venue_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Venue v = new Venue
                    {
                        venue_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        name = reader.IsDBNull(1) ? null : reader.GetString(1),
                        location = reader.IsDBNull(2) ? null : reader.GetString(2)
                    };
                    returnVenues.Add(v);
                }
            }

            connection.Close();

            return returnVenues;
        }
    }
}
