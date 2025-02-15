/*
 * Intel Edison
 *
 * Texas Instruments ADS1015 ADC.
 *
 * In Linux you need to set CONFIG_TI_ADS1015=y (or m) to be able to use
 * this device.
 *
 * Copyright (C) 2019, Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
DefinitionBlock ("ads1015.aml", "SSDT", 5, "", "ADS1015", 1)
{
    External (\_SB.PCI0.I2C1, DeviceObj)

    Scope (\_SB.PCI0.I2C1)
    {
        Device (TIAD)
        {
            Name (_HID, "PRP0001")
            Name (_DDN, "TI ADS1015 ADC")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBus (
                    0x48,                   // Bus address
                    ControllerInitiated,    // Don't care
                    400000,                 // 400 kHz
                    AddressingMode7Bit,     // 7-bit addressing
                    "\\_SB.PCI0.I2C1",      // I2C host controller
                    0                       // Must be 0
                )
            })

            /*
             * See Documentation/devicetree/bindings/iio/adc/ads1015.txt
             * for more information about these bindings.
             */
            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "compatible", Package () { "ti,ads1015" } },
                }
            })
        }
    }
}
