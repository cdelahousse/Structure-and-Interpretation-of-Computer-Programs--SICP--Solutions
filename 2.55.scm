;Exercise 2.55
;

(car ''abracadabra)

;Is the same as
;
(car (quote (quote abracadabra)))

; b/c 'word [apostrophe word] is an alias for (quote word)
