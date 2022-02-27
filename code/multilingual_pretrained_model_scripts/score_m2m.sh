COMET_DIR=comet

python score.py eng_aze_test.pred data/ted_raw/aze_eng/ted-test.orig.aze \
    --src data/ted_raw/aze_eng/ted-test.orig.eng \
	--comet-dir $COMET_DIR \
    | tee eng_aze_test.score
    