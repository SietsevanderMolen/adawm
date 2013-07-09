with Xab_Types;

with Cons;

package Output_Containers is
   type Output_Container is new Cons.Con with private;

   --  Returns whether this output is currently active
   function Is_Active (OC : Output_Container) return Boolean;

   --  Set whether this output is currently active
   procedure Set_Active (OC        : out Output_Container;
                         Is_Active : Boolean);
private
   type Output_Container is new Cons.Con with
      record
         --  Output id, so that we can requery the output directly later
         Output_Id : Xab_Types.Xab_Randr_Output_T;
         Active    : Boolean;

         --  Internal flags, necessary for querying Randr screens
         Changed       : Boolean;
         To_Be_Deleted : Boolean;
         Primary       : Boolean;
      end record;
end Output_Containers;