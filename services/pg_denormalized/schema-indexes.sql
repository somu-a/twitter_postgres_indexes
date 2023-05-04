CREATE INDEX indexd_one ON tweets_jsonb USING gin((data->'entities'->'hashtags'));
CREATE INDEX indexd_two ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));
CREATE INDEX indexd_three ON tweets_jsonb USING gin((data->'lang'));
CREATE INDEX indexd_four ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))) WHERE data->>'lang'='en';
CREATE INDEX indexd_five ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')), (data->'entities'->'hashtags' || COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')));
