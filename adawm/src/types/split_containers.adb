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
package body Split_Containers is
   function Make (Tree : in out Trees.Containers.Tree;
                  Parent : Workspaces.Workspace) return Split_Container
   is
      Parent_Cursor : constant Trees.Containers.Cursor := Tree.Find (Item => Parent);
      SC: Split_Container;
   begin
      SC.Layout := L_DEFAULT;
      Tree.Append_Child(Parent => Parent_Cursor, 
                        New_Item => SC);
   end Make;

   function Make (Tree : in out Trees.Containers.Tree;
                  Parent : Workspaces.Workspace;
                  Layout : Layout_Type) return Split_Containers
   is
      Parent_Cursor : constant Trees.Containers.Cursor := Tree.Find (Item => Parent);
      SC: Split_Container;
   begin
      SC.Layout := Layout;
      Tree.Append_Child(Parent => Parent_Cursor,
                        New_Item => SC);
   end Make;
end Split_Containers;
