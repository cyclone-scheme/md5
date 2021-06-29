(package
 (name md5)
 (version "0.2.0")
 (license "BSD")
 (authors "Justin Ethier")
 (maintainers "Arthur Maciel")
 (description
  "Implementation of the MD5 (Message Digest) cryptographic hash.")
 (tags "crypto hash")
 (docs "https://github.com/cyclone-scheme/cyclone-winds/wiki/md5")
 (test "test.scm")
 (dependencies ())
 (test-dependencies ())
 (foreign-dependencies ())
 (library
  (name (cyclone crypto md5))
  (description "MD5 implementation")))
