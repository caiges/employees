FROM ruby:2.5 as builder
COPY employeesdb /usr/src/app/
WORKDIR /usr/src/app
RUN bundle
RUN rake build

FROM ruby:2.5
COPY --from=builder /usr/src/app/pkg/employeesdb-0.1.0.gem /tmp/
RUN gem install /tmp/employeesdb-0.1.0.gem
ENTRYPOINT [ "employeesdb" ]
