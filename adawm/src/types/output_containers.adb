package body Output_Containers is
   function Is_Active (OC : Output_Container)
      return Boolean
   is
   begin
      return OC.Active;
   end Is_Active;

   procedure Set_Active (OC : out Output_Container;
                         Is_Active : Boolean)
   is
   begin
      OC.Active := Is_Active;
   end Set_Active;
end Output_Containers;
