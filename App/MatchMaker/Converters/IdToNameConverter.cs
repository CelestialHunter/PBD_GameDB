using MatchMaker.DataBase;
using MatchMaker.DataBase.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace MatchMaker.Converters
{
    internal class IdToNameConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            Jucator j = DbConn.Instance.getJucatori().Where<Jucator>(j => j.ID_Jucator == (int)value).ElementAt<Jucator>(0);
            return j.Nume;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
