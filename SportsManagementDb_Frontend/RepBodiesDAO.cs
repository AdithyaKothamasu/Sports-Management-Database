using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class RepBodiesDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<RepBody> getAllRepBodies()
        {
            List<RepBody> returnRepBodies = new List<RepBody>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all representing bodies
            MySqlCommand command = new MySqlCommand("SELECT * FROM representing_body_table", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    RepBody r = new RepBody
                    {
                        rep_body_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        name = reader.IsDBNull(1) ? null : reader.GetString(1)
                    };
                    returnRepBodies.Add(r);
                }
            }

            connection.Close();

            return returnRepBodies;
        }
    }
}
