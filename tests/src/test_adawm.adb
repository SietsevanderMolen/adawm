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
with Ahven.Framework;
with Ahven.XML_Runner;
with Tests;

procedure Test_AdaWM is
      Suite : Ahven.Framework.Test_Suite := Tests.Get_Test_Suite;
begin
      Ahven.XML_Runner.Run (Suite);
end Test_AdaWM;
