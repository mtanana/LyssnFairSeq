#!/usr/bin/env python3

# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

"""
Helper script to pre-compute embeddings for a wav2letter++ dataset
"""



'''

In this version, I'm assuming that {split}.labels.tsv has the labels
one line per utterance with utteranceid.wav {label text}

The tsv is the generated tsv with directory at the top and one line per utterance
'''

import argparse
import os


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("tsv")
    parser.add_argument("--labels-tsv")
    parser.add_argument("--output-dir", required=True)
    parser.add_argument("--output-name", required=True)
    args = parser.parse_args()

    os.makedirs(args.output_dir, exist_ok=True)
    #map of transcripts by session filename
    transcriptions = {}

    with  open(
            os.path.join(args.output_dir, args.output_name + ".labels.tsv"), "r"
    ) as labels:
        for line in labels:
            cols = line.split("\t")

            words = cols[1].upper().strip()
            transcriptions[cols[0]] = words



    with open(args.tsv, "r") as tsv, open(
        os.path.join(args.output_dir, args.output_name + ".ltr.txt"), "w"
    ) as ltr_out, open(
        os.path.join(args.output_dir, args.output_name + ".wrd.txt"), "w"
    ) as wrd_out:
        #root directory for the split
        root = next(tsv).strip()
        for line in tsv:
            cols = line.split("\t")

            uttname = cols[0]


            print(transcriptions[uttname], file=wrd_out)
            print(
                " ".join(list(transcriptions[uttname].replace(" ", "|"))) + " |",
                file=ltr_out,
            )




if __name__ == "__main__":
    main()
