with AdaWM_Randr_Tests;

package body AdaWM_Tests is
   use Ahven;

   function Get_Test_Suite return Ahven.Framework.Test_Suite is
      S : Framework.Test_Suite := Framework.Create_Suite ("All");

      AdaWM_Randr_Test : AdaWM_Randr_Tests.Test;
   begin
      Framework.Add_Static_Test (S, AdaWM_Randr_Test);
      return S;
   end Get_Test_Suite;
end AdaWM_Tests;
