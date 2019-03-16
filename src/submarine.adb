package body Submarine
is
  Oxygen_Threshold: constant Oxygen_Percentage := 20;

  procedure Create(Self: in out Submarine) is
  begin
    for I in Self.H'Range loop
      Self.H(I).Closed := True;
      Self.H(I).Locked := False;
    end loop;

    Self.Depth := 0;
  end Create;

  procedure Open_Hatch(Sub: in out Submarine; Index: Hatch_Index) is
  begin
    for I in Sub.H'Range loop
      if Sub.H(I).Closed = False then
        return;
      end if;
    end loop;

    Sub.H(Index).Closed := False;
  end Open_Hatch;

  procedure Change_Depth(Sub: in out Submarine; Distance: Dive_Depth) is
  begin
    if Can_Operate(Sub) then
      Sub.Depth := Distance;
    end if;
  end Change_Depth;

  procedure Close_Hatch(Sub: in out Submarine; Index: Hatch_Index) is
  begin
    Sub.H(Index).Closed := True;
  end Close_Hatch;

  procedure Lock_Hatch(Sub: in out Submarine; Index: Hatch_Index) is
  begin
    if Sub.H(Index).Closed = False then
      return;
    end if;

    Sub.H(Index).Locked := True;
  end Lock_Hatch;

  procedure Unlock_Hatch(Sub: in out Submarine; Index: Hatch_Index) is
  begin
    Sub.H(Index).Locked := False;
  end Unlock_Hatch;

end Submarine;
