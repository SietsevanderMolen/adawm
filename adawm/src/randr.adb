with Ada.Strings.Unbounded;
with xab;

with Log;

package body Randr is
   procedure Fake_Single_Screen (Connection : xab_types.xab_connection_t;
                                 Tree       : Trees.Tree) is
      output : Outputs.Output;
      root_screen : constant xab_types.xab_screen_t :=
         xab.xab_get_root_screen (Connection);
   begin
      Log.Warning ("Faking single RandR screen");
      Log.Increase_Indent;

      output.Rect.X      := 0;
      output.Rect.Y      := 0;
      output.Rect.Width  := root_screen.width_in_pixels;
      output.Rect.Height := root_screen.height_in_pixels;
      output.Active      := True;
      output.Name        :=
         Ada.Strings.Unbounded.To_Unbounded_String ("xroot-0");

      output.Con := Initialize_Con (Output => output,
                                    Tree   => Tree); --  output_init_con(s);
      Outputs.Init_Workspace (output);
      --  TAILQ_INSERT_TAIL(&outputs, s, outputs);
      Log.Decrease_Indent;
   end Fake_Single_Screen;

   function Initialize_Con (Output : Outputs.Output;
                             Tree   : Trees.Tree)
                             return Cons.Con
   is
      con     : Cons.Con := Cons.Create;
      Content : Cons.Con := Cons.Create;
      Reused  : constant Boolean  := False;
   begin
      Log.Info ("Initializing con for output "
         & Ada.Strings.Unbounded.To_String (Output.Name));

      --  Search for a Con with that name directly below the root node. There
      --  might be one from a restored layout.
      --  ELSE:

      con.Name   := Output.Name;
      con.CType  := Cons.CT_OUTPUT;
      con.Layout := Cons.L_OUTPUT;
      --  TODO: con_Fix_percent(croot);
      con.Rect   := Output.Rect;
      --  x_set_name (con, "[adawm con] output", con.Name);

      --  I'm too lazy for this now, but I can't stand this "lets break out of
      --  a subroutine halfway" attitude. Please decide if this is a reused con
      --  earlier on in the flow TODO FIXME YOLO
      if Reused then
         Log.Info ("Not adding workspace, this was a reused con");
         return con;
      end if;

      --  Top dockarea could be added here TODO

      Log.Info ("Adding main content container");
      Content.CType := Cons.CT_CON;
      Content.Layout := Cons.L_SPLITH;
      Content.Name := Ada.Strings.Unbounded.To_Unbounded_String ("content");
      --  x_set_name (con, "[adawm con] content ", Content.Name);
      --  Content.Attach_To is disabled until it is implemented in cons.adb
      --  Content := Content.Attach_To (con, False);

      --  Bottom dockarea could be added here TODO
      return con;
   end Initialize_Con;

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
