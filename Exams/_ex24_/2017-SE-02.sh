 SRC, DST (empty), АBC.
root => find all files in SRC with substring АBC in name => move to DST (/SRC/../../.. => /DST/../../..)
Пример:
• в SRC (/src) има следните файлове:
/src/foof.txt
/src/1/bar.txt
/src/1/foo.txt
/src/2/1/foobar.txt
/src/2/3/barf.txt
• DST (/dst) е празна директория
• зададения низ е foo
Резултат:
• в SRC има следните файлове:
/src/1/bar.txt
/src/2/3/barf.txt
• в DST има следните файлове:
/dst/foof.txt
/dst/1/foo.txt
/dst/2/1/foobar.txt






/src/2/3/barf.txt

                      #2/3/barf.txt            #3/2       
dirs="$3/$(echo $line | cut -d '/' -f 3- | rev | cut -d '/' -f 2- | rev)" #2/3
name=$(echo $line | cut -d '/' -f 3-) #path

mkdir -p "$dirs"
cd dirs
touch "$2\/$name"
























if [ $(id -user) -ne 0 ]; then
  exit 1
fi

#proverki

find $1 -type -f | grep "$2" >> file

cat file | while read line; do  #/src/foof.txt
    dirpath="\/$2"
    for i in $line; do
      if [ $i = $2 ]; then
        continue
      else
        
      fi
    done
done

  
