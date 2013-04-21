with Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists;

with xab_types;

package Types is
   type Rectangle is record
      X      : Integer;
      Y      : Integer;
      Width  : Integer;
      Height : Integer;
   end record;

   type Output is record
      --  Output id, so that we can requery the output directly later
      Id : xab_types.xab_randr_output_t;
      --  Name of the output
      Name : Ada.Strings.Unbounded.Unbounded_String;
      --  Whether the output is currently active (has a CRTC attached with a
      --  valid mode
      Active : Boolean;

      --  Internal flags, necessary for querying Randr screens
      Changed       : Boolean;
      To_Be_Deleted : Boolean;
      Primary       : Boolean;

      --  X, Y, width and height
      Rect : Rectangle;
   end record;

   package Output_Container is
      new Ada.Containers.Doubly_Linked_Lists(Output);

   type Virtual_Screen is record
      Num : Integer;
      Rect : Rectangle;
   end record;
end Types;
