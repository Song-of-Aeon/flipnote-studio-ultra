function msglang(english=[], japanese=[], russian=[], indonesian=[], french=[], vietnamese=[], bread=[]) {
	return array_insert_array_parse(argument[global.lang]);
	/*switch language {
		case LANGUAGE.ENGLISH:
			return array_insert_array_parse(english);
			break;
		case LANGUAGE.JAPANESE:
			return array_insert_array_parse(japanese);
			break;
		default:
			return [txt()];
			break;
	}*/
}


enum LANGUAGE {
	ENGLISH,
	JAPANESE,
	RUSSIAN,
	INDONESIAN,
	FRENCH,
	VIETNAMESE,
	//ARABIC,
	BREAD,
	SILENT,
}