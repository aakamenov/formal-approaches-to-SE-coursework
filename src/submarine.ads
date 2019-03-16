package Submarine with SPARK_Mode
is
  type Hatch is record
    Closed: Boolean;
    Locked: Boolean;
  end record;  
  type Hatch_Index is range 0..1; 
  type Hatches is array (Hatch_Index) of Hatch;
  
  type Dive_Depth is range 0..1300;
  
  type Submarine is record
    H: Hatches;
    Depth: Dive_Depth;
  end record;
  
  type Oxygen_Percentage is range 1..100;
  
  procedure Create(Self: in out Submarine);
  
  function At_Least_One_Hatch_Is_Closed(Sub: Submarine) return Boolean
  is
    (for some I in Sub.H'Range => 
      Sub.H(I).Closed = True);
    
  function Can_Operate(Sub: Submarine) return Boolean
  is
    (for all I in Sub.H'Range => 
      Sub.H(I).Closed = True and then Sub.H(I).Locked = True);
      
  procedure Change_Depth(Sub: in out Submarine; Distance: Dive_Depth) with
    Pre => Can_Operate(Sub),
    Post => Sub.Depth'Old /= Sub.Depth;
  
  procedure Open_Hatch(Sub: in out Submarine; Index: Hatch_Index) with
    Pre => At_Least_One_Hatch_Is_Closed(Sub),
    Post => At_Least_One_Hatch_Is_Closed(Sub) and then Sub.H(Index).Closed = False;
    
  procedure Close_Hatch(Sub: in out Submarine; Index: Hatch_Index) with
    Post => Sub.H(Index).Closed = True;
    
  procedure Lock_Hatch(Sub: in out Submarine; Index: Hatch_Index) with
    Pre => Sub.H(Index).Closed = True,
    Post => Sub.H(Index).Closed = True and then Sub.H(Index).Locked = True;
    
  procedure Unlock_Hatch(Sub: in out Submarine; Index: Hatch_Index) with
    Post => Sub.H(Index).Closed = True and then Sub.H(Index).Locked = True;
    
end Submarine;
