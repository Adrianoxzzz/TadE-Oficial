--Realice la descripción en VHDL de un circuito capaz de generar una señal de
--0.5 Hz; utilizando para el diseño la señal de reloj generada por el oscilador de 50 MHz
--de la placa de desarrollo.

library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsiged.all;

entity Contador_ is
  port (
    clk,rst,d : in std_logic;
    q: out std_logic;
  ) ;
end Contador_ ; 

architecture Contadorarch of Contador_ is
    signal counter: integer range 0 to 24999999:=0;  --Contador para generar la frecuencia deseada Clk/2
begin
    process (clk,rst) is
        begin
        if rst = '1' then
            counter <= 0;
            q <= '0';
        elsif clk'event and clk = '1' and counter = 24999999 then
            counter <= '0';
            q <= not q;
        else
            counter <= counter + 1;
        end if;
    end process;--Generador_.5Hz:
end Contadorarch ;