export CUDA_DEVICE_ORDER=PCI_BUS_ID
export CUDA_VISIBLE_DEVICES=2

#for some reason I think this only uses the valid subset

python train.py /lyssn/datasets/asr/asraug2020/ --save-dir /lyssn/temp/asr/wav2vec/asraug20201.8/ --fp16 \
--reset-dataloader \
--post-process letter --valid-subset valid  --no-epoch-checkpoints --best-checkpoint-metric wer --num-workers 10 \
--max-update 550000 --sentence-avg --task audio_pretraining --arch wav2vec_ctc --w2v-path /lyssn/datasets/asr/test2/wav2vec_vox.pt \
--labels ltr --apply-mask --mask-selection static --mask-other 0 --mask-length 10 --mask-prob 0.5 --layerdrop 0.1 \
--mask-channel-selection static --mask-channel-other 0 --mask-channel-length 64 --mask-channel-prob 0.5 --zero-infinity \
--feature-grad-mult 0.0 --freeze-finetune-updates 10000 --validate-after-updates 10000 --optimizer adam \
--adam-betas '(0.9, 0.98)' --adam-eps 1e-08 --lr 2e-05 --lr-scheduler tri_stage --warmup-steps 8000 --hold-steps 100000 \
--decay-steps 250000 --final-lr-scale 0.05 --final-dropout 0.0 --dropout 0.0 --activation-dropout 0.1 --criterion ctc \
--attention-dropout 0.0  --max-tokens 1280000 --max-tokens-valid 3000000   --seed 2337 --log-format tqdm --log-interval 100 --ddp-backend no_c10d \
--tensorboard-logdir /lyssn/temp/asr/wav2vec/test2/tensorboardaug2020v5 \


#--wer-args '("/path/to/lm/4-gram.bin","/path/to/lexicon",2,-1)' \
