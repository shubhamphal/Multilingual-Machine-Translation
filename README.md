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
* ```python multilingual_pretrained_model/mbart_hugging.py``` to obtain the predicted translations from the pretrained MBart50 model. These are saved in a ```.pred``` file such as ```aze_eng_test.pred``` in ```outputs/multilingual_pretrained_model/MBart50```
* ```bash multilingual_pretrained_model/score_mbart.sh``` to run the scoring script for MBart50. This will produce a ```.score``` file like ```aze_eng_test.score``` which contains the BLEU and the COMET scores in ```outputs/multilingual_pretrained_model/MBart50```
* ```python multilingual_pretrained_model/m2m_hugging.py``` to obtain the predicted translations from the pretrained M2M100 model. These are saved in a ```.pred``` file such as ```aze_eng_test.pred``` in ```outputs/multilingual_pretrained_model/M2M100```
* ```bash multilingual_pretrained_model/score_m2m.sh``` to run the scoring script for M2M100. This will produce a ```.score``` file like ```aze_eng_test.score``` which contains the BLEU and the COMET scores in ```outputs/multilingual_pretrained_model/M2M100```

### To run the crosslingual transfer code
* ```cd code```
* ```preprocess-ted-bilingual.sh``` to preprocess aze and eng raw data.
* ```preprocess-ted-bilingual-tur.sh``` to preprocess tur and eng raw data.
* For aze-eng using tur-eng, run ```bash traineval_flores_tur_eng.sh``` to train a high-resource tur-eng translation model. Then run ```bash traineval_flores_aze_eng_from_tur.sh``` to train low-resource aze-eng intializing weights from the previous training.
* For eng-aze using eng-tur, run ```bash traineval_flores_eng_tur.sh``` to train a high-resource eng-tur translation model. Then run ```bash traineval_flores_eng_aze_from_tur.sh``` to train low-resource eng-aze intializing weights from the previous training.
