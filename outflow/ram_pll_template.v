
// Efinity Top-level template
// Version: 2019.2.192
// Date: 2020-01-31 10:03

// Copyright (C) 2017 - 2019 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as F:\efinity_prj\2019_2\ram_pll_test-master\ram_pll.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  ram_pll
//     #4)  Insert design content.


module ram_pll
(
  input clk,
  input locked,
  output [7:0] led_o
);


endmodule

