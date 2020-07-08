;; MD5 implementation. As it is a vulnerable crypto hash, use sha-256 instead.

(define-library (cyclone crypto md5)
  (import (scheme base)
          (only (scheme char) string-downcase))
  (export md5)
  (include-c-header "md5.h")
  (include-c-header "md5-native.c")
  (begin
    (define-c md5-native
      "(void *data, int argc, closure _, object k, object bv_in)"
      "MD5_CTX ctx;
       unsigned char result[17];
       make_empty_bytevector(bv);

       Cyc_check_bvec(data, bv_in);
       MD5_Init(&ctx);
       MD5_Update(&ctx, 
                  ((bytevector)bv_in)->data,
                  ((bytevector)bv_in)->len);
       MD5_Final(result, &ctx);
       bv.len = 16;
       bv.data = (char *)result;
       return_closcall1(data, k, &bv); ")

    (define (md5 inp)
      (let ((bv (md5-native (cond ((string? inp)
                                   (string->utf8 inp))
                                  (else
                                   inp))))) ;; Assumes bytevector
        (string-downcase
         (apply string-append
                (map 
                 ;; TODO: clearly need better tooling here
                 (lambda (n) 
                   (let ((str (number->string n 16)))
                     (cond
                      ((= (string-length str) 0) "00")
                      ((= (string-length str) 1) (string-append "0" str))
                      (else str))))
                 (list (bytevector-u8-ref bv 0)
                       (bytevector-u8-ref bv 1)
                       (bytevector-u8-ref bv 2)
                       (bytevector-u8-ref bv 3)
                       (bytevector-u8-ref bv 4)
                       (bytevector-u8-ref bv 5)
                       (bytevector-u8-ref bv 6)
                       (bytevector-u8-ref bv 7)
                       (bytevector-u8-ref bv 8)
                       (bytevector-u8-ref bv 9)
                       (bytevector-u8-ref bv 10)
                       (bytevector-u8-ref bv 11)
                       (bytevector-u8-ref bv 12)
                       (bytevector-u8-ref bv 13)
                       (bytevector-u8-ref bv 14)
                       (bytevector-u8-ref bv 15)))))))))
