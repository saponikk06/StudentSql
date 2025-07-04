# Student Database Project

Этот репозиторий содержит SQL-скрипт для развёртывания учебной базы данных студентов в PostgreSQL.

## 📚 Описание

Проект моделирует структуру БД для управления информацией о студентах:
- личные данные (физические лица, контакты, паспорта)
- академические данные (группы, кафедры, дисциплины, учебные планы)
- результаты ЕГЭ и документы об образовании
- роли студентов и связанные заказы

База демонстрирует умение:
- проектировать реляционные таблицы с внешними ключами
- использовать последовательности (SEQUENCE) для автогенерации ключей
- проверять целостность данных с помощью ограничений (CHECK)

## 🗂️ Основные таблицы

- `physical_persons` — информация о студентах
- `passport` — данные паспортов студентов
- `contacts` — контакты студентов
- `departments` — кафедры
- `disciplines` — дисциплины и их связь с кафедрами
- `groups` — студенческие группы
- `ege_results` и `ege_subjects` — результаты ЕГЭ
- `study_plans` и `study_plan_disciplines` — учебные планы
- `roles` и `person_roles` — роли студентов

## 🚀 Как запустить

1. Установи PostgreSQL 16+
2. Создай базу данных:  
   ```bash
   createdb student_db
3.Выполни скрипт:
psql -U your_user -d student_db -f StudentSql.sql
