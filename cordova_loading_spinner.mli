(* -------------------------------------------------------------------------- *)
type options = private Ojs.t

(* Abstract constructor for options. *)
val create_options :
  ?overlay:(bool [@js.default true])                  ->
  ?timeout:(int [@js.default 0])                      ->
  ?fullscreen:(bool [@js.default false])              ->
  unit                                                ->
  options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* show ?[options] *)
val show :
  ?options:(options [@js.default create_options ()])  ->
  unit                                                ->
  unit
[@@js.global "window.spinnerplugin.show"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* hide *)
val hide : unit -> unit
[@@js.global "window.spinnerplugin.hide"]
(* -------------------------------------------------------------------------- *)
