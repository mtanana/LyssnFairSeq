'''
Creates the spelling lexicon
Usage python createlexicon.py inputfile.txt outputfile.txt
'''


import sys


#the word level text file
textloc= sys.argv[1]
#the output file
lexicon = sys.argv[2]
words = set()
print(textloc)
print(lexicon)

with open(textloc,"r") as text:
    for line in text:
        ws = line.split()
        for word in ws:
            words.add(word)

with open(lexicon,"w") as l:
    for word in words:
        letters = " ".join(list(word))
        l.write(word+"\t"+letters+"\n")
