with xab_types;

with Cons;
with Layout_Types;
with Rectangles;

package Workspaces is
   type Workspace;
   type Workspace_Access is access all Workspace;

   function Make return Workspace;

   type Workspace is new Cons.Con with private;
private
   type Workspace is new Cons.Con with
      record
         Layout : Layout_Types.Layout_Type;
      end record;
end Workspaces;
