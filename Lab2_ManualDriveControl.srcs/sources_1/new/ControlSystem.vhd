

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlSystem is
    port(
        RJoy, LJoy : in std_logic_vector (1 downto 0);
        RMotor, LMotor : out std_logic_vector (2 downto 0)
    );
end ControlSystem;

architecture Behavioral of ControlSystem is

begin
    
    -- Instantiate motor functions
    Right : entity work.RightMotor port map (RJoy => RJoy, LJoy => LJoy, Motor => RMotor);
    Left : entity work.LeftMotor port map (RJoy => RJoy, LJoy => LJoy, Motor => LMotor);
    
end Behavioral;
