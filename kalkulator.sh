#!/bin/bash
#====================================================================
# name          : kalkulator.sh
# Version       : 1.1
# description   : Kalkulator prostych operacji napisany w bashu
# Written by    : Asia
#====================================================================

#ustawia podstawowe zmienne
INIT()
{
VER="1.1"
USE1="#kalkulator.sh : Version $VER "
USE2=" "

#wzorce
regex_dodatnie='^[0-9]+([.][0-9]+)?$'
regex_ujemne='^-[0-9]+([.][0-9]+)?$'
regex_ujemne_i_dodatnie='^[+-]?[0-9]+([.][0-9]+)?$'
}

#pobiera parametry
GET_PARAMETERS()
{

while [ $# -ne 0 ]
do
 case $1 in
      ?|help) echo $USE1; echo $USE2; exit ;;
 esac
 shift
done

}

MENU()
{
  clear
  echo "Jaką operację chcesz wykonać?"
  echo " "
  echo "1. Dodawanie"
  echo "2. Odejmowanie"
  echo "3. Mnożenie"
  echo "4. Dzielenie"
  echo " "
  echo "9. Wyjście"
  echo " "

  read -p "Twój wybór: " choice

  while [ true ]
  do
   case $choice in
     1) DODAJ ; MENU; break; ;;
     2) ODEJMIJ ; MENU; break; ;;
     3) POMNOZ ; MENU; break; ;;
     4) PODZIEL ; MENU; break; ;;
     9) exit ;;
     *) MENU ;;
   esac
   shift
  done

}

DODAJ()
{
  clear
  echo " "
  echo "OPERACJA DODAWANIA"
  echo " "
  read -p "Podaj pierwszą liczbę: " skladowa1
  while ! [[ $skladowa1 =~ $regex_ujemne_i_dodatnie ]] ; do
    echo "Nieprawidłowa składowa."
    read -p "Podaj pierwszą liczbę: " skladowa1
  done

  read -p "Podaj drugą liczbę: " skladowa2
  while ! [[ $skladowa2 =~ $regex_ujemne_i_dodatnie ]] ; do
    echo "Nieprawidłowa składowa."
    read -p "Podaj drugą liczbę: " skladowa2
  done

  echo " "
  echo "Wykonywanie działania: $skladowa1 + $skladowa2"
  suma="$skladowa1 + $skladowa2"
  echo "Wynik: `bc <<< $suma`"
  echo " "
  read -p "Naciśnij enter aby kontynuować"
}

ODEJMIJ()
{
  clear
  echo " "
  echo "OPERACJA ODEJMOWANIA"
  echo " "
  read -p "Podaj pierwszą liczbę: " skladowa1
  while ! [[ $skladowa1 =~ $regex_ujemne_i_dodatnie ]] ; do
    echo "Nieprawidłowa składowa."
    read -p "Podaj pierwszą liczbę: " skladowa1
  done

  read -p "Podaj drugą liczbę: " skladowa2
  while ! [[ $skladowa2 =~ $regex_ujemne_i_dodatnie ]] ; do
    echo "Nieprawidłowa składowa."
    read -p "Podaj drugą liczbę: " skladowa2
  done

  echo " "
  echo "Wykonywanie działania: $skladowa1 - $skladowa2"
  suma="$skladowa1 - $skladowa2"
  echo "Wynik: `bc <<< $suma`"
  echo " "
  read -p "Naciśnij enter aby kontynuować"
}

POMNOZ()
{
  clear
  echo " "
  echo "OPERACJA MNOŻENIA"
  echo " "
  read -p "Podaj pierwszą liczbę: " skladowa1
  while ! [[ $skladowa1 =~ $regex_ujemne_i_dodatnie ]] ; do
    echo "Nieprawidłowa składowa."
    read -p "Podaj pierwszą liczbę: " skladowa1
  done

  read -p "Podaj drugą liczbę: " skladowa2
  while ! [[ $skladowa2 =~ $regex_ujemne_i_dodatnie ]] ; do
    echo "Nieprawidłowa składowa."
    read -p "Podaj drugą liczbę: " skladowa2
  done

  echo " "
  echo "Wykonywanie działania: $skladowa1 x $skladowa2"
  suma="$skladowa1 * $skladowa2"
  echo "Wynik: `bc <<< $suma`"
  echo " "
  read -p "Naciśnij enter aby kontynuować"
}

PODZIEL()
{
  clear
  echo " "
  echo "OPERACJA DZIELENIA"
  echo " "
  read -p "Podaj pierwszą liczbę: " skladowa1
  while ! [[ $skladowa1 =~ $regex_ujemne_i_dodatnie ]] ; do
    echo "Nieprawidłowa składowa."
    read -p "Podaj pierwszą liczbę: " skladowa1
  done

  read -p "Podaj drugą liczbę: " skladowa2
  while ! [[ $skladowa2 =~ $regex_ujemne_i_dodatnie ]] || [ $skladowa2 -eq 0 ] ; do
    echo "Nieprawidłowa składowa."
    read -p "Podaj drugą liczbę: " skladowa2
  done

  echo " "
  echo "Wykonywanie działania: $skladowa1 / $skladowa2"
  suma="$skladowa1 / $skladowa2"
  echo "Wynik: `bc <<< $suma`"
  echo " "
  read -p "Naciśnij enter aby kontynuować"
}

#MAIN - tutaj zaczyna się wykonywać skrypt
INIT                #wywołanie funkcji INIT
GET_PARAMETERS $*   #Wywołanie funkcji GET_PARAMETERS i przekazanie do niej wszystkich parametrów
                    #z jakimi został uruchomiony skrypt.sh
MENU      #Wykonaj nasze zadanie...
