#!/bin/bash

case $1 in
  --date|-d)
    # Wyświetlenie dzisiejszej daty
    date
    ;;

  --logs|-l)
    # Tworzenie plików logx.txt
    count=${2:-100}
    for i in $(seq 1 $count); do
      filename="log${i}.txt"
      echo "Plik: $filename" > "$filename"
      echo "Utworzony przez: skrypt.sh" >> "$filename"
      echo "Data: $(date)" >> "$filename"
    done
    ;;

  --error|-e)
    # Tworzenie plików errorx/errorX.txt
    count=${2:-100}
    mkdir -p errorx
    for i in $(seq 1 $count); do
      filename="errorx/error${i}.txt"
      echo "Plik: $filename" > "$filename"
      echo "Utworzony przez: skrypt.sh" >> "$filename"
      echo "Data: $(date)" >> "$filename"
    done
    ;;

  --init)
    # Klonowanie repozytorium i dodanie ścieżki do PATH
    repo_url="https://github.com/dsw56039/lab4.git"  
    dest_dir="$(pwd)/repo_clone"
    git clone "$repo_url" "$dest_dir"
    export PATH="$dest_dir:$PATH"
    echo "Repozytorium sklonowane do $dest_dir i dodane do PATH"
    ;;

  --help|-h)
    # Wyświetlenie dostępnych opcji
    echo "Dostępne opcje:"
    echo "--date / -d         - wyświetla dzisiejszą datę"
    echo "--logs / -l [n]     - tworzy n plików log (domyślnie 100)"
    echo "--error / -e [n]    - tworzy n plików błędów w katalogu errorx/ (domyślnie 100)"
    echo "--init              - klonuje repozytorium i dodaje do PATH"
    echo "--help / -h         - wyświetla tę pomoc"
    ;;

  *)
    echo "Nieznana opcja: $1"
    echo "Użyj --help lub -h aby zobaczyć dostępne opcje."
    ;;
esac

