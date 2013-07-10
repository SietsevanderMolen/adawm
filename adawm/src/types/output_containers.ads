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
with Xab_Types;

with Cons;

package Output_Containers is
   type Output_Container is new Cons.Con with private;

   --  Returns whether this output is currently active
   function Is_Active (OC : Output_Container) return Boolean;

   --  Set whether this output is currently active
   procedure Set_Active (OC        : out Output_Container;
                         Is_Active : Boolean);
private
   type Output_Container is new Cons.Con with
      record
         --  Output id, so that we can requery the output directly later
         Output_Id : Xab_Types.Xab_Randr_Output_T;
         Active    : Boolean;

         --  Internal flags, necessary for querying Randr screens
         Changed       : Boolean;
         To_Be_Deleted : Boolean;
         Primary       : Boolean;
      end record;
end Output_Containers;
