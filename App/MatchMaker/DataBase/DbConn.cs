using MatchMaker.DataBase.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MatchMaker.DataBase
{
    internal class DbConn
    {
        private String connString = "Server=localhost;Port=3306;Database=pbd_db;Uid=root;Pwd='';";
        MySqlConnection conn;

        // singleton
        private static DbConn? instance = null;

        public static DbConn Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DbConn();
                }
                return instance;
            }
        }

        private DbConn()
        {
            conn = new MySqlConnection(connString);
        }

        public bool testConnection()
        {
            try
            {
                conn.Open();
                conn.Close();
                return true;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return false;
            }
        }

        public List<Joc> getJocuri()
        {
            List<Joc> jocuriList = new List<Joc>();

            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM jocuri", conn);
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int ID_joc = Convert.IsDBNull(reader["ID_joc"]) ? 0 : (int)reader["ID_joc"];
                    string Tip_joc = Convert.IsDBNull(reader["Tip_joc"]) ? "" : (string)reader["Tip_joc"];
                    int Jucator_1 = Convert.IsDBNull(reader["Jucator_1"]) ? 0 : (int)reader["Jucator_1"];
                    int Jucator_2 = Convert.IsDBNull(reader["Jucator_2"]) ? 0 : (int)reader["Jucator_2"];
                    int Numar_partide = Convert.IsDBNull(reader["Numar_partide"]) ? 0 : (int)reader["Numar_partide"];
                    int Numar_partide_jucate = Convert.IsDBNull(reader["Numar_partide_jucate"]) ? 0 : (int)reader["Numar_partide_jucate"];
                    DateTime? Data_inceput_joc = Convert.IsDBNull(reader["Data_inceput_joc"]) ? null : (DateTime?)reader["Data_inceput_joc"];
                    DateTime? Data_sfarsit_joc = Convert.IsDBNull(reader["Data_sfarsit_joc"]) ? null : (DateTime?)reader["Data_sfarsit_joc"];
                    int Scor_jucator_1 = Convert.IsDBNull(reader["Scor_jucator_1"]) ? 0 : (int)reader["Scor_jucator_1"];
                    int Scor_jucator_2 = Convert.IsDBNull(reader["Scor_jucator_2"]) ? 0 : (int)reader["Scor_jucator_2"];
                    int Invingator = Convert.IsDBNull(reader["Invingator"]) ? 0 : (int)reader["Invingator"];

                    Joc joc = new Joc(ID_joc, Tip_joc, Jucator_1, Jucator_2, Numar_partide, Numar_partide_jucate,
                        Data_inceput_joc, Data_sfarsit_joc, Scor_jucator_1, Scor_jucator_2, Invingator);
                    jocuriList.Add(joc);
                }
                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                conn.Close();
            }

            return jocuriList;
        }

        public List<Jucator> getJucatori()
        {
            List<Jucator> listaJucatori = new List<Jucator>();

            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM jucatori", conn);
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int ID_Jucator = Convert.IsDBNull(reader["ID_Jucator"]) ? 0 : (int)reader["ID_Jucator"];
                    string Nume = Convert.IsDBNull(reader["Nume"]) ? "" : (string)reader["Nume"];
                    DateTime? Data_nastere = Convert.IsDBNull(reader["Data_nastere"]) ? null : (DateTime)reader["Data_nastere"];
                    DateTime? Data_inscriere = Convert.IsDBNull(reader["Data_inscriere"]) ? null : (DateTime)reader["Data_inscriere"];

                    Jucator jucator = new Jucator(ID_Jucator, Nume, Data_nastere, Data_inscriere);
                    listaJucatori.Add(jucator);
                }
                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                conn.Close();
            }

            return listaJucatori;
        }

        public bool creeazaJoc(String tipjoc, String numeJucator1, String numeJucator2, int nrPartide)
        {
            bool retVal;
            int errCode;
            String statusMsg;
            
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("creeazaJoc", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("tipjoc", tipjoc);
                cmd.Parameters.AddWithValue("numeJucator1", numeJucator1);
                cmd.Parameters.AddWithValue("numeJucator2", numeJucator2);
                cmd.Parameters.AddWithValue("nrPartide", nrPartide);

                cmd.Parameters.Add(new MySqlParameter("@errCode", MySqlDbType.Int32));
                cmd.Parameters["@errCode"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add(new MySqlParameter("@statusMsg", MySqlDbType.VarChar, 70));
                cmd.Parameters["@statusMsg"].Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                errCode = Convert.IsDBNull(cmd.Parameters["@errCode"].Value) ? 0 : (int)cmd.Parameters["@errCode"].Value;
                statusMsg = Convert.IsDBNull(cmd.Parameters["@statusMsg"].Value) ? "" : (string)cmd.Parameters["@statusMsg"].Value;

                conn.Close();
                retVal = errCode == 0;
                if (!retVal) MessageBox.Show(statusMsg);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                conn.Close();
                retVal = false;
            }

            return retVal;
        }

        public List<Joc> getJocuri2010()
        {
            List<Joc> jocuriList = new List<Joc>();

            int errCode;
            string statusMsg;

            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("getJocuri2010", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new MySqlParameter("@errCode", MySqlDbType.Int32));
                cmd.Parameters["@errCode"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add(new MySqlParameter("@statusMsg", MySqlDbType.VarChar, 70));
                cmd.Parameters["@statusMsg"].Direction = ParameterDirection.Output;

                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int ID_joc = Convert.IsDBNull(reader["ID_joc"]) ? 0 : (int)reader["ID_joc"];
                    string Tip_joc = Convert.IsDBNull(reader["Tip_joc"]) ? "" : (string)reader["Tip_joc"];
                    int Jucator_1 = Convert.IsDBNull(reader["Jucator_1"]) ? 0 : (int)reader["Jucator_1"];
                    int Jucator_2 = Convert.IsDBNull(reader["Jucator_2"]) ? 0 : (int)reader["Jucator_2"];
                    int Numar_partide = Convert.IsDBNull(reader["Numar_partide"]) ? 0 : (int)reader["Numar_partide"];
                    int Numar_partide_jucate = Convert.IsDBNull(reader["Numar_partide_jucate"]) ? 0 : (int)reader["Numar_partide_jucate"];
                    DateTime? Data_inceput_joc = Convert.IsDBNull(reader["Data_inceput_joc"]) ? null : (DateTime?)reader["Data_inceput_joc"];
                    DateTime? Data_sfarsit_joc = Convert.IsDBNull(reader["Data_sfarsit_joc"]) ? null : (DateTime?)reader["Data_sfarsit_joc"];
                    int Scor_jucator_1 = Convert.IsDBNull(reader["Scor_jucator_1"]) ? 0 : (int)reader["Scor_jucator_1"];
                    int Scor_jucator_2 = Convert.IsDBNull(reader["Scor_jucator_2"]) ? 0 : (int)reader["Scor_jucator_2"];
                    int Invingator = Convert.IsDBNull(reader["Invingator"]) ? 0 : (int)reader["Invingator"];
                    int Durata_joc = Convert.IsDBNull(reader["Durata_joc"]) ? 0 : (int)reader["Durata_joc"];

                    Joc joc = new Joc(ID_joc, Tip_joc, Jucator_1, Jucator_2, Numar_partide, Numar_partide_jucate,
                        Data_inceput_joc, Data_sfarsit_joc, Scor_jucator_1, Scor_jucator_2, Invingator, Durata_joc);
                    jocuriList.Add(joc);
                }

                reader.Close();

                errCode = Convert.IsDBNull(cmd.Parameters["@errCode"].Value) ? 0 : (int)cmd.Parameters["@errCode"].Value;
                statusMsg = Convert.IsDBNull(cmd.Parameters["@statusMsg"].Value) ? "" : (string)cmd.Parameters["@statusMsg"].Value;

                if (errCode != 0)
                {
                    MessageBox.Show(statusMsg);
                    conn.Close();
                    return jocuriList;
                }

                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                conn.Close();
            }

            return jocuriList;
        }

        public Jucator? getJucatorMaxJocuri()
        {
            Jucator? jucator = null;
            int errCode;
            string statusMsg;

            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("getjucatorMaxJocuri", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new MySqlParameter("@errCode", MySqlDbType.Int32));
                cmd.Parameters["@errCode"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add(new MySqlParameter("@statusMsg", MySqlDbType.VarChar, 70));
                cmd.Parameters["@statusMsg"].Direction = ParameterDirection.Output;

                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int ID_Jucator = Convert.IsDBNull(reader["ID_Jucator"]) ? 0 : (int)reader["ID_Jucator"];
                    string Nume = Convert.IsDBNull(reader["Nume"]) ? "" : (string)reader["Nume"];
                    DateTime? Data_nastere = Convert.IsDBNull(reader["Data_nastere"]) ? null : (DateTime)reader["Data_nastere"];
                    DateTime? Data_inscriere = Convert.IsDBNull(reader["Data_inscriere"]) ? null : (DateTime)reader["Data_inscriere"];
                    jucator = new Jucator(ID_Jucator, Nume, Data_nastere, Data_inscriere);
                }

                reader.Close();

                errCode = Convert.IsDBNull(cmd.Parameters["@errCode"].Value) ? 0 : (int)cmd.Parameters["@errCode"].Value;
                statusMsg = Convert.IsDBNull(cmd.Parameters["@statusMsg"].Value) ? "" : (string)cmd.Parameters["@statusMsg"].Value;

                if (errCode != 0)
                {
                    MessageBox.Show(statusMsg);
                    conn.Close();
                    return null;
                }

                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                conn.Close();
            }

            return jucator;
        }
        
        public List<Jucator> getSahMaster()
        {
            // use stored procedure getSahMaster

            List<Jucator> listaMaiestrii = new List<Jucator>();
            int errCode;
            string statusMsg;

            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("getSahMaster", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new MySqlParameter("@errCode", MySqlDbType.Int32));
                cmd.Parameters["@errCode"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add(new MySqlParameter("@statusMsg", MySqlDbType.VarChar, 70));
                cmd.Parameters["@statusMsg"].Direction = ParameterDirection.Output;

                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int ID_Jucator = Convert.IsDBNull(reader["ID_Jucator"]) ? 0 : (int)reader["ID_Jucator"];
                    string Nume = Convert.IsDBNull(reader["Nume"]) ? "" : (string)reader["Nume"];
                    DateTime? Data_nastere = Convert.IsDBNull(reader["Data_nastere"]) ? null : (DateTime)reader["Data_nastere"];
                    DateTime? Data_inscriere = Convert.IsDBNull(reader["Data_inscriere"]) ? null : (DateTime)reader["Data_inscriere"];
                    int Victorii = Convert.IsDBNull(reader["Victorii"]) ? 0 : (int)(Int64)reader["Victorii"];
                    listaMaiestrii.Add(new Jucator(ID_Jucator, Nume, Data_nastere, Data_inscriere, Victorii));
                }
                reader.Close();

                errCode = Convert.IsDBNull(cmd.Parameters["@errCode"].Value) ? 0 : (int)cmd.Parameters["@errCode"].Value;
                statusMsg = Convert.IsDBNull(cmd.Parameters["@statusMsg"].Value) ? "" : (string)cmd.Parameters["@statusMsg"].Value;

                if (errCode != 0)
                {
                    MessageBox.Show(statusMsg);
                    conn.Close();
                    return listaMaiestrii;
                }
                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                conn.Close();
            }

            return listaMaiestrii;
        }

        public Jucator? getMaiestruCategVarsta(int minVarst, int maxVarst)
        {
            // use stored procedure getMaiestruCategVarsta

            Jucator? jucator = null;

            int errCode = 0;
            string statusMsg = "";

            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("getMaiestruCategVarsta", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@minVarst", minVarst);
                cmd.Parameters["@minVarst"].Direction = ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@maxVarst", maxVarst);
                cmd.Parameters["@maxVarst"].Direction = ParameterDirection.Input;

                cmd.Parameters.Add(new MySqlParameter("@errCode", MySqlDbType.Int32));
                cmd.Parameters["@errCode"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add(new MySqlParameter("@statusMsg", MySqlDbType.VarChar, 70));
                cmd.Parameters["@statusMsg"].Direction = ParameterDirection.Output;

                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int ID_Jucator = Convert.IsDBNull(reader["ID_Jucator"]) ? 0 : (int)reader["ID_Jucator"];
                    string Nume = Convert.IsDBNull(reader["Nume"]) ? "" : (string)reader["Nume"];
                    DateTime? Data_nastere = Convert.IsDBNull(reader["Data_nastere"]) ? null : (DateTime)reader["Data_nastere"];
                    DateTime? Data_inscriere = Convert.IsDBNull(reader["Data_inscriere"]) ? null : (DateTime)reader["Data_inscriere"];
                    int Victorii = Convert.IsDBNull(reader["Victorii"]) ? 0 : (int)(Int64)reader["Victorii"];
                    jucator = new Jucator(ID_Jucator, Nume, Data_nastere, Data_inscriere, Victorii);
                }

                reader.Close();

                errCode = Convert.IsDBNull(cmd.Parameters["@errCode"].Value) ? 0 : (int)cmd.Parameters["@errCode"].Value;
                statusMsg = Convert.IsDBNull(cmd.Parameters["@statusMsg"].Value) ? "" : (string)cmd.Parameters["@statusMsg"].Value;

                if (errCode != 0)
                {
                    MessageBox.Show(statusMsg);
                    conn.Close();
                    return null;
                }
                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                conn.Close();
            }

            return jucator;
        }
    }
}
