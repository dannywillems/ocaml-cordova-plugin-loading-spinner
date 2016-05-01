# ocaml-cordova-plugin-loading-spinner

* gen_js_api (master branch): [![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-loading-spinner.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-loading-spinner)

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

## Repository branches and tags

We are migrating bindings from
[js_of_ocaml](https://github.com/ocsigen/js_of_ocaml) (low level bindings) to
[gen_js_api](https://github.com/lexifi/gen_js_api) (high level bindings).

The gen_js_api binding allows to use *pure* ocaml types (you don't have to use
the ## syntax from js_of_ocaml or Js.string type but only # and string type).

The js_of_ocaml version is available in the branch
[*js_of_ocaml*](https://github.com/dannywillems/ocaml-cordova-plugin-loading-spinner/tree/js_of_ocaml)
but we **recommend** to use the gen_js_api version which is the master branch.

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-loading-spinner https://github.com/dannywillems/ocaml-cordova-plugin-loading-spinner.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-loading-spinner [...] -linkpkg [other arguments]
```

Don't forget to install the cordova plugin loading spinner with
```Shell
cordova plugin add https://github.com/mobimentum/phonegap-plugin-loading-spinner.git
```

## How to use ?

See the official documentation
[cordova-plugin-loading-spinner](https://github.com/mobimentum/phonegap-plugin-loading-spinner)

## ! BE CAREFUL !

The device plugin creates a new object called *window.spinnerplugin*, but the object is
available when the *deviceready* event is handled.

Instead, we provide a function *Cordova_loading_spinner.t* of type unit ->
Cordova_loading_spinner.loading_spinner which does the binding when you call it.
So, use (with js_of_ocaml)

```OCaml
let on_device_ready _ =
  let l = Cordova_loading_spinner.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
