
export KENLM_ROOT_DIR=/lyssn/code/mike/kenlm
export CUDA_DEVICE_ORDER=PCI_BUS_ID
export CUDA_VISIBLE_DEVICES=0
export PYTHONPATH=$PYTHONPATH:/lyssn/code/mike/fairseq/
#Some notes on install
#1. You have to declare  KENLM_ROOT_DIR  not whatever the error says when creating wav2letter
#2.  There is a missing binding in wav2letter that throws an error on import  https://github.com/facebookresearch/wav2letter/issues/775

model='/lyssn/temp/asr/wav2vec/asroct20202.1/checkpoint_best.pt'

python ../../examples/speech_recognition/infer.py /lyssn/datasets/asr/asroct2020/ \
--task audio_pretraining \
--nbest 1 --path ${model} --gen-subset valid \
--results-path /lyssn/temp/asr/wav2vec.punct/ --w2l-decoder viterbi --beam 50 \
 --sil-weight 0 --criterion ctc --labels ltr --max-tokens 2100000  \
--post-process letter




