Music_PrimarinumCave:
	channel_count 4
	channel 1, Music_PrimarinumCave_Ch1
	channel 2, Music_PrimarinumCave_Ch2
	channel 3, Music_PrimarinumCave_Ch3
	channel 4, Music_PrimarinumCave_Ch4

Music_PrimarinumCave_Ch1:
	tempo 256
	volume 7, 7
	note_type 12, 15, 8
.mainLoop:
	octave 2
	rest 16
	rest 14
	sound_call .sub1
	rest 16
	rest 12
	note A_, 1
	note A#, 1
	note B_, 1
	octave 2
	note A#, 1
	note B_, 1
	octave 3
	note C_, 1
	note C#, 1
	note C_, 1
	octave 2
	note A_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	octave 3
	note C_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A_, 1
	rest 1
	octave 3
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A_, 1
	rest 1
	octave 3
	note_type 12, 15, 8
	rest 16
	rest 12
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 2
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 10
	sound_loop 0, .mainLoop

.sub1:
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	rest 2
	octave 2
	sound_ret

Music_PrimarinumCave_Ch2:
	note_type 12, 15, 8
.mainLoop:
	octave 1
.loop1:
.loop3:
	rest 2
	volume_envelope 15, 1
	note G_, 2
	rest 3
	note G_, 1
	rest 1
	note G_, 1
	note A#, 3
	rest 2
	octave 1
	sound_loop 11, .loop3
	rest 2
	note G_, 2
	rest 3
	note G_, 1
	rest 1
	note G_, 1
	note A#, 3
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	octave 2
	note C#, 1
	octave 1
	note B_, 1
	note A#, 1
	note_type 12, 15, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 2
	rest 2
	note G_, 2
	rest 3
	note G_, 1
	rest 1
	note G_, 1
	note A#, 3
	rest 4
	note G_, 2
	rest 3
	note G_, 1
	rest 1
	note G_, 1
	note A#, 3
	rest 2
	octave 3
	note C_, 3
	octave 1
	rest 4
	note G_, 1
	rest 1
	note G_, 1
	note A#, 3
	rest 2
	octave 3
	note C_, 3
	octave 1
	rest 3
	note G_, 1
	rest 1
	note G_, 1
	note A#, 3
	rest 16
	rest 16
	rest 1
.loop2:
	sound_loop 0, .mainLoop

Music_PrimarinumCave_Ch3:
	note_type 12, 1, 0
.mainLoop:
	volume_envelope 1, 4
	octave 3
.loop1:
.loop2:
	note C_, 1
	rest 14
	octave 3
	sound_loop 20, .loop2
	note_type 12, 1, 4
	sound_loop 0, .mainLoop

Music_PrimarinumCave_Ch4:
	toggle_noise 0
	drum_speed 12
.mainLoop:
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 12
	sound_loop 0, .mainLoop
