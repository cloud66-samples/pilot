ARG $BANANA
FROM $BANANA

ENV APP_HOME /go/src/app
COPY . $APP_HOME
WORKDIR $APP_HOME

RUN go get -d -v ./...
RUN go build
