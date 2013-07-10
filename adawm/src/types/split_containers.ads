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
with Cons;
with Trees;
with Rectangles;
with Workspaces;
with xab_types;

package Split_Containers is
   type Split_Container;
   type Split_Container_Access is access all Output_Container;

   function Make (Tree : in out Trees.Containers.Tree; 
                  Parent : Workspaces.Workspace) return Split_Container;
   function Make (Tree : in out Trees.Containers.Tree;
                  Parent : Workspaces.Workspace;
                  Layout : Layout_Type) return Split_Containers;

   type Layout_Type is (L_DEFAULT, L_STACKED, L_TABBED, L_DOCKAREA, L_OUTPUT,
      L_SPLITV, L_SPLITH);

   type Split_Container is new Cons.Con with private;
private
   type Split_Container is new Cons.Con with
      record
         Layout : Layout_Type;
      end record;
end Split_Containers;
