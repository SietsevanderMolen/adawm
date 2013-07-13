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
with Ada.Strings.Unbounded;

with Rectangles;

--  A 'Con' represents everything from the X11 root window down to a single X11
--  window.
package Cons is
   type Con;
   type Con_Access is access all Con;

   type Con is tagged
      record
         Parent : Con_Access;
         Rect   : Rectangles.Rectangle;
         Name   : Ada.Strings.Unbounded.Unbounded_String;
      end record;

   function "="(a, b : Con) return Boolean;
end Cons;
--  vim:ts=3:expandtab:tw=80
