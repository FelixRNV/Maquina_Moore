----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2024 08:04:24
-- Design Name: 
-- Module Name: Moore_TB - Behavioral
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

entity Moore_TB is
--  Port ( );
end Moore_TB;

architecture Behavioral of Moore_TB is
    -- Señal Interna para UUT
    
    signal reseteo :STD_LOGIC := '0';
    signal reloj :STD_LOGIC := '0';
    signal entrada :STD_LOGIC := '0';
    signal salida :STD_LOGIC;
    
    -- Instancia Maquina de Estados
    
    component Moore is
    Port ( reseteo : in std_logic;
           reloj : in std_logic;
           entrada : in std_logic;
           salida : out std_logic);
    end component;
    
begin
    
    -- Instancianción de la UUT
    
    uut: Moore
    
        Port map(
        
        reloj => reloj,
        reseteo => reseteo,
        entrada => entrada,
        salida => salida
        );
    
    -- Creación de la señal de reloj
    reloj_process: process
    begin
    while true loop
        reloj <= '0';
        wait for 10 ns;
        reloj <= '1';
        wait for 10 ns;
        end loop;
    end process;
    
    -- Declaración de Estimulos e Inicialización
    
    esti_process: process
    begin
    
    -- Inicialización
    
        reseteo <= '1';
        wait for 20 ns;
        reseteo <= '0';
        wait for 20 ns;
    
    -- Generación de los estímulos
        -- Se ingresan los estimulos 
        -- en el orden correcto para que Res = 1
        entrada <= '1';
        wait for 20 ns;
        entrada <= '0';
        wait for 20 ns;
        entrada <= '1';
        wait for 20 ns;
        
        -- Se reinicia
        entrada <= '0';
        wait for 20 ns;
        
        -- Se ingresa el primer estado correcto
        -- y segundo estado erroneo,
        -- vuelve del estado S2 a S1
        
        entrada <= '1';
        wait for 20 ns;
        entrada <= '1';
        wait for 20 ns;
        
        -- Se ingresa el resto de la secuencia
        
        entrada <= '0';
        wait for 20 ns;
        entrada <= '1';
        wait for 20 ns;
        
        wait;
      end process;
        
end Behavioral;
