with Hatch_System; use Hatch_System;
with Oxygen_System; use Oxygen_System;

package Submarine with SPARK_Mode
is 
  type Dive_Depth is range 0..1300;
  
  type Submarine is tagged record
    Hatch_Sys: Hatch_System.Hatch_System;
    Oxygen_Sys: Oxygen_System.Oxygen_System;
    Depth: Dive_Depth;
  end record;
  
  procedure Create(Self: in out Submarine);
    
  function Can_Operate(Sub: Submarine) return Boolean
  is (Hatch_System.Is_Sealed(Sub.Hatch_Sys));
      
  procedure Change_Depth(Self: in out Submarine; Distance: Dive_Depth) with
    Pre'Class => Can_Operate(Self),
    Post => Self.Depth'Old /= Self.Depth;
    
  procedure Emerge(Self: in out Submarine) with
    Pre'Class => Can_Operate(Self),
    Post => Self.Depth = 0;
    
end Submarine;
