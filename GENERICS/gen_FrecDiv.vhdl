library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity Generador_5hz is
    generic(
        N: integer := 25000000
    )
    port (
    clk,rst : in std_logic;
    q: out std_logic
  ) ;
end Generador_5hz ; 

architecture Contadorarch of Generador_5hz is
    signal sq: std_logic:='0';
    signal counter: integer range 0 to N-1:=0;  --Contador para generar la frecuencia deseada Clk/2
begin
    process (clk,rst) is
        begin
         if rst = '1' then
            counter <= 0;
            sq <= '0';
        elsif clk'event and clk = '1' then
            if counter = N-1 then
                counter <= '0';
                sq <= not sq;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;--Generador_.5Hz:
    q <= sq;
end Contadorarch ;