with Log;
with X11_Root_Windows;

package body Tree_Manager is
   procedure Add_Output_Container (output : Output_Containers.Output_Container)
   is
   begin
      null;
   end Add_Output_Container;

   procedure Init_Tree
   is
      Root : Trees.Containers.Cursor := Tree.Root;
      X11_Win : X11_Root_Windows.X11_Root_Window;
   begin
      Log.Increase_Indent;
      Log.Info ("Creating tree");
      Log.Info ("Adding X11_Root_Window to tree");
      Tree.Append_Child (Parent   => Root,
                         New_Item => X11_Win);
      Log.Decrease_Indent;
   end Init_Tree;
end Tree_Manager;
