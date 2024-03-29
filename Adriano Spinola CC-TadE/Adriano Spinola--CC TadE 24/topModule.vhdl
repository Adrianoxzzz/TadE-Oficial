library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Topmodule is
  port (
   clk: in std_logic;
   rst: in std_logic;
   enblink: in std_logic;
   din: in std_logic_vector (3 downto 0);
   dout: out std_logic_vector (7 downto 0)
  ) ;
end Topmodule ; 

architecture ArchTopModule of Topmodule is
    component div_frec
    port(
        clk: in std_logic;
        rst: in std_logic;
        rco: out std_logic;
        en: in std_logic
    ); 
    end component;
    component FSM
    port(
        clk: in std_logic;
        rst: in std_logic;
        din: in std_logic_vector(3 downto 0);
        enblink: in std_logic;
        dout: out std_logic_vector(7 downto 0)
    );
	 end component;
signal intermedia: std_logic;

begin
divisor:div_frec
port map(
    clk => clk,
    en => '1',
    rst => rst,
    rco => intermedia
);
maquina: FSM
port map( 
    clk=> intermedia,
    rst=>rst,
    din=>din,
    dout=>dout,
    enblink=>enblink
);
end ArchTopModule;