with Randr_Tests;

package body Tests is
   use Ahven;

   function Get_Test_Suite return Ahven.Framework.Test_Suite is
      S : Framework.Test_Suite := Framework.Create_Suite ("All");

      Randr_Test : Randr_Tests.Test;
   begin
      Framework.Add_Static_Test (S, Randr_Test);
      return S;
   end Get_Test_Suite;
end Tests;
