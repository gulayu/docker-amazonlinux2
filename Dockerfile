FROM amazonlinux:2

# install amazon-linux-extras install
RUN amazon-linux-extras install -y

# yum update & install
RUN yum update -y \
    && yum install \
        systemd \
        tar \
        unzip \
        sudo \
        -y

# install node.js, yarn
RUN curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo

# yum update & install ruby-related
RUN yum update -y \
    && yum install \
        ruby-devel \
        rpm-build \
        git \
        gcc \
        gcc-c++ \
        zlib-devel \
        openssl-devel \
        rubygems-devel \
        nodejs \
        yarn \
        make \
        -y

# install aws cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install

# create user
RUN useradd "ec2-user" && echo "ec2-user ALL=NOPASSWD: ALL" >> /etc/sudoers

# install for develop, etc.
RUN sudo amazon-linux-extras install ruby3.0 -y

# install rails
WORKDIR /home/ec2-user/myapp
COPY Gemfile /home/ec2-user/myapp/Gemfile
RUN bundle install

# init
CMD ["/sbin/init"]