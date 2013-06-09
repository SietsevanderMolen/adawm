--  vim:ts=3:expandtab:tw=79:colorcolumn=79
with Xab;
with Xab_Types;
with Xab_Events.Event_Loop;

with ControlGroups;
with Log;
with Randr;
with Tree_Manager;

procedure AdaWM is
   --  Our global connection to the X11 server
   --  Connect to the X11 display server. xab_connect checks if the connection
   --  succeeded and raises ConnectionFailedException
   Global_X_Connection : Xab_Types.Xab_Connection_T;

   --  Init cgroups if these are available
   procedure Init_CGroups;
   procedure Init_CGroups is
   begin
      if ControlGroups.Is_Enabled then
         null;
      end if;
   end Init_CGroups;

   --  Init the outputs according to their physical configuration
   procedure Init_Outputs;
   procedure Init_Outputs
   is
   begin
      Randr.Fake_Single_Screen (Global_X_Connection);
   end Init_Outputs;

begin
   Log.Info ("Starting AdaWM");
   Log.Info ("Initialise");
   Log.Increase_Indent;

   Global_X_Connection := Xab.Xab_Connect;
   Tree_Manager.Init_Tree;

   Init_Outputs;
   Init_CGroups;

   Log.Info (Tree_Manager.Tree_To_String);

   Log.Decrease_Indent;
   Log.Info ("Init done");
   Log.Info ("Starting main loop");

   Xab_Events.Event_Loop.start_event_loop (Global_X_Connection);
end AdaWM;
