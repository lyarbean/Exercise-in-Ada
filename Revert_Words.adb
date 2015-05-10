with Ada.Text_IO;
procedure Reverse_Words is
   function Op (a : String) return String is
      s : String (a'Range);
      t : constant Integer := a'First + a'Last;
      j : Integer          := a'First;
   begin
      for i in a'First + 1 .. a'Last loop
         if i = a'Last then
            s (t - i .. t - j) := a (j .. i);
         end if;
         if a (i) = ' ' then
            if a (i - 1) /= ' ' then
               s (t - i + 1 .. t - j) := a (j .. i - 1);
            end if;
            s (t - i) := ' ';
            j         := i + 1; -- expect a(i+1) /= ' '
         end if;
      end loop;
      return s;
   end Op;
   k1 : String := "hello, how are you";
   k2 : String := "hello    how are   you  ";
   k3 : String := "hello    how are   you  o";
   k4 : String := "a hello    how are   you";
begin
   Ada.Text_IO.Put_Line ("|" & Op (k1) & "|");
   Ada.Text_IO.Put_Line ("|" & Op (k2) & "|");
   Ada.Text_IO.Put_Line ("|" & Op (k3) & "|");
   Ada.Text_IO.Put_Line ("|" & Op (k4) & "|");
end reverse_words;
