using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class SystemAdmin_ManageImpactWeight : System.Web.UI.Page
{
    int c = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        btnSave.Visible = false;
        btnCancel.Visible = false;
        lblRemainingImpacts.Visible = false;
        lblTotalImpact.Visible = false;
        lblmsg.Visible = false;
        lblInstruct.Visible = false;
        

      

        if (IsPostBack)
        {

   
            //    //Counter to keep track of textboxes
            int x = 0;

            //Array of textbox per source
            var varStd = new TextBox[20];
            var varPeer = new TextBox[20];
            var varHOD = new TextBox[20];

            // Array of label per role component
            var varComponents = new Label[20];

            //To calculate total impacts per source
            double valStd = 0;
            double valPeer = 0;
            double valHOD = 0;

            //To store the impact amount
            double ValTotalImpactVal = 0;

            //To store the impact remainding
            double ValRemainingImpactVal = 0;
            //To locate the textbox controls and retrieves the value of each textbox
            foreach (DataListItem item in dlCRR.Items)
            {

                //find the Component names

                varComponents[x] = (Label)item.FindControl("lblRoleComponent");

                //To prevent over count of the the amount of components if that component does not exists
                if (varComponents[x] != null)
                {


                    //find the Source impact values and assign to reference variable
                    varStd[x] = (TextBox)item.FindControl("txtboxStudentImpact");
                    //store the sum of students impacts

                    valStd = valStd + double.Parse(varStd[x].Text);

                    // To store the sum of the Peer impacts
                    varPeer[x] = (TextBox)item.FindControl("txtboxPeerImpact");
                    valPeer = valPeer + double.Parse(varPeer[x].Text);

                    // To store the sum of the HOD impacts
                    varHOD[x] = (TextBox)item.FindControl("txtboxHODImpact");
                    valHOD = valHOD + double.Parse(varHOD[x].Text);

                    //value changed


                    x += 1;
                }//end if
            }//end foreach


            ValTotalImpactVal = valStd + valPeer + valHOD;

            //To calcoulate the ValRemainingImpactVal impacts
            ValRemainingImpactVal = 100 - (valStd + valPeer + valHOD);

            //To display impact used
            lblTotalImpact.Text = "Total Impacts Assigned: " + ValTotalImpactVal.ToString();

            //Display rem impacts
            lblRemainingImpacts.Text = "Total Impacts available: " + ValRemainingImpactVal.ToString();

        }//end if postback


    }




    protected void dlCRR_SelectedIndexChanged(object sender, EventArgs e)
    {
        BusinessLogic.spGetRoleComponentsViewNoUser(ddlFactRole.SelectedValue, ddlPosition.SelectedValue);

    }



    //SAve
    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (IsPostBack)
        {
            //Counter to keep track of the amount of components
            int x = 0;

            //Array of textbox per source
            var varStd = new TextBox[20];
            var varPeer = new TextBox[20];
            var varHOD = new TextBox[20];

            // Array of label per role component
            var varComponents = new Label[20];

            //To calculate total impacts per source
            double valStd = 0;
            double valPeer = 0;
            double valHOD = 0;

            //To store the impact amount
            double ValTotalImpactVal = 0;


            //To store the remaining amount of Impact points
            double ValRemainingImpactVal = 0;

            //To determine the controls in the datalist 
            foreach (DataListItem item in dlCRR.Items)
            {

                //find the Component names
                // Label lblRoleComponent = (Label)item.FindControl("lblRoleComponent");
                varComponents[x] = (Label)item.FindControl("lblRoleComponent");

                //To prevent over counting the amount of components
                if (varComponents[x] != null)
                {

                    //find the Student Source impact values and assign to reference variable         
                    varStd[x] = (TextBox)item.FindControl("txtboxStudentImpact");

                    //store the sum of students impacts
                    //valStd = double.Parse(varStd[x].Text);
                    valStd = valStd + double.Parse(varStd[x].Text);
                    //find the Peer Source impact values and assign to reference variable 
                    varPeer[x] = (TextBox)item.FindControl("txtboxPeerImpact");
                    valPeer = valPeer + double.Parse(varPeer[x].Text);

                    //find the HOD Source impact values and assign to reference variable 
                    varHOD[x] = (TextBox)item.FindControl("txtboxHODImpact");
                    valHOD = valHOD + double.Parse(varHOD[x].Text);


                    //To change color of textbox
                    varStd[x].BackColor = System.Drawing.Color.White;
                    varPeer[x].BackColor = System.Drawing.Color.White;
                    varHOD[x].BackColor = System.Drawing.Color.White;

                    // To disable textbox user so that the user can only adjust value when all impacts are consumed

                    varStd[x].Enabled = false;
                    varPeer[x].Enabled = false;
                    varHOD[x].Enabled = false;

                    //To establish the amount comonents
                    x += 1;
                }//end if
            }//end foreach

            //To calcilate the total impacts spent
            ValTotalImpactVal = valStd + valPeer + valHOD;

            //To display impact used
            lblTotalImpact.Text = "Total Impacts Assigned: " + ValTotalImpactVal.ToString();
            //To calcoulate the ValRemainingImpactVal impacts
            ValRemainingImpactVal = 100 - (valStd + valPeer + valHOD);
            //Display rem impacts
            lblRemainingImpacts.Text = "Total Impacts available: " + ValRemainingImpactVal.ToString();

            // Innitize the sources to 3 (Students, Peers, HOD)
            int Src = 0;

            //To store the sources student, Peers, HOD
            //Variables for Sproc
            double TempVarStd;
            int varImpactStd;
            string varPosStd;
            string varCompStd;
            string StdSrcName = "";

            double TempVarPeer;
            int varImpactPeer;
            string varPosPeer;
            string varCompPeer;
            string PeerSrcName = "";

            double TempVarHOD;
            int varImpactHOD;
            string varPosHOD;
            string varCompHOD;
            string HODSrcName = "";

            //To test if insert or update db if total impavt is 100 or less

            if ((ValTotalImpactVal <= 100) & (ValTotalImpactVal >= 0))
            {

                // set value for max components per faculty
                //To cycle through the three sources
                int i = 0;


                while (Src < 3)
                {

                    for (i = 0; i < x; i++)
                    {
                        //To loop through the impact per source

                        if (Src == 0)
                        {

                            StdSrcName = "Student";

                            //To update the component
                            varCompStd = varComponents[i].Text;

                            //To save values to prevent input string error correct format
                            //cast text to double for impact value
                            TempVarStd = Convert.ToDouble(varStd[i].Text);

                            //cast impact to int for sproc
                            varImpactStd = Convert.ToInt32(TempVarStd);

                            //assign ddlist position value to variable
                            varPosStd = ddlPosition.SelectedValue;

                            //Invoke procedure to update or insert new impact
                            BusinessLogic.UpdateAddRCSImpWeightParameter(varCompStd, StdSrcName, varPosStd, varImpactStd);
                        }//endif

                        if (Src == 1)
                        {

                            PeerSrcName = "Peer";

                            //To update the component
                            varCompPeer = varComponents[i].Text;

                            //To save values to prevent input string error correct format
                            //cast text to double for impact value
                            TempVarPeer = Convert.ToDouble(varPeer[i].Text);

                            //cast to int for sproc
                            varImpactPeer = Convert.ToInt32(TempVarPeer);

                            //assign ddlist value to variable
                            varPosPeer = ddlPosition.SelectedValue;

                            //Invoke procedure to update or insert new impact
                            BusinessLogic.UpdateAddRCSImpWeightParameter(varCompPeer, PeerSrcName, varPosPeer, varImpactPeer);
                        }//endif


                        if (Src == 2)
                        {

                            HODSrcName = "HOD";

                            //To update the component
                            varCompHOD = varComponents[i].Text;

                            //To save values to prevent input string error correct format
                            //cast text to double for impact value
                            TempVarHOD = Convert.ToDouble(varHOD[i].Text);

                            //cast to int for sproc
                            varImpactHOD = Convert.ToInt32(TempVarHOD);

                            //assign ddlist value to variable
                            varPosHOD = ddlPosition.SelectedValue;

                            //Invoke procedure to update or insert new impact
                            BusinessLogic.UpdateAddRCSImpWeightParameter(varCompHOD, HODSrcName, varPosHOD, varImpactHOD);
                        }//endif



                    }//Endfor insert for  loop
                    i = 0;
                    //To increment the source variable
                    Src = Src + 1;
                }//end while

                //To make cancel button not visible and disabled 
                btnCancel.Visible = false;
                btnCancel.Enabled = false;

                //disable save button 
                btnSave.Enabled = false;
                btnSave.Visible = false;

                lblmsg.Text = "Update Completed.....";
                lblmsg.Visible = true;

                //To show status of Impacts for each faculty role
                lblStatus.Text = BusinessLogic.ImpactStatus(ddlPosition.SelectedValue);
                lblFacultyPending.Text = BusinessLogic.FacultyOutstanding(ddlPosition.SelectedValue); 
          
                //To enable ddls
                ddlFactRole.Enabled = true;
                ddlPosition.Enabled = true;


                //To check if after update values are less than 100
                ////////////////////////////
                //To reset values 
                ValTotalImpactVal = 0;
                valHOD = 0;
                valStd = 0;
                valPeer = 0;
                foreach (DataListItem item in dlCRR.Items)
                {
                    x = 0;
                    //find the Component names        
                    varComponents[x] = (Label)item.FindControl("lblRoleComponent");

                    //To prevent over counting the amount of components
                    if (varComponents[x] != null)
                    {

                        //find the Student Source impact values and assign to reference variable         
                        varStd[x] = (TextBox)item.FindControl("txtboxStudentImpact");

                        //store the sum of students impacts

                        valStd = valStd + double.Parse(varStd[x].Text);

                        //find the Peer Source impact values and assign to reference variable 
                        varPeer[x] = (TextBox)item.FindControl("txtboxPeerImpact");
                        valPeer = valPeer + double.Parse(varPeer[x].Text);

                        //find the HOD Source impact values and assign to reference variable 
                        varHOD[x] = (TextBox)item.FindControl("txtboxHODImpact");
                        valHOD = valHOD + double.Parse(varHOD[x].Text);

                        //To establish the amount comonents
                        x += 1;
                    }//end if
                }//end foreach

                //To calcilate the total impacts spent
                ValTotalImpactVal = valStd + valPeer + valHOD;
                double varx = 100;

                x = 0;
                if ((ValTotalImpactVal == varx))
                {
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////


                    ////btnEdit.CommandName = "btnEdit";
                    foreach (DataListItem item in dlCRR.Items)
                    {


                        //find the Component names
                        // Label lblRoleComponent = (Label)item.FindControl("lblRoleComponent");
                        varComponents[x] = (Label)item.FindControl("lblRoleComponent");

                        //To prevent over counter the amount of components
                        if (varComponents[x] != null)
                        {


                            //find the Source impact values and assign to reference variable
                            //TextBox chkStd = (TextBox)item.FindControl("txtboxStudentImpact");
                            varStd[x] = (TextBox)item.FindControl("txtboxStudentImpact");
                            valStd = valStd + double.Parse(varStd[x].Text);

                            // TextBox chkPeer = (TextBox)item.FindControl("txtPeerImpact");
                            varPeer[x] = (TextBox)item.FindControl("txtboxPeerImpact");
                            valPeer = valPeer + double.Parse(varPeer[x].Text);

                            // TextBox chkHOD = (TextBox)item.FindControl("txtboxHODImpact");
                            varHOD[x] = (TextBox)item.FindControl("txtboxHODImpact");
                            valHOD = valHOD + double.Parse(varHOD[x].Text);

                            //To disable textbox user 

                            varStd[x].Enabled = false;
                            varPeer[x].Enabled = false;
                            varHOD[x].Enabled = false;

                            //To change color of textbox
                            varStd[x].BackColor = System.Drawing.Color.White;
                            varPeer[x].BackColor = System.Drawing.Color.White;
                            varHOD[x].BackColor = System.Drawing.Color.White;

                            x += 1;
                        }//end if
                    }//end foreach


                    //////////////////////////////////////////////////////////////////////////////////////////////////////////
                }
                else
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Please Total impacts must not exceed 100";
                    ddlPosition.Enabled = false;
                    ddlFactRole.Enabled = false;
                    btnEdit_Click(new object(), new EventArgs());

                }


                ////////////////


            }//end if test for parameter against 100 ma impact

            else
            {

                btnSave.Enabled = false;
                btnSave.Visible = true;
                lblmsg.Text = "Total Impacts must not exceed 100, please review.";
                btnEdit_Click(new object(), new EventArgs());
                lblmsg.Visible = true;
                btnCancel.Visible = false;
                ddlFactRole.Enabled = false;
                ddlPosition.Enabled = false;


            }//end else

        }//endifpost


    }//endbtn


    protected void ddlPosition_SelectedIndexChanged(object sender, EventArgs e)
    {
        //To show status of Impacts for each faculty role
        lblStatus.Text = BusinessLogic.ImpactStatus(ddlPosition.SelectedValue);
        lblFacultyPending.Text = BusinessLogic.FacultyOutstanding(ddlPosition.SelectedValue);  

      
    }

    


    //Edit///////////////////////////////////////////////////////////////////////
    protected void btnEdit_Click(object sender, EventArgs e)
    {

        //Disable save button 
        btnSave.Enabled = true;
        btnSave.Visible = true;

        //Msg
        lblmsg.Visible = true;
        lblInstruct.Visible = true;
        lblInstruct.Text = "Total Impacts assigned must be 100 max";

        //Disable DDls
        ddlPosition.Enabled = false;
        ddlFactRole.Enabled = false;
        if (IsPostBack)
        {
            //Counter to keep track of textboxes
            int x = 0;

            //Array of textbox per source
            var varStd = new TextBox[20];
            var varPeer = new TextBox[20];
            var varHOD = new TextBox[20];

            // Array of label per role component
            var varComponents = new Label[20];

            //To calculate total impacts per source
            double valStd = 0;
            double valPeer = 0;
            double valHOD = 0;

            //To store the impact amount
            double ValTotalImpactVal = 0;

            //To store the total impacts remainding
            double ValRemainingImpactVal = 0;

            ////btnEdit.CommandName = "btnEdit";
            foreach (DataListItem item in dlCRR.Items)
            {


                //find the Component names
                varComponents[x] = (Label)item.FindControl("lblRoleComponent");

                //To prevent over counter the amount of components
                if (varComponents[x] != null)
                {

                    //find the Source impact values and assign to reference variable
                    varStd[x] = (TextBox)item.FindControl("txtboxStudentImpact");
                    //store the sum of students impacts
                    valStd = valStd + double.Parse(varStd[x].Text);


                    varPeer[x] = (TextBox)item.FindControl("txtboxPeerImpact");
                    valPeer = valPeer + double.Parse(varPeer[x].Text);

                    varHOD[x] = (TextBox)item.FindControl("txtboxHODImpact");
                    valHOD = valHOD + double.Parse(varHOD[x].Text);

                    //To enable textbox user 

                    varStd[x].Enabled = true;
                    varPeer[x].Enabled = true;
                    varHOD[x].Enabled = true;

                    //To change color of textbox
                    varStd[x].BackColor = System.Drawing.Color.LightBlue;
                    varPeer[x].BackColor = System.Drawing.Color.LightBlue;
                    varHOD[x].BackColor = System.Drawing.Color.LightBlue;

                    x += 1;

                }//end if
            }//end foreach


            //To get the total impacts on page 
            ValTotalImpactVal = valStd + valPeer + valHOD;

            //To display impact used
            lblTotalImpact.Text = "Total Impacts Assigned: " + ValTotalImpactVal.ToString();
            //To calcoulate the ValRemainingImpactVal impacts
            ValRemainingImpactVal = 100 - (valStd + valPeer + valHOD);
            //Display rem impacts
            lblRemainingImpacts.Text = "Total Impacts available: " + ValRemainingImpactVal.ToString();


            //to enable save button if total impacts are true
            btnSave.Enabled = true;

            //To make cancel button visible and enabled 
            btnCancel.Visible = true;
            btnCancel.Enabled = true;
            //To enable labels 
            lblRemainingImpacts.Visible = true;
            lblmsg.Visible = true;
            lblTotalImpact.Visible = true;
            // lblTotalImpact.Visible = true;

            //To disable label
            lblmsg.Visible = false;
        }


    }//end Edit btn



    protected void dlCRR_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }

    //Cancel button
    protected void btnCancel_Click(object sender, EventArgs e)
    {

        if (IsPostBack)
        {
            //Counter to keep track of textboxes
            int x = 0;

            //Array of textbox per source
            var varStd = new TextBox[20];
            var varPeer = new TextBox[20];
            var varHOD = new TextBox[20];

            //To calculate total impacts per source
            double valStd = 0;
            double valPeer = 0;
            double valHOD = 0;

            //To store the impact amount
            double ValTotalImpactVal = 0;

            // Array of label per role component
            var varComponents = new Label[20];


            ////btnEdit.CommandName = "btnEdit";
            foreach (DataListItem item in dlCRR.Items)
            {


                //find the Component names
                // Label lblRoleComponent = (Label)item.FindControl("lblRoleComponent");
                varComponents[x] = (Label)item.FindControl("lblRoleComponent");

                //To prevent over counter the amount of components
                if (varComponents[x] != null)
                {

                    //find the Source impact values and assign to reference variable
                    //TextBox chkStd = (TextBox)item.FindControl("txtboxStudentImpact");
                    varStd[x] = (TextBox)item.FindControl("txtboxStudentImpact");
                    valStd = valStd + double.Parse(varStd[x].Text);

                    // TextBox chkPeer = (TextBox)item.FindControl("txtPeerImpact");
                    varPeer[x] = (TextBox)item.FindControl("txtboxPeerImpact");
                    valPeer = valPeer + double.Parse(varPeer[x].Text);

                    // TextBox chkHOD = (TextBox)item.FindControl("txtboxHODImpact");
                    varHOD[x] = (TextBox)item.FindControl("txtboxHODImpact");
                    valHOD = valHOD + double.Parse(varHOD[x].Text);

                    //To disable textbox user 

                    varStd[x].Enabled = false;
                    varPeer[x].Enabled = false;
                    varHOD[x].Enabled = false;

                    //To change color of textbox
                    varStd[x].BackColor = System.Drawing.Color.White;
                    varPeer[x].BackColor = System.Drawing.Color.White;
                    varHOD[x].BackColor = System.Drawing.Color.White;

                    x += 1;
                }//end if
            }//end foreach

            //To get the total impacts on page 
            ValTotalImpactVal = valStd + valPeer + valHOD;

            if ((ValTotalImpactVal < 100) & (ValTotalImpactVal >= 0))
            {

                btnEdit_Click(new object(), new EventArgs());

            }
            else btnSave_Click(new object(), new EventArgs());

        }

    }//end cancel
    protected void ddlFactRole_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}