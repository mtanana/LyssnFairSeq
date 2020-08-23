
KENLM=/lyssn/code/mike/kenlm/build/bin
textloc=/lyssn/datasets/asr/asraug2020/train.wrd.txt

cat $textloc | ${KENLM}/lmplz -o 3 --prune 0 1 1  > /lyssn/datasets/asr/asraug2020/lyssn.trigram.arpa
${KENLM}/build_binary /lyssn/datasets/asr/asraug2020/lyssn.trigram.arpa /lyssn/datasets/asr/asraug2020/lyssn.trigram.bin
cat $textloc | ${KENLM}/lmplz -o 2 --prune 0 1   > /lyssn/datasets/asr/asraug2020/lyssn.bigram.arpa
${KENLM}/build_binary /lyssn/datasets/asr/asraug2020/lyssn.bigram.arpa /lyssn/datasets/asr/asraug2020/lyssn.bigram.bin
cat $textloc | ${KENLM}/lmplz -o 1   > /lyssn/datasets/asr/asraug2020/lyssn.unigram.arpa
