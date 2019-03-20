with Hatch_System; use Hatch_System;
with Oxygen_System; use Oxygen_System;
with Torpedo_System; use Torpedo_System;

package Submarine with SPARK_Mode
is 
  type Dive_Depth is range 0..1300;
  
  type Submarine is tagged private;

  function Create return Submarine;
  
  function Get_Current_Depth(Self: Submarine) return Dive_Depth;
  
  function Request_Hatch_System(Self: Submarine; Sys: out Hatch_System.Hatch_System) return Boolean
  with SPARK_Mode => Off;
  
  function Request_Oxygen_System(Self: Submarine; Sys: out Oxygen_System.Oxygen_System) return Boolean
  with SPARK_Mode => Off;
  
  function Request_Torpedo_System(Self: Submarine; Sys: out Torpedo_System.Torpedo_System) return Boolean
  with SPARK_Mode => Off;
  
  function Can_Operate(Self: Submarine) return Boolean;
      
  procedure Change_Depth(Self: in out Submarine; Distance: Dive_Depth) with
    Pre'Class => Self.Can_Operate,
    Post => Self.Get_Current_Depth'Old /= Self.Get_Current_Depth;
    
  procedure Emerge(Self: in out Submarine) with
    Pre'Class => Self.Can_Operate,
    Post => Self.Get_Current_Depth = 0;
    
private
  type Submarine is tagged record
    Hatch_Sys: Hatch_System.Hatch_System;
    Torpedo_Sys: Torpedo_System.Torpedo_System;
    Oxygen_Sys: Oxygen_System.Oxygen_System;
    Depth: Dive_Depth;
  end record;
  
end Submarine;
