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
  
  procedure Create(Self: out Torpedo_System);
  
  procedure Load(Self: in out Torpedo_System; Index: Tube_Index) with
    Pre'Class => Self.Remaining_Torpedoes > 0 and then Self.Tubes(Index) = Empty,
    Contract_Cases => 
      (Self.Tubes(Index) = Loaded => Self.Remaining_Torpedoes'Old = Self.Remaining_Torpedoes,
      Self.Remaining_Torpedoes > 0 => Self.Tubes(Index)'Old = Self.Tubes(Index));
      
end Torpedo_System;
