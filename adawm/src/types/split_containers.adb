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
