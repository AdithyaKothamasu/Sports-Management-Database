using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class PlaysIn2DAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<PlaysIn2> getAllPlaysIn2Values()
        {
            List<PlaysIn2> returnPlaysIn2Values = new List<PlaysIn2>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all values from plays_in_2_table
            MySqlCommand command = new MySqlCommand("SELECT * FROM plays_in_2_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    PlaysIn2 p = new PlaysIn2
                    {
                        team_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        event_id = reader.IsDBNull(1) ? 0 : reader.GetInt32(1),
                        latest_record_2 = reader.IsDBNull(2) ? null : reader.GetString(2)
                    };
                    returnPlaysIn2Values.Add(p);
                }
            }

            connection.Close();

            return returnPlaysIn2Values;
        }
    }
}
