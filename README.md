# Double_Metaphone
Double Metaphone PL/SQL Implementation

PL/SQL implementation of well-known double metaphone algorithm. 

``` pl/sql
declare

alternative_result varchar(50);

begin;

result = p_double_metaphone.calculate('Chuck Norris',alternative_result)

end;
```

More information can be found on:

[Metaphone Wikipedia Page](https://en.wikipedia.org/wiki/Metaphone)

Reference implementation links can be found on:

[Reference implementation 1](http://aspell.net/metaphone/dmetaph.cpp)

[Reference implementation 2](https://svn.apache.org/repos/asf/commons/proper/codec/trunk/src/main/java/org/apache/commons/codec/language/DoubleMetaphone.java)

