with Ada.Strings.Unbounded;
with xab;

with AdaWM_Log;
with Cons;

package body AdaWM_Randr is
   procedure Fake_Single_Screen (Connection : xab_types.xab_connection_t) is
      output : AdaWM_Types.Output;
      root_screen : constant xab_types.xab_screen_t :=
         xab.xab_get_root_screen (Connection);
   begin
      AdaWM_Log.Warning ("Faking single RandR screen");

      output.Rect.X      := 0;
      output.Rect.Y      := 0;
      output.Rect.Width  := root_screen.width_in_pixels;
      output.Rect.Height := root_screen.height_in_pixels;
      output.Active      := True;
      output.Name        :=
         Ada.Strings.Unbounded.To_Unbounded_String ("xroot-0");

      Initialize_Con (output); --  output_init_con(s);
      --  init_ws_for_output(s, output_get_content(s->con));
      --  TAILQ_INSERT_TAIL(&outputs, s, outputs);
      Initialize_Con (output);
   end Fake_Single_Screen;

   procedure Initialize_Con (Output : AdaWM_Types.Output) is
      con : Cons.Con;
   begin
      AdaWM_Log.Info ("Initializing con for output "
         & Ada.Strings.Unbounded.To_String (Output.Name));

      --  Search for a Con with that name directly below the root node. There
      --  might be one from a restored layout.
      --  ELSE:

   end Initialize_Con;

   procedure Initialize_Randr (Connection : xab_types.xab_connection_t) is
      Not_Implemented : exception;
   begin
      AdaWM_Log.Info ("Initialising RandR");
      raise Not_Implemented
         with "Real Randr is not implemented and should never be called";
   end Initialize_Randr;

   --  Not implemented
   procedure Query_Outputs
      (Connection : xab_types.xab_connection_t;
       Window     : xab_types.xab_window_t)
   is
      --  Other_Output     : Outputs.Output;
      --  Resources_Cookie :
      --  xab_randr.xab_randr_get_screen_resources_current_cookie_t :=
         --  xab_randr.xab_randr_get_screen_resources_current
            --  (Connection, Window);
         --  Primary_Cookie : xab_randr.xab_randr_get_output_primary_cookie_t;
      --  Configuration_TimeStamp : xab_types.xab_timestamp_t;
      --  Randr_Outputs           : xab_randr_output_t_container.Vector;
   begin
      null;
   end Query_Outputs;
end AdaWM_Randr;
