library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Reg_Count is
  port (
    clk: in std_logic;
    entrada: in std_logic;
    salida: out std_logic
  ) ;
end Reg_Count ; 

architecture arch of Reg_Count is

signal D_bus, Q_bus: std_logic_vector(3 downto 0):=(others => '0');
begin
    --------Registro de estado-------
    State_Reg : process( clk )
    begin
        if clk'event and clk = '1' then
            Q_bus <= D_bus;
        end if;
    end process ; -- State_Reg
    --------Logica del estado siguiente-------
    D_bus <= entrada & Q_bus(3 downto 1);
    --------Logica de salida--------
salida <= Q_bus(0);
end architecture ;