set UID (id -u)

set -g c0 (set_color 005284)
set -g c1 (set_color 0075cd)
set -g c2 (set_color 009eff)
set -g c3 (set_color 6dc7ff)


function fish_prompt
	set_color green
	echo "------------------------------------------------------------"
	set_color 0075cd
        echo -n [(date +%m\/%d\/%y) 
	set_color 009eff
	echo -n " "(date +%T%p)  
	set_color 6dc7ff
	echo -n " "(pwd)] 
	echo 

if [ "$UID" = "0" ]
	set_color green
	echo -n [
	set_color red
	echo -n (whoami)
	set_color white
	echo -n @(hostname|cut -f 1 -d ".")]" # "
else
	set_color cyan
	echo -n [
	set_color 6dc7ff
	echo -n (whoami)
	set_color white
	echo -n @(hostname|cut -f 1 -d ".")
	set_color cyan
	echo -n ]" # "
 end
end
