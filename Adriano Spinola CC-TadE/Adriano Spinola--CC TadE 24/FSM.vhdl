library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity FSM is
  port (
    clk: in std_logic;
    rst: in std_logic;
    din: in std_logic_vector(3 downto 0);
    enblink: in std_logic;
    dout: out std_logic_vector(7 downto 0)
  ) ;
end FSM ; 

architecture ArchFSM of FSM is
type state_type is (inicio,multiplicar,alternar);
signal d_bus,q_bus: state_type:=inicio;
signal alternador: std_logic:= '0';
signal mode: std_logic:='0';
begin
----clk init----
process( clk, rst )
begin
  if( rst = '1' ) then
    q_bus <=inicio;
 elsif( rising_edge(clk) ) then
    q_bus<=d_bus;
	 alternador <= not( alternador);
 end if ;
end process;

----- enblink-----
process(enblink)
begin
if (rising_edge(enblink)) then
	mode <= not(mode);
end if;
end process;

----next state----
 process (mode,enblink, q_bus)
begin
    case( q_bus ) is
	 when inicio =>
			D_bus <= multiplicar;
	      when alternar =>
        if mode ='0' then
            d_bus <= multiplicar;
         else
            d_bus <= alternar;
            end if;
            when multiplicar =>
           if mode='1' then
                d_bus <= alternar;
             else
                d_bus<= multiplicar;
                end if;
    end case ;
    end process;
---- present state---
dout(7 downto 4) <= (others=> '0') when q_bus = inicio or( q_bus =alternar and alternador ='1')else
							din;
dout(3 downto 0) <= (others=> '0') when q_bus = inicio or( q_bus =alternar and alternador ='1')else
							din;
				     
end ArchFSM ;


------modo: para saber cuando tengo un pulso en enblink y cambiar de senal (de multiplicar a alternar y viseversa)---------
------cambio_alternador: para que me alterne de (0 al valor y viseversa) -------