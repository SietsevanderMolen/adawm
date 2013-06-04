with Ada.Strings.Unbounded;

with Log;

package body Workspaces is
      function Make return Workspace
      is
         W : Workspace;
      begin
         W.Name := Ada.Strings.Unbounded.To_Unbounded_String ("Workspace");
         return w;
      end Make;
end Workspaces;
