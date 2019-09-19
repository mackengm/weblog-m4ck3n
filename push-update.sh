#!/bin/bash
cd ~/Projects/weblog-m4ck3n
perl -i.bak -lpe 'BEGIN { sub inc { my ($num) = @_; ++$num } } s/(build = )(\d+)/$1 . (inc($2))/eg' config.toml
docker image build -t blog-m4-update .
docker login
docker tag blog-m4-update summittdweller/weblog-m4ck3n:latest
docker push summittdweller/weblog-m4ck3n:latest
