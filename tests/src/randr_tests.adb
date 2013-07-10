-------------------------------------------------------------------------------
--                                                                           --
--                   Copyright (C) 2012-, Sietse van der Molen		     --
--                                                                           --
--    This file is part of AdaWM.			 	   	     --
--									     --
--    AdaWM is free software: you can redistribute it and/or modify          --
--    it under the terms of the GNU General Public License as published by   --
--    the Free Software Foundation, either version 3 of the License, or      --
--    (at your option) any later version.                                    --
--   		 		 	 	 	 	 	     --
--    AdaWM is distributed in the hope that it will be useful,               --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of         --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          --
--    GNU General Public License for more details.                           --
--                                                                           --
--    You should have received a copy of the GNU General Public License      --
--    along with AdaWM.  If not, see <http://www.gnu.org/licenses/>.         --
--                                                                           --
-------------------------------------------------------------------------------
with Ahven; use Ahven;

with xab;
with xab_types;

with Randr;
with Tree_Manager;

package body Randr_Tests is
     X_Connection : constant xab_types.xab_connection_t 
        := xab.xab_connect;

   procedure Initialize (T : in out Test) is
   begin
      Set_Name (T, "Randr");

      Framework.Add_Test_Routine
        (T, Test_Fake_Single_Screen_Exception_Absence'Access, "Fake_Single_Screen");
      Framework.Add_Test_Routine
        (T, Test_Initialize_Con'Access, "Initialize_Con");
   end Initialize;

   procedure Test_Fake_Single_Screen_Exception_Absence is
   begin
        Tree_Manager.Init_Tree;
        Randr.Fake_Single_Screen (X_Connection);
   end Test_Fake_Single_Screen_Exception_Absence;

   procedure Test_Initialize_Con is
      --  Output : Types.Output;
   begin
      --  Randr.Initialize_Con (Output);
      null;
   end Test_Initialize_Con;
end Randr_Tests;
