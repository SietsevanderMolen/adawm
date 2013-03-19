--  vim:ts=3:expandtab:tw=79:colorcolumn=79
with GNATCOLL.Traces;
with xab;
with xab_types;

with AdaWM_Xinerama;
with AdaWM_Randr;

procedure AdaWM is
   --  Declare and initialise a logging trace
   Warning_Stream : constant GNATCOLL.Traces.Trace_Handle :=
      GNATCOLL.Traces.Create ("Warning");
   Notice_Stream : constant GNATCOLL.Traces.Trace_Handle :=
      GNATCOLL.Traces.Create ("Notice");

   --  Our global connection to the X11 server
   Global_X_Connection : xab_types.xab_connection_t;
begin
   --  Parse the ./.gnatdebug file for trace options
   GNATCOLL.Traces.Parse_Config_File;
   GNATCOLL.Traces.Increase_Indent (Notice_Stream, "Starting AdaWM");

   --  Connect to the X11 display server. xab_connect checks if the connection
   --  succeeded and raises ConnectionFailedException
   Global_X_Connection := xab.xab_connect;
   GNATCOLL.Traces.Trace (Notice_Stream,
                          "Global X11 connection established");

   if xab.xab_has_randr (Global_X_Connection) then
      GNATCOLL.Traces.Trace (Notice_Stream,
         "RandR extension found, initialising");
      AdaWM_Randr.Initialize_Randr (Global_X_Connection);
      null;
   elsif xab.xab_has_xinerama (Global_X_Connection) then
      GNATCOLL.Traces.Trace (Notice_Stream,
         "Xinerama found, initialising");
      AdaWM_Xinerama.Initialize_Xinerama (Global_X_Connection);
      null;
   else
      GNATCOLL.Traces.Trace (Warning_Stream,
         "No Randr or Xinerama extensions found, faking single randr screen");
      AdaWM_Randr.Fake_Single_Screen (Global_X_Connection);
   end if;

   GNATCOLL.Traces.Decrease_Indent (Notice_Stream, "Quit AdaWM");
end AdaWM;
