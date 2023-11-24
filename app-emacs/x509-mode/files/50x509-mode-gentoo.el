
;;; x509-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(autoload 'x509-mode "x509-mode" "Major mode for displaying OpenSSL output." t)
(autoload 'x509-viewcert "x509-mode" "Parse current buffer as a certificate file." t)
(autoload 'x509-viewreq "x509-mode" "Parse current buffer as a certificate request file." t)
(autoload 'x509-viewcrl "x509-mode" "Parse current buffer as a CRL file." t)
(autoload 'x509-viewpkcs7 "x509-mode" "Parse current buffer as a PKCS#7 file." t)
(autoload 'x509-viewdh "x509-mode" "Parse current buffer as a DH-parameter file." t)
(autoload 'x509-viewkey "x509-mode" "Display x509 private key using the OpenSSL pkey command." t)
(autoload 'x509-viewpublickey "x509-mode" "Display x509 public key using the OpenSSL pkey command." t)
(autoload 'x509-dwim "x509-mode" "Guess the type of object and call the corresponding view-function." t)
(autoload 'x509-viewasn1 "x509-mode" "Parse current buffer as ASN.1." t)
