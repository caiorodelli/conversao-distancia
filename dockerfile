FROM python:3.12-slim

WORKDIR /app
COPY src/ .
RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "main:app"]
