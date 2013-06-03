with Ada.Containers.Multiway_Trees; use Ada.Containers;

with Cons; use Cons;
with Log;

--  The tree data structure contains all the Cons in the system
package Trees is
   package Containers is new Ada.Containers.Multiway_Trees
      (Element_Type => Con);
       --Equivalent_Keys => "=");
end Trees;
