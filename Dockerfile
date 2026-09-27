FROM python:3.11-slim

RUN groupadd -g 10001 appuser && \
    useradd -u 10001 -g 10001 -m appuser

WORKDIR /app

COPY --chown=appuser:appuser app/app.py .

RUN pip install --no-cache-dir flask

USER 10001

EXPOSE 5000

CMD ["python", "app.py"]