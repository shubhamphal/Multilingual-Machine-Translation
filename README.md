# Multilingual-Machine-Translation

### To run the backtranslation code 
* ```cd code```
* ```bash preprocess-ted-multilingual.sh```
* ```bash traineval_azetur_eng.sh``` and obtain the model checkpoint 
* Run the preprocessing notebook under ```backtranslation_script/preprocessing.ipynb``` and move the ```preprocessed_mono_aze.txt``` file to a new directory ```data/ted_raw/aze_eng_augmented/preprocess_data_dir```
* ```bash backtranslation_scripts/binarize_monolingual_data.sh```
* ```bash backtranslation_scripts/backtranslate_monolingual_data.sh```
* ```bash backtranslation_scripts/combine_data_from_sources.sh```
* ```bash backtranslation_scripts/preprocess-augmented-bilingual-data.sh```
* ```bash backtranslation_scripts/traineval-augmented-bilingual-data.sh```


### To run the multilingual pretraining code
* ```cd code```
* ```python mbart_hugging.py``` to obtain the predicted translations from pretrained models like MBart50. These are saved in a ```.pred``` file such as ```aze_eng_test.pred```
* ```bash score_mbart.sh``` to run the scoring script. This will produce a ```.score``` file like ```aze_eng_test.score``` which contains the BLEU and the COMET scores
