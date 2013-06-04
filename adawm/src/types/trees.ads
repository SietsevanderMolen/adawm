with Ada.Containers.Indefinite_Multiway_Trees; use Ada.Containers;

with Cons; use Cons;

--  The tree data structure contains all the Cons in the system
package Trees is
   package Containers is new Ada.Containers.Indefinite_Multiway_Trees
      (Element_Type => Con'Class);
end Trees;
