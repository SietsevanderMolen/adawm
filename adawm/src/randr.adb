with Ada.Strings.Unbounded;
with xab;

with Output_Containers;
with Log;

package body Randr is
   procedure Fake_Single_Screen (Connection : xab_types.xab_connection_t;
                                 Tree       : Trees.Containers.Tree) is
      output : Output_Containers.Output_Container;
      root_screen : constant xab_types.xab_screen_t :=
         xab.xab_get_root_screen (Connection);
   begin
      Log.Warning ("Faking single RandR screen");
      Log.Increase_Indent;

      output.Rect.X      := 0;
      output.Rect.Y      := 0;
      output.Rect.Width  := root_screen.width_in_pixels;
      output.Rect.Height := root_screen.height_in_pixels;
      output.Name        :=
         Ada.Strings.Unbounded.To_Unbounded_String ("xroot-0");

      --  Set this output to active
      output.Set_Active (Is_Active => True);

      --  output.Con := Initialize_Con (Output => output,
      --  Tree   => Tree); --  output_init_con(s);
      --  Outputs.Init_Workspace (output, output.Con);
      --  TAILQ_INSERT_TAIL(&outputs, s, outputs);
      Log.Decrease_Indent;
   end Fake_Single_Screen;

   procedure Initialize_Randr (Connection : xab_types.xab_connection_t) is
      Not_Implemented : exception;
   begin
      Log.Info ("Initialising RandR");
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
end Randr;
