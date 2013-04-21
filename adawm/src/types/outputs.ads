with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded;
with xab_types;

with Cons;
with Types;

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
      Rect : Types.Rectangle;
   end record;

   package Output_Container is
      new Ada.Containers.Doubly_Linked_Lists (Output);
end Outputs;