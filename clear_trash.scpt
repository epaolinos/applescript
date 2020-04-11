tell application "Finder"
	set trash_size to 0
	set file_list to every item of trash
	repeat with the_file in file_list
		set trash_size to trash_size + (get size of the_file)
	end repeat
	if trash_size = 0 then
		display dialog ("The Trash is completely empty now. See you later") buttons "See you" default button "See you"
		return
	else if trash_size > 1000 ^ 3 then
		set trash_size to (round (trash_size / (1000 ^ 3) * 100)) / 100
		set metric to " GB"
	else if trash_size > 1000 ^ 2 then
		set trash_size to (round (trash_size / (1000 ^ 2) * 100)) / 100
		set metric to " MB"
	else if trash_size > 1000 then
		set trash_size to (round (trash_size / (1000) * 100)) / 100
		set metric to " KB"
	else
		set metric to " B"
	end if
	display dialog ("The size of Trash is " & trash_size & metric & "
Wanna empty?") buttons {"Nope", "Yep!"} default button "Yep!"
	if result = {button returned:"Yep!"} then
		try
			set warns before emptying of trash to false
			empty trash
			display dialog "Success, see you!" buttons "See you" default button "See you"
		on error
			display dialog "It seems that something went wrong. See you later" buttons "See you" default button "See you"
		end try
	else
		display dialog "Ok, let's collect some more trash before emptying" buttons "See you" default button "See you"
	end if
end tell
