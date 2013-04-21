with Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists;

with xab_types;

package Types is
   type Rectangle is record
      X      : Integer;
      Y      : Integer;
      Width  : Integer;
      Height : Integer;
   end record;

   type Virtual_Screen is record
      Num : Integer;
      Rect : Rectangle;
   end record;
end Types;
