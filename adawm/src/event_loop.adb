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

package body Event_Loop is
   procedure Handle_Event (e : in Xab_Events.Generic_Event'Class)
   is
   begin
      null;
   end Handle_Event;

   procedure Start (Connection : Xab_Types.Connection;
                    Event_Mask : Xab_Types.Event_Mask)
   is
      --  xcbada_xproto.xcb_change_window_attributes (
      --    dpy, root, xcbada_xproto.XCB_CW_EVENT_MASK,
      --    events_we_listen_to'Access);
      task Main_Loop is
      end Main_Loop;
      task body Main_Loop is
      begin
         loop
            declare
               Event : Xab_Events.Generic_Event'class :=
                  Xab.Wait_For_Event (Connection);
            begin
               Handle_Event (Event);
            end;
         end loop;
      end Main_Loop;
   begin
      null;
   end Start;
end Event_Loop;
--  vim:ts=3:sts=3:sw=3:expandtab:tw=80
