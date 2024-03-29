library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity div_frec is
    generic(
        frec: integer:= 2      ----Nota la frecuencia original seria 25 000 000
		  --- se coloca este valor para la facilidad de simulacion
    );
  port (
    clk: in std_logic;
    rst: in std_logic;
    rco: out std_logic;
    en: in std_logic
  ) ;
end div_frec ; 


architecture ArchDiv_frec of div_frec is
signal cout: integer :=0;
signal aux_sig: std_logic :='0';
begin

---Logica del clk---

 process (clk) is
	begin
	if clk'event and clk='1' then
		if rst='1' then
			cout<=0;
			otro_rso<='0';
		elsif en='1' and cout= frec then
			cout<=0;
			aux_sig<= not(aux_sig);
		else
			cout<= cout+1;
			aux_sig<= aux_sig;
		end if;
	end if;
end process;
	
	
---Salida de rco---
	rco<=aux_sig;
	
	
end ArchDiv_frec ;