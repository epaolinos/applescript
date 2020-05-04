repeat 6 times
	update()
	delay 360
end repeat

on update()
	tell application "Google Chrome"
		set theWindow to (make new window)
		tell theWindow
			set activeTab to active tab
			set activeTab's URL to "https://hh.ru/applicant/resumes?from=header_new"
			tell activeTab
				execute javascript "document.getElementsByClassName('bloko-button_primary-dimmed')[0].click()"
				execute javascript "document.getElementsByClassName('bloko-button_primary-dimmed')[1].click()"
			end tell
		end tell
		close theWindow
	end tell
end update
