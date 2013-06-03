with Cons;
with xab_types;

with Rectangles;

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
