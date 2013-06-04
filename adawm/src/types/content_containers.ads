with Cons;

package Content_Containers is
   type Content_Container;
   type Content_Container_Access is access all Content_Container;

   function Make return Content_Container;

   type Content_Container is new Cons.Con with private;
private
   type Content_Container is new Cons.Con with
      record
         null;
      end record;
end Content_Containers;
