library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use ieee.std_logic_arith.all;
entity GenCounter is
    generic(
        N: integer:=50000000;
        limit: integer:= 60
    );
  port (
    clk: in std_logic;
    rst: in std_logic;
    cuenta: out integer;
    rco: out std_logic;
	 pause: in std_logic;
    Q: out std_logic
  ) ;
end GenCounter ; 

architecture CounterArch of GenCounter is
signal Qsig: std_logic:='0'; 
signal count: integer range 0 to N:=0; --25MHz
signal secs: integer range 0 to limit:=0;
signal rco_sig: std_logic:='0';
begin

Start : process( clk, rst,pause )
begin
  if( rst = '1' ) then
    Qsig <= '0';
	 count <= 0;
  elsif pause= '1' then
	 count <= count;
  elsif( rising_edge(clk) ) and pause = '0' then
    if count = N-1 then
        count <= 0;
        Qsig <= not(Qsig);
    else 
        count <= count + 1;
    end if;
  end if ;
  end process;
  process(Qsig)
 begin
 if falling_edge(Qsig) then
                if secs = limit - 1 then
                    secs <= 0;
                    rco_sig <= not(rco_sig);
                else 
                    secs <= secs + 1;
                    rco_sig <= '0';
                end if;
            end if;
		end process;
cuenta <= secs;
Q <= Qsig;
rco <= rco_sig;
end architecture ;