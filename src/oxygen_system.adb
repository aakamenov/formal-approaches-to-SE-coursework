package body Oxygen_System with SPARK_Mode
is
  procedure Create(Self: in out Oxygen_System) is 
  begin
    Update(Self);
  end Create;
  
  procedure Update(Self: in out Oxygen_System) is
  begin
    Update_Oxygen_Level(Self);
    Update_Status(Self);
  end Update;
  
  procedure Update_Oxygen_Level(Self: in out Oxygen_System) is
  begin
    Self.Oxygen_Count := Read_Oxygen_Level(Self.Sensor);
  end Update_Oxygen_Level;
  
  procedure Update_Status(Self: in out Oxygen_System) is
  begin
    if Self.Oxygen_Count > Oxygen_Threshold then
      Self.S := Stable;
    elsif Self.Oxygen_Count > Oxygen_Critical then
      Self.S := Warning;
    else
      Self.S := Critical;
    end if;
  end Update_Status;
  
  function Read_Oxygen_Level(Sensor: Tank_Sensor) return Oxygen_Percentage
  is
  begin
    return Sensor.Value;
  end Read_Oxygen_Level;

end Oxygen_System;
