/*エピソード視聴数*/
SELECT title, views_count
FROM episodes
ORDER BY views_count DESC
LIMIT 3;

/*エピソード視聴数トップ３　詳細情報含む*/
SELECT p.program_name, s.season_number, e.episode_number, e.title, e.views_count
FROM episodes e
JOIN seasons s ON e.season_id = s.season_id
JOIN programs p ON s.program_id = p.program_id
ORDER BY e.views_count DESC
LIMIT 3;

/*本日の番組表*/
SELECT c.channel_name, ps.broadcast_time AS start_time, ADDTIME(ps.broadcast_time, SEC_TO_TIME(e.duration * 60)) AS end_time, s.season_number, e.episode_number, e.title, e.episode_details
FROM program_slots ps
JOIN channels c ON ps.channel_id = c.channel_id
JOIN episodes e ON ps.episode_id = e.episode_id
JOIN seasons s ON e.season_id = s.season_id
WHERE DATE(ps.broadcast_time) = CURRENT_DATE()
ORDER BY ps.broadcast_time;

/*ドラマチャンネルの一週間分の番組表*/
SELECT ps.broadcast_time AS start_time, ADDTIME(ps.broadcast_time, SEC_TO_TIME(e.duration * 60)) AS end_time, s.season_number, e.episode_number, e.title, e.episode_details
FROM program_slots ps
JOIN channels c ON ps.channel_id = c.channel_id
JOIN episodes e ON ps.episode_id = e.episode_id
JOIN seasons s ON e.season_id = s.season_id
WHERE c.channel_name = 'ドラマチャンネル' AND ps.broadcast_time BETWEEN CURRENT_DATE() AND DATE_ADD(CURRENT_DATE(), INTERVAL 7 DAY)
ORDER BY ps.broadcast_time;

/*直近一週間で最も見られた番組２つ*/
SELECT p.program_name, SUM(e.views_count) AS total_views
FROM episodes e
JOIN seasons s ON e.season_id = s.season_id
JOIN programs p ON s.program_id = p.program_id
WHERE e.release_date BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) AND CURRENT_DATE()
GROUP BY p.program_id
ORDER BY total_views DESC
LIMIT 2;

/*ジャンルごとの番組視聴数*/
SELECT g.genre_name, p.program_name, AVG(e.views_count) AS average_views
FROM episodes e
JOIN seasons s ON e.season_id = s.season_id
JOIN programs p ON s.program_id = p.program_id
JOIN program_genres pg ON p.program_id = pg.program_id
JOIN genres g ON pg.genre_id = g.genre_id
GROUP BY g.genre_id, p.program_id
ORDER BY g.genre_name, average_views DESC;
