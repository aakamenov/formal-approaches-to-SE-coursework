package Hatch_System with SPARK_Mode
is
  type Hatch is record
    Closed: Boolean;
    Locked: Boolean;
  end record;  
  
  type Hatch_Index is range 0..1; 
  type Hatches is array (Hatch_Index) of Hatch;
  
  type Hatch_System is tagged record
    H: Hatches;
  end record;
  
  function At_Least_One_Hatch_Is_Closed(Self: in out Hatch_System) return Boolean
  is
    (for some I in Self.H'Range => 
      Self.H(I).Closed = True);
      
  procedure Create(Self: in out Hatch_System);
  
  procedure Open_Hatch(Self: in out Hatch_System; Index: Hatch_Index) with
    Pre => At_Least_One_Hatch_Is_Closed(Self),
    Post => At_Least_One_Hatch_Is_Closed(Self) and then Self.H(Index).Closed = False;
    
  procedure Close_Hatch(Self: in out Hatch_System; Index: Hatch_Index) with
    Post => Self.H(Index).Closed = True;
    
  procedure Lock_Hatch(Self: in out Hatch_System; Index: Hatch_Index) with
    Pre => Self.H(Index).Closed = True,
    Post => Self.H(Index).Closed = True and then Self.H(Index).Locked = True;
    
  procedure Unlock_Hatch(Self: in out Hatch_System; Index: Hatch_Index) with
    Post => Self.H(Index).Closed = True and then Self.H(Index).Locked = True;

end Hatch_System;
