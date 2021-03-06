docker-sinatra
==============

Simple sinatra image suitable for demo purpose. Replace `app.rb` to your `app.rb` with volume mount etc.

Local Docker with your `tmp/app.rb`:

```ruby
# tmp/app.rb
require 'sinatra'

get('/') { 'test' }
```

```bash
docker run -it -p 8080:80 -v $PWD/tmp:/src taiki45/sinatra
```

Kubernetes:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
    spec:
      containers:
      - image: taiki45/sinatra
        imagePullPolicy: IfNotPresent
        name: hello
        ports:
        - containerPort: 80
        volumeMounts:
          - name: app-file
            mountPath: /src
      volumes:
        - name: app-file
          configMap:
            name: hello-app
---
kind: ConfigMap
apiVersion: v1
metadata:
  name: hello-app
data:
  app.rb: |
    require 'sinatra'

    get '/' do
      'hello'
    end
```

When changes the code, run `kubectl rollout restart deployments` after applying the manifest.
