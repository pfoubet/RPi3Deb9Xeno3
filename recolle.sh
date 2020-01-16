#! /bin/sh

SOURCE=RPi3Deb9Xeno3.0.8.img
PRE=RPi3D9Xeno3

[ -e $SOURCE ] && rm -f $SOURCE
touch $SOURCE
for A in a b c d e f g h i j k l m n o p q r s t u v w x y z ; do
for B in a b c d e f g h i j k l m n o p q r s t u v w x y z ; do
for C in a b c d e f g h i j k l m n o p q r s t u v w x y z ; do
  f=$A/$PRE$A$B$C
  [ ! -e $f ] && break 3
  cat $f >> $SOURCE
done
done
done

md5sum $SOURCE > test.md5
cmp test.md5 verif.md5
if [ $? -ne 0 ] ; then
   echo "ERREUR dans la verification !!"
   echo "Refaire la commande git clone !"
else
   echo "Vous pouvez utiliser $SOURCE !"
   rm -f test.md5
   echo "Pour liberer de la place disque vous pouvez faire :\nrm -Rf ?"
fi
