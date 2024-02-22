--c�digo de una ROM de 16x8 (128bits) donde se guardan
--los n�meros hexadecimales para un display de 7 segmentos de anodo común
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom is
	generic (bits: integer:=8);
	port(address: in std_logic_vector(3 downto 0);
	dataout: out std_ulogic_vector(bits-1 downto 0);
	AN : out std_logic_vector(7 downto 0));
end entity rom;

architecture mem of rom is
	type rom_array is array (0 to 15) of std_ulogic_vector (bits-1 downto 0);
	-- los datos de los segmentos del display tienen el orden "abcdefgP" para �nodo com�n
	constant rom: rom_array := (
	x"03", x"9F", x"25", "00001101", -- 0, 1, 2, 3
	x"99", x"49", x"41", "00011111", -- 4, 5, 6, 7
	x"01", x"09", x"11", "11000001", -- 8, 9, A, b
	x"63", x"85", x"61", "01110001"); -- C, d, E, F

	signal addr: integer range 0 to 15;
	begin
	AN <= "11111110";
	addr <= conv_integer(address); -- convierte el dato binario de address a entero
	dataout <= rom(addr);
end architecture;