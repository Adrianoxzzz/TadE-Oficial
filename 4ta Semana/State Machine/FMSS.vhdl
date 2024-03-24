library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity FMSS is
  port (
      i_clk : in std_logic;
      i_rst : in std_logic;
      i_L : in std_logic;
      o_P: out std_logic
  ) ;
end FMSS ; 

architecture FMSSarch of FMSS is
signal d_bus,q_bus: state_type := INICIO;
type state_type is (INICIO,S1,S0,SP);  
begin
    
    CLK_INIT : process( i_clk, i_rst )
    begin
      if( i_rst = '1' ) then
        q_bus <= inicio;
      elsif( rising_edge(i_clk) ) then
        q_bus <= d_bus;
      end if ;
    end process ; -- CLK_INIT

    --------------NEXT STATE-----------
    Next_State : process( q_bus,i_L )
    begin
        case( q_bus ) is
        
            when INICIO =>
                if i_L = '1' then
                    q_bus <= S1;
                else
                    q_bus <= S0;
                end if;
                when S1 =>
                if i_L = '1' then
                    q_bus <= S1;
                else
                    q_bus <= S0;
                end if;
                when S0 =>
                if i_L = '1' then
                    q_bus <= SP;
                else
                    q_bus <= S0;
                end if;
                when SP =>
                if i_L = '1' then
                    q_bus <= S1;
                else
                    q_bus <= S0;
                end if;
            when others =>
                q_bus <= INICIO;
        
        end case ;
    end process ; -- Next_State

    ------------PRESENT STATE----------
        
            o_P <= '1' when q_bus = SP else
                    '0';

                
end architecture ;