library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity FMS_tb is
end FMS_tb ; 

architecture Behavior of FMS_tb is
component FMS 
port(
    clk: in std_logic;
    CS: in std_logic;
    rst: in std_logic;
    data_in:in std_logic_vector(7 downto 0);
    data_out: out std_logic_vector(7 downto 0);
    bdir: in std_logic_vector(23 downto 0);
    databus: in std_logic_vector(7 downto 0);
    WriteC,ReadC: in std_logic
);

end component;
--Inputs
signal clk: std_logic := '0';
signal CS: std_logic:='0';
signal rst: std_logic:='0';
signal data_in:std_logic_vector(7 downto 0):=(others => '0');
signal data_out: std_logic_vector(7 downto 0);
signal bdir: std_logic_vector(23 downto 0):="100111010011110010111110";
signal databus: std_logic_vector(7 downto 0):="01010111";
signal WriteC,ReadC:std_logic;
constant clk_period : time:= 10 ns;
begin
    uut: FMS port map (
        clk => clk,
        CS => CS,
        rst =>rst,
        data_in =>data_in,
        WriteC =>WriteC,
        ReadC => ReadC,
        bdir =>bdir,
        databus =>databus,
        data_out =>data_out
      ) ;
clk_process : process
begin
    clk<='0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process ; -- clk_process

stim_process : process
begin
    rst <= '1';
    wait for clk_period;
    rst <= '0';
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='1';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
    CS <='0';
    WriteC <='0';
    ReadC <= '1';
    wait for clk_period*4;
end process ; -- stim_process
end architecture ;