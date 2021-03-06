library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Maquina_Expendedora is
--nada porque es un tesbench
end tb_Maquina_Expendedora;

  architecture Behavior of tb_Maquina_Expendedora is
  
    --Definir componetes
    Component Maquina_Expendedora is
    port(
CLK : in std_logic; --Clock
RESET: in std_logic;
COIN_IN in std_logic_vector( 2 downto 0); 
COIN_OUT: out std_logic_vector( 2 downto 0); 
LATA: out std_logic
);
    end component;
   
    -- Definir señales
    signal CLK, RESET: std_logic;
    signal COIN_IN in std_logic_vector( 2 downto 0); 
    signal COIN_OUT: out std_logic_vector( 2 downto 0); 
    signal LATA: out std_logic;
    
    -- Instanciamos tb_Maquina_Expendedora
    DUT : tb_Maquina_Expendedora port map(
        CLK   => CLK,
        RESET  => RESET
        COIN_IN  => COIN_IN,
        COIN_OUT => COIN_OUT,
        LATA =>LATA
       
    );
   
begin
     process(CLK)
   begin
     --PROBAMOS TODAS LAS POSIBILIDADES
    
    COIN_IN <= "001"; RESET <= '1';  wait 10 ns;    --LATA será 0 y COIN_OUT será 1 
    COIN_IN <= "010"; RESET <= '1';  wait 10 ns;    --LATA será 0 y COIN_OUT será 2
    COIN_IN <= "011"; RESET <= '1';  wait 10 ns;    --LATA será 0 y COIN_OUT será 3
    COIN_IN <= "100"; RESET <= '1';  wait 10 ns;    --LATA será 0 y COIN_OUT será 4
    COIN_IN <= "101"; RESET <= '1';  wait 10 ns;    --LATA será 0 y COIN_OUT será 5
    COIN_IN <= "110"; RESET <= '1';  wait 10 ns;    --LATA será 0 y COIN_OUT será 6
    
    COIN_IN <= "001"; RESET <= '0';  wait 10 ns;    --LATA será 0 y COIN_OUT será 0 a la espera de más órdenes
    COIN_IN <= "010"; RESET <= '0';  wait 10 ns;    --LATA será 1 y COIN_OUT será 0
    COIN_IN <= "011"; RESET <= '0';  wait 10 ns;    --LATA será 1 y COIN_OUT será 1
    COIN_IN <= "100"; RESET <= '0';  wait 10 ns;    --LATA será 1 y COIN_OUT será 2
    COIN_IN <= "101"; RESET <= '0';  wait 10 ns;    --LATA será 1 y COIN_OUT será 3
    COIN_IN <= "110"; RESET <= '0';  wait 10 ns;    --LATA será 1 y COIN_OUT será 4

   
        end process;
 end Behavior;  
