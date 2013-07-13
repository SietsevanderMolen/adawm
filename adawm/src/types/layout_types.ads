-------------------------------------------------------------------------------
--                                                                           --
--                   Copyright (C) 2012-, Sietse van der Molen               --
--                                                                           --
--    This file is part of AdaWM.                                            --
--                                                                           --
--    AdaWM is free software: you can redistribute it and/or modify          --
--    it under the terms of the GNU General Public License as published by   --
--    the Free Software Foundation, either version 3 of the License, or      --
--    (at your option) any later version.                                    --
--                                                                           --
--    AdaWM is distributed in the hope that it will be useful,               --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of         --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          --
--    GNU General Public License for more details.                           --
--                                                                           --
--    You should have received a copy of the GNU General Public License      --
--    along with AdaWM.  If not, see <http://www.gnu.org/licenses/>.         --
--                                                                           --
-------------------------------------------------------------------------------
package Layout_Types is
   --  workspace_layout is only for type == CT_WORKSPACE cons. When you
   --  change the layout of a workspace without any children, i3 cannot
   --  just set the layout (because workspaces need to be splitv/splith
   --  to allow focus parent and opening new containers). Instead, it
   --  stores the requested layout in workspace_layout and creates a new
   --  split container with that layout whenever a new container is
   --  attached to the workspace.
   type Layout_Type is (L_DEFAULT, L_STACKED, L_TABBED, L_DOCKAREA, L_OUTPUT,
      L_SPLITV, L_SPLITH);
end Layout_Types;
--  vim:ts=3:expandtab:tw=80
