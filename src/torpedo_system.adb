package body Torpedo_System with SPARK_Mode
is
  procedure Create(Self: out Torpedo_System) is
  begin
    Self.Remaining_Torpedoes := Torpedo_Index'Last;
    -- Can't call Load in the loop because SPARK is stupid, but SPARKS gets MARKS
    for I in Torpedo_Tubes'Range loop
      Self.Tubes(I) := Loaded;
      Self.Remaining_Torpedoes := Self.Remaining_Torpedoes - 1;
    end loop;
  end Create;
  
  procedure Load(Self: in out Torpedo_System; Index: Tube_Index) is
  begin
    if Self.Remaining_Torpedoes > Torpedo_Index'First or Self.Tubes(Index) = Loaded then
      return;
    end if;
    
    Self.Tubes(Index) := Loaded;
    Self.Remaining_Torpedoes := Self.Remaining_Torpedoes - 1;
  end Load;
  
  procedure Unload(Self: in out Torpedo_System; Index: Tube_Index) is
  begin
    if Self.Remaining_Torpedoes = Torpedo_Index'Last or Self.Tubes(Index) = Empty then
      return;
    end if;
    
    Self.Tubes(Index) := Empty;
    Self.Remaining_Torpedoes := Self.Remaining_Torpedoes + 1;
  end Unload;
   
  procedure Fire(Self: in out Torpedo_System; Index: Tube_Index) is
  begin
    Self.Tubes(Index) := Empty;
  end Fire;
  
end Torpedo_System;
