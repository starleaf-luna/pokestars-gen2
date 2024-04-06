Music_PokeMart:
	channel_count 4
	channel 1, Music_PokeMart_Ch1
	channel 2, Music_PokeMart_Ch2
	channel 3, Music_PokeMart_Ch3
	channel 4, Music_PokeMart_Ch4

Music_PokeMart_Ch1:
	tempo 256
	volume 7, 7
	note_type 12, 15, 8
	octave 4
	note C_, 1
	rest 1
	note C_, 2
	note C_, 1
	note C_, 1
	rest 1
	octave 3
	note B_, 1
	rest 3
	octave 4
	note F_, 5
	octave 3
.mainLoop:
	octave 3
	note D#, 1
	note G_, 1
	note A_, 1
	note B_, 2
	octave 4
	note C#, 1
	octave 3
	note A_, 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D_, 2
	note C#, 1
	note D_, 1
	note E_, 1
	octave 3
	note B_, 2
	octave 4
	note C#, 1
	octave 3
	note A_, 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note F#, 3
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 2
	note D_, 1
	octave 3
	note B_, 6
	note F#, 2
	note G#, 2
	note A_, 2
	octave 4
	note C#, 3
	note_type 6, 15, 8
	note D_, 1
	note C#, 1
	note_type 12, 15, 8
	octave 3
	note B_, 3
	note_type 6, 15, 8
	note G#, 1
	note A#, 1
	note_type 12, 15, 8
	note B_, 3
	octave 4
	rest 1
	note B_, 1
	note F#, 1
	note D#, 1
	octave 3
	note G#, 1
	note B_, 2
	octave 4
	note C#, 1
	octave 3
	note A_, 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D_, 2
	note C#, 1
	note D_, 1
	note E_, 1
	octave 3
	note B_, 2
	octave 4
	note C#, 1
	octave 3
	note A_, 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note F#, 3
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 2
	note D_, 1
	octave 3
	note B_, 6
	note F#, 2
	note G#, 2
	note A_, 2
	octave 4
	note C#, 3
	note_type 6, 15, 8
	note D_, 1
	note C#, 1
	note_type 12, 15, 8
	octave 3
	note B_, 3
	note_type 6, 15, 8
	note G#, 1
	note A#, 1
	note_type 12, 15, 8
	note B_, 3
	rest 1
	note_type 6, 15, 8
	note A#, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note_type 12, 15, 8
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note D#, 1
	note D_, 1
	note D#, 1
	note A#, 3
	note G_, 2
	note E_, 2
	note D_, 2
	note D_, 2
	note E_, 1
	note C_, 2
	note D_, 2
	note E_, 1
	note C_, 2
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note D#, 1
	note D_, 1
	note D#, 1
	note A#, 3
	note G_, 2
	note A_, 2
	note B_, 2
	note B_, 2
	octave 5
	note C_, 1
	octave 4
	note A_, 2
	note B_, 2
	octave 5
	note C_, 1
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note C_, 1
	octave 4
	note A#, 1
	note G#, 1
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	note B_, 1
	rest 1
	octave 5
	note C_, 1
	rest 1
	octave 4
	note A_, 1
	note B_, 1
	rest 1
	octave 5
	note C_, 1
	rest 1
	octave 4
	note A_, 1
	note B_, 1
	rest 1
	octave 5
	note C_, 1
	rest 1
	note D_, 1
	rest 16
	rest 16
	rest 9
	octave 3
	sound_loop 0, .mainLoop

Music_PokeMart_Ch2:
	note_type 12, 15, 8
	octave 4
	note F_, 1
	rest 1
	note F_, 2
	note E_, 2
	rest 1
	note D#, 1
	rest 3
	note C_, 5
	octave 8
.mainLoop:
	rest 16
	rest 16
	rest 5
	octave 5
	sound_call .sub1
	rest 16
	rest 16
	rest 7
	octave 5
	sound_call .sub1
	note_type 12, 15, 8
	octave 8
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 8
	sound_loop 0, .mainLoop

.sub1:
	octave 6
	note D_, 1
	note D_, 1
	note D_, 1
	note_type 6, 15, 8
	note C#, 1
	octave 5
	note B_, 1
	note_type 12, 15, 8
	note G#, 3
	note B_, 2
	note G#, 2
	note B_, 3
	octave 6
	note_type 6, 15, 8
	note C_, 1
	octave 5
	note B_, 1
	note_type 12, 15, 8
	note A_, 3
	note_type 6, 15, 8
	note F#, 1
	note G#, 1
	note_type 12, 15, 8
	note A_, 3
	octave 4
	sound_ret

Music_PokeMart_Ch3:
	note_type 12, 1, 0
	rest 16
.mainLoop:
	volume_envelope 1, 4
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	octave 8
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	note_type 12, 1, 4
	rest 16
	sound_loop 0, .mainLoop

Music_PokeMart_Ch4:
	toggle_noise 0
	drum_speed 12
	rest 16
.mainLoop:
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
	rest 16
	rest 16
	drum_speed 12
	rest 16
	sound_loop 0, .mainLoop
