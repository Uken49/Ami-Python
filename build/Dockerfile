# syntax=docker/dockerfile:1
FROM ubuntu:20.04
COPY dependency.sh .
COPY python/main.py /home/main.py
RUN bash dependency.sh
CMD ["/home/main.py"]
ENTRYPOINT ["python3"]
