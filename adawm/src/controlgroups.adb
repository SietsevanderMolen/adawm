-------------------------------------------------------------------------------
--                                                                           --
--                   Copyright (C) 2012-, Sietse van der Molen		     --
--                                                                           --
--    This file is part of AdaWM.			 	   	     --
--									     --
--    AdaWM is free software: you can redistribute it and/or modify          --
--    it under the terms of the GNU General Public License as published by   --
--    the Free Software Foundation, either version 3 of the License, or      --
--    (at your option) any later version.                                    --
--   		 		 	 	 	 	 	     --
--    AdaWM is distributed in the hope that it will be useful,               --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of         --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          --
--    GNU General Public License for more details.                           --
--                                                                           --
--    You should have received a copy of the GNU General Public License      --
--    along with AdaWM.  If not, see <http://www.gnu.org/licenses/>.         --
--                                                                           --
-------------------------------------------------------------------------------
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
