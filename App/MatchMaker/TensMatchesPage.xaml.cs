using MatchMaker.DataBase;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for TensMatchesPage.xaml
    /// </summary>
    public partial class TensMatchesPage : Page
    {
        Action ret;
        
        public TensMatchesPage(Action ret)
        {
            InitializeComponent();
            this.ret = ret;

            fillData();
        }

        private void fillData()
        {
            partideListView.ItemsSource = DbConn.Instance.getJocuri2010();
        }

        private void TextBlock_PreviewMouseUp(object sender, MouseButtonEventArgs e)
        {
            ret();
        }
    }
}
