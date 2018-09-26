module load repeatmasker/4.0.7-openmpi3-vruhfro
nice -n10 RepeatMasker -pa 175 -s -nolow -lib cottonRB23.04.fa -no_is -frag 500000 -nocut -noisy -dir ${1%.fasta}.dir -html -gff $1

