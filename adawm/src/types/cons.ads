with Ada.Strings.Unbounded;

with Rectangles;

--  A 'Con' represents everything from the X11 root window down to a single X11
--  window.
package Cons is
   type Con;
   type Con_Access is access all Con;

   type Con is abstract tagged
      record
         Parent : Con_Access;
         Rect   : Rectangles.Rectangle;
         Name   : Ada.Strings.Unbounded.Unbounded_String;
      end record;
end Cons;
