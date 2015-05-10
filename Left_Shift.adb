with Ada.Text_IO;
procedure Left_Shift is
   procedure Op (s : in out String; n : Integer);
   procedure Op (s : in out String; n : Integer) is
      k : Integer := s'Length;
      t : Integer := n rem k;
      c : Character;
   begin
      -- 1..t
      for i in 1 .. t / 2 loop
         c             := s (i);
         s (i)         := s (t - i + 1);
         s (t - i + 1) := c;
      end loop;
      -- t+1..k
      for i in t + 1 .. (k + t) / 2 loop
         c                 := s (i);
         s (i)             := s (k - i + t + 1);
         s (k - i + t + 1) := c;
      end loop;
      -- 1..k
      for i in 1 .. k / 2 loop
         c             := s (i);
         s (i)         := s (k - i + 1);
         s (k - i + 1) := c;
      end loop;
   end Op;

   x : String := "hello world";
begin
   Op (x, 4);
   Ada.Text_IO.Put_Line (x);
   Op (x, 15);
   Ada.Text_IO.Put_Line (x);
end Left_Shift;
