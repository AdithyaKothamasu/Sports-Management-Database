using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class HasDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Has> getAllHasValues()
        {
            List<Has> returnHasValues = new List<Has>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all values from has_table
            MySqlCommand command = new MySqlCommand("SELECT * FROM has_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Has h = new Has
                    {
                        event_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        sport_id = reader.IsDBNull(1) ? 0 : reader.GetInt32(1),
                        location = reader.IsDBNull(2) ? null : reader.GetString(2)
                    };
                    returnHasValues.Add(h);
                }
            }

            connection.Close();

            return returnHasValues;
        }
    }
}
