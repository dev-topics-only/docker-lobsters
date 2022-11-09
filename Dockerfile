# Lobsters
#
# VERSION latest
FROM pipecraftnet/lobsters-base:dev

# Copy lobsters into the container.
COPY ./lobsters ./docker-assets /lobsters/

# Set proper permissions and move assets and configs.
RUN set -xe; \
    mv /lobsters/Gemfile.bak /lobsters/Gemfile; \
    mv /lobsters/Gemfile.lock.bak /lobsters/Gemfile.lock; \
    chown -R lobsters:lobsters /lobsters; \
    mv /lobsters/docker-entrypoint.sh /usr/local/bin/; \
    chmod 755 /usr/local/bin/docker-entrypoint.sh;

# Drop down to unprivileged users
USER lobsters

# Set our working directory.
WORKDIR /lobsters/

# Set environment variables.
ENV MARIADB_HOST="mariadb" \
    MARIADB_PORT="3306" \
    MARIADB_PASSWORD="password" \
    MARIADB_USER="root" \
    LOBSTER_DATABASE="lobsters" \
    LOBSTER_HOSTNAME="localhost" \
    LOBSTER_SITE_NAME="Example News" \
    RAILS_ENV="development" \
    SECRET_KEY="" \
    GEM_HOME="/lobsters/.gem" \
    GEM_PATH="/lobsters/.gem" \
    BUNDLE_PATH="/lobsters/.bundle" \
    RAILS_MAX_THREADS="5" \
    SMTP_HOST="127.0.0.1" \
    SMTP_PORT="25" \
    SMTP_STARTTLS_AUTO="true" \
    SMTP_USERNAME="lobsters" \
    SMTP_PASSWORD="lobsters" \
    RAILS_LOG_TO_STDOUT="1" \
    PATH="/lobsters/.gem/ruby/2.7.0/bin:$PATH"

# Expose HTTP port.
EXPOSE 3000

# Execute our entry script.
CMD ["/usr/local/bin/docker-entrypoint.sh"]
