with Cons;
with Log;
with X11_Root_Windows;

package body Tree_Manager is
   procedure Add_Con_To_Tree_String (Position : in Trees.Containers.Cursor)
   is
      Con : Cons.Con'Class := Trees.Containers.Element (Position);
   begin
      Ada.Strings.Unbounded.Append (Tree_String, Con.Name);
   end Add_Con_To_Tree_String;

   procedure Add_Output_Container
      (Output_Container : Output_Containers.Output_Container)
   is
      Root    : constant Trees.Containers.Cursor := Tree.Root;
      X11_Win : constant Trees.Containers.Cursor :=
         Trees.Containers.First_Child (Root);
   begin
      Tree.Append_Child (Parent   => X11_Win,
                         New_Item => Output_Container);
   end Add_Output_Container;

   procedure Init_Tree
   is
      Root    : constant Trees.Containers.Cursor := Tree.Root;
      X11_Win : X11_Root_Windows.X11_Root_Window := X11_Root_Windows.Make;
   begin
      Log.Increase_Indent;
      Log.Info ("Creating tree");
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
