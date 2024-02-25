library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use ieee.std_logic_unsigned.all;

entity  Cronometro is
  port (
    INIT_PAUSE: in std_logic;
    STOP_TO_INIT: in std_logic;
    clk: in std_logic;
    rst: in std_logic;
    q: out std_logic_vector (1 downto 0)
  ) ;
end Cronometro ; 

architecture Cronometroarch of Cronometro is
    type state_type is (INITIAL,PAUSED,ACTIVE);
    signal state, next_state: state_type;
begin
    process(clk,rst)
    begin
        if rst = '1' then
            state <= INITIAL;
        elsif clk'event and clk = '1' then
            state <= next_state;
        end if;
    end process ; -- Cronometer
    process(state,INIT_PAUSE,STOP_TO_INIT)
    begin
        case(state) is
        
            when INITIAL =>
                if INIT_PAUSE ='1' then
                    next_state <= ACTIVE;
                else 
                    next_state <= INITIAL;
                end if;
            when ACTIVE =>
                if INIT_PAUSE = '1' then
                    next_state <= PAUSED;
                elsif STOP_TO_INIT = '1' then
                    next_state <= INITIAL;
                else 
                    next_state <= ACTIVE;
                end if;
            when PAUSED =>
                if INIT_PAUSE = '1' then
                    next_state <= ACTIVE;
                elsif STOP_TO_INIT = '1' then
                    next_state <= INITIAL;
                else
                    next_state <= PAUSED;
                end if;
            when others =>
                    next_state <= INITIAL; --estado inicial por defecto en caso de error
        end case ;
    end process ;
    q(0) <= '1' when state = ACTIVE else '0';
    q(1) <= '1' when state = PAUSED else '0';
end Cronometroarch ;