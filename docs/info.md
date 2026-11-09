<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

An 8-bit counter. While rst_n is low the count is held at 0 on the next clock edge. Otherwise it increases by 1 on every rising clock edge and wraps from 255 to 0. The count is driven on uo_out.

## How to test

Hold rst_n low for a few clock cycles, then release it. uo_out should read 0 and then increase by 1 on every clock.

## External hardware

None.
