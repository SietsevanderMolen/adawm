with Cons;
with Rectangles;
with xab_types;

package Split_Containers is
   type Split_Container;
   type Split_Container_Access is access all Output_Container;

   type Split_Container is new Cons.Con with private;
private
   type Split_Container is new Cons.Con with
      record
         Todo : Boolean;
      end record;
end Split_Containers;
