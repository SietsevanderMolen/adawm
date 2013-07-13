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
with Cons;
with Content_Containers;
with Log;
with Workspaces;
with X11_Root_Windows;

package body Tree_Manager is
   procedure Add_Con_To_Tree_String (Position : in Trees.Containers.Cursor)
   is
      Con : constant Cons.Con'Class := Trees.Containers.Element (Position);
   begin
      Ada.Strings.Unbounded.Append (Tree_String, Con.Name);
   end Add_Con_To_Tree_String;

   --  Please fix this madness :-( TODO FIXME YOLO
   procedure Add_Output_Container
      (Output_Container : Output_Containers.Output_Container)
   is
      Root              : constant Trees.Containers.Cursor := Tree.Root;
      X11_Win           : constant Trees.Containers.Cursor :=
         Trees.Containers.First_Child (Root);
      Content_Container : constant Content_Containers.Content_Container :=
         Content_Containers.Make;
      Workspace         : constant Workspaces.Workspace := Workspaces.Make;
   begin
      Tree.Append_Child (Parent   => X11_Win,
                         New_Item => Output_Container);
      --  Add the output now
      declare
         --  Find the cursor of the X11_Root_Window
         Output_Con : constant Trees.Containers.Cursor :=
            Trees.Containers.First_Child (X11_Win);
      begin
         Tree.Append_Child (Parent   => Output_Con,
                            New_Item => Content_Container);
         declare
            --  Find the cursor of the Content_Container
            Content_Con : constant Trees.Containers.Cursor :=
               Trees.Containers.First_Child (Output_Con);
         begin
            Tree.Append_Child (Parent   => Content_Con,
                               New_Item => Workspace);
         end;
      end;
   end Add_Output_Container;

   procedure Init_Tree
   is
      Root    : constant Trees.Containers.Cursor := Tree.Root;
      X11_Win : constant X11_Root_Windows.X11_Root_Window :=
         X11_Root_Windows.Make;
   begin
      Log.Info ("Initialising tree");
      Log.Increase_Indent;
      Log.Info ("Adding X11_Root_Window to tree");
      Tree.Append_Child (Parent   => Root,
                         New_Item => X11_Win);
      Log.Decrease_Indent;
   end Init_Tree;

   function Tree_To_String return String
   is
   begin
      Tree.Iterate (Process => Add_Con_To_Tree_String'Access);
      return Ada.Strings.Unbounded.To_String (Tree_String);
   end Tree_To_String;
end Tree_Manager;
--  vim:ts=3:expandtab:tw=80
