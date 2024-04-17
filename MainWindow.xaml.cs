using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
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

namespace udodPizza
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        UdodPizzaEntities db = new UdodPizzaEntities();
        List<foodInOrder> foods = new List<foodInOrder>();
        public MainWindow()
        {
            InitializeComponent();
            var food = db.food.ToList();
            var category = db.category.ToList();
            var product = from f in food join c in category on f.id_c equals c.id_c select new { id = f.id_f, cat = c.name_c, name_f = f.name_f, price = f.price };
            listProduct.ItemsSource = product;
            listProduct.SelectedValuePath = "id";
        }

        private void listProduct_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var food = db.food.First(x=> x.id_f == (int)listProduct.SelectedValue);
            nameFood.Text = food.name_f;
            nameFood.Visibility = Visibility;
            countFood.Visibility = Visibility;
            countLabel.Visibility = Visibility;
            addOrder.Visibility = Visibility;
        }

        private void confitmBtn_Click(object sender, RoutedEventArgs e)
        {
            Window1 window1 = new Window1();
            this.Close();
            window1.Show();
        }

        private void addOrder_Click(object sender, RoutedEventArgs e)
        {
            var food = db.food.First(x => x.id_f == (int)listProduct.SelectedValue);
            foodInOrder f = new foodInOrder();
            f.id = food.id_f;
            f.category = (int)food.id_c;
            f.name_f = food.name_f;
            f.price = (decimal)food.price;
            f.count = Convert.ToInt32(countFood.Text);
            foods.Add(f);
            MessageBox.Show("Добавлено!");
        }
    }
}
