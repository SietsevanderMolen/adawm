with Ada.Strings.Unbounded;
with Cons;
with xab_types;

with Rectangles;

package X11_Window_Containers is
   type X11_Window_Container;
   type X11_Window_Container_Access is access all Output_Container;

   type X11_Window_Container is new Cons.Con with private;
private
   type X11_Window_Container is new Cons.Con with
      record
         Todo : Boolean;
      end record;
end X11_Window_Containers;
