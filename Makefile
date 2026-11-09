TOP = tt_um_tolelom_counter
SRC = src/$(TOP).v

.PHONY: test lint synth

test:
	cd test && $(MAKE) -B

lint:
	verilator --lint-only -Wall $(SRC)

synth:
	yosys -q -p "read_verilog $(SRC); synth -top $(TOP); check -assert; select -assert-none t:\$$_DLATCH*; tee -o /dev/stdout stat"
