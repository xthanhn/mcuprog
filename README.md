# **MCUprog UPDI**
MCUprog UPDI is a modified utility for programming various Microchip MCU devices using Microchip CMSIS-DAP based debuggers and standard TTL serial port.

I made this modified using for my personal project and focus on UPDI programming interface only, so I name it as MCUprog UPDI, but it can be used to program PIC MCU and MCU with another programming interface type.

MCUprog UPDI is released as windows executable file (exe) - checkout [**releases**](https://github.com/caddish12/mcuprog/releases). You can use them directly on windows without Python.

MCUprog UPDI supports newest MCU from microchip. It works well with new AVR 0-Series, 1-Series and 2-Series using UPDI programming interface.

### Notice
This code is used to build Windows application and does not compatible original build.

### Serial UPDI

MCUprog UPDI can be used as **Serial UPDI programmer** using a **standard TTL serial port**

If you use [MegaTinyCore by SpenceKonde](https://github.com/SpenceKonde/megaTinyCore) version from 2.3.2, programming speed can be as high as **460800 baud**. Checkout [docs for SerialDUPI](https://github.com/SpenceKonde/megaTinyCore/blob/master/megaavr/tools/README.md) from SpenceKonde

Example connection, for detailes please check above link. Be sure to connect a common ground, and use a TTL serial adapter running at the same voltage as the AVR device

```bash
Vcc                     Vcc                     Vcc
+-+                     +-+                     +-+
 |                      |                       |
+---------------------+ |                       | +--------------------+
| Serial port         +-+                       +-+  AVR device        |
|                     |      +----------+         |                    |
|                  TX +------+  1k-4.7k +---------+ UPDI               |
|                     |      +----------+    |    |                    |
|                     |                      |    |                    |
|                  RX +----------------------+    |                    |
|                     |                           |                    |
|                     +--+---------------------+--+                    |
+---------------------+  |                     |  +--------------------+
                        +-+                   +-+
                        GND                   GND                        
```

### Pickit 4 UPDI
```bash
                                         Vcc
                                         +-+
                                           |
        +---------------------+            |  |-------------------+
        | Pickit4       2-VDD +------------+--+   AVR device      |
        |                     |               |                   |
        |               3-GND +---------------+ GND               |
|USB|---|                     |               |                   |
        |               4-PGD +---------------+ UPDI              |
        |                     |               |                   |
        |                     |               |                   |
        +---------------------+               |-------------------+

```

### Usage
MCUprog UPDI can be used as a command-line interface. GUI version will release soon.

### CLI examples
When installed using pip, MCUprog UPDI CLI is located in the Python scripts folder.

Example 1: test connectivity by reading the device ID using Curiosity Nano:
```bash
mcuprog ping
```
Example 2: write contents of a hexfile to flash using Curiosity Nano:
```bash
mcuprog write -f app.hex
```
Example 3: interface with UPDI using pickit4 and erase flash
```bash
mcuprog -d attiyy1626 erase
```
Example 4: interface with UPDI using TTL serial port
```bash
mcuprog -i uart -u com1 -c 115200 -d attiny1626 reset
```

Example 5: write content of hexfile to flash
```bash
mcuprog -i uart -u com1 -c 115200 -d attiny1626 write -f app.hex
```

Example 6: get voltage of devices using pickit4
```bash
mcuprog getvoltage
```

For more examples see [on pypi.org](https://pypi.org/project/pymcuprog/)

### Supported devices and tools
MCUprog UPDI is primarily intended for use with PKOB nano (nEDBG) debuggers which are found on Curiosity Nano kits and other development boards.  This means that it is continuously tested with a selection of AVR devices with UPDI interface as well as a selection of PIC devices.  However since the protocol is compatible between all EDBG-based debuggers (pyedbglib) it is possible to use MCUprog UPDI with a wide range of debuggers and devices, although not all device families/interfaces have been implemented.

### Debuggers / Tools
MCUprog UPDI supports:
* PKOB nano (nEDBG) - on-board debugger on Curiosity Nano
* MPLAB PICkit 4 In-Circuit Debugger (when in 'AVR mode')
* MPLAB Snap In-Circuit Debugger (when in 'AVR mode')
* Atmel-ICE
* Power Debugger
* EDBG - on-board debugger on Xplained Pro/Ultra
* mEDBG - on-board debugger on Xplained Mini/Nano
* JTAGICE3 (firmware version 3.0 or newer)

Although not all functionality is provided on all debuggers/boards.  See device support section below.

### Devices
MCUprog UPDI supports:
* All UPDI devices, whether mounted on kits or standalone
* PIC devices mounted on Curiosity Nano kits, or similar board with PKOB nano (nEDBG) debugger

Other devices (eg ATmega328P, ATsamd21e18a) may be partially supported for experimental purposes

### Build instruction on Windows
Open Command Prompt and run cx_freeze
```bash
pip install cx_freeze
```
Change working directory to source code folder and run
```bash
python build.py build_exe
```
Go to **build/exe.win-xxx** folder and run **runme.bat** and enjoy!

### Origin Python version
* Browse origin pymcuprog source code on [github](https://github.com/microchip-pic-avr-tools/pymcuprog)
* Read API documentation on [github](https://microchip-pic-avr-tools.github.io/pymcuprog)
