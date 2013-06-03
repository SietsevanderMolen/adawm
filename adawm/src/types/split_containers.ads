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
