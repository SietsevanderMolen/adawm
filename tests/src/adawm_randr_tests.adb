with Ahven; use Ahven;

  with AdaWM_Randr;
  with xab;
  with xab_types;

package body AdaWM_Randr_Tests is
     Global_X_Connection : constant xab_types.xab_connection_t 
        := xab.xab_connect;

   procedure Initialize (T : in out Test) is
   begin
      Set_Name (T, "AdaWM Randr");

      Framework.Add_Test_Routine
        (T, Test_Fake_Single_Screen_Exception_Absence'Access, "Exception absence");
   end Initialize;

   procedure Test_Fake_Single_Screen_Exception_Absence is
   begin
        AdaWM_Randr.Fake_Single_Screen (Global_X_Connection);
      --  assert (True, "fake test");
   end Test_Fake_Single_Screen_Exception_Absence;
end AdaWM_Randr_Tests;
