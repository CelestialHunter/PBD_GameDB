using MatchMaker.DataBase;
using MatchMaker.DataBase.Models;
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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void exitBT_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void enterBT_Click(object sender, RoutedEventArgs e)
        {
            menuGrid.Visibility = Visibility.Hidden;
            mainPage.Visibility = Visibility.Visible;
            backBT.Visibility = Visibility.Visible;
        }

        private void backBT_Click(object sender, RoutedEventArgs e)
        {
            menuGrid.Visibility = Visibility.Visible;
            mainPage.Visibility = Visibility.Hidden;
            backBT.Visibility = Visibility.Hidden;
        }

        private void Image_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            System.Diagnostics.Process.Start(new System.Diagnostics.ProcessStartInfo("https://upt.ro/") { UseShellExecute=true}) ;
        }

        private void Image_MouseLeftButtonDown_1(object sender, MouseButtonEventArgs e)
        {
            System.Diagnostics.Process.Start(new System.Diagnostics.ProcessStartInfo("https://github.com/CelestialHunter/PBD_GameDB") { UseShellExecute = true });
        }
    }
}
