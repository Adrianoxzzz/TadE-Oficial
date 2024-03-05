library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use ieee.std_logic_unsigned.all;
entity Contador8bit is
  port (
    clk: in std_logic;
    rst: in std_logic;
    q: out std_logic_vector(7 downto 0)
  ) ;
end Contador8bit ; 

architecture Contador8bitArch of Contador8bit is
begin
 process( CLK, rst )
    begin
        
    end process ;

end architecture ;