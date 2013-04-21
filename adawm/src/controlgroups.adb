with Ada.Directories; use Ada.Directories;
with Log;

package body ControlGroups is
   function Is_Enabled return Boolean
   is
      Name : constant String := "/sys/fs/cgroup/";
   begin
      if Ada.Directories.Exists (Name) and then
         Ada.Directories.Kind (Name) = Ada.Directories.Directory then

         Log.Info ("/sys/fs/cgroup/ found, " &
                         "assuming ControlGroups are available");
         return True;
      else
         Log.Info ("/sys/fs/cgroup/ not found, " &
                          "assuming ControlGroups are not available");
         return False;
      end if;
   end Is_Enabled;
end ControlGroups;
