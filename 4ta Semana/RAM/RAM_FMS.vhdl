library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity RAM_FMS is
  port (
    rst: in std_logic;
    clk: in std_logic;
    lap_btn: in std_logic;
    en: in std_logic;
    stp: in std_logic;
    salida: out std_logic_vector(2 downto 0)
  ) ;
end RAM_FMS ; 

architecture RAM_FMSarch of RAM_FMS is

type state_type is (IDLE,Rd,Wr);
signal q_bus,d_bus: state_type:= idle;

begin
    -----SET CLK------
    
    Settings : process( clk, rst )
    begin
      if( rst = '1' ) then
        q_bus <= IDLE;
      elsif( rising_edge(clk) ) then
        q_bus <= d_bus;
      end if ;
    end process ; -- Settings
    
    -----Present STATE-----
        salida <= "101" when q_bus = rd else
                  "110" when q_bus = wr else
                  "000";
    -----Next State------
    Pres_State : process( q_bus,stp,en,lap_btn )
        begin
            case( q_bus ) is
            
                when IDLE =>
                    if (lap_btn = '1' and en = '1') then
                        d_bus <= wr;
                    elsif (lap_btn = '1' and stp = '1') then
                        d_bus <= rd;
                    else 
                        d_bus <= idle;
                     end if;

                 when wr =>
                     if (lap_btn = '1' and en = '1') then
                         d_bus <= wr;
                     elsif (lap_btn = '1' and stp = '1') then
                         d_bus <= rd;
                     else 
                         d_bus <= idle;
                      end if;

                when rd =>
                    if (lap_btn = '1' and en = '1') then
                        d_bus <= wr;
                    elsif (lap_btn = '1' and stp = '1') then
                        d_bus <= rd;
                    else 
                        d_bus <= idle;
                     end if;

                when others =>
                    d_bus <= idle;
            end case ;
        end process ; -- Pres_State
end architecture ;