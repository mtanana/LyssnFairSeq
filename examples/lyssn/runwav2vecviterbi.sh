
export KENLM_ROOT_DIR=/lyssn/code/mike/kenlm

#Some notes on install
#1. You have to declare  KENLM_ROOT_DIR  not whatever the error says when creating wav2letter
#2.  There is a missing binding in wav2letter that throws an error on import  https://github.com/facebookresearch/wav2letter/issues/775



python ../../examples/speech_recognition/infer.py /lyssn/datasets/asr/asraug2020fixedlength10/ \
--task audio_pretraining \
--nbest 1 --path /lyssn/temp/asr/wav2vec/asraug20202.2/checkpoint_best.pt --gen-subset valid \
--results-path /lyssn/temp/asr/wav2vec/ --w2l-decoder viterbi \
--lexicon /lyssn/datasets/asr/test1/librispeech-train+dev-unigram-10000-nbest10.lexicon \
--lm-model /lyssn/datasets/asr/test1/lm_librispeech_kenlm_wp_10k_6gram_pruning_000012.bin \
--lm-weight 2 --word-score -1 --sil-weight 0 --criterion ctc --labels ltr --max-tokens 2100000  \
--post-process letter




