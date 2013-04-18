with Ahven;

use Ahven;

package body AdaWM_Randr_Tests is
   procedure Initialize (T : in out Test) is
   begin
      Set_Name (T, "AdaWM Randr Module");

      Framework.Add_Test_Routine
        (T, Test_Fake_Single_Screen'Access, "Fake single screen");
   end Initialize;

   procedure Test_Fake_Single_Screen is
   begin
      Assert (False, "Please write the first test");
   end Test_Fake_Single_Screen;
end AdaWM_Randr_Tests;
