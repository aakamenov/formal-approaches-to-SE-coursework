with Hatch_System;

package body Submarine
is
  Oxygen_Threshold: constant Oxygen_Count := 200;

  procedure Create(Self: in out Submarine) is
  begin
    Hatch_System.Create(Self.Hatch_Sys);
    Self.Depth := 0;
  end Create;

  procedure Change_Depth(Self: in out Submarine; Distance: Dive_Depth) is
  begin
    if Self.Depth = 0 then
      Hatch_System.Seal(Self.Hatch_Sys);
      Self.Depth := Distance;

      return;
    end if;

    if Can_Operate(Self) then
      Self.Depth := Distance;

      if Distance = 0 then
        Hatch_System.Unseal(Self.Hatch_Sys);
      end if;
    end if;
  end Change_Depth;

  procedure Emerge(Self: in out Submarine) is
  begin
    Change_Depth(Self, 0);
  end Emerge;

end Submarine;
