mkdir out

path >out\dir-all.txt

dir c:\                       /a/ogn >>out\dir-all.txt
dir "c:\Program Files"        /a/ogn >>out\dir-all.txt
dir "c:\Program Files (x86)"  /a/ogn >>out\dir-all.txt

c:
cd \
dir ninja.exe /o/sb >out\dir-ninja.txt