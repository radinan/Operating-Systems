 #You cannot escape a single quote inside a pair of singe quotes in shell. 
 #Escaping double quotes is allowed though.
 #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 #sed 's/\'//g' NE
 #sed "s/'//g" DA
 
 Напишете shell script, който получава задължителен първи позиционен параметър
– директория и незадължителен втори – име на файл. Скриптът трябва да намира в подадената
директория и нейните под-директории всички symlink-ове и да извежда (при подаден аргумент
файл – добавяйки към файла, а ако не е – на стандартния изход) за тях следната информация:
• ако destination-a съществува – името на symlink-а -> името на destination-а;
• броя на symlink-овете, чийто destination не съществува.
Примерен изход:
lbaz -> /foo/bar/baz
lqux -> ../../../qux
lquux -> /foo/quux
Broken symlinks: 34

$1 - dir
$2 - file

$counter=0;
find $1 -type l | while read line; do #namira vs symlinkove
  $reference=$(stat $line --printf "%N\n" | sed "s/'//g")
  dest=$(echo $reference | awk -F ' -> ' '{print $2}')
  if [ ! -e $dest ]; do
    counter++
  else
     if [ '$2' -ne '' ]; do
        echo "$reference\n" >> $2
     else
        echo "$reference\n"
     done
  done
done

if [ '$2' -ne '' ]; do
  echo "Broken symlinks: $counter\n" >> $2
else
  echo "Broken symlinks: $counter\n"
done

if [dest exists] 
  -> echo 'symlink -> dest'
else
  ->
    counter++;
 
echo "Broken symlinks: $counter"






































