using MatchMaker.DataBase;
using MatchMaker.DataBase.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MatchMaker
{
    /// <summary>
    /// Interaction logic for PlayerStatPage.xaml
    /// </summary>
    public partial class PlayerStatPage : Page
    {
        Action ret;

        DataTable dt;
        
        public PlayerStatPage(Action ret)
        {
            InitializeComponent();
            this.ret = ret;

            fillData();
        }

        private void fillData()
        {
            playersCB.ItemsSource = DbConn.Instance.getJucatori();

            dt = DbConn.Instance.getRaportJucatori();

            partideListView.ItemsSource = dt.DefaultView;
        }

        private void playersCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataTable filteredDt = new DataTable();
            if (dt.Select("Nume = '" + ((Jucator)playersCB.SelectedItem).Nume + "'").Length != 0)
                filteredDt = dt.Select("Nume = '" + ((Jucator)playersCB.SelectedItem).Nume + "'").CopyToDataTable();
            partideListView.ItemsSource = filteredDt.DefaultView;
        }

        private void TextBlock_PreviewMouseUp(object sender, MouseButtonEventArgs e)
        {
            ret();
        }
    }
}
