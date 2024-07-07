using System.Security.Cryptography;
using System.Windows.Forms.Design;

namespace sportsmanagementdb
{
    public partial class Form1 : Form
    {
        BindingSource playerBindingSource = new BindingSource();
        public Form1()
        {
            InitializeComponent();
            dataGridView1.BackgroundColor = Color.White;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            PlayersDAO playersDAO = new PlayersDAO();
            //connect the list to the grid view control
            playerBindingSource.DataSource = playersDAO.getAllPlayers();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            PlayersDAO playersDAO = new PlayersDAO();
            //connect the list to the grid view control
            playerBindingSource.DataSource = playersDAO.searchIds(textBox1.Text);

            dataGridView1.DataSource = playerBindingSource;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {

            EventsDAO eventsDAO = new EventsDAO();
            //connect the list to the grid view control
            playerBindingSource.DataSource = eventsDAO.getAllEvents();

            dataGridView1.DataSource = playerBindingSource;

        }


        private void button5_Click(object sender, EventArgs e)
        {
            MatchesDAO matchesDAO = new MatchesDAO();
            playerBindingSource.DataSource = matchesDAO.getAllMatches();

            dataGridView1.DataSource = playerBindingSource;

        }

        private void button6_Click(object sender, EventArgs e)
        {
            PodiumDAO podiumDAO = new PodiumDAO();
            playerBindingSource.DataSource = podiumDAO.getAllPodium();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            SportsDAO sportsDAO = new SportsDAO();
            playerBindingSource.DataSource = sportsDAO.getAllSports();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            PlayersDAO playersDAO = new PlayersDAO();

            // Attempt to parse the text from textBox2 as an integer
            if (int.TryParse(textBox2.Text, out int sportId))
            {
                // Input is a valid integer
                playerBindingSource.DataSource = playersDAO.searchEvents(sportId);
                dataGridView1.DataSource = playerBindingSource;
            }
            else
            {
                // Input is not a valid integer
                MessageBox.Show("Please enter a valid integer for the sport ID.");
            }
        }


        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            PlayersDAO playersDAO = new PlayersDAO();

            // Attempt to parse the text from textBox3 as an integer
            if (int.TryParse(textBox3.Text, out int age))
            {
                // Input is a valid integer
                int count = playersDAO.getMinPlayers(age);
                MessageBox.Show($"Number of players above the age of {age}: {count}");
            }
            else
            {
                // Input is not a valid integer
                MessageBox.Show("Please enter a valid integer for the age.");
            }
        }

        private void button9_Click(object sender, EventArgs e)
        {
            PlayersDAO playersDAO = new PlayersDAO();

            // Attempt to parse the text from textBox3 as an integer
            if (int.TryParse(textBox4.Text, out int a1) && int.TryParse(textBox5.Text, out int a2) && int.TryParse(textBox6.Text, out int a3) && int.TryParse(textBox7.Text, out int a4) && int.TryParse(textBox8.Text, out int a5) && int.TryParse(textBox9.Text, out int a6))
            {
                playerBindingSource.DataSource = playersDAO.showMatchAfterInsertion(a1, a2, a3, a4, a5, a6);
                dataGridView1.DataSource = playerBindingSource;
            }
            else
            {
                // Input is not a valid integer
                MessageBox.Show("Please enter a valid integers.");

            }
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void button10_Click(object sender, EventArgs e)
        {
            PlayersDAO playerDAO = new PlayersDAO();
            if (int.TryParse(textBox10.Text, out int eid))
            {
                // Input is a valid integer
                playerDAO.deletePodiumForGivenEventID(eid);
                MessageBox.Show($"Podium record for the Event ID {eid} is deleted!");
            }
            else
            {
                // Input is not a valid integer
                MessageBox.Show("Please enter a valid integer for the Event Id.");
            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            PlayersDAO playerDAO = new PlayersDAO();
            if (int.TryParse(textBox11.Text, out int sid) && !string.IsNullOrEmpty(textBox12.Text))
            {
                playerBindingSource.DataSource = playerDAO.updateSportName(sid, textBox12.Text);
                dataGridView1.DataSource = playerBindingSource;
            }
            else
            {
                // Input is not a valid integer or the name is null or empty
                MessageBox.Show("Please enter a valid integer for the Sport ID and a non-empty name.");
            }
        }

        private void button12_Click(object sender, EventArgs e)
        {
            PlayersDAO playerDAO = new PlayersDAO();
            if (int.TryParse(textBox13.Text, out int pid) && int.TryParse(textBox14.Text, out int age))
            {
                playerBindingSource.DataSource = playerDAO.updatePlayerAge(pid, age);
                dataGridView1.DataSource = playerBindingSource;
            }
            else
            {
                // Input is not a valid integer or the age is null or empty
                MessageBox.Show("Please enter a valid integer for the Player ID and a non-empty age.");
            }
        }

        private void button13_Click(object sender, EventArgs e)
        {
            PlayersDAO playerDAO = new PlayersDAO();
            playerBindingSource.DataSource = playerDAO.updateSportsTable();
            dataGridView1.DataSource = playerBindingSource;
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button14_Click(object sender, EventArgs e)
        {
            PlayersDAO playersDAO = new PlayersDAO();

            // Attempt to parse the text from textBox3 as an integer
            if (int.TryParse(textBox15.Text, out int a1) &&
                !string.IsNullOrEmpty(textBox16.Text) &&
                int.TryParse(textBox17.Text, out int a3) &&
                int.TryParse(textBox18.Text, out int a4) &&
                DateTime.TryParse(textBox19.Text, out DateTime a5) &&
                !string.IsNullOrEmpty(textBox20.Text) &&
                int.TryParse(textBox21.Text, out int a7))
            {
                playerBindingSource.DataSource = playersDAO.showSportsAfterInsertion(a1, textBox16.Text, a3, a4, a5, textBox20.Text, a7);
                dataGridView1.DataSource = playerBindingSource;
            }
            else
            {
                // Input is not a valid integer
                MessageBox.Show("Please enter valid values.");
            }
        }

        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void button15_Click(object sender, EventArgs e)
        {
            PlayersDAO playersDAO = new PlayersDAO();

            // Attempt to parse the text from textBox3 as an integer
            if (int.TryParse(textBox22.Text, out int pid) && !string.IsNullOrEmpty(textBox23.Text) && DateTime.TryParse(textBox24.Text, out DateTime dob) && !string.IsNullOrEmpty(textBox25.Text) && int.TryParse(textBox26.Text, out int rbid) && int.TryParse(textBox27.Text, out int tid) && int.TryParse(textBox28.Text, out int eid) && int.TryParse(textBox29.Text, out int age) && int.TryParse(textBox30.Text, out int exp))
            {
                playerBindingSource.DataSource = playersDAO.showPlayersAfterInsertion(pid, textBox23.Text, dob, textBox25.Text, rbid, tid, eid, age, exp);
                dataGridView1.DataSource = playerBindingSource;
            }
            else
            {
                // Input is not a valid integer
                MessageBox.Show("Please enter valid values.");
            }
        }

        private void button17_Click(object sender, EventArgs e)
        {
            TeamDAO teamDAO = new TeamDAO();
            playerBindingSource.DataSource = teamDAO.getAllTeams();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button16_Click(object sender, EventArgs e)
        {
            AuditDAO auditDAO = new AuditDAO();
            playerBindingSource.DataSource = auditDAO.getAllAudits();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button20_Click(object sender, EventArgs e)
        {
            PlayerEventDAO playerEventDAO = new PlayerEventDAO();
            playerBindingSource.DataSource = playerEventDAO.getAllPlayerEvents();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button24_Click(object sender, EventArgs e)
        {
            TeamEventDAO teamEventDAO = new TeamEventDAO();
            playerBindingSource.DataSource = teamEventDAO.getAllTeamEvents();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button18_Click(object sender, EventArgs e)
        {
            HasDAO hasDAO = new HasDAO();
            playerBindingSource.DataSource = hasDAO.getAllHasValues();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button21_Click(object sender, EventArgs e)
        {
            PlaysIn1DAO playsIn1DAO = new PlaysIn1DAO();
            playerBindingSource.DataSource = playsIn1DAO.getAllPlaysIn1Values();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button19_Click(object sender, EventArgs e)
        {
            PlaysIn2DAO playsIn2DAO = new PlaysIn2DAO();
            playerBindingSource.DataSource = playsIn2DAO.getAllPlaysIn2Values();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button23_Click(object sender, EventArgs e)
        {
            RepBodiesDAO repBodiesDAO = new RepBodiesDAO();
            playerBindingSource.DataSource = repBodiesDAO.getAllRepBodies();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button22_Click(object sender, EventArgs e)
        {
            VenuesDAO venuesDAO = new VenuesDAO();
            playerBindingSource.DataSource = venuesDAO.getAllVenues();

            dataGridView1.DataSource = playerBindingSource;
        }

        private void button25_Click(object sender, EventArgs e)
        {
            PlayersDAO playerDAO = new PlayersDAO();
            if (int.TryParse(textBox31.Text, out int eventId))
            {
                // Input is a valid integer
                playerDAO.deleteEvent(eventId);
                MessageBox.Show($"Event with Event ID {eventId} has been deleted!");
            }
            else
            {
                // Input is not a valid integer
                MessageBox.Show("Please enter a valid integer for the Event ID.");
            }
        }

        private void label20_Click(object sender, EventArgs e)
        {

        }

        private void label42_Click(object sender, EventArgs e)
        {

        }
    }
}
