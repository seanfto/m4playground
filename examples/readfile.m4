dnl readfile: display file named on
dnl command line in -Dfile=
dnl converting () to [] and , to -
dnl
file `file on 'esyscmd(`hostname')
changequote({,})dnl
esyscmd({tr '(),' '[]-' <} file)dnl

That's all.
changequote
