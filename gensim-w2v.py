from gensim.models import KeyedVectors


model = KeyedVectors.load_word2vec_format('piaget.bin', binary=True)

result = model.similar_by_word("intelligence")
print(result)
# most_similar_key, similarity = result[0]  # look at the first match
# print(f"{most_similar_key}: {similarity:.4f}")