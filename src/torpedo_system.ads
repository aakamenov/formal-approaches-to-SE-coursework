package Torpedo_System with SPARK_Mode
is
  type Torpedo_Tube is (Empty, Loaded);
  type Tube_Index is range 0..3;
  type Torpedo_Tubes is array(Tube_Index) of Torpedo_Tube;
  
  type Torpedo_Index is range 0..23;
  
  type Torpedo_System is tagged record
    Remaining_Torpedoes: Torpedo_Index;
    Tubes: Torpedo_Tubes;
  end record;
  
  function Create return Torpedo_System;
  
  function Get_Torpedo_Count(Self: Torpedo_System) return Torpedo_Index;
  
  function Get_Tubes(Self: Torpedo_System) return Torpedo_Tubes;
  
  procedure Load(Self: in out Torpedo_System; Index: Tube_Index) with
    Pre'Class => Self.Remaining_Torpedoes > 0 and then Self.Tubes(Index) = Empty,
    Contract_Cases => 
      (Self.Tubes(Index) = Loaded => Self.Remaining_Torpedoes'Old = Self.Remaining_Torpedoes,
      Self.Remaining_Torpedoes > Torpedo_Index'First => Self.Remaining_Torpedoes < Self.Remaining_Torpedoes'Old);
      
  procedure Unload(Self: in out Torpedo_System; Index: Tube_Index) with
    Pre'Class => Self.Tubes(Index) = Loaded,
    Contract_Cases =>
      (Self.Tubes(Index) = Empty => Self.Tubes(Index) = Empty,
      Self.Remaining_Torpedoes = Torpedo_Index'Last => Self.Tubes(Index)'Old = Self.Tubes(Index),
      Self.Tubes(Index) = Loaded and then Self.Remaining_Torpedoes < Torpedo_Index'Last => 
        Self.Tubes(Index) = Empty);
        
  procedure Fire(Self: in out Torpedo_System; Index: Tube_Index) with
    Post => Self.Tubes(Index) = Empty;
    
end Torpedo_System;
