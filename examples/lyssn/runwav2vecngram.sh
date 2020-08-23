
export KENLM_ROOT_DIR=/lyssn/code/mike/kenlm
export CUDA_DEVICE_ORDER=PCI_BUS_ID
export CUDA_VISIBLE_DEVICES=1
#Some notes on install
#1. You have to declare  KENLM_ROOT_DIR  not whatever the error says when creating wav2letter
#2.  There is a missing binding in wav2letter that throws an error on import  https://github.com/facebookresearch/wav2letter/issues/775


#python examples/speech_recognition/infer.py /lyssn/datasets/asr/test1/ \
#--task audio_pretraining \
#--nbest 1 --path /lyssn/code/mike/fairseq/examples/wav2vec/wav2vec2_vox_960h.pt --gen-subset train \
#--results-path /lyssn/temp/asr/wav2vec/ --w2l-decoder viterbi \
#--lexicon /lyssn/datasets/asr/test1/librispeech-train+dev-unigram-10000-nbest10.lexicon \
#--lm-model /lyssn/datasets/asr/test1/lm_librispeech_kenlm_wp_10k_6gram_pruning_000012.bin \
#--lm-weight 2 --word-score -1 --sil-weight 0 --criterion ctc --labels ltr --max-tokens 4000000 \
#--post-process letter



#/lyssn/temp/asr/wav2vec/asraug20201.8/checkpoint_best.pt
#/lyssn/code/mike/fairseq/examples/wav2vec/wav2vec2_vox_960h.pt


python examples/speech_recognition/infer.py /lyssn/datasets/asr/asraug2020/ \
--task audio_pretraining \
--nbest 1 --path /lyssn/temp/asr/wav2vec/asraug20201.8/checkpoint_best.pt --gen-subset valid \
--results-path /lyssn/temp/asr/wav2vec/bigram/ --w2l-decoder kenlm \
--lexicon /lyssn/datasets/asr/asraug2020/lexicon.txt \
--beam 150 \
--lm-model /lyssn/datasets/asr/asraug2020/lyssn.bigram.bin \
--lm-weight 1 --word-score -.5 --sil-weight 0 --criterion ctc --labels ltr --max-tokens 2100000 \
--post-process letter

#