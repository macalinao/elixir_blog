FROM josephyi/phoenixframework
MAINTAINER Ian Macalinao <me@ian.pw>

ADD . /app
WORKDIR /app

RUN mix do local.rebar, local.hex --force
RUN mix deps.get, compile
