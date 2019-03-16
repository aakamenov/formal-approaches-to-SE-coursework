package Hatch_System with SPARK_Mode
is
  type Hatch is tagged record
    Closed: Boolean;
    Locked: Boolean;
  end record;  
  
  type Hatch_Index is range 0..1; 
  type Hatches is array (Hatch_Index) of Hatch;
  
  function At_Least_One_Hatch_Is_Closed(H: Hatches) return Boolean
  is
    (for some I in H'Range => 
      H(I).Closed = True);
  
  procedure Open_Hatch(H: in out Hatches; Index: Hatch_Index) with
    Pre => At_Least_One_Hatch_Is_Closed(H),
    Post => At_Least_One_Hatch_Is_Closed(H) and then H(Index).Closed = False;
    
  procedure Close_Hatch(H: in out Hatches; Index: Hatch_Index) with
    Post => H(Index).Closed = True;
    
  procedure Lock_Hatch(H: in out Hatches; Index: Hatch_Index) with
    Pre => H(Index).Closed = True,
    Post => H(Index).Closed = True and then H(Index).Locked = True;
    
  procedure Unlock_Hatch(H: in out Hatches; Index: Hatch_Index) with
    Post => H(Index).Closed = True and then H(Index).Locked = True;

end Hatch_System;
