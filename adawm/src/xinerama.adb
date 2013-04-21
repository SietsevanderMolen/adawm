with Log;

package body Xinerama is
   procedure Initialize_Xinerama (Connection : xab_types.xab_connection_t) is
   begin
      Log.Info ("Initialising Xinerama");
   end Initialize_Xinerama;
end Xinerama;
