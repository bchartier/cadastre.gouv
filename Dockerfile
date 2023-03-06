# syntax=docker/dockerfile:1.4
FROM osgeo/gdal:ubuntu-full-latest

RUN apt update
RUN apt install -y python3
RUN apt install -y python3-pip

WORKDIR /app

COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt

COPY . .

ENTRYPOINT ["python3"]
CMD ["proxycad.py"]
