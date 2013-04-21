with xab_types;
with Types;

package Randr is
   Output_List : Types.Output_Container.List;

   procedure Initialize_Randr (Connection : xab_types.xab_connection_t);
   procedure Initialize_Con (Output : Types.Output);

   procedure Fake_Single_Screen (Connection : xab_types.xab_connection_t);

   procedure Query_Outputs
      (Connection : xab_types.xab_connection_t;
       Window     : xab_types.xab_window_t);
end Randr;
