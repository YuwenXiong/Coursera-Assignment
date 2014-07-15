import sys
import json

def main():
    sent_file = open(sys.argv[1])
    tweet_file = open(sys.argv[2])
    scores = {}
    total = {}
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
                elif word in total:
                    total[word][0] += 1
                else:
                    total[word] = [1, 0, 0]
            for word in text.split():
                if word in scores:
                    continue
                if score > 0:
                    total[word][1] += 1
                elif score < 0:
                    total[word][2] += 1
            
        except:
            continue
            
    for item in total:
        print item, total[item][1] - total[item][2]

if __name__ == '__main__':
    main()
