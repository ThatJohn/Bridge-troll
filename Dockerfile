# Build image with `docker build -t bridge-troll-app .`
# Run the app for development (local source directory mounted inside of the container):
#   * Linux/mac: `docker run -it --rm -v $(pwd):/app -p 3000:3000 bridge-troll-app`
#   * Window (use Powershell): `docker run -it --rm -v ${PWD}:/app -p 3000:3000 bridge-troll-app`
# Open browser to http://localhost:3000
FROM ubuntu:xenial

RUN apt-get update && \
  apt-get install -y  \
    git \
    curl \
    bzip2 \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    npm \
    libsqlite3-dev \
    phantomjs \
    libpq-dev \
    tzdata

EXPOSE 3000
WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN echo '{ "allow_root": true }' > ~/.bowerrc && \
  git clone https://github.com/creationix/nvm.git ~/.nvm && \
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.profile && \
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.profile && \
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile && \
  echo 'eval "$(rbenv init -)"' >> ~/.profile && \
  . ~/.profile && \
  nvm install node && \
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build && \
  rbenv install 2.3.1 && \
  rbenv local 2.3.1 && \
  gem install bundler && \
  bundle install

CMD ["/bin/bash", "--login", "-c", "bin/setup && bin/rake db:seed && bin/rails server -b 0.0.0.0"]
