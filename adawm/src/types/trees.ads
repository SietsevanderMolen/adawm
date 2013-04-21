with Cons;
--  The tree data structure contains all the Cons in the system
package Trees is
   type Tree is tagged private;
   type Tree_Access is access Tree;

   --  Creates the tree by creating the root node, adding all RandR outputs
   --  to the tree (that means randr_init() has to be called before) and
   --  assigning a workspace to each RandR output.
   function Create return Tree;
private
   type Tree is tagged
      record
         Con_Root : Cons.Con;
         Focused  : Cons.Con;
         All_Cons : Cons.Con_List.List;
      end record;
end Trees;
