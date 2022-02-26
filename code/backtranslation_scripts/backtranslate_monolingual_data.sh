#!/bin/bash

set -euo pipefail

VOCAB_SIZE=8000
BINARIZED_DDIR_TEST=data/ted_binarized/azetur_spm"$VOCAB_SIZE"/azetur_test/M2O
MODEL_DIR=checkpoints/ted_azetur_spm8000/M2O/

fairseq-generate $BINARIZED_DDIR_TEST \
    --gen-subset test \
	--task translation_multi_simple_epoch \
	--lang-pairs aze-eng,tur-eng \
    --source-lang aze --target-lang eng \
    --path $MODEL_DIR/checkpoint_best.pt \
    --sampling --beam 1 --sampling-topk 5 \
    --batch-size 32 \
    --remove-bpe sentencepiece | grep ^H | cut -c 3- | sort -n | cut -f3- > "$MODEL_DIR"/test_b5.pred