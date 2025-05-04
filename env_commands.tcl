set base_dir "/home/u_r_tatsu"
set project_name "try_synth7"
set part_number "xcvc1902-viva1596-2LP-e-L

set project_dir [file join $base_dir $project_name]

create_project $project_name $project_dir -part $part_number
set_property target_language VHDL [current_project]

file mkdir [file join $project_dir "src"]
file mkdir [file join $project_dir "constraints"]

set vhdl_file [file join $project_dir "src" "counter.vhd"]
set fh [open $vhdl_file w]
puts $fh {
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
  Port ( 
    clk : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR(3 downto 0)
  );
end counter;

architecture Behavioral of counter is
  signal tmp : UNSIGNED(3 downto 0) := "0000";
begin
  process(clk)
  begin
    if rising_edge(clk) then
      tmp <= tmp + 1;
    end if;
  end process;
  cnt <= STD_LOGIC_VECTOR(tmp);
end Behavioral;
}
close $fh

set xdc_file [file join $project_dir "constraints" "constraints.xdc"]
set fh [open $xdc_file w]
puts $fh "create_clock -name clk -period 10 \[get_ports clk\]"
close $fh

add_files -norecurse $vhdl_file
add_files -fileset constrs_1 -norecurse $xdc_file

#save_project
