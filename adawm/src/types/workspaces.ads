with Cons;
with Rectangles;
with xab_types;

package Workspaces is
   type Workspace;
   type Workspace is access all Workspace;

   type Workspace is new Cons.Con with private;
private
   type Workspace is new Cons.Con with
      record
         Todo : Boolean;
      end record;
end Workspaces;
