import sys
import json

def main():
    sent_file = open(sys.argv[1])
    tweet_file = open(sys.argv[2])
    scores = {}
    for line in sent_file:
        [term, score] = line.split("\t")
        scores[term] = int(score)

    for line in tweet_file:
        try:
            tweet = json.loads(line)
            text = tweet['text'].decode('utf-8')
            text = text.lower()
            
            score = 0
            
            for word in text.split():
                if word in scores:
                    score += scores[word]
            
            print score
        except:
            continue 

if __name__ == '__main__':
    main()
