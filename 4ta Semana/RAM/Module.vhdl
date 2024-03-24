library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Module is
  port (
    clk: in std_logic;
    rst: in std_logic;
    en: in std_logic;
    lap_btn: in std_logic;
    stp: in std_logic;
    din: in std_logic_vector (31 downto 0);
    addr: in std_logic_vector (7 downto 0);
    dout: out std_logic_vector (31 downto 0)
  ) ;
end Module ; 

architecture ModuleArch of Module is

  ----Ram module-----

  component RAM
  generic(
    ADDR_WIDTH : integer := 8;
    DATA_WIDTH : integer := 32
    );
    port(
    clk: in std_logic;
    rst: in std_logic;
    en: in std_logic;
    wr: in std_logic;
    rd:in std_logic;
    din: in std_logic_vector(data_width-1 downto 0);
    addr: in std_logic_vector(addr_width-1 downto 0);
    dout: out std_logic_vector(data_width-1 downto 0)
    );
  end component;

  ----State Machine------
  
  component RAM_FMS 
  port (
    rst: in std_logic;
    clk: in std_logic;
    lap_btn: in std_logic;
    en: in std_logic;
    stp: in std_logic;
    salida: out std_logic_vector(2 downto 0)
  ) ;
  end component;

  ---Signal-----

signal intermedio: std_logic_vector(2 downto 0):= "000";

begin

  RAM_FMS_c: RAM_FMS 
  port map(
    rst => rst,
    clk => clk,
    stp => stp,
    en => en,
    lap_btn => lap_btn,
    salida => intermedio
  );
  RAM_c: RAM
  generic map(
    ADDR_WIDTH => 8,
    DATA_WIDTH => 32
  ) 
  port map(
    rst => rst,
    clk => clk,
    en => intermedio(2),
    wr => intermedio (1),
    rd => intermedio (0),
    din => din,
    addr => addr,
    dout => dout
  );
end ModuleArch ;