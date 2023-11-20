FROM python:3.10.12

RUN mkdir /booking

WORKDIR /booking

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN chmod a+x /booking/docker/*.sh

# КОММЕНТАРИЙ НИЖЕ ТОЛЬКО ДЛЯ DOCKER COMPOSE. РАСКОММЕНТИРУЙТЕ КОД, ЕСЛИ ВЫ ИСПОЛЬЗУЕТЕ ТОЛЬКО DOCKERFILE
# Эта команда выведена в bash скрипт
# RUN alembic upgrade head

# КОММЕНТАРИЙ НИЖЕ ТОЛЬКО ДЛЯ DOCKER COMPOSE. РАСКОММЕНТИРУЙТЕ КОД, ЕСЛИ ВЫ ИСПОЛЬЗУЕТЕ ТОЛЬКО DOCKERFILE
# Эта команда также выведена в bash скрипт
CMD ["gunicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8000"]
