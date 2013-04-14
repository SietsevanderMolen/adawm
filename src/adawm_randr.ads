with xab_types;
with AdaWM_Types;

package AdaWM_Randr is
   Output_List : AdaWM_Types.Output_Container.List;

   procedure Initialize_Randr (Connection : xab_types.xab_connection_t);
   procedure Initialize_Con (Output : AdaWM_Types.Output);

   procedure Fake_Single_Screen (Connection : xab_types.xab_connection_t);

   procedure Query_Outputs
      (Connection : xab_types.xab_connection_t;
       Window     : xab_types.xab_window_t);
end AdaWM_Randr;
