SELECT '#' || a.hashtag as tag, count(*) as count
FROM (
    SELECT DISTINCT 
        data->>'id' AS id_tweets,
        jsonb_array_elements(data->'entities'->'hashtags')->>'text' AS hashtag
    FROM tweets_jsonb
    WHERE data->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
    UNION
    SELECT DISTINCT
        data->>'id' as id_tweets,
        jsonb_array_elements(data->'extended_tweet'->'entities'->'hashtags')->>'text' AS hashtag
    FROM tweets_jsonb
    WHERE data->'extended_tweet'->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
)a
GROUP BY a.hashtag
ORDER BY count DESC, a.hashtag
LIMIT 1000;
