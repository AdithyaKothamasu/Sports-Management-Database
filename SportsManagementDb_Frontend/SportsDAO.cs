using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class SportsDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Sport> getAllSports()
        {
            List<Sport> returnSports = new List<Sport>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all sports
            MySqlCommand command = new MySqlCommand("SELECT * FROM sport_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Sport s = new Sport
                    {
                        sport_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        sport_name = reader.IsDBNull(1) ? null : reader.GetString(1),
                        no_of_events = reader.IsDBNull(2) ? 0 : reader.GetInt32(2)
                    };
                    returnSports.Add(s);
                }
            }

            connection.Close();

            return returnSports;
        }
    }
}