-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 5.0.97.1
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 26.12.2012 20:44:14
-- Версия сервера: 5.1.65-community-log
-- Версия клиента: 4.1

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Описание для базы данных maileator
--
DROP DATABASE IF EXISTS maileator;
CREATE DATABASE IF NOT EXISTS maileator
	CHARACTER SET utf8
	COLLATE utf8_general_ci;

-- 
-- Установка базы данных по умолчанию
--
USE maileator;

--
-- Описание для таблицы me_users
--
CREATE TABLE IF NOT EXISTS me_users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX email (email)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы me_projects
--
CREATE TABLE IF NOT EXISTS me_projects (
  id INT(11) NOT NULL AUTO_INCREMENT,
  owner_id INT(11) NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_me_projects_me_users_id FOREIGN KEY (owner_id)
    REFERENCES me_users(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы me_lists
--
CREATE TABLE IF NOT EXISTS me_lists (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  project_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_me_lists_me_projects_id FOREIGN KEY (project_id)
    REFERENCES me_projects(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы me_templates
--
CREATE TABLE IF NOT EXISTS me_templates (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  project_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_me_templates_me_projects_id FOREIGN KEY (project_id)
    REFERENCES me_projects(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы me_timesheets
--
CREATE TABLE IF NOT EXISTS me_timesheets (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  project_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_me_timesheets_me_projects_id FOREIGN KEY (project_id)
    REFERENCES me_projects(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы me_mailings
--
CREATE TABLE IF NOT EXISTS me_mailings (
  id INT(11) NOT NULL AUTO_INCREMENT,
  project_id INT(11) NOT NULL,
  name VARCHAR(255) NOT NULL,
  list_id INT(11) NOT NULL,
  template_id INT(11) NOT NULL,
  timesheet_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_me_mailings_me_lists_id FOREIGN KEY (list_id)
    REFERENCES me_lists(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_me_mailings_me_projects_id FOREIGN KEY (project_id)
    REFERENCES me_projects(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_me_mailings_me_templates_id FOREIGN KEY (template_id)
    REFERENCES me_templates(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_me_mailings_me_timesheets_id FOREIGN KEY (timesheet_id)
    REFERENCES me_timesheets(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 8
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы me_users
--
INSERT INTO me_users VALUES 
  (2, 'gogo@gmail.com');

-- 
-- Вывод данных для таблицы me_projects
--
INSERT INTO me_projects VALUES 
  (3, 2, 'Первый проект'),
  (4, 2, 'Второй проект');

-- 
-- Вывод данных для таблицы me_lists
--
INSERT INTO me_lists VALUES 
  (1, 'Клиенты', 4);

-- 
-- Вывод данных для таблицы me_templates
--
INSERT INTO me_templates VALUES 
  (1, 'С новым годом', 3);

-- 
-- Вывод данных для таблицы me_timesheets
--
INSERT INTO me_timesheets VALUES 
  (1, 'Медленная рассылка', 3),
  (3, 'Быстрая рассылка', 4);

-- 
-- Вывод данных для таблицы me_mailings
--
INSERT INTO me_mailings VALUES 
  (7, 3, 'Новогодняя рассылка', 1, 1, 1);

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;