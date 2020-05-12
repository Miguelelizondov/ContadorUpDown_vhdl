
library IEEE;
use IEEE.numeric_bit.all;

entity tarea2_31tb is 
end tarea2_31tb;

architecture eq_tb of tarea2_31tb is 
	component  contadormayor is 
		port (D: in unsigned(7 downto 0); CLK,CLR,LOAD,ENT,ENP,UP: in bit;
	  Q: out unsigned(7 downto 0); Co: out bit);
	end	component;

	signal D: unsigned(7 downto 0); 
	signal CLK, CLR, LOAD, ENT, ENP,UP: bit;
	signal Q: unsigned(7 downto 0); 
	signal Co: bit;

begin 
  UUT: contadormayor port map (D,CLK,CLR,LOAD,ENT,ENP,UP,Q,Co);  
  
  P0: process
  begin
	ENT <= '1';
    ENP <= '1';
    CLR <= '1';
    UP <= '1';
    D <= "00001000";
    wait for 15 ns;
 	LOAD <= '0';
    wait for 15 ns;
    LOAD <= '1';
    wait for 200 ns;
    UP <= '0';
    wait for 200 ns;
    CLR <= '0';
    wait for 15 ns;
  end process;
  
  P1: process 
  begin 
  CLK<='0';
  wait for 5 ns;
  CLK<= '1';
  wait for 5 ns;
  end process;
end eq_tb;

