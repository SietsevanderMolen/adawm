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
      Tree.Replace_Element (Position => Root,
                            New_Item => X11_Win);
      return Tree;
   end Make;
end Trees;
