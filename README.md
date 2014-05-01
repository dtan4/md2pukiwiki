# md2pukiwiki
[![Build Status](https://travis-ci.org/dtan4/md2pukiwiki.svg?branch=master)](https://travis-ci.org/dtan4/md2pukiwiki)
[![Coverage Status](https://coveralls.io/repos/dtan4/md2pukiwiki/badge.png)](https://coveralls.io/r/dtan4/md2pukiwiki)
[![Code Climate](https://codeclimate.com/github/dtan4/md2pukiwiki.png)](https://codeclimate.com/github/dtan4/md2pukiwiki)
[![Gem Version](https://badge.fury.io/rb/md2pukiwiki.svg)](http://badge.fury.io/rb/md2pukiwiki)

Convert Markdown to Pukiwiki-notation

## Installation

Add this line to your application's Gemfile:

    gem 'md2pukiwiki'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install md2pukiwiki

## Usage

    $ md2pukiwiki <filename>

Conversion result will be written to the standard output.

## Example

```
$ cat sample.md
# header
* list1
* l**is**t2
    * list2.1

## subheader
1. nlist1
2. nl*is*t2
   1. nlist2.1

$ md2pukiwiki sample.md > sample.txt
$ cat sample.txt
*header
- list1
- l''is''t2
-- list2.1

**subheader
+ nlist1
+ nl'''is'''t2
++ nlist2.1
```

## Contributing

1. Fork it ( https://github.com/dtan4/md2pukiwiki/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
