# This is the main Dockerfile for this repository
FROM ruby:3.1.4

# Set default locale for the environment	
ENV LC_ALL C.UTF-8	
ENV LANG en_US.UTF-8	
ENV LANGUAGE en_US.UTF-8	

LABEL "com.github.actions.name"="Build & Deploy to GitHub Pages"	
LABEL "com.github.actions.description"="Builds & deploys Jekyll to gh-pages branch of the same repository. "	
LABEL "com.github.actions.icon"="globe"	
LABEL "com.github.actions.color"="green"	

LABEL "repository"="http://github.com/Li357/jekyll-deploy-gh-pages"	

# Install NodeJS
RUN apt-get update && apt-get install -y ca-certificates curl gnupg && apt-get clean
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
ENV NODE_MAJOR=21
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && apt-get install nodejs -y && apt-get clean

# Install image compressor/manager
RUN apt-get install -y libvips imagemagick libvips-tools && apt-get clean

# Install OpenJDK-11
RUN apt-get install -y default-jre && \
    apt-get clean;
