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
with Xab;

with Ada.Text_IO;
with Ada.Tags; use Ada.Tags;

package body Event_Loop is
   procedure Handle_Event (Connection : Xab_Types.Connection;
                           e : in Xab_Events.Generic_Event'Class)
   is
   begin
      if e'Tag = Xab_Events.Configure_Request'Tag then
         declare
            ne : constant Xab_Events.Configure_Request :=
               Xab_Events.Configure_Request (e);
         begin
            Xab.Configure_Window (Connection, ne.Window, ne.X, ne.Y,
                                  ne.Width, ne.Height);
         end;
      elsif e'Tag = Xab_Events.Map_Request'Tag then
         declare
            ne : constant Xab_Events.Map_Request := Xab_Events.Map_Request (e);
         begin
            Xab.Map_Window (Connection, ne.Window);
         end;
      elsif e'Tag = Xab_Events.None'Tag then
         Ada.Text_IO.Put_Line ("Got ev type: " & Integer'Image
            (Xab_Events.None (e).Response_Type));
      end if;
   end Handle_Event;

   procedure Start (Connection : Xab_Types.Connection)
   is
      task Main_Loop is
      end Main_Loop;
      task body Main_Loop is
      begin
         loop
            declare
               Event : constant Xab_Events.Generic_Event'class :=
                  Xab.Wait_For_Event (Connection);
            begin
               Handle_Event (Connection, Event);
            end;
         end loop;
      end Main_Loop;
   begin
      null;
   end Start;
end Event_Loop;
--  vim:ts=3:sts=3:sw=3:expandtab:tw=80
