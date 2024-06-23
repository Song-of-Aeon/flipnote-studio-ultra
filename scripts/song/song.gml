function song(name_=["among us trap remix"], shortname="autr", audio_=m_null, bpm_=100, details_=["by nobody"], ogdetails_=["originally by nobody"], description_=["can you hear it?"], map_="./maps/NOTHING.sm", loopstart=0, loopend=audio_sound_length(audio_), offset_=0) constructor {
	name = name_;
	audio = audio_;
	bpm = bpm_;
	details = details_;
	ogdetails = ogdetails_;
	description = description_;
	map = map_;
	loopStart = loopstart;
	loopEnd = loopend;
	offset = offset_;
	variable_struct_set(global.tracklist, shortname, self);
}