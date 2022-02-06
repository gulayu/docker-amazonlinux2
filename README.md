# docker-amazonlinux2-rails
amazon-linux-2のイメージににrubyとrailsをインストールするところまでを実行します。

## 環境
mac mojave 10.14.6  
Docker version 20.10.8, build 3967b7d  
docker-compose version 1.29.2, build 5becea4c  

## 手順
### repositoryからcloneしてくる
お好きなところで
```sh
git clone https://github.com/gulayu/docker-amazonlinux2-rails.git
```

### コンテナを作成する
```sh
cd docker-amazonlinux2-rails
docker-compose up -d --build
```

### コンテナに入ってみる
```sh
docker-compose exec app bash

bash-4.2#  su - ec2-user
Last login: Sun Feb  6 06:30:29 UTC 2022 on pts/0
[ec2-user@d0459551b39b ~]$ pwd
/home/ec2-user
```

### Dockerfileでインストールした諸々を確認する
```sh
[ec2-user@d0459551b39b ~]$ git --version
git version 2.32.0
[ec2-user@d0459551b39b ~]$ ruby -v
ruby 3.0.3p157 (2021-11-24 revision 3fb7d2cadc) [x86_64-linux]
[ec2-user@d0459551b39b ~]$ rails -v
Rails 6.1.4
[ec2-user@d0459551b39b ~]$ node -v
v12.22.10
[ec2-user@d0459551b39b ~]$ yarn -v
1.22.17
[ec2-user@d0459551b39b ~]$ make -v
GNU Make 3.82
```
