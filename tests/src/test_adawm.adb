with Ahven.Framework;
with Ahven.Text_Runner;
with AdaWM_Tests;

procedure Test_AdaWM is
      Suite : Ahven.Framework.Test_Suite := AdaWM_Tests.Get_Test_Suite;
begin
      Ahven.Text_Runner.Run (Suite);
end Test_AdaWM;
