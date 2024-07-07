using System;

namespace sportsmanagementdb
{
    internal class Audit
    {
        public int audit_id { get; set; }
        public string table_name { get; set; }
        public string action { get; set; }
        public string old_data { get; set; }
        public string new_data { get; set; }
        public DateTime timestamp { get; set; }
    }
}
