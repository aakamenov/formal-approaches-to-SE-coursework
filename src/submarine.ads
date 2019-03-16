with Hatch_System; use Hatch_System;

package Submarine with SPARK_Mode
is 
  type Dive_Depth is range 0..1300;
  
  type Submarine is record
    Hatch_Sys: Hatches;
    Depth: Dive_Depth;
  end record;
  
  type Oxygen_Percentage is range 1..100;
  
  procedure Create(Self: in out Submarine);
    
  function Can_Operate(Sub: Submarine) return Boolean
  is
    (for all I in Sub.Hatch_Sys'Range => 
      Sub.Hatch_Sys(I).Closed = True and then Sub.Hatch_Sys(I).Locked = True);
      
  procedure Change_Depth(Sub: in out Submarine; Distance: Dive_Depth) with
    Pre => Can_Operate(Sub),
    Post => Sub.Depth'Old /= Sub.Depth;
    
end Submarine;
