#!/usr/bin/env bash

NEWLINE=$'\n'
TABULATOR=$'\t'

HELP_HEADER="This script creates another scripts' skeleton-template based on inserted arguments and optional options.${NEWLINE}"

HELP_STRING="The args for these scripts should be seperated with '/' sign.${NEWLINE}"\
"Every arg should be preceded with a specific prefix and a ':' sign.${NEWLINE}"\
"This script's args:${NEWLINE}"\
"${TABULATOR} -h / --help: shows help on how to use the script.${NEWLINE}"\
"${TABULATOR} -n / --name <arg>: sets the script name. It will be saved to <arg>.sh file.${NEWLINE}"
#"${TABULATOR} -hd / --help-description: sets the help description.${NEWLINE}"
#"${TABULATOR} -ft / --file-template: reads the script configuration from file instead of the commandline.${NEWLINE}"\


PREFIXES="Prefixes:${NEWLINE}"\
"${TABULATOR}'a' (argument): entry for just single length key.${NEWLINE}"\
"${TABULATOR}'as' (argument-short): entry with both lenghts key persistent, here - for the short key.${NEWLINE}"\
"${TABULATOR}'af' (argument-full): entry with both lenghts key persistent, here - for the full key.${NEWLINE}"\
"${TABULATOR}'n' (number): number defining the number of intended values for this entry.${NEWLINE}"\
"${TABULATOR}${TABULATOR}Lack of this option with no 't' argument set will be interpreted as no values intended.${NEWLINE}"\
"${TABULATOR}${TABULATOR}Otherwise, with 't' set, but 'n' lacking, script will allow to use any arg number (string case).${NEWLINE}"\
"${TABULATOR}'t' (type): value defining the type of intended value for this entry. Possible values:${NEWLINE}"\
"${TABULATOR}${TABULATOR}t / terminal: arguments to this case will be read from command line.${NEWLINE}"\
"${TABULATOR}${TABULATOR}f / file: expected arguments will be the valid paths to files.${NEWLINE}"\
"${TABULATOR}${TABULATOR}n / number: arguments to this case will be read from command line and will be exptected to be numbers.${NEWLINE}"
#"${TABULATOR}'v' (value): arg defining the value for this entry.${NEWLINE}"\


EXAMPLE_USAGES="Example usages:${NEWLINE}"\
"${TABULATOR}./this.sh -n printer a:print - will generate the &apos;printer.sh&apos; script with additional -print argument. Possible using:${NEWLINE}"\
"${TABULATOR}${TABULATOR}./printer.sh -print${NEWLINE}"\
"${TABULATOR}./this.sh -n super_printer a:print a:show a:print_formatted${NEWLINE}"\
"${TABULATOR}${TABULATOR}./super_printer.sh -print${NEWLINE}"\
"${TABULATOR}${TABULATOR}./super_printer.sh -show${NEWLINE}"\
"${TABULATOR}${TABULATOR}./super_printer.sh -print_formatted${NEWLINE}"\
"${TABULATOR}./this.sh -n scanner as:s/as:scan/t:t - will generate 'scanner.h' file which is used with:${NEWLINE}"\
"${TABULATOR}${TABULATOR}./scanner.sh -s <args...>${NEWLINE}"\
"${TABULATOR}${TABULATOR}./scanner.sh -scan <args...>${NEWLINE}"\
"${TABULATOR}./this.sh -n scanner_writer as:s/af:scan/t:t as:w/af:write/n:1/t:f${NEWLINE}"\
"${TABULATOR}${TABULATOR}./scanner_writer.sh -s <args...>${NEWLINE}"\
"${TABULATOR}${TABULATOR}./scanner_writer.sh -write <filepath>${NEWLINE}"\
"${TABULATOR}${TABULATOR}./scanner_writer.sh -scan <args...> -w <filepath>${NEWLINE}"\
"${TABULATOR}./this.sh -n num_scan_write_to_two_files as:s/af:scan/n:5/t:n as:w/af:write/n:2/t:f${NEWLINE}"\
"${TABULATOR}${TABULATOR}./num_scan_write_to_two_files.sh -s <num1> <num2> <num3> <num4> <num5> -w <file1> <file2>${NEWLINE}"\


if [[ $1 == "-h" || $1 == "--help" ]]
then
        echo "${NEWLINE}"\
        "$HELP_HEADER"\
        "${NEWLINE}"\
        "${NEWLINE}"\
        "$HELP_STRING"\
	"${NEWLINE}"\
	"${PREFIXES}"\
	"${NEWLINE}"\
	"${NEWLINE}"\
	"${EXAMPLE_USAGES}"
else
	 echo "${NEWLINE}"\
        "$HELP_HEADER"\
        "${NEWLINE}"\
        "${NEWLINE}"\
        "$HELP_STRING"
fi
