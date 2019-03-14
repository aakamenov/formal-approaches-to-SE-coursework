package body Submarine
is
  Oxygen_Threshold: constant Oxygen_Percentage := 20;

  procedure Create(Self: in out Submarine) is
  begin
    Self.H(0).Closed := True;
    Self.H(0).Locked := False;
    Self.H(1).Closed := True;
    Self.H(1).Locked := False;
  end Create;

  procedure Open_Hatch(Sub: in out Submarine; Index: Hatch_Index) is
  begin
    Sub.H(Index).Closed := False;
  end Open_Hatch;

end Submarine;
