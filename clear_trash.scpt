tell application "Finder"
	-- we iterate files and sum their sizes without using 'size of trash' because
	-- it works really inconsistently 
	set trashSize to 0
	set fileList to every item of trash
	repeat with theFile in fileList
		set trashSize to trashSize + (get size of theFile)
	end repeat
	
	-- trashSize processing and dialog with user
	if trashSize = 0 then
		display dialog ("The Trash is completely empty now. See you later") buttons "See you" default button "See you"
		return
	else if trashSize > 1000 ^ 3 then
		set trashSize to (round (trashSize / (1000 ^ 3) * 100)) / 100
		set metric to " GB"
	else if trashSize > 1000 ^ 2 then
		set trashSize to (round (trashSize / (1000 ^ 2) * 100)) / 100
		set metric to " MB"trashSize
	else if trashSize > 1000 then
		set trashSize to (round (trashSize / (1000) * 100)) / 100
		set metric to " KB"
	else
		set metric to " B"
	end if
	display dialog ("The size of Trash is " & trashSize & metric & ". Wanna empty?") buttons {"Nope", "Yep!"} default button "Yep!"
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
