# md5

## Index 
- [Intro](#Intro)
- [Dependencies](#Dependencies)
- [Test dependencies](#Test-dependencies)
- [Foreign dependencies](#Foreign-dependencies)
- [API](#API)
- [Examples](#Examples)
- [Author(s)](#Author(s))
- [Maintainer(s)](#Maintainer(s))
- [Version](#Version) 
- [License](#License) 
- [Tags](#Tags) 

## Intro 
Implementation of the MD5 (Message Digest) cryptographic hash.

## Dependencies 
None

## Test-dependencies 
None

## Foreign-dependencies 
None

## API 

### (cyclone crypto md5)

#### [procedure]   `(md5 src)`

Returns the md5 checksum of `src` as a lowercase hex-string.
`src` can be either a string (interpreted as utf8) or a bytevector.


## Examples
```scheme
(import (scheme base)
        (cyclone crypto md5))

(md5 "The quick brown fox jumps over the lazy dog")
;; => "9e107d9d372bb6826bd81d3542a419d6"
```

## Author(s)
Justin Ethier

## Maintainer(s) 
Arthur Maciel

## Version 
"0.2.0"

## License 
BSD

## Tags 
crypto hash
