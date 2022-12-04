using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchMaker.DataBase.Models
{
    public class Joc
    {
        public int ID_joc { get; private set; }
        public string Tip_joc { get; private set; }
        public int Jucator_1 { get; private set; }
        public int Jucator_2 { get; private set; }
        public int Numar_partide { get; private set; }
        public int Numar_partide_jucate { get; private set; }
        public DateTime? Data_inceput_joc { get; private set; }
        public DateTime? Data_sfarsit_joc { get; private set; }
        public int Scor_jucator_1 { get; private set; }
        public int Scor_jucator_2 { get; private set; }
        public int Invingator { get; private set; }

        public int Durata_joc { get; private set; }


        public Joc(int ID_joc, string Tip_joc, int Jucator_1, int Jucator_2, int Numar_partide, int Numar_partide_jucate, 
            DateTime? Data_inceput_joc, DateTime? Data_sfarsit_joc, int Scor_jucator_1, int Scor_jucator_2, int Invingator)
        {
            this.ID_joc = ID_joc;
            this.Tip_joc = Tip_joc;
            this.Jucator_1 = Jucator_1;
            this.Jucator_2 = Jucator_2;
            this.Numar_partide = Numar_partide;
            this.Numar_partide_jucate = Numar_partide_jucate;
            this.Data_inceput_joc = Data_inceput_joc;
            this.Data_sfarsit_joc = Data_sfarsit_joc;
            this.Scor_jucator_1 = Scor_jucator_1;
            this.Scor_jucator_2 = Scor_jucator_2;
            this.Invingator = Invingator;
        }

        public Joc(int ID_joc, string Tip_joc, int Jucator_1, int Jucator_2, int Numar_partide, int Numar_partide_jucate, 
            DateTime? Data_inceput_joc, DateTime? Data_sfarsit_joc, int Scor_jucator_1, int Scor_jucator_2, int Invingator, int Durata_joc) 
            : this(ID_joc, Tip_joc, Jucator_1, Jucator_2, Numar_partide, Numar_partide_jucate, 
                  Data_inceput_joc, Data_sfarsit_joc, Scor_jucator_1, Scor_jucator_2, Invingator)
        {
            this.Durata_joc = Durata_joc;
        }

        public override string ToString()
        {
            //return base.ToString();
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(String.Format("ID_joc: {0}", ID_joc));

            sb.AppendLine(String.Format("Tip_joc: {0}", Tip_joc));
            
            sb.AppendLine(String.Format("Jucator_1: {0}", Jucator_1));

            sb.AppendLine(String.Format("Jucator_2: {0}", Jucator_2));

            sb.AppendLine(String.Format("Numar_partide: {0}", Numar_partide));

            sb.AppendLine(String.Format("Numar_partide_jucate: {0}", Numar_partide_jucate));

            sb.AppendLine(String.Format("Data_inceput_joc: {0}", Data_inceput_joc));

            sb.AppendLine(String.Format("Data_sfarsit_joc: {0}", Data_sfarsit_joc));

            sb.AppendLine(String.Format("Scor_jucator_1: {0}", Scor_jucator_1));

            sb.AppendLine(String.Format("Scor_jucator_2: {0}", Scor_jucator_2));

            sb.AppendLine(String.Format("Invingator: {0}", Invingator));

            sb.AppendLine(String.Format("Durata_joc: {0}", Durata_joc));

            return sb.ToString();
        }
    }
}
