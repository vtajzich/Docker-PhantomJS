FROM debian:7.9
RUN apt-get update -y && apt-get install -y git build-essential g++ flex bison gperf ruby perl libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev libpng-dev libjpeg-dev python libx11-dev libxext-dev

RUN mkdir /home/phantomjs

WORKDIR /opt

RUN git clone --recurse-submodules git://github.com/ariya/phantomjs.git
RUN ./phantomjs/build.py

RUN ln -s /opt/phantomjs/bin/phantomjs /usr/local/bin/phantomjs

VOLUME /home/phantomjs

WORKDIR /home/phantomjs

EXPOSE 23983

CMD phantomjs --webdriver=23983