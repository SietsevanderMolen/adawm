with Ahven; use Ahven;

with xab;
with xab_types;

with Randr;
with Tree_Manager;

package body Randr_Tests is
     X_Connection : constant xab_types.xab_connection_t 
        := xab.xab_connect;

   procedure Initialize (T : in out Test) is
   begin
      Set_Name (T, "Randr");

      Framework.Add_Test_Routine
        (T, Test_Fake_Single_Screen_Exception_Absence'Access, "Fake_Single_Screen");
      Framework.Add_Test_Routine
        (T, Test_Initialize_Con'Access, "Initialize_Con");
   end Initialize;

   procedure Test_Fake_Single_Screen_Exception_Absence is
   begin
        Tree_Manager.Init_Tree;
        Randr.Fake_Single_Screen (X_Connection);
   end Test_Fake_Single_Screen_Exception_Absence;

   procedure Test_Initialize_Con is
      --  Output : Types.Output;
   begin
      --  Randr.Initialize_Con (Output);
      null;
   end Test_Initialize_Con;
end Randr_Tests;
