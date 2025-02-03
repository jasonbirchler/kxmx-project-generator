#include "daisysp.h"
#include "kxmx_bluemchen/src/kxmx_bluemchen.h"

using namespace kxmx;
using namespace daisy;
using namespace daisysp;

Bluemchen bluemchen;

Parameter knob1;
Parameter knob2;
Parameter cv1;
Parameter cv2;

void UpdateOled()
{
    bluemchen.display.Fill(false);

    bluemchen.display.SetCursor(0, 0);
    std::string str = "Hello!";
    char *cstr = &str[0];
    bluemchen.display.WriteString(cstr, Font_6x8, true);

    bluemchen.display.Update();
}

void UpdateControls()
{
    bluemchen.ProcessAllControls();

    knob1.Process();
    knob2.Process();

    cv1.Process();
    cv2.Process();
}

void AudioCallback(AudioHandle::InputBuffer in, AudioHandle::OutputBuffer out, size_t size)
{
    UpdateControls();


    for (size_t i = 0; i < size; i++)
    {
        out[0][i] = in[0][i];
        out[1][i] = in[1][i];
    }
}

int main(void)
{
    float sample_rate;
    bluemchen.Init();
    bluemchen.SetAudioBlockSize(4);
    sample_rate = bluemchen.AudioSampleRate();
    bluemchen.StartAdc();

    knob1.Init(bluemchen.controls[bluemchen.CTRL_1], 0.001f, 0.1f, Parameter::LINEAR);
    knob2.Init(bluemchen.controls[bluemchen.CTRL_2], 0.001f, 0.5f, Parameter::LINEAR);

    cv1.Init(bluemchen.controls[bluemchen.CTRL_3], -5000.0f, 5000.0f, Parameter::LINEAR);
    cv2.Init(bluemchen.controls[bluemchen.CTRL_4], -5000.0f, 5000.0f, Parameter::LINEAR);

    bluemchen.StartAudio(AudioCallback);

    while (1)
    {
        UpdateControls();
        UpdateOled();
    }
}
