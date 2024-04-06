Music_Crafting1:
	channel_count 4
	channel 1, Music_Crafting1_Ch1
	channel 2, Music_Crafting1_Ch2
	channel 3, Music_Crafting1_Ch3
	channel 4, Music_Crafting1_Ch4

Music_Crafting1_Ch1:
	tempo 256
	volume 7, 7
	note_type 12, 15, 8
.mainLoop:
	octave 2
.loop1:
	note E_, 1
	rest 1
	octave 3
	note D_, 1
	octave 2
	note A_, 1
	note F_, 1
	rest 1
	octave 3
	note D_, 1
	rest 4
	octave 2
	sound_loop 12, .loop1
	note_type 12, 15, 8
	sound_loop 0, .mainLoop

Music_Crafting1_Ch2:
	note_type 12, 15, 8
.mainLoop:
	octave 3
.loop1:
	note E_, 1
	rest 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note F_, 1
	rest 1
	octave 4
	note D_, 1
	rest 4
	octave 3
	sound_loop 12, .loop1
	note_type 12, 15, 8
	sound_loop 0, .mainLoop

Music_Crafting1_Ch3:
	note_type 12, 1, 0
.mainLoop:
	rest 16
	rest 16
	rest 12
	octave 2
	volume_envelope 1, 5
	note B_, 11
	octave 3
	note C_, 11
	note C#, 11
	note C_, 11
	note D_, 11
	note D#, 11
	note E_, 11
	note D#, 11
	note_type 12, 1, 5
	sound_loop 0, .mainLoop

Music_Crafting1_Ch4:
	toggle_noise 0
	drum_speed 12
.mainLoop:
	octave 1
.loop1:
	drum_note 9, 1
	rest 1
	octave 2
	drum_note 1, 1
	octave 1
	rest 1
	drum_note 9, 1
	rest 1
	octave 2
	drum_note 1, 1
	octave 1
	rest 4
	sound_loop 12, .loop1
	drum_speed 12
	sound_loop 0, .mainLoop
