#!/usr/bin/bash
#  ╭──────────────────────────────────────────────────────────╮
#  │   Block social media for you to focus on more            │
#  │  important tasks.                                        │
#  │   You can put this script in your PATH                   │
#  │  (/usr/bin/block  for example). Don't forget to          │
#  │  change the permissions (sudo chmod 755 /usr/bin/smedia) │
#  ╰──────────────────────────────────────────────────────────╯
#  ╭──────────────────────────────────────────────────────────╮
#  │  To block ALL social media: sudo smedia block            │
#  │  To unblock ALL: sudo smedia unblock                     │
#  ╰──────────────────────────────────────────────────────────╯

# Add here the social media you're addicted to:
social_media=(
	tweetdeck.twitter.com
	twitter.com
	www.twitter.com
	api.twitter.com
	facebook.com
	www.facebook.com
	linkedin.com
	www.linkedin.com
	reddit.com
	www.reddit.com
	api.reddit.com
	www.mail.google.com
	mail.google.com
	twitter.com
	www.twitter.com
	downloadly.ir
	www.downloadly.ir
	pimpmymoney.net
	www.pimpmymoney.net
	pimpmymind.net
	www.pimpmymind.net
	sanet.ws
	www.sanet.ws
	hacksnation.com
	www.hacksnation.com
	nulled.org
	www.nulled.org
	freetutsdownload.com
	www.freetutsdownload.com
	freecoursesites.com
	www.freecoursesites.com
	freecoursesonline.me
	www.freecoursesonline.me
	tut4it.com
	www.tut4it.com
	babiato.co
	www.babiato.co
	www.0daydown.com
	0daydown.com
	courseclub.me
	www.courseclub.me
)

if [[ ! -f /etc/hosts ]]; then
	echo "You don't have the file /etc/hosts."
	exit 0
fi

if [[ ! -w /etc/hosts ]]; then
	echo "You can't write the file /etc/hosts. Try with sudo?"
	exit 0
fi

localhost=127.0.0.1

if [[ $1 == "block" ]]; then
	for i in "${social_media[@]}"; do
		sed -i "/^$localhost $i/d" /etc/hosts
		echo "$localhost $i" >>/etc/hosts
	done
elif [[ $1 == "unblock" ]]; then
	for i in "${social_media[@]}"; do
		sed -i "/^$localhost $i/d" /etc/hosts
	done
else
	echo "Please run this script with 'block' (block all), 'unblock' as argument and feel the intense productivity!"
fi
