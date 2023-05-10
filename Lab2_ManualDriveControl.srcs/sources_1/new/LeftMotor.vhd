
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LeftMotor is
    Port (
        RJoy, LJoy : in std_logic_vector (1 downto 0);
        Motor : out std_logic_vector (2 downto 0)
        );
end LeftMotor;

architecture Behavioral of LeftMotor is
    -- Direcetion of pad input
    constant up    : std_logic_vector := "01";
    constant down  : std_logic_vector := "10";
    constant cntr1 : std_logic_vector := "00";
    constant cntr2 : std_logic_vector := "11";
    -- Speeds of motor output
    constant ffast : std_logic_vector := "010";
    constant fslow : std_logic_vector := "001";
    constant bfast : std_logic_vector := "110";
    constant bslow : std_logic_vector := "101";
    constant stop  : std_logic_vector := "000";
begin
    LeftProc: process(LJoy)
    begin
        -- Case response of the Right Joystick on the Right Motor
        case LJoy is
            -- LJoy is up
            when up => 
                if      RJoy = cntr1 then Motor <= ffast;
                elsif   RJoy = up then Motor    <= ffast;
                elsif   RJoy = down then Motor  <= fslow;
                elsif   RJoy = cntr2 then Motor <= ffast;
                end if; 
            -- LJoy is down
            when down =>
                if      RJoy = cntr1 then Motor <= bfast;
                elsif   RJoy = up then Motor    <= bslow;
                elsif   RJoy = down then Motor  <= bfast;
                elsif   RJoy = cntr2 then Motor <= bfast;
                end if; 
            -- LJoy is centered    
            when others => 
                if      RJoy = cntr1 then Motor <= stop;
                elsif   RJoy = up then Motor    <= fslow;
                elsif   RJoy = down then Motor  <= bslow;
                elsif   RJoy = cntr2 then Motor <= stop;
                end if;
        end case;
    end process LeftProc;

end Behavioral;
