FROM python:3.11-slim AS base
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
FROM base AS final
COPY . .

EXPOSE 5000
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000", "--log-file", "-", "--access-logfile", "-", "--workers", "2", "--keep-alive", "0"]
