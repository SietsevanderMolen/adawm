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
with Xab_Types;
with Xab_Events.Event_Loop;

with Log;
with Randr;
with Tree_Manager;

procedure AdaWM is
   --  Our global connection to the X11 server
   --  Connect to the X11 display server. xab_connect checks if the connection
   --  succeeded and raises ConnectionFailedException
   Global_X_Connection : Xab_Types.Connection;

   --  Init the outputs according to their physical configuration
   procedure Init_Outputs;
   procedure Init_Outputs
   is
   begin
      Randr.Fake_Single_Screen (Global_X_Connection);
   end Init_Outputs;

begin
   Log.Info ("Starting AdaWM");
   Log.Info ("Initialising");
   Log.Increase_Indent;

   Global_X_Connection := Xab.Connect;
   Tree_Manager.Init_Tree;

   Init_Outputs;

   Log.Info (Tree_Manager.Tree_To_String);

   Log.Decrease_Indent;
   Log.Info ("Init done");

   Log.Info ("Starting main loop");
   Xab_Events.Event_Loop.start_event_loop(Global_X_Connection);
end AdaWM;
--  vim:ts=3:expandtab:tw=80
