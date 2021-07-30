
CREATE TABLE IF NOT EXISTS `action_histories` (
  `id`  INT PRIMARY KEY,
  `unix_time` INT NOT NULL,
  `action_id` INT NOT NULL,
)

CREATE TABLE IF NOT EXISTS `actions` (
  `action_id` INT PRIMARY KEY
)