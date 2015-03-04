# VCR-FakeFS

For use with the VCR and FakeFS gems.

Record your vcr cassettes to the real file system, even when using FakeFS.

Without VCR-FakeFS, if you use both VCR and FakeFS, FakeFS works as you intend, but while it's activated, VCR's cassettes from your real file system won't exist, and network calls won't be saved to your real FS, defeating the purpose of using it. VCR-FakeFS keeps FakeFS the same, and makes sure VCR uses your real file system for storage.

# Install

## Using bundler

```
gem 'vcr-fakefs'
```

## Manually

```
$ gem install vcr-fakefs
```

Require the gem before your tests:

```
require 'vcr-fakefs'
```

# Usage / How does it work?

By default, you don't need to do anything extra besides require the gem.

VCR-FakeFS configures VCR automatically to use an alternative file system persister, which will use FakeFS's `without` tactic to bypass the fake file system to use VCR's original (real) file system persister.

If you want it to work differently (e.g. not automatically), just open an issue on Github.

# Thanks

Thank you to Myron Marston (@myronmarston) and Mark Van de Vyver (@taqtiqa-mark), for the enormously helpful conversation [here](https://github.com/vcr/vcr/issues/234).

Thank you to to Brian Donovan (@eventualbuddha) for pointing out how easily [this could be done with FakeFS](https://github.com/defunkt/fakefs/issues/167).

# License

The MIT License (MIT)

Copyright (c) 2015 Tyler Collier

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.