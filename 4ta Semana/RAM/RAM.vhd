
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

			
entity RAM is
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
end RAM;

architecture Behavioral of RAM is

type ram_type is array (2**addr_width-1 downto 0) of std_logic_vector (DATA_WIDTH-1 downto 0);
signal ram_signal : ram_type;

begin

process (clk,rst)
begin
	if (rst = '1')then
		dout <= (others => '0');
   elsif (clk'event and clk = '1') then 
         if (en = '1' and Wr = '1' and rd ='0') then
            ram_signal(conv_integer(addr)) <= din;
         elsif (en='1' and wr = '0' and rd = '1') then
            dout <= ram_signal(conv_integer(addr));
			else
				dout <= (others => '0');
      end if;
   end if;
end process;

						
end Behavioral;

