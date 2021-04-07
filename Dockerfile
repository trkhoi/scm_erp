#
# Step 1 - Build the OTP binary
#
FROM elixir:1.9-alpine AS builder

ENV APP_NAME=scm
ENV MIX_ENV=prod

ARG SECRET_KEY_BASE=secret
WORKDIR /build

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add make g++ git openssl-dev python3 yaml-dev

RUN mix local.rebar --force && \
    mix local.hex --force

COPY mix.* ./
COPY config config
COPY lib lib
COPY priv priv
COPY mix.exs .
COPY mix.lock .

RUN mix deps.get --only prod
RUN mix deps.compile --only prod
RUN mix compile --only prod

RUN mix release && \
    mkdir -p /opt/build && \    
    cp -r _build/prod/rel/${APP_NAME} /opt/build/

#
# Step 2 - Build a lean runtime container
#
FROM alpine:3.10

ENV APP_NAME=scm

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add bash openssl erlang-crypto yaml-dev

WORKDIR /opt/${APP_NAME}

# Copy the OTP binary and assets deps from the build step
COPY --from=builder /opt/build/${APP_NAME} /opt/${APP_NAME}


# Copy the entrypoint script
COPY scripts/docker-entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

# Create a non-root user
RUN adduser -D ${APP_NAME} && chown -R ${APP_NAME}: /opt/${APP_NAME}
USER ${APP_NAME}

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 4000
CMD ["start"]