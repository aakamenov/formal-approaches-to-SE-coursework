with Hatch_System;

package body Submarine
is
  Oxygen_Threshold: constant Oxygen_Percentage := 20;

  procedure Create(Self: in out Submarine) is
  begin
    Hatch_System.Create(Self.Hatch_Sys);
    Self.Depth := 0;
  end Create;

  procedure Change_Depth(Sub: in out Submarine; Distance: Dive_Depth) is
  begin
    if Can_Operate(Sub) then
      Sub.Depth := Distance;
    end if;
  end Change_Depth;

end Submarine;
