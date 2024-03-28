library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity gen_Reg_SP is
    generic(
        n: integer:=8
    );
  port (
    clk: in std_logic;
    entrada: in std_logic;
    salida: in std_logic_vector(n-1 downto 0)
  ) ;
end gen_Reg_SP ; 

architecture arch of gen_Reg_SP is

signal d_bus,q_bus : std_logic_vector(n-1 downto 0):= (others => '0');

begin

    ---Registro de estado----
    
    CLK_Proc : process( clk, rst )
    begin
      if( rst = '1' ) then
        q_bus <= (others => '0');
      elsif( rising_edge(clk) ) then
        q_bus <= d_bus;
      end if ;
    end process ; -- CLK_Proc
    
    ---Estado Siguiente---
        d_bus <= entrada & q_bus (n-1 downto 1);
    ---Estado Presente----
        salida <= q_bus;
end architecture ;