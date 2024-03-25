library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Multiplier is
  port (
    clk: in std_logic;
    rst: in std_logic;
    EnBlink: in std_logic;
    Din: in std_logic_vector(3 downto 0);
    Dout: out std_logic_vector(7 downto 0)
  ) ;
end Multiplier ; 

architecture MultiplierArch of Multiplier is

    signal mode : std_logic := '0';
    signal alternador : std_logic := '0';
    signal d_bus,q_bus: std_logic_vector(7 downto 0):= (others => '0');

begin
    CLK_INIT : process( clk, rst )
    begin
      if( rst = '1' ) then
        q_bus <= (others => '0');
      elsif( rising_edge(clk) ) then
        q_bus <= d_bus;
        alternador <= not (alternador);
      end if ;
    end process ; -- CLK_INIT
    
    
    
    ------Next State-------
    d_bus(3 downto 0) <= din;
    d_bus(7 downto 4) <= din;

    --------EnBlink----------
    Moder : process( EnBlink )
    begin
        if(rising_edge(EnBlink)) then
            mode <= not(mode);
        end if;
    end process ; -- Moder

    ------Present State------
    Dout <= (others => '0') when (alternador = '0' and mode = '1') else
            q_bus;
            
end architecture ;