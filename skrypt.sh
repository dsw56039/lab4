#!/bin/bash

case $1 in
  --date)
    date
    ;;
  --logs)
    count=${2:-100}
    for i in $(seq 1 $count); do
      filename="log${i}.txt"
      echo "Nazwa pliku: $filename" > $filename
      echo "Utworzony przez: skrypt.sh" >> $filename
      echo "Data: $(date)" >> $filename
    done
    ;;
  --help)
    echo "Dostępne opcje:"
    echo "--date          - wyświetla datę"
    echo "--logs [n]      - tworzy n plików log (domyślnie 100)"
    echo "--help          - wyświetla tę pomoc"
    ;;
  *)
    echo "Nieznana opcja. Użyj --help"
    ;;
esac
