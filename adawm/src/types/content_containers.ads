with Cons;
with xab_types;
with Rectangles;

package Content_Containers is
   type Content_Container;
   type Content_Container_Access is access all Content_Container;

   type Content_Container is new Cons.Con with private;
private
   type Content_Container is new Cons.Con with
      record
         Todo : Boolean;
      end record;
end Content_Containers;
