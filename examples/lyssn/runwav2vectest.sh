
export KENLM_ROOT_DIR=/lyssn/code/mike/kenlm

#Some notes on install
#1. You have to declare  KENLM_ROOT_DIR  not whatever the error says when creating wav2letter
#2.  There is a missing binding in wav2letter that throws an error on import  https://github.com/facebookresearch/wav2letter/issues/775


##in the target folder you need a few files

#{split}.tsv first line is the folder of the split, then one row with relative file locations and lengths (ms?)
#the next two have to have the same order as the tsv
#{split}.wrd.txt   target words one line per utterance with just uppercased text (no ids- ordered the same as other files)
#{splitid}.ltr.txt target letters, one line per utterance, with letters of the words separated by spaces, and pipes separating words

#dict.ltr.txt this is the letter dictionary, one row per line




#######   WARNING!!  For some reason the LM keeps looking for dict.txt in the wav2vec folder NOT the data folder!!!!!!!


python examples/speech_recognition/infer.py /lyssn/datasets/asr/test1/ \
--task audio_pretraining \
--nbest 10 --path /lyssn/code/mike/fairseq/examples/wav2vec/wav2vec2_vox_960h.pt --gen-subset train \
--results-path /lyssn/temp/asr/wav2vec/ --w2l-decoder fairseqlm \
--lm-model /lyssn/code/mike/fairseq/examples/wav2vec/lm_librispeech_word_transformer.pt \
--lm-weight .5 --word-score -1 --sil-weight 0 --criterion ctc --labels ltr --max-tokens 4000000 \
--post-process letter

#--lexicon /lyssn/datasets/asr/test1/libri-upper.dict \