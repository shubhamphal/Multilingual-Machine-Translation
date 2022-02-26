#!/bin/bash
set -euo pipefail
if [[ -z $FAIRSEQ_DIR ]]; then
  echo "\$FAIRSEQ_DIR enviromental variable needs to be set"
  exit 1
fi

VOCAB_SIZE=8000
RAW_DDIR=data/ted_raw/aze_eng_augmented/preprocess_data_dir/
PROC_DDIR_TRAIN=data/ted_processed/azetur_spm"$VOCAB_SIZE"/
PROC_DDIR_TEST=data/ted_processed/azetur_spm"$VOCAB_SIZE"/azetur_test/
BINARIZED_DDIR_TRAIN=data/ted_binarized/azetur_spm"$VOCAB_SIZE"/
BINARIZED_DDIR_TEST=data/ted_binarized/azetur_spm"$VOCAB_SIZE"/azetur_test/
FAIR_SCRIPTS=$FAIRSEQ_DIR/scripts
SPM_TRAIN=$FAIR_SCRIPTS/spm_train.py
SPM_ENCODE=$FAIR_SCRIPTS/spm_encode.py
LANG=aze


mkdir -p "$PROC_DDIR_TEST"/"$LANG"_eng

echo "test data with learned BPE..."
split=test
python "$SPM_ENCODE" \
    --model="$PROC_DDIR_TRAIN"/"$LANG"_eng/spm"$VOCAB_SIZE".model \
    --output_format=piece \
    --inputs "$RAW_DDIR"/preprocessed_mono_aze.txt  \
    --outputs "$PROC_DDIR_TEST"/"$LANG"_eng/ted-test.spm"$VOCAB_SIZE"."$LANG"


fairseq-preprocess --source-lang $LANG --target-lang eng \
    --only-source \
    --testpref "$PROC_DDIR_TEST"/"$LANG"_eng/ted-test.spm"$VOCAB_SIZE" \
    --srcdict $BINARIZED_DDIR_TRAIN/dict.src.txt \
    --tgtdict $BINARIZED_DDIR_TRAIN/dict.eng.txt \
    --destdir $BINARIZED_DDIR_TEST/M2O/
