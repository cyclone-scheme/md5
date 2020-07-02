;; Ported from Chibi Scheme

;;> Implementation of the MD5 (Message Digest) cryptographic hash.  In
;;> new applications SHA-2 should be preferred.

(define-library (md5) ;(cyclone crypto md5)
  (import (scheme base)
          (only (scheme char) string-downcase)
          (only (srfi 60) arithmetic-shift bitwise-and bitwise-ior bitwise-xor)
          (only (cyclone bytevector) bytevector-u16-ref-le))
  (export md5)
  (include-c-header "md5.h")
  (include-c-header "md5-native.c")
  (begin
    (define-c md5-native
      "(void *data, int argc, closure _, object k, object str)"
      "MD5_CTX ctx;
       unsigned char result[17];
       make_empty_bytevector(bv);

       Cyc_check_str(data, str); // TODO: what about other types??
       MD5_Init(&ctx);
       MD5_Update(&ctx, 
                  string_str(str),
                  strlen( string_str(str) ));
       MD5_Final(result, &ctx);
       bv.len = 16;
       bv.data = (char *)result;
       return_closcall1(data, k, &bv); ")
    (define (md5 str)
      (md5-native str))
    )
  )
