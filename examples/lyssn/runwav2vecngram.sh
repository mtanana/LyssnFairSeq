
export KENLM_ROOT_DIR=/lyssn/code/mike/kenlm
export CUDA_DEVICE_ORDER=PCI_BUS_ID
export CUDA_VISIBLE_DEVICES=0
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

file='lyssn.trigram.bin'
model='/lyssn/temp/asr/wav2vec/asraug20201.8/checkpoint_best.pt'
lmweight=.5
insscore=-.5
beam=20

python ../../examples/speech_recognition/infer.py /lyssn/datasets/asr/asraug2020/ \
--task audio_pretraining \
--nbest 1 --path ${model} --gen-subset valid \
--results-path /lyssn/temp/asr/wav2vec/libritrigram/ --w2l-decoder kenlm \
--lexicon /lyssn/datasets/asr/asraug2020/lexicon.txt \
--beam ${beam} \
--lm-model /lyssn/datasets/asr/asraug2020/${file} \
--lm-weight ${lmweight} --word-score ${insscore} --sil-weight 0 --criterion ctc --labels ltr --max-tokens 2100000 \
--post-process letter


echo 'model ' $model
echo 'running ' ${file}
echo 'beam ' $beam
echo 'lmweight ' $lmweight
echo 'inscore ' $insscore
