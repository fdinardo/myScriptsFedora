#!/bin/bash -       
#title           :mkscript.sh
#description     :This script will make a header for a bash script.
#author		       :bgw + francdin@gmail.com
#date            :20141013
#version         :0.5    
#usage		       :bash mkscript.sh
#notes           :Install Vim and gedit to use this script.
#bash_version    :4.1.5(1)-release
#==============================================================================

script_name="$(basename $0)"
today=$(date +%Y%m%d)
div=======================================

# Options description
USAGE=$(printf "$script_name [--option value].\n%-22s" "See --help.")

# TODO
# Show example, how to use this scritp
_show_example(){
  printf "%s\n\
  %-22s%-11s\n\
  %-22s%-11s\n\
  %-22s%-11s\n" "EXAMPLE:" \
  "$script_name -n \"file_name\"" ": Create a file with name passad as parameter" \
  "$script_name -e \"extension\"" ": Create a file with extension passed as paramater"

}

# Show the help message
_show_help(){
  printf "\n%s\n\n\
  %-22s%-11s\n\
  %-22s%-11s\n\
  \n%s\n\
  %-22s\n\
  \n%s" "This script will make the file in filesystem and the header for a script." \
  "-n, --name" ":The name of the new file" \
  "-e, --extension" ":The file extension (sh, c etc...)" \
  "USAGE:" "$USAGE"
  _show_example
}

# Options checker
getopt_results=`getopt -s bash -o n:e:h:: --long name:,extension:,"help":: -- "$@"`

if test $? != 0; then
  printf "\n%s\n%s\n\n" "Unrecognized Option" "$USAGE"
  exit 1
fi

eval set -- "$getopt_results"
while true
do
  case "$1" in 
    --name | -n)
        title="$2";
        shift 2;
        ;;
    --extension | -e)
        ext=$2;
        shift 2;
        ;;
    --help | -h)
        shift
        _show_help
        exit 0
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "$0: unparseable option $1"
        exit 1
        ;;
  esac
done

/usr/bin/clear
echo $title is the file name passed.

_select_title(){

    if [[ -z "$title" ]]; then
      # Get the user input.
      printf "Enter a title: " ; read -r title;
    fi

    # Remove the spaces from the title if necessary.
    title=${title// /_}

    # Convert uppercase to lowercase.
    title=${title,,}

    # Add .sh to the end of the title if it is not there already 
    # and only if you want.
    if [ -z "$ext" ]; then
      if [ "${title: -3}" != '.sh' ]; then
    	  printf "Do you want add the .sh extension?[s/N]" ; read -r ans
    	  if [ "$ans" == "s" ] || [ "$ans" == "S" ]; then
    		  title=${title}.sh
    	  fi
      fi
    fi

    # Check to see if the file exists already.
    if [ -e $title ] ; then 
        printf "\n%s\n%s\n\n" "The script \"$title\" already exists." \
        "Please select another title."
        _select_title
    fi

}

_select_title

printf "Enter a description: " ; read -r dscrpt
printf "Enter your name: " ; read -r name
printf "Enter the version number: " ; read -r vnum

# Format the output and write it to a file.
printf "%-16s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%s\n\n\n" '#!/bin/bash -' '#title' ":$title" '#description' \
":${dscrpt}" '#author' ":$name" '#date' ":$today" '#version' \
":$vnum" '#usage' ":./$title" '#notes' ':' '#bash_version' \
":${BASH_VERSION}" \#$div${div} > $title

# Make the file executable.
chmod +x $title

/usr/bin/clear

_select_editor(){

    # Select between Vim or Emacs.
    printf "%s\n%s\n%s\n%s" "Select an editor." "1] Vim." "2] Gedit." "> "
    read -r editor

    # Open the file with the cursor on the twelth line.
    case $editor in
        1) vim +12 $title
            ;;
        2) gedit +12 $title &
            ;;
        *) /usr/bin/clear
           printf "%s\n%s\n\n" "I did not understand your selection." \
               "Press <Ctrl-c> to quit."
           _select_editor
            ;;
    esac

}

_select_editor

