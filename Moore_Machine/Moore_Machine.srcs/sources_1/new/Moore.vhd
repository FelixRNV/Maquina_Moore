----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2024 07:46:25
-- Design Name: 
-- Module Name: Moore - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Moore is
    Port ( reloj : in STD_LOGIC;
           reseteo : in STD_LOGIC;
           entrada : in STD_LOGIC;
           salida : out STD_LOGIC);
end Moore;

architecture Behavioral of Moore is
    
    type state_type is (S0, S1, S2, S3);
    signal estado, siguiente: state_type;
    
begin
    
    -- Proceso de transición de Estado
    
    process (reloj, reseteo)
    begin
     if reseteo = '1' then
     estado <= S0;
     elsif rising_edge(reloj) then
     estado <= siguiente;
     end if;
     end process;
     
     -- Lógica de Siguiente (Cambio de Estado)
     
     process (estado, entrada)
     begin
      case estado is 
      when S0 =>
        if entrada = '1' then
            siguiente <= S1;
        else
            siguiente <= S0;
        end if;
      when S1 =>
        if entrada = '0' then
            siguiente <= S2;
        else
            siguiente <= S1;
        end if;
      when S2 =>
        if entrada = '1' then
            siguiente <= S3;
        else
            siguiente <= S2;
        end if;
      when S3 =>
            siguiente <= S0;
      when others =>
            siguiente <= S0;
      end case;
      end process;
      
      -- Lógica de la Salida
      
      process (estado)
      begin
      case estado is 
        when S0 =>
            salida <= '0';
        when S1 =>
            salida <= '0';
        when S2 =>
            salida <= '0';
        when S3 =>
            salida <= '1';
        when others =>
            salida <= '0';
      end case;
      end process;      

end Behavioral;
