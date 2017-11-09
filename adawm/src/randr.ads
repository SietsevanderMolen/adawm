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
with Xab_Types;

package Randr is
   procedure Initialize_Randr (Connection : Xab_Types.Connection);

   procedure Fake_Single_Screen (Connection  : Xab_Types.Connection);

   procedure Query_Outputs
      (Connection : Xab_Types.Connection;
       Window     : Xab_Types.Window);
end Randr;
--  vim:ts=3:expandtab:tw=80
