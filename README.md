## RhoConnect Push Demo

Sample applications for my RhoConnect Push presentation:

* rhostore-with-plugin: This is the sample rails application that serves the "backend"
* rhoapp:               Vanilla RhoConnect application (see 'settings.yml' file)
* store-manager:        Rhodes application that is setup for push using rhoconnect-push service

## Docs
<http://docs.rhomobile.com/rhoconnect/push>

## How to create store-manager

1) Create app

```
$ rhodes app store-manager
$ cd store-manager/
$ rake -T
$ rake clean:iphone
$ rhodes model product brand,name,price,quantity,sku
```

2) # Edit rhoconfig.txt

```
start_path = '/app/Product'
...
# Configure push server
Push.rhoconnect.pushAppName = 'someappname'
Push.rhoconnect.pushServer = 'http://192.168.1.8:8675'

# Configure sync server
syncserver = 'http://192.168.1.8:9292'
```

3) Edit app/index.erb

```
    <li><a href="Product">Products</a></li>
```

4) Edit app/Product/product.rb

```
  enable :sync
```

5) Edit app/application.rb

```
    ...
    # Start listening for push messages. Parameter is an url to push_callback method
    Rho::Push.startNotifications '/app/Settings/push_callback'
    ...
```

5) Edit app/Settings/controller.rb

    - Register for push service in login_callback
    - def registration_callback method
    - def push_callback

6) Check that build.yml has there extensiions:

```
extensions: ["rhoconnect-client", "rhoconnect-push"]
```

7) Start android AVD/attach android phone and copy these apks there

```
  adb -e install ../rhoconnect-push-service.apk
  adb -e install bin/target/android/store-manager-debug.apk
```

7) Run it

