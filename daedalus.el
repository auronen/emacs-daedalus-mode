;; 
;; 

(defvar daedalus-mode-hook nil)

(defvar daedalus-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for Daedalus major mode")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.d\\'" . daedalus-mode))

(defconst daedalus-font-lock-keywords-1
  (list
   '("\\<\\(FLOAT\\|INT\\|STRING\\|VOID\\|float\\|int\\|string\\|void\\)\\>" . font-lock-builtin-face)
   '("\\('\\w*'\\)" . font-lock-variable-name-face))
  "Minimal highlighting expressions for daedalus mode")

(defconst daedalus-font-lock-keywords-2
  (append daedalus-font-lock-keywords-1
		  (list
		   '("\\<\\(BREAK\\|C\\(?:LASS\\|ON\\(?:ST\\|TINUE\\)\\)\\|ELSE\\(?:IF\\)?\\|FUNC\\|I\\(?:F\\|NSTANCE\\)\\|PROTOTYPE\\|RETURN\\|VAR\\|WHILE\\|break\\|c\\(?:lass\\|on\\(?:st\\|tinue\\)\\)\\|else\\(?:if\\)?\\|func\\|i\\(?:f\\|nstance\\)\\|prototype\\|return\\|var\\|while\\)\\>" . font-lock-keyword-face)
		   '("\\<\\(HERO\\|ITEM\\|NULL\\|OTHER\\|SELF\\|VICTIM\\|hero\\|item\\|null\\|other\\|self\\|victim\\)\\>" . font-lock-constant-face)))
  "Additional Keywords to highlight in DAEDALUS mode")

;(regexp-opt '("TRUE" "FALSE" "true" "false") t)

(defconst daedalus-font-lock-keywords-3
  (append daedalus-font-lock-keywords-2
		  (list
		   '("\\<\\(FALSE\\|TRUE\\|\\(?:fals\\|tru\\)e\\)\\>" . font-lock-constant-face)))
  "Balls-out highlighting in Daedalus mode")


(defvar daedalus-font-lock-keywords daedalus-font-lock-keywords-3
  "Default highlighting expressions for Daedalus mode")
;; ==============
;; Indentation
;; ==============


(defconst daedalus-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; underscore is part of a word
    (modify-syntax-entry ?_ "w" table)

    (modify-syntax-entry ?/ ". 124b" table)
    (modify-syntax-entry ?* ". 23" table)
    (modify-syntax-entry ?\n "> b" table)

    table)
"Syntax table for Daedalus mode")


(defun daedalus-mode ()
  "Major mode for editing Daedalus scripts"
;  (interactive)
;  (message "%s" (propertize "This runs :okaychamp:" 'face '(:foreground "red")))
  (kill-all-local-variables)
  (set-syntax-table daedalus-mode-syntax-table)
  (use-local-map daedalus-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(daedalus-font-lock-keywords))
  (setq c-basic-offset 4) 
  (setq major-mode 'daedalus-mode)
  (setq mode-name "Daedalus")
  (setq-default tab-width 4)
  (setq-default c-basic-offset 4)
  (setq c-default-style (cons '(c-mode . "k&r") c-default-style))

  (run-hooks 'daedalus-mode-hook))


(define-derived-mode daedalus-mode c-mode "Daedalus Mode"
  :syntax-table daedalus-mode-syntax-table


(message "%s" (propertize "Daedalus mode on" 'face '(:foreground "red")))
;  (kill-all-local-variables)
  (set-syntax-table daedalus-mode-syntax-table)
  (use-local-map daedalus-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(daedalus-font-lock-keywords))
  (setq c-basic-offset 4) 
  (setq-default tab-width 4)
  (run-hooks 'daedalus-mode-hook)
  (setq c-default-style (cons '(c-mode . "k&r") c-default-style))  
  (font-lock-fontify-buffer)

  (setq major-mode 'daedalus-mode)
  (setq mode-name "Daedalus")
  (yas-reload-all)
  "Major mode for Daedalus scripting language.")


(provide 'daedalus-mode)


;;; KEYWORDS
;(regexp-opt '(
;"class"
;"instance"
;"prototype"
;
;"var"
;"const"
;"func"
;
;"if"
;"else"
;"elseif"
;
;"return"
;
;"while"
;"continue"
;"break"
;
;"CLASS"
;"INSTANCE"
;"PROTOTYPE"
;
;"VAR"
;"CONST"
;"FUNC"
;
;"IF"
;"ELSE"
;"ELSEIF"
;
;"RETURN"
;
;"WHILE"
;"CONTINUE"
;"BREAK"
;) t)
;
;
;
;
;
;; Built-in constants
;(regexp-opt '(
;"null"
;
;"self"
;"hero"
;"other"
;"victim"
;
;"item"
;
;
;"NULL"
;
;"SELF"
;"HERO"
;"OTHER"
;"VICTIM"
;
;"ITEM"
;
;) t)



;
;
;
;;; Types
;(regexp-opt '(
;"void"
;"int"
;"string"
;"float"
;
;"VOID"
;"INT"
;"STRING"
;"FLOAT"
;) t)
;





;(regexp-opt '(
;"true"
;"false"
;
;"TRUE"
;"FALSE"
;) t)





