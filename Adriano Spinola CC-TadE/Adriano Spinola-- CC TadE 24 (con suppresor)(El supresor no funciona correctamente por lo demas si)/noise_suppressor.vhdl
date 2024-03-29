library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

entity noise_suppressor is
    generic(
        g_nClkIgnore : integer := 20 
    );
    port (
        i_clk   : in std_logic;
        i_rst   : in std_logic;
        i_data  : in std_logic;
        o_data  : out std_logic
    );
end entity noise_suppressor;

architecture Rtl of noise_suppressor is
    component counter is
        generic(
            g_dataSize : integer
        );
        port(
            i_clk  : in std_logic;
            i_rst  : in std_logic;
            i_en   : in std_logic;
            i_data : in std_logic_vector(g_dataSize-1 downto 0);
            o_data : out std_logic_vector(g_dataSize-1 downto 0);
            o_end  : out std_logic
        );
    end component counter;
    constant c_NBITS : integer := integer(ceil(log2(real(g_nClkIgnore)+1.0)));
    constant c_countLimit: std_logic_vector(c_NBITS-1 downto 0) := std_logic_vector(to_unsigned(g_nClkIgnore, c_NBITS) - 2);
    signal s_dataOut: std_logic := '0';
    signal s_stableData: std_logic := '0';
    signal s_rstStablizer: std_logic := '0';
    signal s_sRstStablizer: std_logic := '0';

    type t_state is (st_stable, st_notStable);
    signal s_state, s_nextState : t_state := st_notStable; 
begin
    
    stabilizer: counter generic map (
        g_dataSize => c_NBITS
    )port map (
        i_clk => i_clk,
        i_rst => s_rstStablizer,
        i_en => '1',
        i_data => c_countLimit,
        o_end => s_stableData,
		  o_data => open
    );
    
    fsm_sync: process (i_clk)
    begin
        if i_clk'event and i_clk = '1' then
            if i_rst = '1' then
                s_state <= st_notStable;
            else
                s_state <= s_nextState;
            end if;
        end if;
    end process fsm_sync;

    fsm_clc_nextState: process (s_state, i_data, s_stableData, s_dataOut)
    begin
        s_nextState <= s_state; -- default assignment
        s_sRstStablizer <= '1';  -- default assignment
        case s_state is
            when st_notStable =>
                if s_stableData = '1' then
                    s_nextState <= st_stable;
                else
                    s_sRstStablizer <= s_dataOut xnor i_data;
                end if;
            when st_stable =>
                if i_data /= s_dataOut then
                    s_nextState <= st_notStable;
                end if;
        end case;
    end process; --clc_nextState

    ff_DataOut: process (i_clk)
    begin
        if i_clk'event and i_clk = '1' then
            if i_rst = '1' then
                s_dataOut <= i_data;
            elsif s_state = st_stable then
                s_dataOut <= i_data;
            end if;
        end if;
    end process; --ff_DataOut

    s_rstStablizer <= i_rst or s_sRstStablizer;
    o_data <= s_dataOut;

    
end architecture;