#!/bin/sh
curl -s "https://www.target.com/p/mcfarlane-toys-dc-comics-batman-the-ultimate-movie-collection-action-figure-set-6pk/-/A-87846925#lnk=sametab" | grep "CComing" > /dev/null || echo "Batman Movie" | /usr/bin/mail -v -s "Something Changed at Target" kollross@kollross.net
