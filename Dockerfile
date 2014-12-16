FROM python:2.7

# foreign dependencies
RUN apt-get update
RUN apt-get install -y graphviz

# app-specific
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt

CMD python run.py
