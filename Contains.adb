with Ada.Text_IO;
procedure Contains is
   type Word is mod 2**32;
   package Word_IO is new Ada.Text_IO.Modular_IO (Word);
   type Bitmap is array (0 .. 7) of Word;
   procedure Set (b : in out Bitmap; pos : Integer);
   procedure Set (b : in out Bitmap; pos : Integer) is
   begin
      if pos < 0 then
         return;
      end if;
      b (pos / 32) := b (pos / 32) or (2**(pos mod 32));
   end Set;

   procedure Print (b : in Bitmap);
   procedure Print (b : in Bitmap) is
   begin
      for i in reverse b'Range loop
         Word_IO.Put (b (i), 2, 16);
         Ada.Text_IO.Put (" ");
      end loop;
   end Print;

   function Op (a, b : String) return Boolean;
   function Op (a, b : String) return Boolean is
      map_a : Bitmap;
      map_b : Bitmap;
      p     : Integer;
   begin
      Map_A := (others => 0);
      Map_B := (others => 0);
      for i in A'Range loop
         p := Character'Pos (a (i));
         Set (map_a, p);
      end loop;
      for i in B'Range loop
         p := Character'Pos (b (i));
         Set (map_b, p);
      end loop;
      for i in reverse 0 .. 7 loop
         for j in reverse 0 .. 31 loop
            if (map_b (i) and (2**j)) > (map_a (i) and (2**j)) then
               return False;
            end if;
         end loop;
      end loop;
      -- Print (Map_A);
      -- Ada.Text_IO.New_Line;
      -- Print (Map_B);
      -- Ada.Text_IO.New_Line;
      return True;
   end Op;
   a : String := "hello world";
   b : String := "hello worl";
   c : String := "hello world!";
   d : String := "oowwlleehello worl";

begin
   if Contains (a, b) then
      Ada.Text_IO.Put_Line ("A contains B");
   end if;
   if not Contains (a, c) then
      Ada.Text_IO.Put_Line ("A doesn't contain C");
   end if;
   if Contains (a, d) then
      Ada.Text_IO.Put_Line ("A contains D");
   end if;
end Contains;
