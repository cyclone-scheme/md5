;; Ported from Chibi Scheme

;;> Implementation of the MD5 (Message Digest) cryptographic hash.  In
;;> new applications SHA-2 should be preferred.

(define-library (cyclone crypto md5)
  (import (scheme base)
          (only (scheme char) string-downcase)
          (only (srfi 60) arithmetic-shift bitwise-and bitwise-ior bitwise-xor)
          (only (cyclone bytevector) bytevector-u16-ref-le))
  (export md5)
  (include "md5.scm"))
