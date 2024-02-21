library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity mux4 is
  port (
    signal x: std_logic_vector(3 downto 0);
    S0,S1: in std_logic;
    Z: out std_logic
    
  ) ;
end mux4 ; 
architecture mux4arch of mux4 is
signal G,H,J,K : std_logic:= '0';
begin
    G <= (x(0) and (not S0) and (not S1));
    H <= (x(1) and S0 and (not S1));
    J <= (x(2) and (not S0) and S1);
    K <= (x(3) and S0 and S1);
    Z <= (G or H or J or K); 
end architecture mux4arch ;