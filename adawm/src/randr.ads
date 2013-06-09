with Xab_Types;

package Randr is
   procedure Initialize_Randr (Connection : Xab_Types.Xab_Connection_T);

   procedure Fake_Single_Screen (Connection  : Xab_Types.Xab_Connection_T);

   procedure Query_Outputs
      (Connection : Xab_Types.Xab_Connection_T;
       Window     : Xab_Types.Xab_Window_T);
end Randr;
