library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use ieee.numeric_std;

entity Contador_Generico is
    generic(
        g_Datasize : integer :=8
    );
  port (
    clk : in std_logic;
    rst : in std_logic;
    i_en : in std_logic;
    i_data : in std_logic_vector (g_Datasize-1 downto 0);
    o_data : out std_logic_vector (g_Datasize-1 downto 0);
    o_end: out std_logic
  ) ;
end Contador_Generico ; 

architecture Contador_GenericoArch of Contador_Generico is

signal D_bus,Q_bus: std_logic_vector(g_Datasize-1 downto 0):= (others => '0');
signal o_end_s: std_logic:'0';
begin

Clk_process : process( clk, rst )
begin
  if( rst = '1' ) then
    Q_bus <= (others => '0');
  elsif( rising_edge(clk) ) then
    Q_bus <= D_bus;
  end if ;
end process ; -- Clk_process
    ----Next State Logic-----

D_bus <= Q_bus when i_en = '0' else
        (others => '0') when Q_bus = i_data else
        std_logic_vector(unsigned(Q_bus)+1);
    ----Present State Logic--
o_data <= Q_bus;
o_end <= o_end_s;
o_end_s <= '1' when Q_bus = i_data else
           '0';
end Contador_GenericoArch ;