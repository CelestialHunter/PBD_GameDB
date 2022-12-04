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
    /// Interaction logic for GamePage.xaml
    /// </summary>
    public partial class GamePage : Page
    {
        Joc? currentGame;
        Action ret;
        
        public GamePage(Joc j, Action ret)
        {
            InitializeComponent();
            currentGame = DbConn.Instance.getJocuri().Where(x => x.ID_joc == j.ID_joc).FirstOrDefault();
            this.ret = ret;
            fillData();
        }

        public void fillData()
        {
            if (currentGame == null) return;
            
            gameTypeTB.Text = currentGame.Tip_joc;

            playedMatchesTB.Text = String.Format("{0} / {1}", 
                                                currentGame.Numar_partide_jucate,
                                                currentGame.Numar_partide);

            List<Jucator> jucatori = DbConn.Instance.getJucatori();

            player1NameTB.Text = jucatori.Where(j => j.ID_Jucator == currentGame.Jucator_1).ElementAt(0).Nume;
            player1WinsTB.Text = currentGame.Scor_jucator_1.ToString();

            
            player2NameTB.Text = jucatori.Where(j => j.ID_Jucator == currentGame.Jucator_2).ElementAt(0).Nume;
            player2WinsTB.Text = currentGame.Scor_jucator_2.ToString();

            startDateTB.Text = String.Format("{0:d}", currentGame.Data_inceput_joc);
            startDateTB.ToolTip = String.Format("{0:dd/MM/yyyy HH:mm}", currentGame.Data_inceput_joc);

            if (currentGame.Data_sfarsit_joc == null)
            {
                endDateTB.Text = "Joc în desfășurare...";
                endDateTB.FontStyle = FontStyles.Italic;
                endDateTB.Foreground = new SolidColorBrush(Colors.DimGray);

                player1VictoryBT.IsEnabled = true;
                player2VictoryBT.IsEnabled = true;
            }
            else
            {
                endDateTB.Text = String.Format("{0:d}", currentGame.Data_sfarsit_joc);
                endDateTB.ToolTip = String.Format("{0:dd/MM/yyyy HH:mm}", currentGame.Data_sfarsit_joc);
                endDateTB.FontStyle = FontStyles.Normal;
                endDateTB.Foreground = new SolidColorBrush(Colors.Black);

                player1VictoryBT.IsEnabled = false;
                player2VictoryBT.IsEnabled = false;

                if (currentGame.Invingator == currentGame.Jucator_1)
                {
                    player1NameTB.Background = new SolidColorBrush(Colors.LightGreen);
                    player2NameTB.Background = new SolidColorBrush(Colors.Pink);
                }
                else
                {
                    player1NameTB.Background = new SolidColorBrush(Colors.Pink);
                    player2NameTB.Background = new SolidColorBrush(Colors.LightGreen);
                }
            }
        }

        private void gamePageBackBT_PreviewMouseUp(object sender, MouseButtonEventArgs e)
        {
            // exit page
            ret();
        }

        private void player1VictoryBT_Click(object sender, RoutedEventArgs e)
        {
            // add victory for player 1
            DbConn.Instance.addScore(currentGame.ID_joc, currentGame.Jucator_1);
            currentGame = DbConn.Instance.getJocuri().Where(x => x.ID_joc == currentGame.ID_joc).FirstOrDefault();
            fillData();
        }

        private void player2VictoryBT_Click(object sender, RoutedEventArgs e)
        {
            // add victory for player 2
            DbConn.Instance.addScore(currentGame.ID_joc, currentGame.Jucator_2);
            currentGame = DbConn.Instance.getJocuri().Where(x => x.ID_joc == currentGame.ID_joc).FirstOrDefault();
            fillData();
        }

        private void saveGameBT_Click(object sender, RoutedEventArgs e)
        {

        }

        
    }
}
