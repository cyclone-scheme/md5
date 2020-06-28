(package
  (name md5)
  (version 0.1)
  (license "BSD")
  (authors "Alex Shinn")
  (maintainers "Arthur Maciel")
  (description
    "Implementation of the MD5 (Message Digest) cryptographic hash.")
  (tags "crypto hash")
  (docs "https://github.com/cyclone-scheme/cyclone-winds/wiki/crypto")
  (test "test.scm")
  (dependencies (bytevector))
  (test-dependencies ())
  (foreign-dependencies ())
  (library
    (name (cyclone crypto md5))
    (description "")))
