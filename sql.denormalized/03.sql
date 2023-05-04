SELECT a.lang AS lang, count(*) AS count
FROM (
    SELECT DISTINCT data->>'id' AS id_tweets, data->>'lang' AS lang
    FROM tweets_jsonb
    WHERE data->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
    UNION
    SELECT DISTINCT data->>'id' AS id_tweets, data->>'lang' AS lang
    FROM tweets_jsonb
    WHERE data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
)a
GROUP BY a.lang
ORDER BY count DESC, a.lang
