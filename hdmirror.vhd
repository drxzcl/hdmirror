----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:56 04/25/2015 
-- Design Name: 
-- Module Name:    hdmirror - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity hdmirror is
    Port ( clk50         : in  STD_LOGIC;
           hdmi_in_p     : in  STD_LOGIC_VECTOR(3 downto 0);
           hdmi_in_n     : in  STD_LOGIC_VECTOR(3 downto 0);
           hdmi_in_sclk  : inout  STD_LOGIC;
           hdmi_in_sdat  : inout  STD_LOGIC;

           hdmi_out_p : out  STD_LOGIC_VECTOR(3 downto 0);
           hdmi_out_n : out  STD_LOGIC_VECTOR(3 downto 0)
			 );
end hdmirror;

architecture Behavioral of hdmirror is

signal serial_data         : std_logic_vector(3 downto 0);

begin
	hdmi_in_sclk  <= 'Z';
   hdmi_in_sdat  <= 'Z';


diff_input_0 : IBUFDS
   generic map (
      DIFF_TERM    => FALSE,
      IBUF_LOW_PWR => TRUE,
      IOSTANDARD   => "TMDS_33")
   port map (
      O  => serial_data(0),
      I  => hdmi_in_p(0),
      IB => hdmi_in_n(0)
   );

diff_output_0  : OBUFDS 
	port map ( 
		O  => hdmi_out_p(0),
		OB => hdmi_out_n(0),
		I => serial_data(0));


diff_input_1 : IBUFDS
   generic map (
      DIFF_TERM    => FALSE,
      IBUF_LOW_PWR => TRUE,
      IOSTANDARD   => "TMDS_33")
   port map (
      O  => serial_data(1),
      I  => hdmi_in_p(1),
      IB => hdmi_in_n(1)
   );

diff_output_1  : OBUFDS 
	port map ( 
		O  => hdmi_out_p(1),
		OB => hdmi_out_n(1),
		I => serial_data(1));


diff_input_2 : IBUFDS
   generic map (
      DIFF_TERM    => FALSE,
      IBUF_LOW_PWR => TRUE,
      IOSTANDARD   => "TMDS_33")
   port map (
      O  => serial_data(2),
      I  => hdmi_in_p(2),
      IB => hdmi_in_n(2)
   );

diff_output_2  : OBUFDS 
	port map ( 
		O  => hdmi_out_p(2),
		OB => hdmi_out_n(2),
		I => serial_data(2));


diff_input_3 : IBUFDS
   generic map (
      DIFF_TERM    => FALSE,
      IBUF_LOW_PWR => TRUE,
      IOSTANDARD   => "TMDS_33")
   port map (
      O  => serial_data(3),
      I  => hdmi_in_p(3),
      IB => hdmi_in_n(3)
   );

diff_output_3  : OBUFDS 
	port map ( 
		O  => hdmi_out_p(3),
		OB => hdmi_out_n(3),
		I => serial_data(3));





end Behavioral;

