library ieee ;
    use ieee.std_logic_1164.all ;

entity compuerta_and is
  port (
    a : in std_logic;
    b : in std_logic;
    c : out std_logic
  ) ;
end compuerta_and ; 

architecture archCompuerta_and of compuerta_and is

begin
    c <= a and b;
end architecture ;