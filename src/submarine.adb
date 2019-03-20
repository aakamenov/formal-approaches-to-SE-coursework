with Hatch_System;

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

  function Request_Hatch_System(Self: Submarine; Sys: out Hatch_System.Hatch_System) return Boolean
  with SPARK_Mode => Off
  is
  begin
    if Self.Depth = Dive_Depth'First then
      Sys := Self.Hatch_Sys;
      return True;
    end if;

    return False;
  end Request_Hatch_System;

  function Request_Oxygen_System(Self: Submarine; Sys: out Oxygen_System.Oxygen_System) return Boolean
  with SPARK_Mode => Off
  is
  begin
    if Self.Can_Operate then
      Sys := Self.Oxygen_Sys;
      return True;
    end if;

    return False;
  end Request_Oxygen_System;

  function Request_Torpedo_System(Self: Submarine; Sys: out Torpedo_System.Torpedo_System) return Boolean
  with SPARK_Mode => Off
  is
  begin
    if Self.Can_Operate then
      Sys := Self.Torpedo_Sys;
      return True;
    end if;

    return False;
  end Request_Torpedo_System;

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
