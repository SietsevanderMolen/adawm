with Ada.Strings.Unbounded;
with Cons;
with xab_types;

with Rectangles;

package Output_Container is
   type Output_Container;
   type Output_Container_Access is access all Output_Container;

   type Output_Container is new Cons.Con with private;
private
   type Output_Container is new Cons.Con with
      record
         --  Output id, so that we can requery the output directly later
         Id : xab_types.xab_randr_output_t;
         --  Name of the output
         Name : Ada.Strings.Unbounded.Unbounded_String;
         Active : Boolean;

         --  Internal flags, necessary for querying Randr screens
         Changed : Boolean;
         To_Be_Deleted : Boolean;
         Primary : Boolean;

         --  X, Y, width and height
         Rect : Rectangles.Rectangle;
      end record;
end Output_Container;
