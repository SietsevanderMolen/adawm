with Ada.Strings.Unbounded;

with Output_Containers;
with Trees;

--  Takes care of anything that manipulates the tree
package Tree_Manager is
   Tree : Trees.Containers.Tree;

   --  Add an Output_Container to this tree
   procedure Add_Output_Container
      (Output_Container : Output_Containers.Output_Container);

   --  Initialise this tree
   procedure Init_Tree;

   --  Return a string representation of this tree
   function Tree_To_String return String;
private
   Tree_String : Ada.Strings.Unbounded.Unbounded_String :=
      Ada.Strings.Unbounded.To_Unbounded_String ("Tree: ");

   procedure Add_Con_To_Tree_String (Position : in Trees.Containers.Cursor);
end Tree_Manager;
