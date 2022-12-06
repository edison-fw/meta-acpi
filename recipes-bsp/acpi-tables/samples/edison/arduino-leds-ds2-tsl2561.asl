/*
 * Intel Edison
 *
 * Copyright (C) 2017, Intel Corporation
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
DefinitionBlock ("leds-ds2-ts2651.aml", "SSDT", 5, "", "LEDS-TSL", 1)
{

#define MUX_I2C

#define SPI_CLK_SEL_HOG	Name (DSMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 11, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "ds2-mux" }, } })
#define SPI_CLK_SEL_REF	Package () { "ds2-mux", "DSMX" },
#define CONF_SPI_CLK_SEL

#define MUX18_DIR_HOG	Name (DSOE, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 13, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "ds2-oe" }, } })
#define MUX18_DIR_REF	Package () { "ds2-oe", "DSOE" },
#define CONF_MUX18_DIR

#define DIG7_PU_PD_HOG	Name (LSPU, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "lightsensor-pu" }, } })
#define DIG7_PU_PD_REF	Package () { "lightsensor-pu", "LSPU" },
#define CONF_DIG7_PU_PD

#define MUX32_DIR_HOG	Name (LSMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "lightsensor-mux" }, } })
#define MUX32_DIR_REF	Package () { "lightsensor-mux", "LSMX" },
#define CONF_MUX32_DIR

    #include "arduino.asli"
    #include "leds.asli"
    #include "tsl2561.asli"
}
