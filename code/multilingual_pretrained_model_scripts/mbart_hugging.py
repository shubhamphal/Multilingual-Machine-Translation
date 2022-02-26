from transformers import MBartForConditionalGeneration, MBart50TokenizerFast

file1 = open('data/ted_raw/aze_eng/ted-test.orig.eng', 'r')
test_lines = file1.readlines()
for i in range(len(test_lines)):
    test_lines[i] = test_lines[i][:-1]
    
model = MBartForConditionalGeneration.from_pretrained("facebook/mbart-large-50-many-to-many-mmt")
tokenizer = MBart50TokenizerFast.from_pretrained("facebook/mbart-large-50-many-to-many-mmt")

article = "UN Chief Says There Is No Military Solution in Syria"
tokenizer.src_lang = "en_XX"

fin_out = []

for i in range(len(test_lines)):
    encoded_hi = tokenizer(test_lines[i], return_tensors="pt")
    generated_tokens = model.generate(
        **encoded_hi,
        forced_bos_token_id=tokenizer.lang_code_to_id["az_AZ"]
    )
    output_text = tokenizer.batch_decode(generated_tokens, skip_special_tokens=True)[0]
    fin_out.append(output_text)
    print(output_text)
    
textfile = open("eng_aze_test.pred", "w")
for element in fin_out:
    textfile.write(element + "\n")
textfile.close()
