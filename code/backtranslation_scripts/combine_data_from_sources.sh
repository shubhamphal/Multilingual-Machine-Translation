#!/bin/bash

#RAW Data dir
RAW_DDIR=data/ted_raw/aze_eng_augmented/
#Monolingual Azerbaijani data
AZE_RAW_FILE=data/ted_raw/aze_eng_augmented/preprocess_data_dir/preprocessed_mono_aze.txt
#Backtranslated English data
ENG_RAW_FILE=checkpoints/ted_azetur_spm8000/M2O/test_b5.pred


CONCAT_RAW_DIR="$RAW_DDIR"/backtranslation/
CONCAT_RAW_FILE="$CONCAT_RAW_DIR"/backtranslation.txt

AZ_EN_RAW=data/ted_raw/aze_eng/

mkdir -p "$RAW_DDIR"/backtranslation

python3 backtranslation_scripts/concatenate_files.py --input1 $AZE_RAW_FILE --input2 $ENG_RAW_FILE --output $CONCAT_RAW_FILE

cp -r "$AZ_EN_RAW"* $AZE_RAW_FILE $ENG_RAW_FILE $CONCAT_RAW_DIR

cat "$CONCAT_RAW_DIR"/ted-train.orig.eng $ENG_RAW_FILE > "$CONCAT_RAW_DIR"/temp.eng

cat "$CONCAT_RAW_DIR"/ted-train.orig.aze $AZE_RAW_FILE > "$CONCAT_RAW_DIR"/temp.aze

cat "$CONCAT_RAW_DIR"/ted-train.orig.aze-eng $CONCAT_RAW_FILE > "$CONCAT_RAW_DIR"/temp.aze-eng

mv "$CONCAT_RAW_DIR"/temp.eng "$CONCAT_RAW_DIR"/ted-train.orig.eng

mv "$CONCAT_RAW_DIR"/temp.aze "$CONCAT_RAW_DIR"/ted-train.orig.aze

mv "$CONCAT_RAW_DIR"/temp.aze-eng "$CONCAT_RAW_DIR"/ted-train.orig.aze-eng


wc -l "$CONCAT_RAW_DIR"/ted-train.orig.aze-eng
wc -l "$CONCAT_RAW_DIR"/ted-train.orig.aze
wc -l "$CONCAT_RAW_DIR"/ted-train.orig.eng

