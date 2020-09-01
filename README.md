# Elementary Music Synthesis
This project investigated one possible method in which music can be synthesized. After the music had been synthesized, various ways of improving the sound quality were investigated, which involved creating an ADSR (attack, decay, sustain, release) envelope and overlapping the musical notes.

I would like to give credit to UW Bothell professor Dr. Tadesse Ghirmai for providing the specifications for this project.

# Background
Each musical note is a sinusoidal signal with its frequency depending on the pitch of the note.

In the case of this project, I only dealt with the octave of 220 Hz to 440 Hz, as shown in the table below.
![Frequency table](https://github.com/leeway64/Elementary-Music-Synthesis/blob/master/Frequency%20table.jpg)


# Music synthesis
The MATLAB function music_note.m creates a sinusoidal signal with a frequency and count (duration) based on the user's input. However, there are several improvements that can be made to make the musical note sound better.

## Improvements to sound quality
### ADSR (attack, decay, sustain, release) envelope
Normally, when a note is played in reality, there are variations in volume in the note. These variations are split into 4 sections: attack, decay, sustain, release, as shown in the figure below.

![ADSR envelope](https://github.com/leeway64/Elementary-Music-Synthesis/blob/master/ADSR%20envelope.jpg)

The music_note.m function can apply such an ADSR envelope to the sinuosoidal signal.


### Overlapping musical notes
Another way to improvement sound quality is by slightly overlapping each musical note in time
