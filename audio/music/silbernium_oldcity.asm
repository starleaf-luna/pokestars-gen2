; MUSIC - Silbernium City (Old Area)
; BASE  - Lavender Town (Generation 1)
; BY    - crystalmoon
; DATE  - 27 jan 2024
; NOTES - this probably sounds horrible

Music_Lavender:
	channel_count 4
	channel 1, Music_Lavender_Ch1
	channel 2, Music_Lavender_Ch2
	channel 3, Music_Lavender_Ch3
	channel 4, Music_Lavender_Ch4

Music_Lavender_Ch1:
	tempo 152
	volume 7, 7
	duty_cycle 1
	vibrato 0, 8, 8
	note_type 12, 8, 7
	rest 16
	rest 16
	octave 8
	rest 16
	rest 16
	note_type 12, 10, 7
.mainloop:
	octave 3
	note G_, 8
	note G_, 8
	note E_, 8
	note E_, 8
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note C_, 8
	note C_, 8
	rest 16
	rest 16
	rest 16
	rest 16
	note G_, 8
	note G_, 8
	note E_, 8
	note E_, 8
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 3
	rest 1
	note C_, 8
	note C_, 8
	note G_, 8
	note G_, 8
	note F#, 8
	note F#, 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note C_, 8
	note C_, 8
	rest 16
	rest 16
	rest 16
	rest 16
	sound_loop 0, .mainloop

Music_Lavender_Ch2:
	vibrato 0, 3, 4
	duty_cycle 3
	note_type 12, 9, 1
.mainloop:
	octave 2
	note_type 12, 9, 1
	volume_envelope 9, 7
	vibrato 0, 0, 4
	duty_cycle 3
	note E_, 2
	rest 1
	note_type 12, 9, 1
	rest 1
	volume_envelope 9, 7
	note A#, 2
	rest 1
	note_type 12, 9, 1
	rest 1
	octave 3
	volume_envelope 9, 7
	note E_, 2
	rest 1
	note_type 12, 9, 1
	rest 1
	octave 2
	volume_envelope 9, 7
	note A#, 2
	rest 1
	note_type 12, 9, 1
	rest 1
	octave 5
	sound_loop 0, .mainloop

Music_Lavender_Ch3:
	vibrato 16, 1, 4
	note_type 12, 3, 5
	rest 16
	rest 16
	rest 16
	rest 16
	note_type 12, 2, 5
.mainloop:
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	octave 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 1
	note C_, 3
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note_type 12, 3, 5
	octave 6
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note_type 12, 2, 5
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 7
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	octave 6
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 7
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note E_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	sound_loop 0, .mainloop

Music_Lavender_Ch4:
	toggle_noise 1
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 16
.mainloop:
	drum_note 7, 8
	drum_note 7, 8
	sound_loop 0, .mainloop
