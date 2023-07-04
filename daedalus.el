(require 'tree-sitter)
(require 'tree-sitter-hl)



(defun file-to-string (file)
  "File to string function"
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))



;;;###autoload
(define-derived-mode daedalus-mode prog-mode "Daedalus mode"
  (run-hooks 'daedalus-mode-hook)
  (setq tree-sitter-hl-default-patterns
        [

         (comment) @comment
         (string_literal) @string
         ;; (number_literal) @number

         ; Keywords
         [
          ; base keywords
          "if"
          "else"
          "func"
          "class"
          "instance"
          "prototype"
          "return"
          "var"
          ; other zPE keywords
          "while"
          "break"
          "continue"
          "namespace"
          ] @keyword

         [
          ; macro keywords
          "#if"
          "#elif"
          "#else"
          "#endif"
          ] @doc

         [
          ","
          ";"
          "."
          ] @punctuation.delimiter

         [
          "("
          ")"
          "["
          "]"
          "{"
          "}"
          ] @punctuation.bracket

         [
          "+"
          "-"
          "*"
          "/"
          "||"
          "&&"
          "|"
          "^"
          "&"
          "=="
          "!="
          ">"
          ">="
          "<="
          "<"
          "<<"
          ">>"
          "!"
          "~"
          ] @operator

         [
          "int"
          "void"
          "float"
          "string"
          "func"
          "event"
          ] @type.builtin


         (parameter_list
          (parameter_declaration
           (identifier) @parameter))

         (call_expression
          (identifier) @function.call)

         (function_definition
          (identifier) @function.definition)

         (variable_definition
          type: (identifier) @type )

         (instance_definition
          parentReference: (identifier) @type)

         (instance_declaration
          parentReference: (identifier) @type)

         (field_expression
          field: (identifier) @attribute)

         (field_expression
          field: (array_expression
                  array_id: (identifier) @attribute))

         (variable_builtin) @variable.builtin

         (function_builtin) @property ; purple - light
         ;(function_builtin) @doc      ; gray - lighter comment
         ;(function_builtin) @escape  ; blue
         (function_zpe) @constructor
         ]
        )
  (tree-sitter-hl-mode))
;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.[dD]\\'" . daedalus-mode))
  (add-to-list 'tree-sitter-major-mode-language-alist '(daedalus-mode . daedalus)))


;; (define-derived-mode daedalus-mode prog-mode "Daedalus mode"

;;   (setq major-mode 'daedalus-mode)
;;   (setq mode-name "Daedalus")
;;   "Major mode for Daedalus scripting language.")

;; (setq comment-start "//")

(provide 'daedalus-mode)
