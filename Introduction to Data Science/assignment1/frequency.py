import sys
import json

def main():
    tweet_file = open(sys.argv[1])
    count = {}
    tot = 0.0;

    for line in tweet_file:
        try:
            tweet = json.loads(line)
            text = tweet['text'].decode('utf-8')
            text = text.lower()
            
            for word in text.split():
                if word in count:
                    count[word] += 1
                else:
                    count[word] = 1
                tot += 1
            
        except:
            continue
            
    for item in count:
        print item, count[item] / tot

if __name__ == '__main__':
    main()
