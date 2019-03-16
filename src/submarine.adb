package body Submarine
is
  Oxygen_Threshold: constant Oxygen_Percentage := 20;

  procedure Create(Self: in out Submarine) is
  begin
    for I in Self.Hatch_Sys'Range loop
      Self.Hatch_Sys(I).Closed := True;
      Self.Hatch_Sys(I).Locked := False;
    end loop;

    Self.Depth := 0;
  end Create;

  procedure Change_Depth(Sub: in out Submarine; Distance: Dive_Depth) is
  begin
    if Can_Operate(Sub) then
      Sub.Depth := Distance;
    end if;
  end Change_Depth;

end Submarine;
