
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rover_tb is
end Rover_tb;

architecture Behavioral of Rover_tb is
    signal count : unsigned (3 downto 0) := "0000";
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal LeftOut : std_logic_vector (2 downto 0);
    signal RightOut : std_logic_vector (2 downto 0);
begin
    
    --Instantiation of device under test
    dut : entity work.ControlSystem(Behavioral) 
        port map(RJoy => std_logic_vector(count(1 downto 0)), LJoy => std_logic_vector(count(3 downto 2))
            ,RMotor => RightOut(2 downto 0), LMotor => LeftOut(2 downto 0));
    
    --Setup of clock and reset
    clk <= not clk after 10 ns;
    rst <= '0' after 15 ns;
    
    -- Input automation
    Steering : process (clk) begin
        if rst = '1' then count <= "0000";
        else count <= count + 1;
        end if;
    end process Steering;    

end Behavioral;
