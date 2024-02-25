--Realice la descripción en VHDL de un circuito capaz de generar una señal de
--0.5 Hz; utilizando para el diseño la señal de reloj generada por el oscilador de 50 MHz
--de la placa de desarrollo.

library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity Generador_5hz is
  port (
    clk,rst : in std_logic;
    q: out std_logic
  ) ;
end Generador_5hz ; 

architecture Contadorarch of Generador_5hz is
    signal sq: std_logic:='0';
    signal counter: integer range 0 to 24999999:=0;  --Contador para generar la frecuencia deseada Clk/2
    signal rr : integer range 0 to 1:=0;
begin
    process (clk,rst) is
        begin
         if rst = '1' then
            counter <= 0;
            sq <= '0';
        elsif clk'event and clk = '1' then
            if counter = 24999999 then
                if rr = 1 then
                    counter <= '0';
                    rr <= 0;
                    sq <= not sq;
                else 
                    counter <= 0;
                    rr <= rr+1;
                end if;
        else
            counter <= counter + 1;
            end if;
        end if;
    end process;--Generador_.5Hz:
    q <= sq;
end Contadorarch ;