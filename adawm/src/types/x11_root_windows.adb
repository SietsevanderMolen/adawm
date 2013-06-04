with Ada.Strings.Unbounded;

package body X11_Root_Windows is
   function Make return X11_Root_Window
   is
      X11_Win : X11_Root_Window;
   begin
      X11_Win.Name :=
         Ada.Strings.Unbounded.To_Unbounded_String ("X11 Root Window");

      return X11_Win;
   end Make;
end X11_Root_Windows;
