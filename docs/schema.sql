CREATE TABLE IF NOT EXISTS `tasks` (
  `task_id` INT PRIMARY KEY,
  `name`  TEXT  NOT NULL,
  `status`  TEXT  NOT NULL,  -- todo, doing, done
  `predicted_hours` REAL,  -- 見積もり(単位はh)
);

CREATE TABLE IF NOT EXISTS `actions` (
  `task_id`    INT PRIMARY KEY,
  `action_id`  INT PRIMARY KEY,
  `name`  TEXT NOT NULL,
  `started_at`  TEXT NOT NULL,  -- フォーマット: yyyy-mm-dd hh:mm:ss
  `ended_at`  TEXT,  -- フォーマット: yyyy-mm-dd hh:mm:ss
);
