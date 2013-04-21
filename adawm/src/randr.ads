with xab_types;

with Cons;
with Outputs;
with Trees;

package Randr is
   Output_List : Outputs.Output_Container.List;

   procedure Initialize_Randr (Connection : xab_types.xab_connection_t);
   function Initialize_Con (Output : Outputs.Output;
                            Tree   : Trees.Tree)
                           return Cons.Con;

   procedure Fake_Single_Screen (Connection : xab_types.xab_connection_t;
                                 Tree       : Trees.Tree);

   procedure Query_Outputs
      (Connection : xab_types.xab_connection_t;
       Window     : xab_types.xab_window_t);
end Randr;
