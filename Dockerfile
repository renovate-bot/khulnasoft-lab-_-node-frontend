FROM node:14

# Install Puppeteer dependencies
RUN apt-get update && apt-get install -y wget gnupg2 ca-certificates --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y wget gnupg2 ca-certificates \
    && rm -rf /src/*.deb

# Set the working directory
WORKDIR /app

# Install Puppeteer
RUN npm install puppeteer

# Copy nginx.conf file
COPY ./nginx.conf /nginx.conf
