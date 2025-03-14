make
if [ $# -eq 0 ]; then
    echo "A text file needed for train"
    exit 128
fi


train="$1"
output="${train%.*}".bin 
echo "$output"
# if [ ! -e $output ]; then
    # window=5 best for semantic
    # -sample 0
    # -size 100, more wil scatter words, less lose definition
    # hs=0 # not needed, https://medium.com/@gridflowai/optimizing-word2vec-with-hierarchical-softmax-a9d46ebe545a
    # cbow=1 # cbow better for small corpus
    # negative=5 is needed, but not too much, will put some rare words too high
    # -sample 1e-4 will keep important frequent word
    # iter=50, needed for smal corpus
    time ./word2vec -train $train -output $output -binary 1 -alpha 0.025 -negative 10 -iter 50  -min-count 10
# fi
./distance $output
