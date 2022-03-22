using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ISIT310Final
{
    public partial class Form1 : Form
    {
        CatModelContainer myCat = new CatModelContainer();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            UpdateCats();
            UpdateComboBoxes();
        }

        private void buttonAddColor_Click(object sender, EventArgs e)
        {
            Color newColor = new Color();
            newColor.ColorValue = textBoxColor.Text;
            myCat.Colors.Add(newColor);
            myCat.SaveChanges();
            MessageBox.Show("A new color is added.");
            UpdateComboBoxes();

        }

        private void buttonActivityLevel_Click(object sender, EventArgs e)
        {
            ActivityLevel newActivityLevel = new ActivityLevel();
            newActivityLevel.ActivityLevelValue = textBoxActivityLevel.Text;
            myCat.ActivityLevels.Add(newActivityLevel);
            myCat.SaveChanges();
            MessageBox.Show("A new activity level is added.");
            UpdateComboBoxes();
        }

        private void buttonAddPlayfullness_Click(object sender, EventArgs e)
        {
            Playfullness newPlayfullness = new Playfullness();
            newPlayfullness.PlayfullnessValue = textBoxPlayfullness.Text;
            myCat.Playfullnesses.Add(newPlayfullness);
            myCat.SaveChanges();
            MessageBox.Show("A new playfullness level is added.");
            UpdateComboBoxes();
        }

        private void buttonAddCat_Click(object sender, EventArgs e)
        {
            Cat newCat = new Cat();
            newCat.Color = (Color)comboBoxColor.SelectedItem;
            newCat.ActivityLevel = (ActivityLevel)comboBoxActivityLevel.SelectedItem;
            newCat.Playfullness = (Playfullness)comboBoxPlayfullness.SelectedItem;
            newCat.Breed = textBoxBreed.Text;

            myCat.Cats.Add(newCat);
            myCat.SaveChanges();
            MessageBox.Show("A new cat is added.");
            UpdateCats();
        }

        private void UpdateComboBoxes()
        {
            comboBoxColor.DataSource = myCat.Colors.ToList();
            comboBoxColor.DisplayMember = "Color";
            comboBoxColor.ValueMember = "ColorValue";

            comboBoxActivityLevel.DataSource = myCat.ActivityLevels.ToList();
            comboBoxActivityLevel.DisplayMember = "Activity Level";
            comboBoxActivityLevel.ValueMember = "ActivityLevelValue";

            comboBoxPlayfullness.DataSource = myCat.Playfullnesses.ToList();
            comboBoxPlayfullness.DisplayMember = "Playfullness";
            comboBoxPlayfullness.ValueMember = "PlayfullnessValue";
        }

        private void UpdateCats()
        {
            var listQuery = from eachCat in myCat.Cats
                            select new
                            {
                                eachCat.Color.ColorValue,
                                eachCat.ActivityLevel.ActivityLevelValue,
                                eachCat.Playfullness.PlayfullnessValue,
                                eachCat.Breed
                            };
            dataGridView1.DataSource = listQuery.ToList();
        }
    }
}
