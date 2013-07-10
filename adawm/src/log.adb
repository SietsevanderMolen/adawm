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
with GNATCOLL.Traces;

package body Log is
   --  Declare and initialise a logging trace
   Debug_Stream : constant GNATCOLL.Traces.Trace_Handle :=
      GNATCOLL.Traces.Create ("Debug");
   Info_Stream : constant GNATCOLL.Traces.Trace_Handle :=
      GNATCOLL.Traces.Create ("Info");
   Warning_Stream : constant GNATCOLL.Traces.Trace_Handle :=
      GNATCOLL.Traces.Create ("Warning");
   Error_Stream : constant GNATCOLL.Traces.Trace_Handle :=
      GNATCOLL.Traces.Create ("Error");
   Fatal_Stream : constant GNATCOLL.Traces.Trace_Handle :=
      GNATCOLL.Traces.Create ("Fatal");

   procedure Debug (Message : String) is
   begin
      GNATCOLL.Traces.Trace (Debug_Stream, Message);
   end Debug;

   procedure Decrease_Indent is
   begin
      GNATCOLL.Traces.Decrease_Indent;
   end Decrease_Indent;

   procedure Error (Message : String) is
   begin
      GNATCOLL.Traces.Trace (Error_Stream, Message);
   end Error;

   procedure Fatal (Message : String) is
   begin
      GNATCOLL.Traces.Trace (Fatal_Stream, Message);
   end Fatal;

   procedure Increase_Indent is
   begin
      GNATCOLL.Traces.Increase_Indent;
   end Increase_Indent;

   procedure Info (Message : String) is
   begin
      GNATCOLL.Traces.Trace (Info_Stream, Message);
   end Info;

   procedure Warning (Message : String) is
   begin
      GNATCOLL.Traces.Trace (Warning_Stream, Message);
   end Warning;
begin
   --  Parse the ./.gnatdebug file for trace options
   GNATCOLL.Traces.Parse_Config_File;
end Log;
