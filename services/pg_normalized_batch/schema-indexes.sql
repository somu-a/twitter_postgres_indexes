CREATE INDEX index_one ON tweet_tags (tag, id_tweets);
CREATE INDEX index_two ON tweet_tags (id_tweets, tag);
CREATE INDEX index_three ON tweets (id_tweets, lang);
CREATE INDEX index_four ON tweets USING gin(to_tsvector('english',text)) WHERE lang='en';
