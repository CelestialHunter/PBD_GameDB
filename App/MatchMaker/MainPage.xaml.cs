using MatchMaker.DataBase;
using MatchMaker.DataBase.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void TabControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            TabControl tabControl = sender as TabControl;

            if (tabControl != null)
            {
                TabItem tabItem = tabControl.SelectedItem as TabItem;

                if(tabItem == partideTab)
                {
                    initPartideTab();

                }
                else if (tabItem == addTab)
                {
                    
                }
                else if (tabItem == statTab)
                {
                        
                }
            }
        }

        #region Partide Tab
        private void initPartideTab()
        {
            ObservableCollection<Joc> jocuri = new ObservableCollection<Joc>(DbConn.Instance.getJocuri());
            partideListView.ItemsSource = jocuri;
        }
        #endregion

        #region Add Tab

        #endregion

        #region Stat Tab

        #endregion
    }
}
