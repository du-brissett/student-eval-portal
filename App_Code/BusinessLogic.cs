using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

[DataObject(true)]
public static class BusinessLogic
{
    /*     <-------- LEVEL -------->       */

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllLevels()
    {
        string query = "SELECT * FROM [Level]";
        SqlCommand cmd = new SqlCommand(query, new SqlConnection(GetConnectionString()));
        
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        
        return data;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteLevel(int ID)
    {
        string spName = "spDeleteLevel";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@id", SqlDbType.Int).Value = ID;
        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 500;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        int count = cmd.ExecuteNonQuery();
        cmd.Connection.Close();

        return count;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateLevel(int ID, string Name, string Description, float OCRScoreMin, float OCRScoreMax)
    {
        string spName = "spUpdateLevel";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = Name;
        cmd.Parameters.Add("@desc", SqlDbType.VarChar, 300).Value = Description;
        cmd.Parameters.Add("@minScore", SqlDbType.Decimal).Value = OCRScoreMin;
        cmd.Parameters.Add("@maxScore", SqlDbType.Decimal).Value = OCRScoreMax;
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = ID;

        cmd.Connection.Open();
        int i = cmd.ExecuteNonQuery();
        cmd.Connection.Close();

        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static string InsertLevel(string Name, string Description, decimal Min, decimal Max)
    {
        string spName = "spInsertLevel";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = Name;
        cmd.Parameters.Add("@desc", SqlDbType.VarChar, 300).Value = Description;
        cmd.Parameters.Add("@minScore", SqlDbType.Decimal).Value = Min;
        cmd.Parameters.Add("@maxScore", SqlDbType.Decimal).Value = Max;

        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 100;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        string error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return error;
    }

    
    /* <---------------------------------------------------------------------------> */

    /*     <-------- POSITION -------->       */

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetPositionsAll()
    {
        string spName = "spGetPositionsAll";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }
    
    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static string InsertPosition(string Name, string Description)
    {
        string spName = "spInsertPosition";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@name", SqlDbType.VarChar, 100).Value = Name;
        cmd.Parameters.Add("@desc", SqlDbType.VarChar, 300).Value = Description;

        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 100;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        string error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return error;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static string UpdatePosition(int ID, string Name, string Description)
    {
        string spName = "spUpdatePosition";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@id", SqlDbType.Int).Value = ID;
        cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = Name;
        cmd.Parameters.Add("@desc", SqlDbType.VarChar, 200).Value = Description;

        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 300;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        string error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return error;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeletePosition(int ID)
    {
        string spName = "spDeletePosition";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@id", SqlDbType.Int).Value = ID;
        cmd.Connection.Open();

        int count = cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return count;
    }

    /* <---------------------------------------------------------------------------> */

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetPositions()
    {
        string spName = "spGetPositions";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        
        return data;
    }

    /*     <-------- FACULTY ROLE -------->       */

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetFacultyRoleNames()
    {
        string spName = "spGetFacultyRoleNames";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        
        return data;
    }
    
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetFacultyRoleAll()
    {
        string spName = "spGetFacultyRoleAll";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);            
        
        return data;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteFacultyRole(int ID)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spDeleteFacultyRole", con);

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 500;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        int i = cmd.ExecuteNonQuery();
        string error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static DataTable InsertFacultyRole(string Name, string Description, decimal MinValue, decimal MaxValue)
    {
        string spName = "spInsertFacultyRole";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("Name", Name);
        cmd.Parameters.AddWithValue("Description", Description);
        cmd.Parameters.AddWithValue("MinValue", MinValue);
        cmd.Parameters.AddWithValue("MaxValue", MaxValue);        
        
        cmd.Connection.Open();
        SqlDataReader read = cmd.ExecuteReader();

        DataTable error = new DataTable();

        error.Columns.Add(new DataColumn("errors", typeof(string)));

        DataRow row;

        while (read.Read())
        {
            row = error.NewRow();
            row[0] = read.GetValue(0);
            error.Rows.Add(row);
        }

        cmd.Connection.Close();

        return error;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateFacultyRole(int ID, string Name, string Description, int MinValue, int MaxValue)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spUpdateFacultyRole", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@ID", ID);
        cmd.Parameters.AddWithValue("@Name", Name);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@MinValue", MinValue);
        cmd.Parameters.AddWithValue("@MaxValue", MaxValue);

        cmd.Connection.Open();
        int i = cmd.ExecuteNonQuery();
        cmd.Connection.Close();

        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable PositionFacultyRole(string Position)
    {
        string spName = "spPositionFacultyRole";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@position", SqlDbType.VarChar).Value = Position;

        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return data;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetUnassignedPositions()
    {
        string spName = "spGetUnassignedPositions";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        
        return data ;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetPositionFacultyRole(string Position)
    {
        string spName = "spGetPositionFacultyRole";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@position", SqlDbType.VarChar).Value = Position;

        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return data;
    }

    public static string UpdatePositionFacultyRole(string Position, string Role, int Weight)
    {
        string spName = "spUpsertPositionAssignedWeight";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = Role;
        cmd.Parameters.Add("@position", SqlDbType.VarChar).Value = Position;
        cmd.Parameters.Add("@weight", SqlDbType.Int).Value = Weight;

        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 300;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        string error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return error;
    }

    public static string ValidateAssignedWeight(int Weight, string Role)
    {
        string error;
        string spName = "spValidateAssignedWeight";

        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@weight", SqlDbType.Int).Value = Weight;
        cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = Role;
        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 200;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return error;
    }

    /* <---------------------------------------------------------------------------> */


    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static object InsertPositionFacultyRole(int FacultyRoleID, int PositionID, int AssignedWeight)
    {
        string spName = "spInsertPositionFacultyRole";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@FacultyRoleID", SqlDbType.Int).Value = FacultyRoleID;
        cmd.Parameters.Add("@PositionID", SqlDbType.Int).Value = PositionID;
        cmd.Parameters.Add("@AssignedWeight", SqlDbType.Int).Value = AssignedWeight;

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Connection.Open();
        int insertFacultyRole = cmd.ExecuteNonQuery();

        cmd.Connection.Close();

        return insertFacultyRole;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetQuestionnaireItems()
    {
        string spName = "spGetQuestionnaireItems";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));

        cmd.Connection.Open();
        
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetRoleComponents(string Role)
    {
        string spName = "spGetRoleComponents";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = Role;

        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable CalculateWeightedRating(string RealID, string FacultyRole, string AcademicYear)
    {
        string spName = "spCalculateWeightedRatingWithID";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@realID", SqlDbType.NChar, 30).Value = RealID;
        cmd.Parameters.Add("@facultyRole", SqlDbType.VarChar, 300).Value = FacultyRole;
        cmd.Parameters.Add("@academicYear", SqlDbType.VarChar, 7).Value = AcademicYear;
        
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable CalculateWeightedRatingPerSemester(string RealID, string FacultyRole, string AcademicYear, int Semester)
    {
        string spName = "spCalculateWeightedRatingPerSemester";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@realID", SqlDbType.NChar, 30).Value = RealID;
        cmd.Parameters.Add("@facultyRole", SqlDbType.VarChar, 300).Value = FacultyRole;
        cmd.Parameters.Add("@academicYear", SqlDbType.VarChar, 7).Value = AcademicYear;
        cmd.Parameters.Add("@semester", SqlDbType.Int).Value = Semester;

        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    /* <---------------------------------------------------------------------------> */

    public static int UpdateQuestionnaire(string Name, int Item)
    {
        string spName = "spUpdateQuestionnaire";

        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@name", SqlDbType.VarChar, 200).Value = Name;
        cmd.Parameters.Add("@item", SqlDbType.Int).Value = Item;
        
        cmd.Connection.Open();
        int i = cmd.ExecuteNonQuery();
        cmd.Connection.Close();

        return i;
    }

    public static int GetQuestionnaireItemsCount()
    {
        string spName = "spGetQuestionnaireItemsCount";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        SqlParameter p = new SqlParameter("@rows", SqlDbType.Int);
        p.Direction = ParameterDirection.Output;
        cmd.Parameters.Add(p);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();

        int RowCount = (int)cmd.Parameters["@rows"].Value;

        cmd.Connection.Close();

        return RowCount;
    }

    public static string VerifyStaffID(string RealID)
    {
        string error = "";

        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spVerifyStaffID", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@realID", SqlDbType.NChar, 30).Value = RealID;
        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 100;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery(); 
        error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return error;
    }

  
    ///// show status of manage impact page
  
    
    public static string ImpactStatus(string Position)
    {
        string status ="";
        string FacultyUpdated = "";

        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spRCSImpactWgtUsagePercentage", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@Position", SqlDbType.NVarChar, 50).Value = Position.Trim();


        SqlParameter par = new SqlParameter("@ImpactProgress", SqlDbType.NVarChar);
        SqlParameter parF = new SqlParameter("@FactcultyRoles", SqlDbType.NVarChar); 
        par.Direction = ParameterDirection.Output;
        parF.Direction = ParameterDirection.Output;
        par.Size = 20;
        parF.Size = 300;
        cmd.Parameters.Add(par);
        cmd.Parameters.Add(parF);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        status = (string)cmd.Parameters["@ImpactProgress"].Value;
        FacultyUpdated = (string)cmd.Parameters["@FactcultyRoles"].Value;
        cmd.Connection.Close();

        return status;
    }
    
  
    ////// shows the faculty roles that are updatable
   
   
    public static string FacultyOutstanding(string Position)
    {
        string FacultyUpdated = "";
        string status = "";
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spRCSImpactWgtUsagePercentage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Position", SqlDbType.NVarChar, 50).Value = Position.Trim();
        SqlParameter parF = new SqlParameter("@FactcultyRoles", SqlDbType.NVarChar);
        SqlParameter par = new SqlParameter("@ImpactProgress", SqlDbType.NVarChar);
        parF.Direction = ParameterDirection.Output;
        par.Direction = ParameterDirection.Output;
        parF.Size =300;
        par.Size = 20;
        cmd.Parameters.Add(parF);
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        status = (string)cmd.Parameters["@ImpactProgress"].Value;
        FacultyUpdated = (string)cmd.Parameters["@FactcultyRoles"].Value;
        cmd.Connection.Close();

        return FacultyUpdated;
    }



    public static string SaveControlState(DataTable Assign, DataTable Unassign)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spSaveState", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@assign", SqlDbType.Structured).Value = Assign;
        cmd.Parameters.Add("@unassign", SqlDbType.Structured).Value = Unassign;
        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 300;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        string error = cmd.Parameters["@error"].Value.ToString();
        cmd.Connection.Close();

        return error;
    }

    public static DataTable LoadControlState(string Table)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spLoadState", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@table", SqlDbType.VarChar, 20).Value = Table;

        cmd.Connection.Open();
        SqlDataReader read = cmd.ExecuteReader();

        DataTable Data = new DataTable();

        if (Table == "Assigned")
        {
            Data.Columns.Add(new DataColumn("QuestionID", typeof(Int32)));
            Data.Columns.Add(new DataColumn("AssignedTextCombined", typeof(string)));            
        }
        else
        {
            Data.Columns.Add(new DataColumn("QuestionID", typeof(Int32)));
            Data.Columns.Add(new DataColumn("QuestionTextCombined", typeof(string)));
        }

        DataRow row;

        while (read.Read())
        {
            row = Data.NewRow();
            row[0] = read.GetValue(0);
            row[1] = read.GetValue(1);
            Data.Rows.Add(row);
        }
        
        cmd.Connection.Close();

        return Data;
    }

    public static void DeleteControlState()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spDeleteState", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable spGetRoleComponentsViewNoUser(String FacTName, String PosName)
    {
        string spName = "spGetRoleComponentsViewNoUser";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@FacTName", SqlDbType.NVarChar).Value = FacTName.Trim();
        cmd.Parameters.Add("@PosName", SqlDbType.NVarChar).Value = PosName.Trim();

        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    //Updates or insert into RCSImp  table
    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int UpdateAddRCSImpWeightParameter(String RoleCompName, String SourceName, String PositionName, int ImpWeight)
    {
        SqlCommand cmd = new SqlCommand("spUpdateAddRCSImpWeightParameters", new SqlConnection(GetConnectionString()));
        cmd.Parameters.Add("@RoleCompName", SqlDbType.VarChar).Value = RoleCompName.Trim();
        cmd.Parameters.Add("@SourceName", SqlDbType.VarChar).Value = SourceName.Trim();
        cmd.Parameters.Add("@PositionName", SqlDbType.VarChar).Value = PositionName.Trim();
        cmd.Parameters.Add("@ImpWeight", SqlDbType.Int).Value = ImpWeight;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection.Open();
        int i = cmd.ExecuteNonQuery();
        cmd.Connection.Close();

        return i;
    }


    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetSelectRCSWeightParameter(String inPositionName, String inFactRoleName)
    {
        string spName = "spGetSelectRCSWeightParameter";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@inPositionName", SqlDbType.NVarChar).Value = inPositionName.Trim();
        cmd.Parameters.Add("@inFactRoleName", SqlDbType.NVarChar).Value = inFactRoleName.Trim();
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    //To select the Academic year within the RCSrate table
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAcademicYear(string RealID)
    {
        SqlCommand cmd = new SqlCommand("spGetAcademicYear", new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@RealID", SqlDbType.Char, 30).Value = RealID.Trim();
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    //RoleComponent rate table -- OCR table 
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable OverallCompositeRatingView(string RealID, string AcademicYear)
    {
        SqlCommand cmd = new SqlCommand("spOverallCompositeRatingView", new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@RealID", SqlDbType.NChar, 30).Value = RealID.Trim();
        cmd.Parameters.Add("@AcademicYear", SqlDbType.NChar, 10).Value = AcademicYear.Trim();


        //string  OCR = Convert.ToString(cmd.Parameters["@CalcOCR"].Value);
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    //To get Department
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable spGetAllAcademicYear()
    {
        string spName = "spGetAllAcademicYear";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }

    //To retrieve Merit Bonus for each Department Member
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable spMeritBonusTemp(String Academic_Year, string RealID)
    {
        string spName = "spMeritBonusTemp";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Academic_Year", SqlDbType.NVarChar).Value = Academic_Year.Trim();
        cmd.Parameters.Add("@RealID", SqlDbType.NVarChar).Value = RealID.Trim();
        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return data;
    }


 /* <-------------------------ROLE COMPONENT MANAGEMENT-------------------------> */


    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetRoleComponentsAll(string role)
    {
        string spName = "spGetRoleComponentsAll";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = role;

        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return data;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static string InsertRoleComponent(string Name, string Description, string Role)
    {
        string spName = "spInsertRoleComponent";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@name", SqlDbType.VarChar, 100).Value = Name;
        cmd.Parameters.Add("@desc", SqlDbType.VarChar, 300).Value = Description;
        cmd.Parameters.Add("@role", SqlDbType.VarChar, 70).Value = Role;

        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 100;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        string error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return error;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static string UpdateRoleComponents(int ID, string Name, string Description, string role)
    {
        string spName = "spUpdateRoleComponent";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@id", SqlDbType.Int).Value = ID;
        cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = Name;
        cmd.Parameters.Add("@desc", SqlDbType.VarChar, 300).Value = Description;
        cmd.Parameters.Add("@role", SqlDbType.VarChar, 50).Value = role;

        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 50;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        string error = (string)cmd.Parameters["@error"].Value;
        cmd.Connection.Close();

        return error;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteRoleComponent(int ID)
    {
        string spName = "spDeleteRoleComponent";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@id", SqlDbType.Int).Value = ID;

        SqlParameter par = new SqlParameter("@error", SqlDbType.VarChar);
        par.Direction = ParameterDirection.Output;
        par.Size = 100;
        cmd.Parameters.Add(par);

        cmd.Connection.Open();

        int count = cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return count;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetUserAcademicYear(string RealID)
    {
        string spName = "spGetUserAcademicYear";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = RealID;

        cmd.Connection.Open();
        SqlDataReader data = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return data;
    }

    public static DataTable GetStaffbyManager(string User)
    {
        string spName = "spGetStaffbyManager";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@realID", SqlDbType.NChar).Value = User;

        cmd.Connection.Open();
        
        SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        DataTable data = new DataTable();

        data.Columns.Add(new DataColumn("FullName", typeof(string)));
        data.Columns.Add(new DataColumn("RealID", typeof(string)));

        DataRow row;

        while (read.Read())
        {
            row = data.NewRow();
            row[0] = read.GetValue(0);
            row[1] = read.GetValue(1);
            data.Rows.Add(row);
        }

        return data;
    }

    public static DataTable GetSemesters(string RealID, string AcademicYear)
    {
        string spName = "spGetSemesters";
        SqlCommand cmd = new SqlCommand(spName, new SqlConnection(GetConnectionString()));
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@realID", SqlDbType.VarChar).Value = RealID;
        cmd.Parameters.Add("@academicYear", SqlDbType.VarChar).Value = AcademicYear;

        cmd.Connection.Open();

        SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        DataTable data = new DataTable();

        data.Columns.Add(new DataColumn("FullName", typeof(string)));
        data.Columns.Add(new DataColumn("RealID", typeof(string)));

        DataRow row;

        while (read.Read())
        {
            row = data.NewRow();
            row[0] = read.GetValue(0);
            row[1] = read.GetValue(1);
            data.Rows.Add(row);
        }

        return data;        
    }

    

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["StudentEvaluationConnectionString"].ConnectionString;
    }
    
    /* <---------------------------------------------------------------------------> */
}