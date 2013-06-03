with Ada.Strings.Unbounded;

with xab_types;

with Cons;
with Rectangles;

package Output_Containers is
   type Output_Container is new Cons.Con with private;

   function Is_Active (OC : Output_Container) return Boolean;
private
   type Output_Container is new Cons.Con with
      record
         --  Output id, so that we can requery the output directly later
         Id : xab_types.xab_randr_output_t;
         Active : Boolean;

         --  Internal flags, necessary for querying Randr screens
         Changed : Boolean;
         To_Be_Deleted : Boolean;
         Primary : Boolean;
      end record;
end Output_Containers;
