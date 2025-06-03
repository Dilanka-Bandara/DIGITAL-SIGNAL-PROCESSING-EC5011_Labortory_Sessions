#define CHIP_6713  // Correct macro definition

#include "dsk6713.h"
#include "dsk6713_aic23.h"
#include "dsk6713_dip.h"
#include "dsk6713_led.h"

Uint32 data;

int main(void)
{
    // Create handle for codec
    DSK6713_AIC23_CodecHandle hCodec;

    // Use default configuration for AIC23 codec
    DSK6713_AIC23_Config config = DSK6713_AIC23_DEFAULTCONFIG;

    // Initialize the DSK board support library
    DSK6713_init();
    DSK6713_DIP_init();
    DSK6713_LED_init();

    // Open codec with default config
    hCodec = DSK6713_AIC23_openCodec(0, &config);

    // Set sampling frequency to 8kHz
    DSK6713_AIC23_setFreq(hCodec, DSK6713_AIC23_FREQ_8KHZ);

    // Main loop
    while (1)
    {
        // If DIP switch 0 is pressed
        if (DSK6713_DIP_get(0) == 0)
        {
            // Read audio sample from codec (left or right channel)
            while (!DSK6713_AIC23_read(hCodec, &data));

            // Write audio sample back to codec
            while (!DSK6713_AIC23_write(hCodec, data));

            // Turn on LED 0
            DSK6713_LED_on(0);
        }
        else
        {
            // Turn off LED 0
            DSK6713_LED_off(0);
        }
    }

    return 0;
}
