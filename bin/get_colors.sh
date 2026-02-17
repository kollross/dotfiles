for i in {0..255}; do printf '\e[48;5;%sm%3d \e[0m' "$i" "$i"; if (((i+1) % 16 == 0)); then echo; fi; done
