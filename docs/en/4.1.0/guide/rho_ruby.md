# The Rhomobile Ruby Environment

Our C/C++ Ruby implementation is based on original Ruby C code, 1.9 release and support such core classes and module as:

BasicObject, Object, Module, Class, Integer, Float, Numeric, Bignum, Rational, Complex, Math, String, StringScanner, StringIO, Array, Hash, Struct, Regexp, RegexpError, MatchData, Data, NilClass, TrueClass, FalseClass, Comparable, Enumerable, Enumerator, Converter, Marshal, IO, Dir, Time, Date, Signal, Mutex, Thread, ThreadGroup, Process, Fiber, FiberError, Method, UnboundMethod, Binding, RubyVM, GC, Exception, SystemExit, fatal, SignalException, Interrupt, StandardError, TypeError, ArgumentError, IndexError, KeyError, RangeError, ScriptError, SyntaxError, LoadError, NotImplementedError, NameError, NoMethodError, RuntimeError, SecurityError, NoMemoryError, EncodingError, CompatibilityError, SystemCallError, Errno, ZeroDivisionError, FloatDomainError, IOError, EOFError, ThreadError

We are using Rubinius specs to test Ruby compatibility across different platforms.

## Rhomobile Ruby Implementation Limitations
Our Ruby implementation is based on Ruby 1.9.2.p290 but, there are a few main differences between our implementation of Ruby and core Ruby 1.9.2:

* `eval` is disabled for string evaluation because of limitations with iOS.
* `eval` for blocks **is** functional.
* Currently, Ruby threads do not work on Android. This is a known issue and is in the process of being fixed.