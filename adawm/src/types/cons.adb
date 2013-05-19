with Log;

package body Cons is
   function Attach_To (Child_Con    : in out Con;
                       Parent_Con   : in out Con;
                       Ignore_Focus : in Boolean)
      return Con
   is
      Parent_Ptr : Con_Access := new Cons.Con'(Parent_Con);
      Loop_Con    : Con;
      Current_Con : Con;
   begin
      Child_Con.Parent := Parent_Ptr;

      if Child_Con.CType = CT_WORKSPACE then
         Log.Info ("Creating workspace " & Integer'Image(Child_Con.Number));
      end if;

      return Child_Con;
   end Attach_To;

   function Create
      return Con
   is
      New_Con : Con;
   begin
      return New_Con;
   end Create;

   function Create (parent : in out Con)
      return Con
   is
      --  First calls the "regular" create function
      New_Con : Con := Create;
   begin
      New_Con := New_Con.Attach_To (parent, False);
      return New_Con;
   end Create;
end Cons;
