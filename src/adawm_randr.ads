with xab_types;

package AdaWM_Randr is
   procedure Initialize_Randr (Connection : xab_types.xab_connection_t);

   procedure Fake_Single_Screen (Connection : xab_types.xab_connection_t);
end AdaWM_Randr;
