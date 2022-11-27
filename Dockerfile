FROM python:3.8-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN pip install pipenv

COPY Pipfile /app/Pipfile
COPY Pipfile.lock /app/Pipfile.lock

RUN pipenv install --deploy --ignore-pipfile

COPY src/ /app

ENTRYPOINT [ "/bin/sh"]
CMD ["-c", "pipenv run python main.py"]