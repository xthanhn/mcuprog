[![MCHP](images/microchip.png)](https://www.microchip.com)

# mcuprog - Microchip MCU programmer
mcuprog is a Python utility for programming various Microchip MCU devices using Microchip CMSIS-DAP based debuggers

Browse source code on [github](https://github.com/caddish12/mcuprog)

Read API documentation on [github](https://microchip-pic-avr-tools.github.io/pymcuprog)

## Usage
mcuprog can be used as a command-line interface or a library

### CLI examples
When installed using pip, mcuprog CLI is located in the Python scripts folder.

Example 1: test connectivity by reading the device ID using Curiosity Nano:
```bash
mcuprog ping
```

Example 2: write contents of a hexfile to flash using Curiosity Nano:
```bash
mcuprog write -f app.hex
```

For more examples see [on pypi.org](https://pypi.org/project/pymcuprog/)

### Library usage example
mcuprog can be used as a library using its backend API.  For example:
```python
"""
Example usage of mcuprog as a library to read the device ID
"""
# pymcuprog uses the Python logging module
import logging
logging.basicConfig(format="%(levelname)s: %(message)s", level=logging.WARNING)

# Configure the session
from pymcuprog.backend import SessionConfig
sessionconfig = SessionConfig("atmega4808")

# Instantiate USB transport (only 1 tool connected)
from pymcuprog.toolconnection import ToolUsbHidConnection
transport = ToolUsbHidConnection()

# Instantiate backend
from pymcuprog.backend import Backend
backend = Backend()

# Connect to tool using transport
backend.connect_to_tool(transport)

# Start the session
backend.start_session(sessionconfig)

# Read the target device_id
device_id = backend.read_device_id()
print ("Device ID is {0:06X}".format(int.from_bytes(device_id, byteorder="little")))
```

## Supported devices and tools
mcuprog is primarily intended for use with PKOB nano (nEDBG) debuggers which are found on Curiosity Nano kits and other development boards.  This means that it is continuously tested with a selection of AVR devices with UPDI interface as well as a selection of PIC devices.  However since the protocol is compatible between all EDBG-based debuggers (pyedbglib) it is possible to use pymcuprog with a wide range of debuggers and devices, although not all device families/interfaces have been implemented.

### Debuggers / Tools
mcuprog supports:
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
mcuprog supports:
* All UPDI devices, whether mounted on kits or standalone
* PIC devices mounted on Curiosity Nano kits, or similar board with PKOB nano (nEDBG) debugger

Other devices (eg ATmega328P, ATsamd21e18a) may be partially supported for experimental purposes

## Notes for Linux® systems
This package uses pyedbglib and other libraries for USB transport and some udev rules are required.  For details see the pyedbglib package: https://pypi.org/project/pyedbglib

# Build Windows executable file instruction
```bash
python setup.py build_exe
```
Go to build folder and run **copydevice.bat**
Copy build folder to use with other computer
