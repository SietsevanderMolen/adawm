with Cons.con;

package Workspaces is
   type Workspace is record
      --  Name of the workspace
      Name : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   package Workspace_Container is
      new Ada.Containers.Doubly_Linked_Lists (Workspace);
end Workspaces;
