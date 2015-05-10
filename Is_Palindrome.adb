With Ada.Text_IO;
procedure Is_Palindrome is
    function Op(s: string) return boolean;
    function Op(s: string) return boolean is
    begin
        for i in s'first..s'length/2 loop
            if s(i) /= s(s'Last - i + S'First) then
                return false;
            end if;
        end loop;
        return true;
    end Op;
begin
    if Op("HelloolleH") then
        Ada.Text_IO.Put("Yes, It is.");
    end if;
end Is_Palindrome;
