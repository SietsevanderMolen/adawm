with Ahven.Framework;

package AdaWM_Randr_Tests is
   type Test is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Test);

private
   --  Tests if Fake_Single_Screen throws no exception
   procedure Test_Fake_Single_Screen_Exception_Absence;
   procedure Test_Initialize_Con;
end AdaWM_Randr_Tests;
