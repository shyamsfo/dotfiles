;; Many ideas taken from sample files at http://www.dotemacs.de/index.html


(defun start-new-line-after ()
  "Start a new line AFTER the current line."
  (move-end-of-line)
  (newline))




(global-set-key "\C-xc" 'compile)
(global-set-key [(control \;)] 'other-window)
(setq c-basic-offset 3)
(setq c-basic-indent 3)
(setq tab-width 3)
(setq indent-tabs-mode nil)
;; Give me colours in major editing modes!!!!!
(require 'font-lock)
(global-font-lock-mode t)

(set-background-color "black")
(set-foreground-color "white")

;; Show matching parenthesis. How can you live without it.
(show-paren-mode t)

;; Set the default font

;(set-default-font "-bitstream-charter-medium-r-normal--12-120-75-75-p-67-iso8859-1")
;(set-default-font "-bitstream-terminal-medium-r-normal--0-0-100-100-c-0-iso8859-1")
;(set-default-font "-bitstream-terminal-medium-r-normal--18-140-100-100-c-110-dec-dectech") 
;(set-default-font "-bitstream-charter-medium-r-normal--11-80-100-100-p-61-iso8859-1")

;(set-default-font "-xos4-terminus-bold-r-normal--16-160-72-72-c-80-iso8859-13")
;(set-default-font "-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso8859-13")
(set-default-font "-xos4-terminus-bold-r-normal--14-140-72-72-c-80-iso8859-9")
(set-default-font "-*-terminus-*-*-*-*-14-*-*-*-*-*-*-*")


(cond ((fboundp 'global-font-lock-mode) 
;; Turn on font-lock in all modes that support it 
(global-font-lock-mode t) 
;; Maximum colors 
(setq font-lock-maximum-decoration t))) 

;; Used to these colors for long whiles now.
;;(set-foreground-color "white")
;;(set-background-color "gray21")
;;(set-background-color "RGB:0/32/64")

;; Plan to store all packages here
(setq load-path (cons "d:/program files/emacs-21.3/packages" load-path))

;; Key mapping changes 
(global-set-key [(control \;)] 'other-window)
(global-set-key [(control q)] 'delete-other-windows)

;; Very useful for all beginners.
;; this was originally mapped to open file read only. 
;; but we can always do that with toggle-read-only
(global-set-key [(control x) (control r)] 'revert-buffer)
(global-set-key [(control x) (control l)] 'goto-line)

;; vi mode turns itself off each time i change to edit mode
;; 
(global-set-key [(f5)] 'vi-mode)

;;f12 is set to toggle read only. useful for copying lines around.
;;I do F12 C-9 C-k and 9 lines are copied to kill ring
;;Then do C-y to paste it elsewhere. If in the same file I do F12 C-y

(global-set-key [(f12)] 'toggle-read-only)

;; local file associations at Siebel
(setq auto-mode-alist
      (append '(
   ("\\.sro$" . sgml-mode)
   ("\\.srr$" . sgml-mode)
   ("\\.srp$" . sgml-mode)
   ("\\.config$" . sgml-mode)
   ("\\.dcl$" . sgml-mode)
   ("\\.cs$"  . java-mode)
   ("\\.csproj$"  . sgml-mode)
      ) auto-mode-alist ))

;; =====================================================================
;; DIRED STUFF
;; =====================================================================

;; Hit capital X to execute file at point
(defun dired-execute-file (&optional arg)
  (interactive "P")
  (mapcar #'(lambda (file) (w32-shell-execute "open" file))
          (dired-get-marked-files nil arg)))

(defun dired-mouse-execute-file (event)
  "In dired, execute the file or goto directory name you click on."
  (interactive "e")
  (set-buffer (window-buffer (posn-window (event-end event))))
  (goto-char (posn-point (event-end event)))
  (if (dired-is-dir)
      (dired-find-file)
    (dired-execute-file)))

(defun my-dired-mode-hook ()
  "Hook run when entering dired-mode."
    (define-key dired-mode-map "X" 'dired-execute-file)
    (define-key dired-mode-map [double-down-mouse-1] 'dired-mouse-execute-file))

(add-hook 'dired-mode-hook 'my-dired-mode-hook)

;; Make the % key jump to the matching {}[]() if on another, like VI
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))


; Replace yes-or-no question responses with y-or-n responses
(fset 'yes-or-no-p 'y-or-n-p)

;(require 'browse-kill-ring)
;(define-key global-map [(control c) k] 'browse-kill-ring)

; time display is last because during .emacs debugging if .emacs file is OK
; then time will display, otherwise I know that entire .emacs file was
; not read
(require 'doc-view)

;; use 3 spaces
(require 'cc-mode)
(defun my-c-mode-common-hook ()
  (setq c-basic-indent 3) 
  (setq c-indent-level 3)
  (setq tab-width 3) 
  (setq indent-tabs-mode nil) )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;; Turn off backup files.
(setq make-backup-files nil)

(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(newsticker-url-list (quote (("all things digital" "http://kara.allthingsd.com/feed" nil nil nil) ("steve pavlina" "http://www.stevepavlina.com/blog/feed" nil nil nil)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
