package body Output_Containers is
   function Is_Active (OC : Output_Container)
      return Boolean
   is
   begin
      return OC.Active;
   end Is_Active;
end Output_Containers;
