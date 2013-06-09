with Ada.Strings.Unbounded;

package body Workspaces is
      function Make return Workspace
      is
         w : Workspace;
      begin
         w.Name := Ada.Strings.Unbounded.To_Unbounded_String ("Workspace");
         return w;
      end Make;
end Workspaces;
