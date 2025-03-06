make
if [ $# -eq 0 ]; then
    echo "A text file needed for train"
    exit 128
fi


train="$1"
output="${train%.*}".bin 
echo "$output"
if [ ! -e $output ]; then
    # window=5 best for semantic
    # size=50
    # hs=0 # not needed, https://medium.com/@gridflowai/optimizing-word2vec-with-hierarchical-softmax-a9d46ebe545a
    # cbow=1 # cbow better for small corpus
    # -negative is needed, but not too much, will put some words too high
    # -sample 1e-4 will keep important frequent word
    time ./word2vec -train $train -output $output -cbow 1 -size 40 -window 5 -negative 5 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 50 #  -min-count 2 
fi
./distance $output
