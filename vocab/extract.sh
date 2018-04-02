#!/bin/bash

for i in {1..5}
do
  wget -O orig$i https://www.russianpod101.com/russian-word-lists/?page=$i

  cat orig$i | grep js-wlv-english | cut -d'>' -f2 | cut -d'<' -f1 > eng$i
  cat orig$i | grep "js-wlv-word\" lang=\"ru\"" | cut -d'>' -f2 | cut -d'<' -f1 > ru$i

  paste -d" " ru$i eng$i > final$i
  rm -rf orig$i eng$i ru$i
done
