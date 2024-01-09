-- チャンネルのサンプルデータ
INSERT INTO channels (channel_name) VALUES
('ドラマチャンネル'),
('アニメチャンネル'),
('映画チャンネル'),
('ニュースチャンネル');


-- 番組のサンプルデータ
INSERT INTO programs (program_name, program_details) VALUES
('鬼滅の刃', '人気アニメシリーズ'),
('進撃の巨人', '壮大な物語のアニメ'),
('映画紹介', '様々な映画を紹介'),
('ニュース速報', '最新のニュースをお届け');

-- ジャンルのサンプルデータ
INSERT INTO genres (genre_name) VALUES
('アニメ'),
('ドラマ'),
('映画'),
('ニュース');

-- シーズンのサンプルデータ
-- 鬼滅の刃のシーズン1
INSERT INTO seasons (program_id, season_number) VALUES
(1, 1);

-- 進撃の巨人のシーズン1
INSERT INTO seasons (program_id, season_number) VALUES
(2, 1);

-- 番組ジャンル関連のサンプルデータ
INSERT INTO program_genres (program_id, genre_id) VALUES 
(1, 1), 
(2, 1), 
(2, 3);

-- エピソードのサンプルデータ
-- 鬼滅の刃のエピソード
INSERT INTO episodes (season_id, episode_number, title, episode_details, duration, release_date, views_count) VALUES
(1, 1, '第1話', '鬼滅の刃第1話の詳細', 30, '2023-01-01', 1000),
(1, 2, '第2話', '鬼滅の刃第2話の詳細', 30, '2023-01-02', 950);
(1, 3, '第3話', '鬼滅の刃第3話の詳細', 30, DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), 800),
(1, 4, '第4話', '鬼滅の刃第4話の詳細', 30, DATE_SUB(CURRENT_DATE(), INTERVAL 2 DAY), 750);


-- 進撃の巨人のエピソード
INSERT INTO episodes (season_id, episode_number, title, episode_details, duration, release_date, views_count) VALUES
(2, 1, '第1話', '進撃の巨人第1話の詳細', 30, '2023-01-03', 900),
(2, 2, '第2話', '進撃の巨人第2話の詳細', 30, '2023-01-04', 850);


-- 番組枠のサンプルデータ
-- ドラマチャンネルの番組枠
INSERT INTO program_slots (channel_id, episode_id, broadcast_time) VALUES
(1, 1, '2023-01-01 20:00:00'),
(1, 2, '2023-01-02 20:00:00');

-- アニメチャンネルの番組枠
INSERT INTO program_slots (channel_id, episode_id, broadcast_time) VALUES
(2, 3, '2023-01-03 20:00:00'),
(2, 4, '2023-01-04 20:00:00');

