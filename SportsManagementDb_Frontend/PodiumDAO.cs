using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class PodiumDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Podium> getAllPodium()
        {
            List<Podium> returnPodiums = new List<Podium>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all podiums
            MySqlCommand command = new MySqlCommand("SELECT * FROM podium_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Podium p = new Podium
                    {
                        event_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        first_place_player_id = reader.IsDBNull(1) ? 0 : reader.GetInt32(1),
                        second_place_player_id = reader.IsDBNull(2) ? 0 : reader.GetInt32(2),
                        third_place_player_id = reader.IsDBNull(3) ? 0 : reader.GetInt32(3),
                        first_place_team_id = reader.IsDBNull(4) ? 0 : reader.GetInt32(4),
                        second_place_team_id = reader.IsDBNull(5) ? 0 : reader.GetInt32(5),
                        third_place_team_id = reader.IsDBNull(6) ? 0 : reader.GetInt32(6)
                    };
                    returnPodiums.Add(p);
                }
            }

            connection.Close();

            return returnPodiums;
        }
    }
}