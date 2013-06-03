with Cons;

package X11_Root_Windows is
   type X11_Root_Window;
   type X11_Root_Window_Access is access all X11_Root_Window;

   type X11_Root_Window is new Cons.Con with private;
private
   type X11_Root_Window is new Cons.Con with
      record
         Todo : Boolean;
      end record;
end X11_Root_Windows;
