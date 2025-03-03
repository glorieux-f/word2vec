make
if [ $# -eq 0 ]; then
    echo "A text file needed for train"
    exit 128
fi

window=5
size=30
hs=0 # not needed, https://medium.com/@gridflowai/optimizing-word2vec-with-hierarchical-softmax-a9d46ebe545a
cbow=1 # cbow better for small corpus

train="$1"
output="${train%.*}"-win$window-size$size-cbow$cbow-hs$hs.bin 
echo "$output"
if [ ! -e $output ]; then
    # -negative is needed
    # -sample 1e-4 will keep important frequent word
    time ./word2vec -train $train -output $output -cbow $cbow -size $size -window $window -negative 5 -hs $hs -sample 1e-4 -threads 20 -binary 1 -iter 50 #  -min-count 2 
fi
./distance $output
