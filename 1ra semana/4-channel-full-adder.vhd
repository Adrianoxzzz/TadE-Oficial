library ieee ;
    use ieee.std_logic_1164.all ;

entity FullAdder4 is
  port (
    signal X: in std_logic_vector(3 downto 0);
    signal Y: in std_logic_vector(3 downto 0);
    signal S : out std_logic_vector(3 downto 0);
    Cout : out std_logic
  ) ;
end FullAdder4 ; 

architecture FullAdder4arch of FullAdder4 is
        --Vector de señales internas
signal A : std_logic_vector(2 downto 0):= "0";
signal B : std_logic_vector(2 downto 0):= "0";
signal C : std_logic_vector(2 downto 0):= "0";
signal D : std_logic_vector(2 downto 0):= "0";
        --Vector de salida de los Cout
signal Cin : std_logic_vector(2 downto 0):="0";
begin
    --Suma 1er Bit
    A(0) <= X(0) xor Y(0);
    A(1) <= X(0) and Y(0);
    A(2) <= A(0) and '0';
    S(0) <= A(0) xor '0';
    Cin(0) <= A(1) or A(2);
    --Suma 2do Bit
    B(0) <= X(1) xor Y(1);
    B(1) <= X(1) and Y(1);
    B(2) <= B(0) and Cin(0);
    S(1) <= B(0) xor Cin(0);
    Cin(1) <= B(1) or B(2);
    --Suma 3er Bit
    C(0) <= X(2) xor Y(2);
    C(1) <= X(2) and Y(2);
    C(2) <= C(0) and Cin(1);
    S(2) <= C(0) xor Cin(1);
    Cin(2) <= C(1) or C(2);
    --Suma 4to bit + carry Bit
    D(0) <= X(3) xor Y(3);
    D(1) <= X(3) and Y(3);
    D(2) <= D(0) and Cin(2);
    S(3) <= D(0) xor Cin(2);
    Cout <= D(1) or D(2);

end architecture FullAdder4arch;