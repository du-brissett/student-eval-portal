using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StatePersistence;

public partial class SystemAdmin_RoleComponentItems : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CreateSource();
            //Assigns the number of rows to the Listboxes based on the impacting question items
            lbQuestionnaire.Rows = BusinessLogic.GetQuestionnaireItemsCount(); 
            lbQuestionSelections.Rows = BusinessLogic.GetQuestionnaireItemsCount();

            /// <Checking for previously saved items>
            /// Executes query to get question items that (if any) were previously saved.
            /// LoadControlState returns a DataTable which is stored in Assign. The if
            /// statement ascertains if Assign contains any previously saved data. If true,
            /// user will be prompted and can proceed to load using the Load Progress button.
            /// </Checking for previously saved items>
            DataTableReader Assign = new DataTableReader(BusinessLogic.LoadControlState("Assigned")); 
                        
            if (Assign.HasRows == true) 
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Load", "alert('You have previously saved your progress. Click Load Progress to continue.');", true);             
            }
        }       
    }
   
    protected void ddlRoleComponent_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblRoleName.Text = ddlFacultyRole.SelectedValue;
    }

    protected void CreateSource()
    {
        /// <Initial population of Listboxes>
        /// GetQuestionnaireItems returns and IEnumerable dataset of the all the relevant question
        /// items from the database. This dataset is used to bind to the listbox to display the question
        /// number and a part of the question. 
        /// </Initial population of Listboxes>
        lbQuestionnaire.DataSource = BusinessLogic.GetQuestionnaireItems();
        lbQuestionnaire.DataValueField = "Result";
        lbQuestionnaire.DataBind();

        /// <Listbox Containers>
        /// First DataTable created to contain the data for the Question items listbox. Second table stores
        /// the assigned items as they are removed and added. Primary key was defined to enable sorting of the
        /// items after they have been removed. The first table is then populated with the current items in the 
        /// lbQuestionnaire listbox (this table will serve as the data source for subsequent removal and addition).
        /// </<Listbox Containers>
        DataTable QuestionItems = new DataTable();
        QuestionItems.TableName = "Question Items"; 
        QuestionItems.Columns.Add(new DataColumn("QuestionID", typeof(Int32)));
        QuestionItems.Columns.Add(new DataColumn("QuestionTextCombined", typeof(string)));
        QuestionItems.PrimaryKey = new DataColumn[] { QuestionItems.Columns["QuestionID"] }; 
        QuestionItems.DefaultView.ApplyDefaultSort = true;
        DataRow itemRow;

        foreach (ListItem list in lbQuestionnaire.Items)
        {
            itemRow = QuestionItems.NewRow();
            itemRow[0] = list.ToString().Substring(0, 2);
            itemRow[1] = list.ToString();
            QuestionItems.Rows.Add(itemRow);
        }

        Session["Items"] = QuestionItems;

        DataTable AssignedItems = new DataTable();
        AssignedItems.TableName = "Assigned Items";
        AssignedItems.Columns.Add(new DataColumn("QuestionID", typeof(Int32)));
        AssignedItems.Columns.Add(new DataColumn("AssignedTextCombined", typeof(string)));
        AssignedItems.PrimaryKey = new DataColumn[] { AssignedItems.Columns["QuestionID"] };
        AssignedItems.DefaultView.ApplyDefaultSort = true;

        Session["Assigns"] = AssignedItems;
    }

    protected void btnAssign_Click(object sender, EventArgs e)
    {
        if (lbRoleComponent.Text != "" && lbQuestionnaire.Text != "") //If button is clicked and no items were selected....
        {
            DataTable QuestionItems = (DataTable)Session["Items"];

            DataTable AssignedItems = (DataTable)Session["Assigns"];

            /*<------------ Populating dataSource for adding to assigned listbox ------------>*/
            DataRow aiRow;
            aiRow = AssignedItems.NewRow();

            aiRow[0] = Convert.ToInt32(lbQuestionnaire.Text.Substring(0, 2)); // Takes the number from the text in the listbox. This is to be used as the ID; refer to table structure
            aiRow[1] = lbRoleComponent.Text + " | " + lbQuestionnaire.Text; // Takes the selected component along with the question item and combine them

            AssignedItems.Rows.Add(aiRow); // Add newly assigned item to the AssignedItems table
            lbQuestionSelections.DataSource = AssignedItems; // Sets the table as the datasource for the listbox
            lbQuestionSelections.DataTextField = "AssignedTextCombined"; //Use ONLY the combined column to populate the listbox (listboxes support only 1 column)
            lbQuestionSelections.DataBind();
            /*--------------------------------------------------------------------------------*/
            
            /*<-------------- Removing items from the dataSource for questionnaire items listbox -------------->*/
            int ID = Convert.ToInt32(lbQuestionnaire.SelectedValue.Substring(0, 2)); //Gets ID of selected item by taking the first two characters
                                    
            var rows = QuestionItems.Select("QuestionID = " + ID); // Performs a select operation with criteria: "SELECT * FROM QuestionItems WHERE ID = ID"
            foreach (var row in rows) 
            {
                row.Delete(); // Deletes the specified row from the DEFAULTVIEW of the QuestionItems table
            }
            
            QuestionItems.AcceptChanges(); // Because the delete operation removed a row from the defaultview, the change made has to be committed to reflect in the actual datatable.

            int count = QuestionItems.Rows.Count;
            lbQuestionnaire.Items.Clear(); // Clears all items in the listbox for it to be repopulated with the updated DataTable
            DataRow[] qiRow = QuestionItems.Select(); // Selects all from the DataTable and assigns it to the DataRow array
            for (int i = 0; i < count; i++)
                lbQuestionnaire.Items.Add(qiRow[i][1].ToString()); // Loops through the DataTable and adding each item from the combined column to the listbox
            
            Session["Items"] = QuestionItems;
            Session["Assign"] = AssignedItems;   
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select a role component and its question item.');", true);            
        }
    }

    protected void btnUnAssign_Click(object sender, EventArgs e)
    {
        if (lbQuestionSelections.SelectedIndex != -1)
        {
            DataTable AssignedItems = (DataTable)Session["Assigns"];

            DataTable QuestionItems = (DataTable)Session["Items"];

            string assignedItem = lbQuestionSelections.SelectedValue;//Gets selected assigned item text so that the question item number (stored as ID) can be extracted
            int index = assignedItem.IndexOf('|') + 2;
            int ID = Convert.ToInt32(assignedItem.Substring(index, 2)); //Extracts item number
            string questionnaireItem = assignedItem.Substring(index, assignedItem.Length - index); //Extracts Item for lbQuestionnaire reinsert

            var rows = AssignedItems.Select("QuestionID = " + ID);
            foreach (var row in rows)
            {
                row.Delete();
            }
            
            lbQuestionSelections.DataSource = AssignedItems;
            lbQuestionSelections.DataTextField = "AssignedTextCombined";
            lbQuestionSelections.DataBind();

            DataRow qRow;
            qRow = QuestionItems.NewRow();

            qRow[0] = ID;
            qRow[1] = questionnaireItem;

            QuestionItems.Rows.Add(qRow);

            int count = QuestionItems.Rows.Count;
            lbQuestionnaire.Items.Clear();
            DataRow[] qiRow = QuestionItems.Select();
            for (int i = 0; i < count; i++)
                lbQuestionnaire.Items.Add(qiRow[i][1].ToString());

            Session["Items"] = QuestionItems;
            Session["Assign"] = AssignedItems;
        }
        else
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Select an item to unassign.');", true);            
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (lbQuestionSelections.Items.Count == (BusinessLogic.GetQuestionnaireItemsCount() - 1))
        {
            DataTable AssignedItems = (DataTable)Session["Assigns"];
                      
            foreach (DataRow aiRow in AssignedItems.Rows)
            {
                int length = aiRow["AssignedTextCombined"].ToString().IndexOf('|') - 1;
                string test = aiRow["AssignedTextCombined"].ToString().Substring(0, length);
                BusinessLogic.UpdateQuestionnaire(aiRow["AssignedTextCombined"].ToString().Substring(0, length), Convert.ToInt32(aiRow["QuestionID"]));
            }
        }
        else
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please assign ALL question items to a role.');", true);
    }


    /// <Persisting Listboxes>
    /// Adds each row of the Assigned Item table at the point it is saved
    /// as an instance of the AssignedRow class. Each class (1 row of table) is 
    /// added to the instantiated object of the AssignedTable class, 'Assigns'.
    /// The AssignedTable has a List<> variable which stores each class (a row) 
    /// and in effect emulates a table. The 'tables are then stored in their 
    /// appropriate profile property.
    /// </Persisting Listboxes>
    public new void SaveControlState()
    {
        DataTable AssignedItems = (DataTable)Session["Assigns"];

        DataTable QuestionItems = (DataTable)Session["Items"];

        //AssignedTable Assigns = new AssignedTable();
        //foreach (DataRow row in AssignedItems.Rows)
        //{
        //    Assigns.AssignedItem.Add(new AssignedRow(row[1].ToString()));
        //}

        //UnassignedTable Unassigns = new UnassignedTable();
        //foreach (DataRow row in QuestionItems.Rows)
        //{
        //    Unassigns.UnassignedItem.Add(new UnassignedRow(Convert.ToInt32(row[0]), row[1].ToString()));
        //}       
        BusinessLogic.SaveControlState(AssignedItems, QuestionItems);
    }

    public void LoadControlState()
    {
        DataTable QuestionItems = new DataTable();
        QuestionItems.TableName = "Question Items";
        QuestionItems.Columns.Add(new DataColumn("QuestionID", typeof(Int32)));
        QuestionItems.Columns.Add(new DataColumn("QuestionTextCombined", typeof(string)));
        QuestionItems.PrimaryKey = new DataColumn[] { QuestionItems.Columns["QuestionID"] };
        QuestionItems.DefaultView.ApplyDefaultSort = true;

        DataTable AssignedItems = new DataTable();
        AssignedItems.TableName = "Assigned Items";
        AssignedItems.Columns.Add(new DataColumn("QuestionID", typeof(Int32)));
        AssignedItems.Columns.Add(new DataColumn("AssignedTextCombined", typeof(string)));
        AssignedItems.PrimaryKey = new DataColumn[] { AssignedItems.Columns["QuestionID"] };
        AssignedItems.DefaultView.ApplyDefaultSort = true;

        //QuestionItems = BusinessLogic.LoadControlState("Unassigned");
        DataTableReader Assign = new DataTableReader(BusinessLogic.LoadControlState("Assigned"));
        AssignedItems.Load(Assign);
        DataTableReader Unassign = new DataTableReader(BusinessLogic.LoadControlState("Unassigned"));
        QuestionItems.Load(Unassign);

        int qi = QuestionItems.Rows.Count;
        lbQuestionnaire.Items.Clear();
        DataRow[] qiRow = QuestionItems.Select();
        for (int i = 0; i < qi; i++)
            lbQuestionnaire.Items.Add(qiRow[i][1].ToString());

        int ai = AssignedItems.Rows.Count;
        lbQuestionSelections.Items.Clear();
        DataRow[] aiRow = AssignedItems.Select();
        for (int i = 0; i < ai; i++)
            lbQuestionSelections.Items.Add(aiRow[i][1].ToString());

        Session["Items"] = QuestionItems;
        Session["Assigns"] = AssignedItems;

        BusinessLogic.DeleteControlState();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveControlState();
    }

    protected void btnLoad_Click(object sender, EventArgs e)
    {
        DataTableReader Assign = new DataTableReader(BusinessLogic.LoadControlState("Assigned"));

        if (Assign.HasRows == true)
            LoadControlState();
        else
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Progress was not previously saved.');", true);
    }
}