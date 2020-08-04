docker-sinatra
==============

Simple sinatra image suitable for demo purpose. Replace `main.rb` to your `main.rb` with volume mount etc.

```
# In local with your tmp/main.rb
docker run -it -p 8080:80 -v $PWD/tmp:/app taiki45/sinatra
```
