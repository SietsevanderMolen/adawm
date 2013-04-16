with AUnit.Reporter.Text;
with AUnit.Run;
with Main_Suite;

procedure Test_AdaWM is
   procedure Runner is new AUnit.Run.Test_Runner (Main_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Reporter.Set_Use_ANSI_Colors (True);
   Runner (Reporter);
end Test_AdaWM;
