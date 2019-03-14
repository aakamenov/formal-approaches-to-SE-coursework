package Submarine with SPARK_Mode
is
  type Hatch is record
    Closed: Boolean;
    Locked: Boolean;
  end record;
  
  type Hatch_Index is range 0..1;
  
  type Hatches is array (Hatch_Index) of Hatch;
  
  type Submarine is tagged record
    H: Hatches;
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
  
  procedure Open_Hatch(Sub: in out Submarine; Index: Hatch_Index) with
    Pre => At_Least_One_Hatch_Is_Closed(Sub);    
   
end Submarine;
