with Hatch_System;
with Oxygen_System;
with Torpedo_System;

package body Submarine with SPARK_Mode
is
  function Create return Submarine
  is
    Self: Submarine;
  begin
    Self.Hatch_Sys := Hatch_System.Create;
    Self.Oxygen_Sys := Oxygen_System.Create;
    Self.Torpedo_Sys := Torpedo_System.Create;
    Self.Depth := 0;

    return Self;
  end Create;

  function Can_Operate(Self: Submarine) return Boolean
  is
  begin
    return Self.Hatch_Sys.Is_Sealed;
  end Can_Operate;

  function Get_Hatch_System(Self: Submarine) return Hatch_System.Hatch_System
  is
  begin
    return Self.Hatch_Sys;
  end Get_Hatch_System;

  function Get_Oxygen_System(Self: Submarine) return Oxygen_System.Oxygen_System
  is
  begin
    return Self.Oxygen_Sys;
  end Get_Oxygen_System;

  function Get_Torpedo_System(Self: Submarine) return Torpedo_System.Torpedo_System
  is
  begin
    return Self.Torpedo_Sys;
  end Get_Torpedo_System;

  procedure Commit_Changes(Self: in out Submarine; State: Hatch_System.Hatch_System)
  is
  begin
    if Self.Depth = Dive_Depth'First then
      Self.Hatch_Sys := State;
    end if;
  end Commit_Changes;

  procedure Commit_Changes(Self: in out Submarine; State: Oxygen_System.Oxygen_System) is
  begin
    if Self.Can_Operate then
      Self.Oxygen_Sys := State;
    end if;
  end Commit_Changes;

  procedure Commit_Changes(Self: in out Submarine; State: Torpedo_System.Torpedo_System) is
  begin
    if Self.Can_Operate then
      Self.Torpedo_Sys := State;
    end if;
  end Commit_Changes;

  function Get_Current_Depth(Self: Submarine) return Dive_Depth
  is
  begin
    return Self.Depth;
  end Get_Current_Depth;

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
