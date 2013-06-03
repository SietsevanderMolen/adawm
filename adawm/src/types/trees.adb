--  The tree data structure contains all the Cons in the system
package body Trees is
   function Create return Tree
   is
      T : Tree;
   begin
      return T;
   end Create;
   procedure Render(T: in out Trees.Tree) is
   begin
      -- Skipped croot null check because this is not the responsibility of this procedure
      Log.Info ("Starting rendering");
      -- mark_unmapped is refactored to Unmap_All
      Log.Info ("Stopping rendering");
   end;
   procedure Unmap_All(T: in out Trees.Tree) is
   begin
      null;
   end;
end Trees;
