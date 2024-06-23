repeat(50) log("and so it begins");

var songdata = [];
var files = [];
//var packfolder = "Stepmania 5";
var packfolder = "handtest";
var thefold = "";
var ogpath = "C:/Games/Stepmania 5.1/Songs/"+packfolder;
thefold = file_find_first(ogpath+"/*", fa_directory);
var thepath = ogpath+"/"+thefold;
log(thefold);
var themus, thesm, thedata;
while thefold != "" {
	if !array_contains(files, thefold) {
		file_find_close();
		array_push(files, thefold);
		themus = file_find_first(thepath+"/*.ogg", fa_none);
		file_find_close();
		thesm = file_find_first(thepath+"/*.ssc", fa_none);
		file_find_close();
		if thesm = "" {
			thesm = file_find_first(thepath+"/*.sm", fa_none);
			file_find_close();
		}
		log(thepath+"/"+thesm);
		thedata = sm_data(thepath+"/"+thesm);
		var nong = new song(thedata.TITLE, u, audio_create_stream(thepath+"/"+themus), thedata.BPMS, u, u, u, thepath+"/"+thesm, u, u, thedata.OFFSET*.75 sec);
		array_push(songdata, nong);
		thefold = file_find_first(ogpath+"/*", fa_directory);
	}
	thefold = file_find_next();
	thepath = ogpath+"/"+thefold;
	log(thefold);
}
file_find_close();


dancing = false;
count = 0;
iterations = 0;
musicdata = songdata;
patterns = [
	
];
lerper = 0;
ptnliteral = 0;
ptnpos = 0;
linelerp = 0;
scroll = 0;

