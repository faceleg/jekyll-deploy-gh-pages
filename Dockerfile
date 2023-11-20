FROM ruby:2.7
# Set default locale for the environment	
ENV LC_ALL C.UTF-8	
ENV LANG en_US.UTF-8	
ENV LANGUAGE en_US.UTF-8	

LABEL "com.github.actions.name"="Build & Deploy to GitHub Pages"	
LABEL "com.github.actions.description"="Builds & deploys Jekyll to gh-pages branch of the same repository. "	
LABEL "com.github.actions.icon"="globe"	
LABEL "com.github.actions.color"="green"	

LABEL "repository"="http://github.com/Li357/jekyll-deploy-gh-pages"	

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install nodejs

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
