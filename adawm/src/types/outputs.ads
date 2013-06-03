with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded;
with xab_types;

with Cons;
with Rectangles;

package Outputs is
   type Output is record
      --  Output id, so that we can requery the output directly later
      Id : xab_types.xab_randr_output_t;
      --  Name of the output
      Name : Ada.Strings.Unbounded.Unbounded_String;

      --  Con that represents this output
      Con : Cons.Con;
      --  Whether the output is currently active (has a CRTC attached with a
      --  valid mode
      Active : Boolean;

      --  Internal flags, necessary for querying Randr screens
      Changed       : Boolean;
      To_Be_Deleted : Boolean;
      Primary       : Boolean;

      --  X, Y, width and height
      Rect : Rectangles.Rectangle;
   end record;

   package Output_Container is
      new Ada.Containers.Doubly_Linked_Lists (Output);

   --  Initializes at least one workspace for this output, trying the following
   --  steps until there is at least one workspace:
   --  • Move existing workspaces, which are assigned to be on the given
   --    output, to the output. NOT IMPLEMENTED
   --  • Create the first assigned workspace for this output. NOT IMPLEMENTED
   --  • Create the first unused workspace.
   procedure Init_Workspace (o : in out Output;
                             c : in out Cons.Con);

   function Create_Workspace_On_Output (o : in out Output;
                                        c : in out Cons.Con)
                                        return Cons.Con;
end Outputs;
