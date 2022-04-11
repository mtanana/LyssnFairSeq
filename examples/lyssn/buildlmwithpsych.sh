
KENLM=/lyssn/code/mike/kenlm/build/bin
textloc=/lyssn/datasets/asr/asraug2020fixedlength10/train.wrd.txt
psychcorpusloc=/lyssn/datasets/asr/asraug2020fixedlength10/psychlm.txt
combinedloc=/lyssn/datasets/asr/asraug2020fixedlength10/combined.txt
lexiconlocation=/lyssn/datasets/asr/asraug2020fixedlength10/lexiconwpsych.txt

cat $textloc $psychcorpusloc > $combinedloc

cat $combinedloc | ${KENLM}/lmplz -o 3 --prune 0 2 2  > /lyssn/datasets/asr/asraug2020fixedlength10/lyssnwpsych.trigram.arpa
${KENLM}/build_binary /lyssn/datasets/asr/asraug2020fixedlength10/lyssnwpsych.trigram.arpa /lyssn/datasets/asr/asraug2020fixedlength10/lyssnwpsych.trigram.bin
cat $combinedloc | ${KENLM}/lmplz -o 2 --prune 0 2   > /lyssn/datasets/asr/asraug2020fixedlength10/lyssnwpsych.bigram.arpa
${KENLM}/build_binary /lyssn/datasets/asr/asraug2020fixedlength10/lyssnwpsych.bigram.arpa /lyssn/datasets/asr/asraug2020fixedlength10/lyssnwpsych.bigram.bin
cat $combinedloc | ${KENLM}/lmplz -o 1   > /lyssn/datasets/asr/asraug2020fixedlength10/lyssnwpsych.unigram.arpa

python3 createlexicon.py $combinedloc $lexiconlocation