function word(str, wordnumber=0, terminateapostrophe=false) {
	var i;
	var myword = "";
	var words = 0;
	var terminators = global.terminators;
	if terminateapostrophe array_push(terminators, "'");

	for (i=1; i<=string_length(str); i++) {
		if array_contains(terminators, string_char_at(str, i)) {
			if words == wordnumber && myword == "" continue;
		} else if words == wordnumber {
			myword += string_char_at(str, i);
		}
		if array_contains(terminators, string_char_at(str, i)) words++;
	}
	if myword == "" return -1 else return myword;
}
global.terminators = [" ", "-", ".", ",", "\"", "\\", "|", "/", "*", "!", "?", "(", ")", "[", "]", "{", "}", "`", "<", ">", ";", ":", "+", "=", "#"];

function wordcount(str) {
	var amount = 0;
	while word(str, amount) != -1 {
		amount++;
	}
	return amount;
}

function textbox_wordcount(msgscript) {
	var amount = 0;
	//with {} {
		style = "funky";
		msgscript();
		iterate msg to {
			amount += wordcount(msg[i]);
			//log(amount);
		}
	//}
}

log("WORDCOUNTING");
log(wordcount("burger"));
log("DONE WORDCOUNTING");

function wordcount_full() {
	var dialogue = [
		txt_memorandum,
		//txt_iwantyou, "tsuki he", [], u, global.textstyles.memo2, s_black, true),
		txt_supersecretprologue,
		txt_supersecretprologuetwo,
	
		txt_reimuprologuetwo,
		txt_reimuyaunn,
		txt_reimuyaunnafter,
		txt_reimuyreisen,
		txt_reimuyreisenafter,
		txt_reimuydoremy,
		txt_reimuydoremyafter,

		//txt_gensokyo, "", []),

		txt_sumirekoprologue,
		txt_sumirekoyaunn,
		txt_sumirekoyaunnafter,
		txt_sumirekoyreisen,
		txt_sumirekoyreisenafter,
		txt_sumirekoydoremy,
		txt_sumirekoydoremyafter,

		//txt_sumireview, "", []),

		txt_chiyuriprologuetwo,
		txt_chiyuriyaunn,
		txt_chiyuriyaunnafter,
		txt_chiyuriyreisen,
		txt_chiyuriyreisenafter,
		txt_chiyuriydoremy,
		txt_chiyuriydoremyafter,

		//txt_resets, "", []),

		txt_reimufail1,
		txt_reimufailaunn,
		txt_reimufail2,
		txt_reimufailreisen,
		txt_reimufail3,
		txt_reimufaildoremy,

		//txt_, "", []),

		txt_sumirekofail1,
		txt_sumirekofailaunn,
		txt_sumirekofail2,
		txt_sumirekofailreisen,
		txt_sumirekofail3,
		txt_sumirekofaildoremy,

		//txt_, "", []),

		txt_chiyurifail1,
		txt_chiyurifailaunn,
		txt_chiyurifail2,
		txt_chiyurifailreisen,
		txt_chiyurifail3,
		txt_chiyurifaildoremy,

		//txt_demoend, "", []),
		txt_demotalk,
		
		txt_reimuymike1,
		txt_reimuymike2,
		txt_reimuymike3,
		txt_chiyuriymike1,
		txt_chiyuriymike2,
		txt_chiyuriymike3,
		txt_sumirekoymike1,
		txt_sumirekoymike2,
		txt_sumirekoymike3,
		
		txt_miketutorialshooting,
		txt_miketutorialbombs,
		txt_miketutorialsidearms,
		txt_miketutorialhp,
		txt_miketutorialpreshop,
		txt_miketutorialshop,
		txt_miketutorialsell,
		txt_miketutorialbuy,
		txt_miketutorialboss,
		txt_miketutorialend,
	];
	var music = [
		mus.title,
		mus.cutscene,
		mus.forest,
		mus.aunn,
		mus.mountains,
		mus.reisen,
		mus.space,
		mus.doremy,
	];
	var profiles = global.profiles;
	
	var amount = 0;
	
	var i
	for (i=0; i<array_length(dialogue); i++) {
		//amount += textbox_wordcount(dialogue[i]);
		//log(amount);
		log(script_get_name(dialogue[i]));
		c_txtsave(dialogue[i], "shitto2.txt");
		
	}
	log(amount);
	iterate music to {
		amount += wordcount(music[i].description);
	}
	log(amount);
	iterate profiles to {
		log(amount);
		if profiles[i] == 0 || get_value(profiles[i], "description") == undefined continue;
		amount += wordcount(profiles[i].description);
	}
}