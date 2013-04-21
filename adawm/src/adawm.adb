--  vim:ts=3:expandtab:tw=79:colorcolumn=79
with xab;
with xab_types;
with GNATCOLL.Traces;

with ControlGroups;
with Log;
with Randr;

procedure AdaWM is
   --  Our global connection to the X11 server
   --  Connect to the X11 display server. xab_connect checks if the connection
   --  succeeded and raises ConnectionFailedException
   Global_X_Connection : constant xab_types.xab_connection_t 
      := xab.xab_connect;

   --  Init cgroups if these are available
   procedure Init_CGroups;
   procedure Init_CGroups is
   begin
      if ControlGroups.Is_Enabled then
         null;
      end if;
   end Init_CGroups;

   --  Init the outputs according to their configuration
   procedure Init_Outputs;
   procedure Init_Outputs
   is
   begin
      GNATCOLL.Traces.Increase_Indent;
      Randr.Fake_Single_Screen (Global_X_Connection);
      Log.Decrease_Indent;
   end Init_Outputs;
begin
   Log.Info ("Starting AdaWM");
   Log.Increase_Indent;

   Init_Outputs;
   Init_CGroups;

   Log.Decrease_Indent;
   Log.Info ("Quit AdaWM");
end AdaWM;
