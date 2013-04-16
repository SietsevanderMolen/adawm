with AUnit.Test_Caller;

package body AdaWM_Randr.Test.Suite is
   package Caller is new AUnit.Test_Caller (AdaWM_Randr.Test.Test);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test (Caller.Create
         ("Test AdaWM_Randr.Fake_Single_Screen",
          Test_Fake_Single_Screen'Access));
      --  Ret.Add_Test
      --  (Caller.Create ("Test Operands.Ints.Value", Test_Value'Access));
      --  Ret.Add_Test
      --  (Caller.Create ("Test Operands.Ints.Set", Test_Set'Access));
      return Ret;
   end Suite;
end AdaWM_Randr.Test.Suite;
