### Multi-alignment

This directory contains experimental multi-alignments of bible texts. As an example I tried to multi-align 77 different Germanic translations of the bible. I used [FastAlign](https://github.com/clab/fast_align) to produce all bi-alignments, and the infomap-community algorithm (implemented in [igraph](http://igraph.org/r/doc/infomap.html)) to turn these into multi-alignments.

#### Format

For bi-alignments, the 'Pharaoh format' introduced by Giza++ is well-established (also used by BerkeleyAligner and FastAlign (see Section on [Output](https://github.com/clab/fast_align)). For multi-alignment there is no established format. In Bioinformatics (where multi-aligned nucleotides are widely used) it is common to simply add spaces to get everything aligned, but that only works because the ordering remains mostly the same. In the case of word-based multi-alignment across languages this won't work, because the ordering is wildly different across languages.

I propose to use a four-column 'stand-off annotation' CSV file for word-based multi-alignments (currently using tabs as column separators). The four columns are the following:

* **ID of the text**: in practice, the name of the file with the original texts (not included in this repository)
* **Wordform count**: because all wordforms and punctuation in our texts are nicely separated by spaces, we can simply count wordforms, including punctuations! So, when there are 13 spaces in a line, then there are 14 wordforms. Note that in the examples I start counting at 1 (Matlab/R-style) and not at zero (Python/C-style).
* **Wordform**: for ease of use, I copy the wordform here. Ideally, the first two columns uniquely identify this wordform.
* **Multi-align cluster**: each multi-alignment is numbered, again starting with 1. This column is roughly related to the actual order, but basically should be treated as a random ID.

The multi-alignments themselves are split into files depending on the parallel string (here: the parallel sentence), and named accordingly, e.g. "41001001.csv".

### Annotation

The multi-aligned sets of words can easily be annotated with a simple three-column format, as illustrated in the directory `annotations` with a few occurrences of a few names:

* **Filename of Alignment**
* **Alignment ID from that file**
* **Content of Annotation**

Using this information, it is now easy, for example, to extract all names for `Peter` in the different translations, e.g. `awk '$4=="10"' alignments/40004018.csv` (cf. the first line in the example annotation file).

Michael Cysouw <cysouw@mac.com>