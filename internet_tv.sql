-- チャンネルテーブル
CREATE TABLE channels (
    channel_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    channel_name VARCHAR(100) NOT NULL
);

-- 番組テーブル
CREATE TABLE programs (
    program_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL,
    program_details TEXT
);

-- ジャンルテーブル
CREATE TABLE genres (
    genre_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- 番組ジャンル関連テーブル
CREATE TABLE program_genres (
    program_id BIGINT NOT NULL,
    genre_id BIGINT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(program_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- シーズンテーブル
CREATE TABLE seasons (
    season_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    program_id BIGINT NOT NULL,
    season_number INT,
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

-- エピソードテーブル
CREATE TABLE episodes (
    episode_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    season_id BIGINT,
    episode_number INT,
    title VARCHAR(100) NOT NULL,
    episode_details TEXT,
    duration INT NOT NULL,
    release_date DATE NOT NULL,
    views_count BIGINT DEFAULT 0,
    FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

-- 番組枠テーブル
CREATE TABLE program_slots (
    slot_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    channel_id BIGINT NOT NULL,
    episode_id BIGINT NOT NULL,
    broadcast_time DATETIME NOT NULL,
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
    FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
);
