using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq; 
using System.Text;
using System.Threading.Tasks;

namespace sportsmanagementdb
{
    internal class PlayersDAO
    {
    string connectionString = "datasource=localhost;port=3306;username=root;password=root;database=lolla;";

        public List<Player> getAllPlayers()
        {
            List<Player> returnThese = new List<Player>();

            //connect to mysql server

            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            //define the sql statement to fetch all albums
            MySqlCommand command = new MySqlCommand("SELECT * FROM playertable", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Player a = new Player
                    {
                        player_ID = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        player_name = reader.IsDBNull(1) ? null : reader.GetString(1),
                        dob = reader.GetDateTime(2),
                        player_gender = reader.IsDBNull(3) ? null : reader.GetString(3),
                        rep_body_id = reader.IsDBNull(4) ? 0 : reader.GetInt32(4),
                        team_id = reader.IsDBNull(5) ? 0 : reader.GetInt32(5),
                        event_id = reader.IsDBNull(6) ? 0 : reader.GetInt32(6),
                        player_age = reader.IsDBNull(7) ? 0 : reader.GetInt32(7),
                        exp = reader.IsDBNull(8) ? 0 : reader.GetInt32(8)
                    };
                    returnThese.Add(a);

                }
            }
            connection.Close();

            return returnThese;
        }





        public List<Player> searchIds(string searchTerm)
        {
            List<Player> returnThese = new List<Player>();

            //connect to mysql server

            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            string searchWildPhrase =searchTerm;
            //define the sql statement to fetch all albums
            MySqlCommand command = new MySqlCommand();

            command.CommandText = "SELECT * FROM playertable where player_ID=@search";
            command.Parameters.AddWithValue("@search",searchWildPhrase);
            command.Connection = connection;

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Player a = new Player
                    {
                        player_ID = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                        player_name = reader.IsDBNull(1) ? null : reader.GetString(1),
                        dob =reader.GetDateTime(2),
                        player_gender = reader.IsDBNull(3) ? null : reader.GetString(3),
                        rep_body_id = reader.IsDBNull(4) ? 0 : reader.GetInt32(4),
                        team_id = reader.IsDBNull(5) ? 0 : reader.GetInt32(5),
                        event_id = reader.IsDBNull(6) ? 0 : reader.GetInt32(6),
                        player_age = reader.IsDBNull(7) ? 0 : reader.GetInt32(7),
                        exp = reader.IsDBNull(8) ? 0 : reader.GetInt32(8)
                    };
                    returnThese.Add(a);

                }
            }
            connection.Close();

            return returnThese;
        }

        public List<Event> searchEvents(int sportId)
        {
            List<Event> returnEvents = new List<Event>();

            // Connect to MySQL server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL stored procedure to fetch events by sport_id
            MySqlCommand command = new MySqlCommand("proc2", connection);
            command.CommandType = CommandType.StoredProcedure;

            // Add parameter for the stored procedure
            command.Parameters.AddWithValue("@a", sportId); // Pass the integer sportId here

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

        public int getMinPlayers(int age)
        {
            int count = 0;

            // Connect to MySQL server
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                // Define the SQL stored procedure to fetch events by sport_id
                using (MySqlCommand command = new MySqlCommand("proc7", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameter for the stored procedure
                    command.Parameters.AddWithValue("@a1", age); // Pass the integer sportId here

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            count = reader.IsDBNull(0) ? 0 : reader.GetInt32(0);
                        }
                    }
                }
            }

            return count;
        }

        public List<Match> showMatchAfterInsertion(int a1, int a2, int a3, int a4, int a5, int a6)
        {
            List<Match> returnThese = new List<Match>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("proc_3", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@a1", a1);
                command.Parameters.AddWithValue("@a2", a2);
                command.Parameters.AddWithValue("@a3", a3);
                command.Parameters.AddWithValue("@a4", a4);
                command.Parameters.AddWithValue("@a5", a5);
                command.Parameters.AddWithValue("@a6", a6);

                command.ExecuteNonQuery();

                connection.Close();
            }

            return getInsertedMatch(a1, a2, a3, a4, a5, a6);
        }
        public List<Match> getInsertedMatch(int a1, int a2, int a3, int a4, int a5, int a6)
        {
            List<Match> returnThese = new List<Match>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("SELECT * FROM match_table WHERE match_id = @a1 AND win_player_id = @a2 AND lose_player_id = @a3 AND win_team_id = @a4 AND lose_team_id = @a5 AND event_id = @a6", connection);
                command.Parameters.AddWithValue("@a1", a1);
                command.Parameters.AddWithValue("@a2", a2);
                command.Parameters.AddWithValue("@a3", a3);
                command.Parameters.AddWithValue("@a4", a4);
                command.Parameters.AddWithValue("@a5", a5);
                command.Parameters.AddWithValue("@a6", a6);

                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Match e = new Match
                        {
                            match_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                            win_player_id = reader.IsDBNull(1) ? 0 : reader.GetInt32(1),
                            lose_player_id = reader.IsDBNull(2) ? 0 : reader.GetInt32(2),
                            win_team_id = reader.IsDBNull(3) ? 0 : reader.GetInt32(3),
                            lose_team_id = reader.IsDBNull(4) ? 0 : reader.GetInt32(4),
                            event_id = reader.IsDBNull(5) ? 0 : reader.GetInt32(5)
                        };
                        returnThese.Add(e);
                    }
                }

                connection.Close();
            }

            return returnThese;
        }

        public void deletePodiumForGivenEventID(int eid)
        {
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

           
            MySqlCommand command = new MySqlCommand("proc_4", connection);
            command.CommandType = CommandType.StoredProcedure;

           
            command.Parameters.AddWithValue("@a1", eid);

            command.ExecuteNonQuery();

            connection.Close();
        }

        public List<Sport> updateSportName(int eid, string a2)
        {
            List<Sport> returnThese = new List<Sport>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("proc_5", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@a1", eid);
                command.Parameters.AddWithValue("@a2", a2);

                command.ExecuteNonQuery();

                connection.Close();
            }

            return getUpdatedSportName(eid, a2);
        }
        public List<Sport> getUpdatedSportName(int eid, string a2)
        {
            List<Sport> returnThese = new List<Sport>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("SELECT * FROM sport_table WHERE sport_id = @eid AND sport_name=@a2", connection);
                command.Parameters.AddWithValue("@eid", eid);
                command.Parameters.AddWithValue("@a2", a2);
              
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Sport e = new Sport
                        {
                             sport_id = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                            sport_name = reader.IsDBNull(1) ? null : reader.GetString(1),
                            no_of_events = reader.IsDBNull(2) ? 0 : reader.GetInt32(2)
                        };
                        returnThese.Add(e);
                    }
                }

                connection.Close();
            }

            return returnThese;
        }

        public List<Player> updatePlayerAge(int pid, int age)
        {
            List<Player> returnThese = new List<Player>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("UPDATE playertable SET player_age = @a2 WHERE player_ID = @a1", connection);
                command.Parameters.AddWithValue("@a1", pid);
                command.Parameters.AddWithValue("@a2", age);

                command.ExecuteNonQuery();

                connection.Close();
            }

            return getUpdatedPlayerData(pid);
        }

        public List<Player> getUpdatedPlayerData(int pid)
        {
            List<Player> returnThese = new List<Player>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("SELECT * FROM playertable WHERE player_ID = @pid", connection);
                command.Parameters.AddWithValue("@pid", pid);

                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Player e = new Player
                        {
                            player_ID = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                            player_name = reader.IsDBNull(1) ? null : reader.GetString(1),
                            dob = reader.GetDateTime(2),
                            player_gender = reader.IsDBNull(3) ? null : reader.GetString(3),
                            rep_body_id = reader.IsDBNull(4) ? 0 : reader.GetInt32(4),
                            team_id = reader.IsDBNull(5) ? 0 : reader.GetInt32(5),
                            event_id = reader.IsDBNull(6) ? 0 : reader.GetInt32(6),
                            player_age = reader.IsDBNull(7) ? 0 : reader.GetInt32(7),
                            exp = reader.IsDBNull(8) ? 0 : reader.GetInt32(8)
                        };
                        returnThese.Add(e);
                    }
                }

                connection.Close();
            }

            return returnThese;
        }
        public List<Sport> updateSportsTable()
        {
            List<Sport> returnThese = new List<Sport>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("proc_6", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.ExecuteNonQuery();

                connection.Close();
            }

            return getUpdatedSportsData();
        }

        public List<Sport> getUpdatedSportsData()
        {
            List<Sport> returnThese = new List<Sport>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

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
                        returnThese.Add(s);
                    }
                }

                connection.Close();
            }

            return returnThese;
        }

        public List<Event> showSportsAfterInsertion(int a1, string a2, int a3, int a4, DateTime a5, string a6, int a7)
        {
            List<Event> returnThese = new List<Event>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("proc_9", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@a1", a1);
                command.Parameters.AddWithValue("@a2", a2);
                command.Parameters.AddWithValue("@a3", a3);
                command.Parameters.AddWithValue("@a4", a4);
                command.Parameters.AddWithValue("@a5", a5);
                command.Parameters.AddWithValue("@a6", a6);
                command.Parameters.AddWithValue("@a7", a7);

                command.ExecuteNonQuery();

                connection.Close();
            }

            return getInsertedEvent(a1, a2, a3, a4, a5, a6,a7);
        }
        public List<Event> getInsertedEvent(int a1, string a2, int a3, int a4, DateTime a5, string a6,int a7)
        {
            List<Event> returnThese = new List<Event>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("SELECT * FROM event_table WHERE event_id = @a1", connection);
                command.Parameters.AddWithValue("@a1", a1);
               

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
                        returnThese.Add(e);
                    }
                }

                connection.Close();
            }

            return returnThese;
        }

        public List<Player> showPlayersAfterInsertion(int pid, string pname, DateTime dob, string gender, int rbid, int tid, int eid, int age, int exp)
        {
            List<Player> returnThese = new List<Player>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("proc_10", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@a1", pid);
                command.Parameters.AddWithValue("@a2", pname);
                command.Parameters.AddWithValue("@a3", dob);
                command.Parameters.AddWithValue("@a4", gender);
                command.Parameters.AddWithValue("@a5", rbid);
                command.Parameters.AddWithValue("@a6", tid);
                command.Parameters.AddWithValue("@a7", eid);
                command.Parameters.AddWithValue("@a8", age);
                command.Parameters.AddWithValue("@a9", exp);

                command.ExecuteNonQuery();

                connection.Close();
            }

            return getInsertedPlayer(pid);
        }

        public List<Player> getInsertedPlayer(int pid)
        {
            List<Player> returnThese = new List<Player>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand("SELECT * FROM playertable WHERE player_ID = @a1", connection);
                command.Parameters.AddWithValue("@a1", pid);

                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Player e = new Player
                        {
                            player_ID = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
                            player_name = reader.IsDBNull(1) ? null : reader.GetString(1),
                            dob = reader.GetDateTime(2),
                            player_gender = reader.IsDBNull(3) ? null : reader.GetString(3),
                            rep_body_id = reader.IsDBNull(4) ? 0 : reader.GetInt32(4),
                            team_id = reader.IsDBNull(5) ? 0 : reader.GetInt32(5),
                            event_id = reader.IsDBNull(6) ? 0 : reader.GetInt32(6),
                            player_age = reader.IsDBNull(7) ? 0 : reader.GetInt32(7),
                            exp = reader.IsDBNull(8) ? 0 : reader.GetInt32(8)
                        };
                        returnThese.Add(e);
                    }
                }

                connection.Close();
            }

            return returnThese;
        }

        public void deleteEvent(int eventId)
        {
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            MySqlCommand command = new MySqlCommand("DELETE FROM event_table WHERE event_id = @eventId", connection);
            command.Parameters.AddWithValue("@eventId", eventId);

            command.ExecuteNonQuery();

            connection.Close();
        }

    }
}
