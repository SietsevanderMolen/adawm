with Ada.Containers.Indefinite_Multiway_Trees; use Ada.Containers;

with Cons; use Cons;
with Log;
with Output_Containers;

--  The tree data structure contains all the Cons in the system
package Trees is
   package Containers is new Ada.Containers.Indefinite_Multiway_Trees
      (Element_Type => Con'Class);

   function Make return Containers.Tree;
end Trees;
