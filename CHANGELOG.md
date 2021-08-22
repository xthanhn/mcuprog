# Changelog

## [3.9] - April 2021

### Added
- DSG-2920 Raise exception if device ID does not match
- DSG-2918 SerialUPDI: error recovery if non-ascii characters are read in SIB
- DSG-2861 Valid memory types are listed if an invalid one is specified

### Fixed
- DSG-3238 PIC16 eeprom displays incorrect address
- DSG-3239 PIC16 eeprom verification does not work
- DSG-2925 UPDI device revision not correctly parsed/displayed
- DSG-2860 SerialUPDI: chip erase does not work on locked device
- DSG-2857 SerialUPDI: crash when writing lockbits
- DSG-2855 Verify action fails if hex file contains eeprom content
- DSG-2854 User row excluded when reading to hex file
- DSG-2850 UPDI device model fix (sram)

### Changed
- DSG-2862 Improved exception handling
- DSG-3203 Improved exception handling
- DSG-3178 Cosmetic changes for publication

## [3.7.4] - December 2020

### Added
- DSG-1492 Added verify function
- DSG-2039 Added all UPDI devices
- DSG-2279 Added error codes
- DSG-1550 Flash-only erase

### Fixed
- DSG-2470 No feedback when multiple kits are connected
- DSG-2014 Error when reading using -m and -o but no -b
- DSG-2738 Padding to page size when writing user row on locked device

### Changed
- DSG-2234 Logging using logging module
- DSG-2034 prevent read using -b with no -m specified
- DSG-2009 prevent writing from hexfile with memory type specified
- DSG-2012 prevent writing from hexfile with offset specified
- DSG-2458 documentation changes
- DSG-2041 documentation changes
- DSG-2042 documentation changes
- DSG-2043 documentation changes
- DSG-2011 documentation changes

## [3.1.3] - June 2020
- First public release to PyPi

## My code
- pymcuprog.py change path of logging.yaml file line 40-46
