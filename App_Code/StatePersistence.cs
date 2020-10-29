using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for ControlState
/// </summary>
namespace StatePersistence
{
    [Serializable]
    public class UnassignedRow
    {
        public UnassignedRow(int ID, string Text)
        {
            QuestionID = ID;
            QuestionTextCombined = Text;
        }

        public UnassignedRow()
        {
            QuestionID = 0;
            QuestionTextCombined = "";
        }

        public int QuestionID;
        public string QuestionTextCombined;
    }

    [Serializable]
    public class AssignedRow
    {
        public AssignedRow(string Text)
        {
            AssignedTextCombined = Text;
        }

        public AssignedRow()
        {
            AssignedTextCombined = "";
        }

        public string AssignedTextCombined;
    }

    [Serializable]
    public class UnassignedTable
    {
        public List<UnassignedRow> UnassignedItem = new List<UnassignedRow>();
    }

    [Serializable]
    public class AssignedTable
    {
        public List<AssignedRow> AssignedItem = new List<AssignedRow>();
    }
}