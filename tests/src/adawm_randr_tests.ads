with Ahven.Framework;

package AdaWM_Randr_Tests is
   type Test is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Test);

private
   procedure Test_Fake_Single_Screen_Exception_Absence;
end AdaWM_Randr_Tests;
