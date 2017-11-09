-------------------------------------------------------------------------------
--                                                                           --
--                   Copyright (C) 2012-, Sietse van der Molen               --
--                                                                           --
--    This file is part of AdaWM.                                            --
--                                                                           --
--    AdaWM is free software: you can redistribute it and/or modify          --
--    it under the terms of the GNU General Public License as published by   --
--    the Free Software Foundation, either version 3 of the License, or      --
--    (at your option) any later version.                                    --
--                                                                           --
--    AdaWM is distributed in the hope that it will be useful,               --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of         --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          --
--    GNU General Public License for more details.                           --
--                                                                           --
--    You should have received a copy of the GNU General Public License      --
--    along with AdaWM.  If not, see <http://www.gnu.org/licenses/>.         --
--                                                                           --
-------------------------------------------------------------------------------
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Xab;

with Output_Containers;
with Log;
with Tree_Manager;

package body Randr is
   --  Creates a single output stretching across the entire root_screen
   procedure Fake_Single_Screen (Connection : Xab_Types.Connection) is
      output : Output_Containers.Output_Container;
      root_screen : constant Xab_Types.Screen :=
         Xab.Get_Root_Screen (Connection);
   begin
      Log.Warning ("Faking single RandR screen");
      Log.Increase_Indent;

      output.Rect.X      := 0;
      output.Rect.Y      := 0;
      output.Rect.Width  := root_screen.Width_In_Pixels;
      output.Rect.Height := root_screen.Height_In_Pixels;
      output.Name        :=
         Ada.Strings.Unbounded.To_Unbounded_String ("xroot-0");

      --  Set this output to active
      output.Set_Active (Is_Active => True);

      Log.Info ("Created output " & To_String (output.Name) & " with size " &
         output.Rect.Width'Img & " ," & output.Rect.Height'Img);

      --  Init output here
      Tree_Manager.Add_Output_Container (output);

      Log.Decrease_Indent;
   end Fake_Single_Screen;

   procedure Initialize_Randr (Connection : Xab_Types.Connection) is
      pragma Unreferenced (Connection);
      Not_Implemented : exception;
   begin
      Log.Info ("Initialising RandR");
      raise Not_Implemented
         with "Real Randr is not implemented and should never be called";
   end Initialize_Randr;

   --  Not implemented
   procedure Query_Outputs
      (Connection : Xab_Types.Connection;
       Window     : Xab_Types.Window)
   is
      --  Other_Output     : Outputs.Output;
      --  Resources_Cookie :
      --  xab_randr.xab_randr_get_screen_resources_current_cookie_t :=
         --  xab_randr.xab_randr_get_screen_resources_current
            --  (Connection, Window);
         --  Primary_Cookie : xab_randr.xab_randr_get_output_primary_cookie_t;
      --  Configuration_TimeStamp : xab_types.xab_timestamp_t;
      --  Randr_Outputs           : xab_randr_output_t_container.Vector;
   begin
      null;
   end Query_Outputs;
end Randr;
--  vim:ts=3:expandtab:tw=80
