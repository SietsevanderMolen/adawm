with Log;

package body Cons is
   function "=" (a, b: Con)
      return Boolean
   is
   begin
      return True;
   end "=";
end Cons;
