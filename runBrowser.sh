#!/bin/sh
# ____                                  
#| __ ) _ __ _____      _____  ___ _ __ 
#|  _ \| '__/ _ \ \ /\ / / __|/ _ \ '__|
#| |_) | | | (_) \ V  V /\__ \  __/ |   
#|____/|_|  \___/ \_/\_/ |___/\___|_|   
#
#Surfs the internet for a given text/ Query using the default search engine or
#directly opens a provided URL. 
#To directly add Bookmarks, Just add the URLs below.
#
#Dependencies -> dmenu.

options="--new-window"
#url=$(dmenu -i -p "Which URL to Follow?" <&-)
url=$(echo -e "DevDocs\nGitHub\nGoogle\nMangaPark\nReddit\nRegExr\nYouTube" | dmenu -i -l 5 -p "Which URL to Follow?")

case ${url} in
	"DevDocs") url='https://devdocs.io'
		;;
	"GitHub") url='https://github.com/login'
		;;
	"Google") url='https://google.com'
		;;
	"MangaPark") url='https://mangapark.net'
		;;
	"Reddit") url='https://reddit.com/login'
		;;
	"RegExr") url='https://regexr.com'
		;;
	"Twitter") url='https://twitter.com/login'
		;;
	"YouTube") url='https://youtube.com/signin'
		;;
esac

if [ -n "$url" ]
then
	[ ! $(echo $url | grep -E '\.com|\.org|\.net|\.in|\.io') > /dev/null ] && url=$(echo "https://duckduckgo.com/?q=${url}" | sed 's/ /+/g')
	[ ! $(echo $url | grep -E 'https') > /dev/null ] && url=$(echo "https://${url}" | sed 's/ //g')
	$BROWSER ${options} ${url} && exit 0
fi