import sys
import json

def main():
    tweet_file = open(sys.argv[1])
    count = {}
    tot = 0.0;

    for line in tweet_file:
        try:
            tweet = json.loads(line)
            text = tweet.get('entities').get('hashtags')
            text = text[0]['text'].decode('utf-8')
            for word in text.split():
                if word in count:
                    count[word] += 1
                else:
                    count[word] = 1            
        except:
            continue
    
    count = sorted(count.iteritems(), key = lambda d:d[1], reverse = True)
    cnt = 1;
    for item in count:
        print item[0], item[1]
        cnt += 1
        if cnt > 10:
            break

if __name__ == '__main__':
    main()
