with Log;

package body Outputs is
   procedure Init_Workspace (o : in out Output)
   is
   begin
      --  • Move existing workspaces, which are assigned to be on the given
      --    output, to the output. NOT IMPLEMENTED
      --  • Create the first assigned workspace for this output. NOT
      --    IMPLEMENTED
      --  if there is still no workspace, we create the first free workspace
      Log.Info ("Adding workspace to output " &
                 Ada.Strings.Unbounded.To_String (o.Name));
      --  Con *ws = create_workspace_on_output(output, content);
   end Init_Workspace;
end Outputs;
