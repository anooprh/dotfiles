;;; chess-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (chess-create-display chess) "chess" "chess.el"
;;;;;;  (21679 23782 814458 855000))
;;; Generated autoloads from chess.el

(autoload 'chess "chess" "\
Start a game of chess, playing against ENGINE (a module name).
With prefix argument, prompt for the engine to play against.
Otherwise use `chess-default-engine' to determine the engine.

\(fn &optional ENGINE DISABLE-POPUP ENGINE-RESPONSE-HANDLER &rest ENGINE-CTOR-ARGS)" t nil)

(defalias 'chess-session 'chess)

(define-key menu-bar-games-menu [chess] '(menu-item "Chess" chess :help "Play Chess"))

(autoload 'chess-create-display "chess" "\
Create a display, letting the user's customization decide the style.
If MODULES-TOO is non-nil, also create and associate the modules
listed in `chess-default-modules'.

\(fn PERSPECTIVE &optional MODULES-TOO)" nil nil)

;;;***

;;;### (autoloads (chess-ics) "chess-ics" "chess-ics.el" (21679 23778
;;;;;;  457792 365000))
;;; Generated autoloads from chess-ics.el

(autoload 'chess-ics "chess-ics" "\
Connect to an Internet Chess Server.

\(fn SERVER PORT &optional HANDLE PASSWORD-OR-FILENAME HELPER &rest HELPER-ARGS)" t nil)

(define-key menu-bar-games-menu [chess-ics] '(menu-item "Internet Chess Servers" chess-ics :help "Play Chess on the Internet"))

;;;***

;;;### (autoloads (chess-link) "chess-link" "chess-link.el" (21679
;;;;;;  23777 974459 51000))
;;; Generated autoloads from chess-link.el

(autoload 'chess-link "chess-link" "\
Play out a game between two engines, and watch the progress.
If you want to run an engine as a bot, make the transport the first
engine, and the computer the second engine.

\(fn FIRST-ENGINE-TYPE SECOND-ENGINE-TYPE)" t nil)

;;;***

;;;### (autoloads (chess-pgn-mode chess-pgn-read) "chess-pgn" "chess-pgn.el"
;;;;;;  (21679 23780 161125 630000))
;;; Generated autoloads from chess-pgn.el

(autoload 'chess-pgn-read "chess-pgn" "\
Read and display a PGN game after point.

\(fn &optional FILE)" t nil)

(autoload 'chess-pgn-mode "chess-pgn" "\
A mode for editing chess PGN files.

\(fn)" t nil)

(defalias 'pgn-mode 'chess-pgn-mode)

(add-to-list 'auto-mode-alist '("\\.pgn\\'" . chess-pgn-mode))

;;;***

;;;### (autoloads (chess-puzzle) "chess-puzzle" "chess-puzzle.el"
;;;;;;  (21679 23778 534459 28000))
;;; Generated autoloads from chess-puzzle.el

(autoload 'chess-puzzle "chess-puzzle" "\
Pick a random puzzle from FILE, and solve it against the default engine.
The spacebar in the display buffer is bound to `chess-puzzle-next',
making it easy to go on to the next puzzle once you've solved one.

\(fn FILE &optional INDEX)" t nil)

;;;***

;;;### (autoloads (chess-fischer-random-position) "chess-random"
;;;;;;  "chess-random.el" (21679 23782 454458 869000))
;;; Generated autoloads from chess-random.el

(autoload 'chess-fischer-random-position "chess-random" "\
Generate a Fischer Random style position.

\(fn)" nil nil)

;;;***

;;;### (autoloads (chess-tutorial) "chess-tutorial" "chess-tutorial.el"
;;;;;;  (21679 23785 364458 750000))
;;; Generated autoloads from chess-tutorial.el

(autoload 'chess-tutorial "chess-tutorial" "\
A simple chess training display.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("chess-ai.el" "chess-algebraic.el" "chess-announce.el"
;;;;;;  "chess-autosave.el" "chess-chat.el" "chess-clock.el" "chess-common.el"
;;;;;;  "chess-crafty.el" "chess-database.el" "chess-display.el"
;;;;;;  "chess-eco.el" "chess-engine.el" "chess-epd.el" "chess-fen.el"
;;;;;;  "chess-file.el" "chess-fruit.el" "chess-game.el" "chess-german.el"
;;;;;;  "chess-glaurung.el" "chess-gnuchess.el" "chess-ics1.el" "chess-images.el"
;;;;;;  "chess-input.el" "chess-irc.el" "chess-kibitz.el" "chess-log.el"
;;;;;;  "chess-message.el" "chess-module.el" "chess-network.el" "chess-none.el"
;;;;;;  "chess-perft.el" "chess-phalanx.el" "chess-pkg.el" "chess-plain.el"
;;;;;;  "chess-ply.el" "chess-polyglot.el" "chess-pos.el" "chess-scid.el"
;;;;;;  "chess-sjeng.el" "chess-sound.el" "chess-stockfish.el" "chess-transport.el"
;;;;;;  "chess-ucb.el" "chess-uci.el" "chess-var.el") (21679 23863
;;;;;;  710967 851000))

;;;***

(provide 'chess-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; chess-autoloads.el ends here
