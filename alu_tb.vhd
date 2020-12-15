----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2020 08:45:17 PM
-- Design Name: 
-- Module Name: alu_tb - Behavioral
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

entity alu_tb is
--  Port ( );
end alu_tb;

architecture Behavioral of alu_tb is


--ALU component
component alu
    Port(
    a,b : in signed(7 downto 0);
    selector: in std_logic_vector(2 downto 0);
    output : out std_logic_vector(7 downto 0);
    c_out : out std_logic
    );
end component;

--Selector array
type sel_arr is array (0 to 7) of std_logic_vector(2 downto 0);

--Input array
type in_arr is array (0 to 3) of signed(7 downto 0);

--Input signals
signal a : signed(7 downto 0);
signal b : signed(7 downto 0);
signal selector : std_logic_vector(2 downto 0); --Assign selector to array

--Output signal
signal alu_out : std_logic_vector(7 downto 0);

signal sel : sel_arr;
signal inps : in_arr;

begin
--Fill selector array with values
sel(0) <= "000";
sel(1) <= "001";
sel(2) <= "010";
sel(3) <= "011";
sel(4) <= "100";
sel(5) <= "101";
sel(6) <= "110";
sel(7) <= "111";

--Fill input array
inps(0) <= "00000000"; --0
inps(1) <= "00011001"; --25
inps(2) <= "10000010"; --130
inps(3) <= "10101010"; --170

--Initialize tester
    uut: alu port map (
        a => a,
        b => b,
        selector => selector,
        output => alu_out
    );
    
    --Begin test
    stimulus: process
    begin
        
        --xyz = 000
        a <= inps(0);
        b <= inps(1);
        selector <= sel(0);
        
        
        wait for 150 ns; --Two-input gate delay = 150ns
        selector <= sel(1);
        --Don't change a or b input signals
        
        wait for 150ns; --Next iteration
        --Swap a and b
        a <= inps(1);
        b <= inps(0);
        selector <= sel(2);

        wait for 150ns; --Next iteration
        --Don't change a or b input signals
        selector <= sel(3);
        
        
        wait for 150ns; --Next iteration
        a <= inps(2);
        b <= inps(1);
        selector <= sel(4);
        
        wait for 150ns; --Next iteration
        a <= inps(2);
        b <= inps(3);
        selector <= sel(5);
        
        wait for 150ns; --Next iteration
        a <= inps(3);
        b <= inps(1);
        selector <= sel(6);
        
        wait for 150ns; --Last iteration
        a <= inps(0);
        b <= inps(2);
        selector <= sel(7);
        
    end process;
end Behavioral;
