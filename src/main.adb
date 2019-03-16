with Submarine; use Submarine;
with Hatch_System; use Hatch_System;

procedure Main is
  Sub: Submarine.Submarine;
begin
  Create(Sub);
  Open_Hatch(Sub.Hatch_Sys, 1);
end Main;
