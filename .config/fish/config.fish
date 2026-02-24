set  PATH /usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/X11R6/bin:$HOME/bin:/snap/bin/
set  LSCOLORS ExGxFxdxCxDxDxhbadExEx
#env XDG_RUNTIME_PATH=$HOME/.tmp fish
#set LSCOLORS gxfxbEaEBxxEhEhBaDaC

test (hostname)  = "cerebro" && alias ls 'ls --color'
test (hostname)  = "shaolin.kollross.net" && alias ls 'ls -G $argv'
test (hostname)  = "puffy.kollross.net" && alias ls 'colorls -G'



##### Functions
function r
        tmux attach -d
end
function cls
	 clear
end
function ll
	 ls -al
end
function lr
        ls -altr
end
function h
	 ssh kollross@shaolin.kollross.net
end
function shred
	 shred -vuz
end
function jig
	 ssh jig.ncsa.illinois.edu
end
function j
	 ssh -4 sg1.ncsa.illinois.edu
end
function jj
	 ssh sg2.ncsa.illinois.edu
end
function dl
	 cd ~/Desktop/.Shared/Downloads
end
function ff
	freeze firefox
end
function uf 
	unfreeze firefox
end

