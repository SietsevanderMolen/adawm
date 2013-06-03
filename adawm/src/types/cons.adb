with Ada.Strings.Unbounded.Less_Case_Insensitive;

package body Cons is
   function "=" (a, b : Con)
      return Boolean
   is
      result : constant Boolean :=
         Ada.Strings.Unbounded.Less_Case_Insensitive (a.Name,
                                                      b.Name);
   begin
      return result;
   end "=";
end Cons;
