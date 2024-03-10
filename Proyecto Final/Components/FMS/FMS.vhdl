library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity FMS is
  port (
    clk: in std_logic;
    CS: in std_logic;
    rst: in std_logic;
    data_out: out std_logic_vector(7 downto 0);
    bdir: in std_logic_vector(23 downto 0);
    databus: in std_logic_vector(7 downto 0);
    WriteC,ReadC: in std_logic
  ) ;
end FMS ; 

architecture arch of FMS is

type state is (WE,PP,Di_MSB,Di_MeSB,Di_LSB,Data,WD,espera,RDB);
signal Q_bus,D_bus: state:=espera;
signal DOut: std_logic_vector(7 downto 0):= (others=>'0');
begin

Inicializar : process( clk, rst )
begin
    if clk'event and clk ='1' then
        if rst ='1' then
            Q_bus <= espera;
        else
            Q_bus <= D_bus;
        end if;
    end if;
end process ; -- Inicializar

-----------NEXT STATE LOGIC-----------
FMScode : process( Q_bus,WriteC,ReadC,CS)
begin
   case( Q_bus ) is
   
    when espera =>
        if CS ='0' then
            if WriteC = '0' then
                D_bus <= WE;
            elsif ReadC = '0' then
                D_bus <= RDB;
            end if;
        else 
            D_bus <= espera;
        end if;
    when WE =>
        if CS ='0' and WriteC ='0' then
            D_bus <= PP;
        else 
            D_bus <= espera;
        end if;
    when PP =>
        if CS = '0' and WriteC = '0' then
            D_bus <= Di_MSB;
        else
            D_bus <= espera;
        end if;
    when Di_MSB =>
        if CS = '0' and WriteC = '0' then
            D_bus <= Di_MeSB;
        elsif CS = '0' and ReadC = '0' then
            D_bus <= Di_MeSB;
        else
            D_bus <= espera;
        end if;
    when Di_MeSB =>
        if CS = '0' and WriteC = '0' then
            D_bus <= Di_LSB;
        elsif CS = '0' and ReadC = '0' then
            D_bus <= Di_LSB;
        else
            D_bus <= espera;
        end if;
    when Di_LSB =>
        if CS = '0' and WriteC = '0' then
            D_bus <= data;
        elsif CS = '0' and ReadC = '0' then
            D_bus <= espera;
        else
            D_bus <= espera;
        end if;
    when data =>
        if CS = '0' and WriteC = '0' then
            D_bus <= data;
        else
            D_bus <= espera;
        end if;
    when RDB =>
        if CS ='0' and ReadC ='0' then
            D_bus <= Di_MSB;
        else
            D_bus <= espera;
        end if;
    when others =>
            D_bus <= espera;
   end case ; 
end process ; -- FMScode

------Present State Logic----------
with Q_bus select
           DOut  <= "00000110" when WE,
                   "00000010" when PP,
                   "00000100" when WD,
                   bdir(23 downto 16) when Di_MSB,
                   bdir(15 downto 8) when Di_MeSB,
                   bdir(7 downto 0) when Di_LSB,
                   databus when data,
                   "00000000" when espera,
                   "00000011" when RDB,
                   "00000000" when others;
data_out <=DOut;
end architecture ;