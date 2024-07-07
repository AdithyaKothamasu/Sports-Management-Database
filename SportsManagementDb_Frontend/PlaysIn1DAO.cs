using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class PlaysIn1DAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<PlaysIn1> getAllPlaysIn1Values()
        {
            List<PlaysIn1> returnPlaysIn1Values = new List<PlaysIn1>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all values from plays_in_1_table
            MySqlCommand command = new MySqlCommand("SELECT * FROM plays_in_1_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    PlaysIn1 p = new PlaysIn1
                    {
                        player_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        event_id = reader.IsDBNull(1) ? 0 : reader.GetInt32(1),
                        latest_record_1 = reader.IsDBNull(2) ? null : reader.GetString(2)
                    };
                    returnPlaysIn1Values.Add(p);
                }
            }

            connection.Close();

            return returnPlaysIn1Values;
        }
    }
}
