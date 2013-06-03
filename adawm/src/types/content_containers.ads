with Cons;
with Rectangles;
with xab_types;

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
