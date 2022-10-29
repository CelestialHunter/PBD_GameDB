using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchMaker.DataBase.Models
{
    internal class Jucator
    {
        public int ID_Jucator { get; private set; }
        public string Nume { get; private set; }
        public DateTime? Data_nastere { get; private set; }
        public DateTime? Data_inscriere { get; private set; }
        public int Victorii { get; private set; }

        public Jucator(int ID_Jucator, string Nume, DateTime? Data_nastere, DateTime? Data_inscriere)
        {
            this.ID_Jucator = ID_Jucator;
            this.Nume = Nume;
            this.Data_nastere = Data_nastere;
            this.Data_inscriere = Data_inscriere;
        }

        public Jucator(int ID_Jucator, string Nume, DateTime? Data_nastere, DateTime? Data_inscriere, int Victorii)
            : this(ID_Jucator, Nume, Data_nastere, Data_inscriere)
        {
            this.Victorii = Victorii;
        }

        public override string ToString()
        {
            //return base.ToString();

            StringBuilder sb = new StringBuilder();
            sb.AppendLine(String.Format("ID_Jucator: {0}", ID_Jucator));

            sb.AppendLine(String.Format("Nume: {0}", Nume));

            sb.AppendLine(String.Format("Data_nastere: {0}", Data_nastere));

            sb.AppendLine(String.Format("Data_inscriere: {0}", Data_inscriere));

            sb.AppendLine(String.Format("Victorii: {0}", Victorii));

            return sb.ToString();
        }
    }
}
