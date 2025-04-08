make
window=2
cbow=0
for train in "$@"
do    
    output="${train%.*},window=$window,cbow=$cbow".bin 
    echo "$output"
    # if [ ! -e $output ]; then
        # Corpus is clean : lemma, no grammatical words, no unknown words
        # -binary 1 — binary format is more compact
        # -window 2 — best for semantic
        # -iter 50 — needed for smal corpus
        # -sample 1e-3 — useful with frequent stop words, not here, bad with 1e-5
        # -size 100 — default, correct for 4M words
        # -hs 0 — not needed, https://medium.com/@gridflowai/optimizing-word2vec-with-hierarchical-softmax-a9d46ebe545a
        # -cbow 1 — skip-gram has not prove accuracy
        # -min-count 5 — default is 5  
        # -negative 10 — default is 5, slow down training but improve accuracy
        time ./word2vec -train $train -output $output -window $window -cbow $cbow -binary 1 -alpha 0.025 -iter 50 -negative 10
    # fi
done