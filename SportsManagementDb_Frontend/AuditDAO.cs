using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sportsmanagementdb
{
    internal class AuditDAO
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Audit> getAllAudits()
        {
            List<Audit> returnAudits = new List<Audit>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all audits
            MySqlCommand command = new MySqlCommand("SELECT * FROM audit_log", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Audit a = new Audit
                    {
                        audit_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        table_name = reader.IsDBNull(1) ? null : reader.GetString(1),
                        action = reader.IsDBNull(2) ? null : reader.GetString(2),
                        old_data = reader.IsDBNull(3) ? null : reader.GetString(3),
                        new_data = reader.IsDBNull(4) ? null : reader.GetString(4),
                        timestamp = reader.IsDBNull(5) ? DateTime.MinValue : reader.GetDateTime(5)
                    };
                    returnAudits.Add(a);
                }
            }

            connection.Close();

            return returnAudits;
        }
    }
}
