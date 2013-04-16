package AdaWM_Log is
   procedure Debug   (Message : String);
   procedure Info    (Message : String);
   procedure Warning (Message : String);
   procedure Error   (Message : String);
   procedure Fatal   (Message : String);

   procedure Decrease_Indent;
   procedure Increase_Indent;
end AdaWM_Log;
