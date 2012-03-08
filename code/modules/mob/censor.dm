mob/proc/censore_ooc(var/msg)
	msg = lowertext(msg)
	msg = dd_replacetext(msg, ",", " ")
	msg = dd_replacetext(msg, ":", " ")
	msg = dd_replacetext(msg, ".", " ")
	msg = dd_replacetext(msg, "!", " ")
	msg = dd_replacetext(msg, "?", " ")
	var/list/text = dd_text2list(msg," ")
	for(var/word in text)
		if(censore.Find(word))
			var/client/C = src.client
			del(C)
			return 1
	return 0
