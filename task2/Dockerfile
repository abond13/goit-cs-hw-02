# Docker-команда FROM вказує базовий образ контейнера
# Наш базовий образ - це Linux з попередньо встановленим python-3.10
FROM python:3.10

# Встановимо змінну середовища
ENV APP_HOME /app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Скопіюємо проєкт в робочу директорію контейнера
RUN git clone https://github.com/GoIT-Python-Web/Computer-Systems-hw02 /app

# Виправляємо SQLALCHEMY_DATABASE_URL в db.py
RUN sed -i 's#"postgresql+psycopg2://postgres:567234@localhost:5432/hw02"#"postgresql+psycopg2://postgres:567234@postgres:5432/hw02"#g' /app/conf/db.py

# Встановимо залежності всередині контейнера
RUN pip install -r requirements.txt

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 8000

# Запустимо наш застосунок всередині контейнера
ENTRYPOINT ["python", "main.py"]