'''
Creates the spelling lexicon
'''

textloc= "/lyssn/datasets/asr/asraug2020fixedlength10/train.wrd.txt"
lexicon = "/lyssn/datasets/asr/asraug2020fixedlength10/lexicon.txt"
words = set()

with open(textloc,"r") as text:
    for line in text:
        ws = line.split()
        for word in ws:
            words.add(word)

with open(lexicon,"w") as l:
    for word in words:
        letters = " ".join(list(word))
        l.write(word+"\t"+letters+"\n")
