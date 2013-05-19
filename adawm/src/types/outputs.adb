with Log;

package body Outputs is
   function Create_Workspace_On_Output (o : in out Output;
                                        c : in out Cons.Con)
                                        return Cons.Con
   is
      Workspace : Cons.Con := Cons.Create;
   begin
      Workspace.CType := Cons.CT_WORKSPACE;



      return Cons.Attach_To (Workspace, c, False);
   end Create_Workspace_On_Output;

   procedure Init_Workspace (o : in out Output;
                             c : in out Cons.Con)
   is
   begin
      --  • Move existing workspaces, which are assigned to be on the given
      --    output, to the output. NOT IMPLEMENTED
      --  • Create the first assigned workspace for this output. NOT
      --    IMPLEMENTED
      --  if there is still no workspace, we create the first free workspace
      Log.Info ("Adding workspace to output " &
                 Ada.Strings.Unbounded.To_String (o.Name));
      declare
         Con : Cons.Con;
      begin
         Con := Create_Workspace_On_Output (o, c);
      end;
      --  Con *ws = create_workspace_on_output(output, content);
   end Init_Workspace;
end Outputs;
