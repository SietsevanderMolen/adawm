with Ada.Strings.Unbounded;

package body Content_Containers is
   function Make return Content_Container
   is
      CC : Content_Container;
   begin
      CC.Name := Ada.Strings.Unbounded.To_Unbounded_String ("Content_Container");
      return CC;
   end Make;
end Content_Containers;
