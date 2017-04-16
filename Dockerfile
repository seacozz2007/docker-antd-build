FROM centos:7
MAINTAINER Eric <eric.zhang@famesmart.com>

#install npm cnpm
RUN  curl -sL -o /etc/yum.repos.d/khara-nodejs.repo https://copr.fedoraproject.org/coprs/khara/nodejs/repo/epel-7/khara-nodejs-epel-7.repo && \
    yum install -y nodejs nodejs-npm && \
    npm install cnpm -g --registry=https://registry.npm.taobao.org && \

#antd-admin
    yum install git && \
    git clone https://github.com/zuiidea/antd-admin.git /tmp/antd-admin && \
    cd /tmp/antd-admin && \
    cnpm i  && \
    cnpm install jsonp  && \
    cd /tmp && \
    rm -rf -y antd-admin


#Create dist folder
VOLUME ["/data/www"]

#Start
ADD start.sh /
RUN chmod +x /start.sh

#Start it
ENTRYPOINT ["/start.sh"]

#Start web server
#CMD ["/bin/bash", "/start.sh"]
