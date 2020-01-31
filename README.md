# ram_pll_test
 How to use Efinix FPGA Block RAM and PLL for FPGA design

 ## Description

This repo focus on introduction Efinix Trion Series FPGA Block RAM and PLL
- README.md  the project readme file
- Efinix 的官网是 www.efinixinc.com

Efinix FPGA 的第一个低成本FPGA家族是 Trion :
- you can register to access the documentation
- we will provide the EVB and software for your evaluation.
- ...


## Trion FPGA Family

```
- FPGA lower than 30mw
  - T4,T8      : 4K , 8K  pure soft logic fabric product
  - Package    : 5x5mm FBGA81, 55 GPIOs
  - EVB        :
    - T8EVB with build in programmer, you only need PC with USB
    - T20EVB with build in programmer based on FTDI chip, you only need PC with USB
-
```

## Software

On Ubuntu 16LTS : Efinix provide the Free FPGA develop suit, you need register it and buy one piece of EVB

```sh
```
Other features :

- Efinity 2018.4, we use the Version 2018.4 test the project, you can use Efinity 2019.3 or other advanced version

## Hardware

- we use the Efinix T20F256 EVB


## Project name

- STEP1: install Efinity 2018.4 or other advanced version in Win or Ubuntu
- STEP2: get ready of the T20F256EVB,  
    - if you have same EVB with Efinix engieers, with the other words, it is easy to find the issue with same two boards when you need tech support.

- STEP3: download the total repository directory into Efinity project directory, for examples, C:\Efinity\2018.4\project\ram_pll_test

- STEP4: open the Efinity project with the ram_pll.xml

- STEP5: download the FPGA design hex into FPGA, it is all set

- you can study how to use the Efinity RAM and PLL when you want to transfer your previous project that based on other vendor FPGA


## Update

 -Jan-31-2020,  migrate from 2018.2 to 2019.2 Efinity by Ben Chen
 
The code is from Ben Chen
Project upload by Wisdom Zhang
