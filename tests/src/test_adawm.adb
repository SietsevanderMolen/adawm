with Ahven.Framework;
with Ahven.XML_Runner;
with AdaWM_Tests;

procedure Test_AdaWM is
      Suite : Ahven.Framework.Test_Suite := AdaWM_Tests.Get_Test_Suite;
begin
      Ahven.XML_Runner.Run (Suite);
end Test_AdaWM;
