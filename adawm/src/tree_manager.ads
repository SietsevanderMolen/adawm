with Output_Containers;
with Trees;

package Tree_Manager is
   Tree : Trees.Containers.Tree;

   procedure Add_Output_Container (output : Output_Containers.Output_Container);
   procedure Init_Tree;
end Tree_Manager;
