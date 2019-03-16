package body Hatch_System
is
  procedure Open_Hatch(H: in out Hatches; Index: Hatch_Index) is
  begin
    for I in H'Range loop
      if H(I).Closed = False then
        return;
      end if;
    end loop;
    
    H(Index).Closed := False;
  end Open_Hatch;
  
  procedure Close_Hatch(H: in out Hatches; Index: Hatch_Index) is
  begin
    H(Index).Closed := True;
  end Close_Hatch;
  
  procedure Lock_Hatch(H: in out Hatches; Index: Hatch_Index) is
  begin
    if H(Index).Closed = False then
      return;
    end if;
    
    H(Index).Locked := True;
  end Lock_Hatch;
  
  procedure Unlock_Hatch(H: in out Hatches; Index: Hatch_Index) is
  begin
    H(Index).Locked := False;
  end Unlock_Hatch;

end Hatch_System;
