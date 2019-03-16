package body Hatch_System
is
  procedure Create(Self: in out Hatch_System) is
  begin
    for I in Self.H'Range loop
      Self.H(I).Closed := True;
      Self.H(I).Locked := False;
    end loop;
    
    Self.S := Open;
  end Create;

  procedure Open_Hatch(Self: in out Hatch_System; Index: Hatch_Index) is
  begin
    if Is_Sealed(Self) then 
      return; 
    end if;
    
    for I in Self.H'Range loop
      if Self.H(I).Closed = False then
        return;
      end if;
    end loop;
    
    Self.H(Index).Closed := False;
  end Open_Hatch;
  
  procedure Close_Hatch(Self: in out Hatch_System; Index: Hatch_Index) is
  begin
    Self.H(Index).Closed := True;
  end Close_Hatch;
  
  procedure Lock_Hatch(Self: in out Hatch_System; Index: Hatch_Index) is
  begin
    if Self.H(Index).Closed = False then
      return;
    end if;
    
    Self.H(Index).Locked := True;
  end Lock_Hatch;
  
  procedure Unlock_Hatch(Self: in out Hatch_System; Index: Hatch_Index) is
  begin
    if Is_Sealed(Self) then
      return;
    end if;
    
    Self.H(Index).Locked := False;
  end Unlock_Hatch;
  
  procedure Seal(Self: in out Hatch_System) is
  begin
    for I in Self.H'Range loop
      Self.H(I).Closed := True;
      Self.H(I).Locked := True;
    end loop;
    
    Self.S := Sealed;
  end Seal;
  
  procedure Unseal(Self: in out Hatch_System) is
  begin
    for I in Self.H'Range loop
      Self.H(I).Locked := False;
    end loop;
  
    Self.S := Open;
  end Unseal;

end Hatch_System;
