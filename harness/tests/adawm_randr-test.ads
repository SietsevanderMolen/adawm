with AUnit.Test_Fixtures;

package AdaWM_Randr.Test is
   type Test is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Fake_Single_Screen (T : in out Test);

   --  procedure Test_Value (T : in out Test);

   --  procedure Test_Set (T : in out Test);
end AdaWM_Randr.Test;
