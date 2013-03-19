--  vim:ts=3:expandtab:tw=79:colorcolumn=79
with xab;
with xab_types;
with GNATCOLL.Traces;

with AdaWM_ControlGroups;
with AdaWM_Log;
with AdaWM_Randr;
with AdaWM_Xinerama;

procedure AdaWM is
   --  Our global connection to the X11 server
   Global_X_Connection : xab_types.xab_connection_t;
begin
   AdaWM_Log.Info ("Starting AdaWM");
   AdaWM_Log.Increase_Indent;

   --  Connect to the X11 display server. xab_connect checks if the connection
   --  succeeded and raises ConnectionFailedException
   Global_X_Connection := xab.xab_connect;
   AdaWM_Log.Info ("Global X11 connection established");

   GNATCOLL.Traces.Increase_Indent;
   if xab.xab_has_randr (Global_X_Connection) then
         AdaWM_Log.Info ("RandR extension found, initialising");
      AdaWM_Randr.Initialize_Randr (Global_X_Connection);
   elsif xab.xab_has_xinerama (Global_X_Connection) then
         AdaWM_Log.Info ("Xinerama found, initialising");
      AdaWM_Xinerama.Initialize_Xinerama (Global_X_Connection);
   else
      AdaWM_Log.Warning (
         "No Randr or Xinerama extensions found, faking single randr screen");
      AdaWM_Randr.Fake_Single_Screen (Global_X_Connection);
   end if;
   AdaWM_Log.Decrease_Indent;

   AdaWM_Log.Decrease_Indent;
   AdaWM_Log.Info ("Quit AdaWM");
end AdaWM;
