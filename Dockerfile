FROM alpine:3.13.2
MAINTAINER fanhuanji
LABEL name="nut" version="3.1" author="fanhuanji"
COPY nut-3.1.zip nut-3.1.zip
COPY pip.zip pip.zip
COPY *.whl ./
RUN apk update \
  && apk add python3=3.8.7 jpeg-dev \
  && python3 pip.zip/pip install --no-index ./*.whl \
  && mkdir /app && unzip nut-3.1.zip -q -d /app \
  && rm -f ./nut-3.1.zip \
  && rm -f ./*.whl \
  && rm -f ./pip.zip \
  && rm -f get-pip.py 

EXPOSE 9000
CMD ["python3", "/app/nut-3.1/nut.py", "-S"]

