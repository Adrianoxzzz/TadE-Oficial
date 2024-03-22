library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_counter is
begin
    
end tb_counter;

architecture Bhv of tb_counter is
    
    --------------------------------------------------------------------
    -- ClockFrequency
    --------------------------------------------------------------------
    constant c_clkFreq   : natural  := 50E6;
    constant c_clkPeriod : time  := 1 sec / c_clkFreq; 

    --------------------------------------------------------------------
    -- component ports
    --------------------------------------------------------------------
    component counter is
        generic (
            g_dataSize : integer := 8
        );
        port (
            i_clk        : in std_logic;                                    -- counter clk
            i_rst        : in std_logic;                                    -- counter sync reset
            i_en         : in std_logic;                                    -- counter enable
            i_data       : in std_logic_vector(g_dataSize-1 downto 0);      -- counter limiter
            o_data       : out std_logic_vector(g_dataSize-1 downto 0);      -- counter data out   
            o_end        : out std_logic
        );
    end component counter;
    
    signal clk      : std_logic := '0';
    signal rst      : std_logic := '1';
    signal i_en     : std_logic := '0';
    signal i_data   : std_logic_vector(7 downto 0) := (others => '0'); 
    signal o_data   : std_logic_vector(7 downto 0) := (others => '0');
    signal o_end    : std_logic := '0';
begin

    --------------------------------------------------------------------
    -- entity instantiation with components
    -- -> search for "entity {} - instantiation"
    -- -> if right entity not found use the shortcut "Strg + Alt + S"
    --------------------------------------------------------------------
    counter_0: counter generic map (
        g_dataSize => 8
    )port map (
        i_clk   => clk,
        i_rst   => rst,
        i_en    => i_en,
        i_data  => i_data,
        o_data  => o_data,
        o_end   => o_end
    );
    
    --------------------------------------------------------------------
    -- clock generation
--------------------------------------------------------------------
    sync: process
    begin
        clk <= '0';
        wait for c_clkPeriod/2;
        clk <= '1';
        wait for c_clkPeriod/2;
    end process; --sync

    --------------------------------------------------------------------
    -- Testcases
    --------------------------------------------------------------------
    Testcase_proc : process
    begin
        rst <= '1';
        wait for 3 * c_clkPeriod;
        i_en <= '1';
        i_data <= x"02";
        wait for 1 * c_clkPeriod;
        rst <= '0';    

        wait for 3 * c_clkPeriod;
        if o_data /= x"00" and o_end /= '1' then
            report "ERROR : count 2";
        else
            report "PASS : count 2";
        end if;

        rst <= '1';
        i_en <= '0';
        wait for 1 * c_clkPeriod;
        i_data <= x"0A";
        i_en <= '1';
        wait for 1 * c_clkPeriod;
        rst <= '0';

        wait for 11 * c_clkPeriod;
        if o_data /= x"00" and o_end /= '1' then
            report "ERROR : count 10";
        else
            report "PASS : count 10";
        end if;

        wait for 11 * c_clkPeriod;
        if o_data /= x"00" and o_end /= '1' then
            report "ERROR : count 10*2";
        else
            report "PASS : count 10*2";
        end if;

        report "END TEST";

        wait;
        
    end process Testcase_Proc;

end architecture;