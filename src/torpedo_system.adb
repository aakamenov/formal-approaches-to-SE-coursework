package body Torpedo_System with SPARK_Mode
is
  procedure Create(Self: out Torpedo_System) is
  begin
    Self.Remaining_Torpedoes := 23;
    -- Can't call Load in the loop because SPARK is stupid, but SPARKS gets MARKS
    for I in Torpedo_Tubes'Range loop
      Self.Tubes(I) := Loaded;
      Self.Remaining_Torpedoes := Self.Remaining_Torpedoes - 1;
    end loop;
  end Create;
  
  procedure Load(Self: in out Torpedo_System; Index: Tube_Index) is
  begin
    if Self.Remaining_Torpedoes > 0 or Self.Tubes(Index) = Loaded then
      return;
    end if;
    
    Self.Tubes(Index) := Loaded;
    Self.Remaining_Torpedoes := Self.Remaining_Torpedoes - 1;
  end Load;
   

end Torpedo_System;
