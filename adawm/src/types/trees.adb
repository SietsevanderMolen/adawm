with Log;
with X11_Root_Windows;

package body Trees is
   function Make
      return Containers.Tree
   is
      use Containers;
      Tree : Containers.Tree;
      Root : Containers.Cursor := Tree.Root;
      X11_Win : X11_Root_Windows.X11_Root_Window;
   begin
      Log.Increase_Indent;
      Log.Info ("Creating tree");
      Log.Info ("Adding X11_Root_Window to tree");

      Tree.Append_Child (Parent   => Root,
                         New_Item => X11_Win);
      
      Log.Decrease_Indent;
      return Tree;
   end Make;
end Trees;
