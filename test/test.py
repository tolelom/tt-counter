# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, ReadOnly


async def reset(dut):
    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1


async def count_after(dut, cycles):
    await ClockCycles(dut.clk, cycles)
    await ReadOnly()
    return dut.uo_out.value


@cocotb.test()
async def test_reset_clears(dut):
    await reset(dut)
    await ReadOnly()
    assert dut.uo_out.value == 0


@cocotb.test()
async def test_counts_up(dut):
    await reset(dut)
    assert await count_after(dut, 5) == 5


@cocotb.test()
async def test_wraps_at_256(dut):
    await reset(dut)
    assert await count_after(dut, 255) == 255
    assert await count_after(dut, 1) == 0


@cocotb.test()
async def test_reset_mid_count(dut):
    await reset(dut)
    await ClockCycles(dut.clk, 20)
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await ReadOnly()
    assert dut.uo_out.value == 0
    assert await count_after(dut, 3) == 3
