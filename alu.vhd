----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2020 07:50:50 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port(
    a, b : in signed(7 downto 0); --2 8-bit 2's comp inputs
    selector : in std_logic_vector(2 downto 0); --3 bit selectors
    output : out std_logic_vector(7 downto 0); --8-bit output
    c_out : out std_logic --carryout bit
    );
end alu;

architecture Behavioral of alu is
    signal temp : std_logic_vector(7 downto 0); --Used to store result of arithmetic operation
begin
process(a,b,selector)
    begin
    
        case(selector) is
            when "000" =>
                temp <= std_logic_vector(a + b);
                output <= temp(7 downto 0); --Output is the first 8 bits after operation
                c_out <= temp(7); --Carryout bit is the last bit in temp
            when "001" =>
                temp <= std_logic_vector(a - b);
                output <= temp(7 downto 0); --Output is the first 8 bits after operation
                c_out <= temp(7); --Carryout bit is the last bit in temp
            when "010" =>
                temp <= std_logic_vector(b - a);
                output <= temp(7 downto 0); --Output is the first 8 bits after operation
                c_out <= temp(7); --Carryout bit is the last bit in temp
            when "011" =>
                temp <= std_logic_vector(a + 1);
                output <= temp(7 downto 0); --Output is the first 8 bits after operation
                c_out <= temp(7); --Carryout bit is the last bit in temp
            when "100" =>
                temp <= std_logic_vector(b + 1);
                output <= temp(7 downto 0); --Output is the first 8 bits after operation
                c_out <= temp(7); --Carryout bit is the last bit in temp
            when "101" =>
                temp <= std_logic_vector(a - 1);
                output <= temp(7 downto 0); --Output is the first 8 bits after operation
                c_out <= temp(7); --Carryout bit is the last bit in temp
            when "110" =>
                temp <= std_logic_vector(b - 1);
                output <= temp(7 downto 0); --Output is the first 8 bits after operation
                c_out <= temp(7); --Carryout bit is the last bit in temp
            when "111" =>
                output <= "00000000"; --convert integer 0 to a signed bit
            when others =>
                NULL;
        end case;
       end process;
end Behavioral;
