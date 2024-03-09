library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity FMS_Video is
  port (
    clk,rst,Sm,Sf : in std_logic;
    E,F,A : out std_logic
  ) ;
end FMS_Video ; 

architecture FMS_VideoArch of FMS_Video is
  type state is (espera,encender_E,apagar_E,abrir_P,alarma);
  signal D_bus , Q_bus : state := "000";
  signal salidas: std_logic_vector (2 downto 0):=(others => '0');
begin
Activacion : process( clk,rst )
begin
  if clk'event and ck = '1' then
    if rst = '1' then
        Q_bus <= "000";
    else 
        Q_bus <= D_bus;
    end if;
  end if;
end process ; -- Activacion
 ---------------Proximo Estado------------
 Next_State : process( Sm,Sf,Q_bus )
 begin
    case( Q_bus ) is
    
      when espera =>
        if (Sm and Sf = '1') then
          D_bus <= encender_E;
          else
            D_bus <= espera;
        end if ;
      when encender_E =>
          if (SM and Sf = '1') then
            D_bus <= encender_E;
            elsif (Sm and (not Sf) = '1') then
              D_bus <= Apagar_E;
              else
                D_bus <= alarma;
          end if ;
      when apagar_E =>
              if (Sf = '1') then
                D_bus <= alarma;
                elsif (Sm and (not Sf) = '1') then
                  D_bus <= apagar_E;
                  else
                    D_bus <=abrir_P;
              end if ;
      when abrir_P =>
                  D_bus <= espera;
      when alarma =>
                  D_bus <= alarma;
      when others =>
                  D_bus <= espera;
    end case ;
 end process ; -- Next_State
  --------------Present State---------------
with Q_bus select
        salidas <= "000" when espera,
                   "100" when encender_E,
                   "000" when apagar_E,
                   "010" when abrir_P,
                   "001" when alarma,
                   "000" when others;
E <= salidas (2);
P <= salidas (1);
A <= salidas (0);
end architecture ;