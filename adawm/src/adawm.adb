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

with Event_Loop;
with Log;
with Randr;
with Tree_Manager;

procedure AdaWM is
   --  Our global connection to the X11 server
   --  Connect to the X11 display server. xab_connect checks if the connection
   --  succeeded and raises ConnectionFailedException
   Global_X_Connection : constant Xab_Types.Connection := Xab.Connect;

   Root_Screen : constant Xab_Types.Screen :=
      Xab.Get_Root_Screen (Global_X_Connection);

   --  TODO need a better way to do this
   Events_To_Watch : Xab_Types.Event_Mask := (
         Xab_Types."or"
            (Xab_Types."or" (Xab_Types.EVENT_MASK_SUBSTRUCTURE_REDIRECT,
                             Xab_Types.EVENT_MASK_SUBSTRUCTURE_NOTIFY),
                             Xab_Types.EVENT_MASK_STRUCTURE_NOTIFY)
      );

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
   Tree_Manager.Init_Tree;
   Init_Outputs;
   Log.Info (Tree_Manager.Tree_To_String);
   Log.Decrease_Indent;
   Log.Info ("Init done");

   Log.Info ("Starting main loop");
   Event_Loop.Start (Connection => Global_X_Connection,
                     Event_Mask => Events_To_Watch);
end AdaWM;
--  vim:ts=3:sts=3:sw=3:expandtab:tw=80
