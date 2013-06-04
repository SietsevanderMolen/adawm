with Ada.Strings.Unbounded;

with Output_Containers;
with Trees;

--  Takes care of anything that manipulates the tree
package Tree_Manager is
   Tree : Trees.Containers.Tree;

   --  Add an Output_Container to this tree
   --  Also initialises the Content_Container
   procedure Add_Output_Container
      (Output_Container : Output_Containers.Output_Container);

   --  Initialise this tree
   procedure Init_Tree;

   --  Return a string representation of this tree
   function Tree_To_String return String;
private
   --  A string representation of this tree, updated and retrieved by
   --  Tree_To_String
   Tree_String : Ada.Strings.Unbounded.Unbounded_String :=
      Ada.Strings.Unbounded.To_Unbounded_String ("Tree: ");

   --  Adds the Name of the Con'Class pointed at by Position to Tree_String
   procedure Add_Con_To_Tree_String (Position : in Trees.Containers.Cursor);
end Tree_Manager;
