#/bin/bash

fixsizes()
{
  awk '/Hint/{a[$3]=$NF} !/Hint/{for (i in a) gsub(i,a[i])}1' $1 >_$1
  mv _$1 $1
}

remove_cb()
{
  awk '{gsub(/_CB/,""); print}' $1 > _$1
  mv _$1 $1
}

remove_params_global_bq()
{
  echo $1  
  awk '{gsub(/PARAMS_GLOBAL_B/,"PARAMS_GLOBAL"); print}' $1 > _$1
  mv _$1 $1
}

add_params_sensitivity()
{
  awk '/PARAMS_GLOBAL/ {print; print "      USE PARAMS_SENSITIVITY"; next} !/PARAMS_SENSITIVITY/{print}' $1 > _$1
  mv _$1 $1
}

for i in `ls *_bq.f90`; do 
  echo $i
  fixsizes $i
  remove_cb $i
  remove_params_global_bq $i
done

rm -f *_cb.f90 *~
rm -f params_global_bq.f90

