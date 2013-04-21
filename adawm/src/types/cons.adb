package body Cons is
   function Attach_To (C            : Con;
                       Parent       : Con;
                       Ignore_Focus : Boolean)
      return Con
   is
      Not_Implemented : exception;
   begin
      raise Not_Implemented with "This procedure is not yet implemented";
      return C;
   end Attach_To;

   function Create
      return Con
   is
      New_Con : Con;
   begin
      return New_Con;
   end Create;

   function Create (parent : Con)
      return Con
   is
      --  First calls the "regular" create function
      New_Con : Con := Create;
   begin
      New_Con := New_Con.Attach_To (parent, False);
      return New_Con;
   end Create;
end Cons;
