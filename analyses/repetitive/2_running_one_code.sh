# $1 is the RM out file

perl build_dictionary.pl --unknown --rm $1 > $1.dictionary
perl one_code_to_find_them_all.pl --rm $1 --ltr $1.dictionary --unknown 
grep "###" *.copynumber.csv > $1.summary
