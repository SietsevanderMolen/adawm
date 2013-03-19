with Ada.Strings.Unbounded;
with xab;

with AdaWM_Types;

package body AdaWM_Randr is
   procedure Fake_Single_Screen (Connection : xab_types.xab_connection_t) is
      output : AdaWM_Types.Output;
      root_screen : constant xab_types.xab_screen_t :=
         xab.xab_get_root_screen (Connection);
   begin
      output.Rect.X      := 0;
      output.Rect.Y      := 0;
      output.Rect.Width  := root_screen.width_in_pixels;
      output.Rect.Height := root_screen.height_in_pixels;
      output.Active      := True;
      output.Name        :=
         Ada.Strings.Unbounded.To_Unbounded_String ("xroot-0");
   end Fake_Single_Screen;

   procedure Initialize_Randr (Connection : xab_types.xab_connection_t) is
   begin
      null;
   end Initialize_Randr;
end AdaWM_Randr;
