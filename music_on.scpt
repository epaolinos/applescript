my openList(my chooseList())
my collapseWindow()

on chooseList()
	set choice to display dialog "What are you going to listen?

1 — Favourites
2 — Home
3 — Newsboys
4 — Imagine Dragons
5 — Skillets
6 — Taizé
7 — Romeo & Juliet" default answer "1"
	set playList to (text returned of choice) as integer
	if (playList = 1) then
		return "https://music.yandex.ru/users/paulin2/playlists/3"
	else if (playList = 2) then
		return "https://music.yandex.ru/users/paulin2/playlists/1006"
	else if (playList = 3) then
		return "https://music.yandex.ru/users/paulin2/playlists/1005"
	else if (playList = 4) then
		return "https://music.yandex.ru/users/paulin2/playlists/1004"
	else if (playList = 5) then
		return "https://music.yandex.ru/users/paulin2/playlists/1000"
	else if (playList = 6) then
		return "https://music.yandex.ru/users/paulin2/playlists/1003"
	else if (playList = 7) then
		return "https://music.yandex.ru/album/1772514"
	end if
end chooseList

on openList(chosenList)
	tell application "Google Chrome"
		set theWindow to (make new window)
		tell theWindow
			set activeTab to active tab
			set activeTab's URL to chosenList
			delay 10
			tell activeTab
				execute javascript "document.getElementsByClassName('button2_rounded')[0].click()"
			end tell
		end tell
	end tell
end openList

on collapseWindow()
	tell application "System Events"
		keystroke "m" using command down
	end tell
end collapseWindow
