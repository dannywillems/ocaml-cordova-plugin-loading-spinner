# ocaml-cordova-plugin-loading-spinner

Binding to
[cordova-plugin-loading-spinner](https://github.com/mobimentum/phonegap-plugin-loading-spinner)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-loading-spinner-example).

## Compatibility

```
This plugin works on PhoneGap/Cordova 3.x. It's currently not tested against
PhoneGap 4.x and known not to be working on PhoneGap/Cordova 5.x and above.
```

Source: [cordova-plugin-loading-spinner](https://github.com/mobimentum/phonegap-plugin-loading-spinner)

## What does cordova-plugin-loading-spinner do ?

```
PhoneGap 3 plugin to show a loading spinner with optional dark overlay.
```

Source: [cordova-plugin-loading-spinner](https://github.com/mobimentum/phonegap-plugin-loading-spinner)

## How to use ?

See the official documentation
[cordova-plugin-loading-spinner](https://github.com/mobimentum/phonegap-plugin-loading-spinner)

## ! BE CAREFUL !

The device plugin creates a new object called *window.spinnerplugin*, but the object is
available when the *deviceready* event is handled.

We don't provide a *spinnerplugin* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *spinnerplugin* will be set to **undefined**
because the *navigator.spinnerplugin* javascript object doesn't exist when we create
the variable.

Instead, we provide a function *Loading_spinner.loading_spinner* of type unit -> Loading_spinner.loading_spinner
Js.t which does the binding when you call it.
So, use

```OCaml
let on_device_ready _ =
  let c = Loading_spinner.loading_spinner () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
