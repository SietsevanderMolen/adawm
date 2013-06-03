with xab_types;

with Trees;

package Randr is
   procedure Initialize_Randr (Connection : xab_types.xab_connection_t);

   procedure Fake_Single_Screen (Connection  : xab_types.xab_connection_t);

   procedure Query_Outputs
      (Connection : xab_types.xab_connection_t;
       Window     : xab_types.xab_window_t);
end Randr;
