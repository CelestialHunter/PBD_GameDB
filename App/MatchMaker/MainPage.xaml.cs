using MatchMaker.DataBase;
using MatchMaker.DataBase.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
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

            this.Language = XmlLanguage.GetLanguage("ro-RO");
        }

        public void enterPage()
        {
            tabControl.SelectedIndex = 0;
        }

        private void TabControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            TabControl? tabControl = sender as TabControl;

            if (tabControl != null)
            {
                TabItem? tabItem = tabControl.SelectedItem as TabItem;

                if(tabItem == partideTab)
                {
                    initPartideTab();

                }
                else if (tabItem == addTab)
                {
                    
                }
                else if (tabItem == statTab)
                {
                    initStats();
                }
            }
        }

        #region Partide Tab
        private void initPartideTab()
        {
            ObservableCollection<Joc> jocuri = new ObservableCollection<Joc>(DbConn.Instance.getJocuri());
            partideListView.ItemsSource = jocuri;
        }

        private void clickOnGame(object sender, MouseButtonEventArgs e)
        {
            Joc? joc = ((ListViewItem)sender).Content as Joc;

            if (joc != null)
            {
                MessageBox.Show("FizzBuzz");
            }
        }
        #endregion

        #region Add Tab

        #endregion

        #region Stat Tab

        public void initStats()
        {
            List<Jucator> bestChessPlayers = DbConn.Instance.getSahMaster();
            if(bestChessPlayers.Count == 0)
            {
                bestChessPlayerTB.Text = "Nu există maiestru la șah...";
                bestChessPlayerTB.FontStyle = FontStyles.Italic;
                bestChessPlayerTB.Foreground = new SolidColorBrush(Colors.DimGray);
            }
            else
            {
                bestChessPlayerTB.Text = bestChessPlayers[0].Nume;
                bestChessPlayerTB.FontStyle = FontStyles.Normal;
                bestChessPlayerTB.Foreground = new SolidColorBrush(Colors.Black);
            }

            String? maxGamesPlayer = DbConn.Instance.getJucatorMaxJocuri();
            if(String.IsNullOrWhiteSpace(maxGamesPlayer))
            {
                mostGamesPlayerTB.Text = "Nu există jucători cu partide jucate în DB...";
                mostGamesPlayerTB.FontStyle = FontStyles.Italic;
                mostGamesPlayerTB.Foreground = new SolidColorBrush(Colors.DimGray);
            }
            else
            {
                mostGamesPlayerTB.Text = maxGamesPlayer;
                mostGamesPlayerTB.FontStyle = FontStyles.Normal;
                mostGamesPlayerTB.Foreground = new SolidColorBrush(Colors.Black);

            }
             
        }

        #endregion

        private void addPlayerBT_Click(object sender, RoutedEventArgs e)
        {
            String playerName = newPlayerNameTB.Text;
            DateTime? playerDoB = newPlayerBDayDP.SelectedDate;
            if (String.IsNullOrWhiteSpace(playerName))
            {
                MessageBox.Show("Introduceți numele jucătorului.", "Eroare", MessageBoxButton.OK, MessageBoxImage.Error);
                newPlayerNameTB.Background = Brushes.Red;
                return;
            }
            else
            {
                newPlayerNameTB.Background = Brushes.White;
            }

            if (playerDoB == null)
            {
                MessageBox.Show("Introduceți data nașterii jucătorului.", "Eroare", MessageBoxButton.OK, MessageBoxImage.Error);
                newPlayerBDayDP.Background = Brushes.Pink;
                return;
            }
            else
            {
                newPlayerBDayDP.Background = Brushes.White;
            }

            DbConn.Instance.adaugaJucator(playerName, playerDoB.Value);

            newPlayerNameTB.Text = "";
            newPlayerBDayDP.SelectedDate = null;
        }

        private void addMatchTB_Click(object sender, RoutedEventArgs e)
        {
            String player1 = player1TB.Text;
            String player2 = player2TB.Text;
            String game = gameTB.Text;
            int matchNo;

            if (!int.TryParse(matchNoTB.Text, out matchNo))
            {
                MessageBox.Show("Introduceți numărul de partide (>0).", "Eroare", MessageBoxButton.OK, MessageBoxImage.Error);
                matchNoTB.Background = Brushes.Red;
                return;
            }
            else
            {
                matchNoTB.Background = Brushes.White;
            }

            if (String.IsNullOrWhiteSpace(player1))
            {
                MessageBox.Show("Introduceți numele primului jucător.", "Eroare", MessageBoxButton.OK, MessageBoxImage.Error);
                player1TB.Background = Brushes.Pink;
                return;
            }
            else
            {
                player1TB.Background = Brushes.White;
            }

            if (String.IsNullOrWhiteSpace(player2))
            {
                MessageBox.Show("Introduceți numele celui de-al doilea jucător.", "Eroare", MessageBoxButton.OK, MessageBoxImage.Error);
                player2TB.Background = Brushes.Pink;
                return;
            }
            else
            {
                player2TB.Background = Brushes.White;
            }

            if (String.IsNullOrWhiteSpace(game))
            {
                MessageBox.Show("Introduceți numele jocului.", "Eroare", MessageBoxButton.OK, MessageBoxImage.Error);
                gameTB.Background = Brushes.Pink;
                return;
            }
            else
            {
                gameTB.Background = Brushes.White;
            }

            if (DbConn.Instance.creeazaJoc(game, player1, player2, matchNo))
            {
                MessageBox.Show("Partida a fost adăugată cu succes.", "Succes", MessageBoxButton.OK, MessageBoxImage.Information);
                resetMatchFields();
            }
            else
            {
                MessageBox.Show("A apărut o eroare la adăugarea partidei.", "Eroare", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void resetMatchFields()
        {
            player1TB.Text = "";
            player2TB.Text = "";
            gameTB.Text = "";
            matchNoTB.Text = "";
        }

        private void TextBlock_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            if (regex.IsMatch(e.Text))
            {
                e.Handled = true;
            }
        }

        private void tensMatchesBT_Click(object sender, RoutedEventArgs e)
        {

        }

        private void playerStatsBT_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ageCategoryCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
