with Ada.Directories; use Ada.Directories;
with AdaWM_Log;

package body AdaWM_ControlGroups is
   function Is_Enabled return Boolean
   is
      Name : constant String := "/sys/fs/cgroup/";
   begin
      if Ada.Directories.Exists (Name) and then
         Ada.Directories.Kind (Name) = Ada.Directories.Directory then

         AdaWM_Log.Info ("/sys/fs/cgroup/ found, " &
                         "assuming ControlGroups are available");
         return True;
      else
         AdaWM_Log.Info ("/sys/fs/cgroup/ not found, " &
                          "assuming ControlGroups are not available");
         return False;
      end if;
   end Is_Enabled;
end AdaWM_ControlGroups;
