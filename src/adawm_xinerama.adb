with AdaWM_Log;

package body AdaWM_Xinerama is
   procedure Initialize_Xinerama (Connection : xab_types.xab_connection_t) is
   begin
      AdaWM_Log.Info ("Initialising Xinerama");
   end Initialize_Xinerama;
end AdaWM_Xinerama;
