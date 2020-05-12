
library IEEE;
use IEEE.numeric_bit.all;

entity tarea2_31 is 
port (D: in unsigned(3 downto 0); CLK, CLR, LOAD, ENT, ENP,UP: in bit;
      Q: out unsigned(3 downto 0); Co: out bit);
end tarea2_31;

architecture arch of tarea2_31 is 
signal Qout: unsigned(3 downto 0);

begin
Q<= Qout;

process(CLK,CLR)
begin
    if CLR = '0' then Qout<= "0000";
    elsif CLK'event and CLK = '1' then
        if LOAD = '0' then Qout<= D;
        elsif ENT = '1' and ENP = '1' and UP = '1' then 
            if Qout = "1001" then Qout <= "0000";
            else Qout<= Qout+1; end if;
        elsif ENT = '1' and ENP = '1' and UP = '0' then 
            if Qout = "0000" then Qout <= "1001";
            else Qout<= Qout-1; end if;
        end if;

    end if;
end process;
    Co <= '1' when (ENT = '1' and UP = '1' and Qout = "1001") or (ENT = '1' and UP = '1' and Qout = "0000") else '0';


end arch;


library IEEE;
use IEEE.numeric_bit.all;


entity contadormayor is 
port (D: in unsigned(7 downto 0); CLK,CLR,LOAD,ENT,ENP,UP: in bit;
	  Q: out unsigned(7 downto 0); Co: out bit);
end contadormayor;

architecture arch of contadormayor is 
signal C: bit;
component tarea2_31
port (D: in unsigned(3 downto 0); CLK, CLR, LOAD, ENT, ENP,UP: in bit;
      Q: out unsigned(3 downto 0); Co: out bit);
end component;

begin

contador0: tarea2_31 port map (D(3 downto 0),CLK,CLR,LOAD,ENT,ENP,UP,Q(3 downto 0),C);
contador1: tarea2_31 port map (D(7 downto 4),CLK,CLR,LOAD,C,C,UP,Q(7 downto 4),Co);

end arch;
