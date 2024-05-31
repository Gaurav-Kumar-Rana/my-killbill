RUN git clone --depth 1 https://github.com/killbill/killbill-admin-ui-standalone.git -b kaui-standalone-3.0.4 /kaui

WORKDIR /kaui

COPY ./docker/kaui/Gemfile .
COPY ./docker/kaui/Gemfile.overlay .
COPY ./docker/kaui/database.yml config/database.yml

RUN gem uninstall bundler && gem install bundler -v 2.4.19

RUN --mount=type=secret,id=TOKEN \
    BUNDLE_RUBYGEMS__PKG__GITHUB__COM=$(cat /run/secrets/TOKEN) \
    BUNDLE_GITHUB__COM=$(cat /run/secrets/TOKEN) \
    bundle _2.4.19_ install --without test

CMD ["./bin/rails", "server", "-e", "development", "-p", "8080", "-b", "0.0.0.0"]