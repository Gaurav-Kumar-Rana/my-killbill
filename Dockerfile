FROM ruby:3.2.2

COPY killbill-admin-ui-standalone ./kaui

WORKDIR /kaui

RUN gem uninstall bundler && gem install bundler -v 2.4.19

RUN mkdir -m 700 /root/.ssh && \
    touch -m 600 /root/.ssh/known_hosts && \
    ssh-keyscan github.com > /root/.ssh/known_hosts
RUN git config --global url."https://${TOKEN}:x-oauth-basic@github.com/".insteadOf https://github.com/

RUN --mount=type=ssh bundle _2.4.19_ install --without test

CMD ["./bin/rails", "server", "-e", "development", "-p", "8080", "-b", "0.0.0.0"]