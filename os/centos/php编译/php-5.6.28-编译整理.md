```
[root@localhost php-5.6.28]# ./configure --help
`configure' configures this package to adapt to many kinds of systems.

Usage: ./configure [OPTION]... [VAR=VALUE]...

To assign environment variables (e.g., CC, CFLAGS...), specify them as
VAR=VALUE.  See below for descriptions of some of the useful variables.

Defaults for the options are specified in brackets.

Configuration:
  -h, --help              display this help and exit
      --help=short        display options specific to this package
      --help=recursive    display the short help of all the included packages
  -V, --version           display version information and exit
  -q, --quiet, --silent   do not print `checking ...' messages
      --cache-file=FILE   cache test results in FILE [disabled]
  -C, --config-cache      alias for `--cache-file=config.cache'
  -n, --no-create         do not create output files
      --srcdir=DIR        find the sources in DIR [configure dir or `..']

Installation directories:
  --prefix=PREFIX         install architecture-independent files in PREFIX
                          [/usr/local]
  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
                          [PREFIX]

By default, `make install' will install all the files in
`/usr/local/bin', `/usr/local/lib' etc.  You can specify
an installation prefix other than `/usr/local' using `--prefix',
for instance `--prefix=$HOME'.

For better control, use the options below.

Fine tuning of the installation directories:
  --bindir=DIR            user executables [EPREFIX/bin]
  --sbindir=DIR           system admin executables [EPREFIX/sbin]
  --libexecdir=DIR        program executables [EPREFIX/libexec]
  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
  --libdir=DIR            object code libraries [EPREFIX/lib]
  --includedir=DIR        C header files [PREFIX/include]
  --oldincludedir=DIR     C header files for non-gcc [/usr/include]
  --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
  --infodir=DIR           info documentation [DATAROOTDIR/info]
  --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
  --mandir=DIR            man documentation [DATAROOTDIR/man]
  --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]
  --htmldir=DIR           html documentation [DOCDIR]
  --dvidir=DIR            dvi documentation [DOCDIR]
  --pdfdir=DIR            pdf documentation [DOCDIR]
  --psdir=DIR             ps documentation [DOCDIR]

System types:
  --build=BUILD     configure for building on BUILD [guessed]
  --host=HOST       cross-compile to build programs to run on HOST [BUILD]
  --target=TARGET   configure for building compilers for TARGET [HOST]

Optional Features and Packages:
  --disable-option-checking  ignore unrecognized --enable/--with options
  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
  --with-libdir=NAME      Look for libraries in .../NAME rather than .../lib
  --disable-rpath         Disable passing additional runtime library
                          search paths
  --enable-re2c-cgoto     Enable -g flag to re2c to use computed goto gcc extension

SAPI modules:

  --with-aolserver=DIR    Specify path to the installed AOLserver
  --with-apxs=FILE        Build shared Apache 1.x module. FILE is the optional
                          pathname to the Apache apxs tool apxs
  --with-apache=DIR       Build Apache 1.x module. DIR is the top-level Apache
                          build directory /usr/local/apache
  --enable-mod-charset    APACHE: Enable transfer tables for mod_charset (Rus Apache)
  --with-apxs2filter=FILE
                          EXPERIMENTAL: Build shared Apache 2.0 Filter module. FILE is the optional
                          pathname to the Apache apxs tool apxs
  --with-apxs2=FILE       Build shared Apache 2.0 Handler module. FILE is the optional
                          pathname to the Apache apxs tool apxs
  --with-apache-hooks=FILE
                          EXPERIMENTAL: Build shared Apache 1.x module. FILE is the optional
                          pathname to the Apache apxs tool apxs
  --with-apache-hooks-static=DIR
                          EXPERIMENTAL: Build Apache 1.x module. DIR is the top-level Apache
                          build directory /usr/local/apache
  --enable-mod-charset    APACHE (hooks): Enable transfer tables for mod_charset (Rus Apache)
  --with-caudium=DIR      Build PHP as a Pike module for use with Caudium.
                          DIR is the Caudium server dir /usr/local/caudium/server
  --disable-cli           Disable building CLI version of PHP
                          (this forces --without-pear)
  --with-continuity=DIR   Build PHP as Continuity Server module.
                          DIR is path to the installed Continuity Server root
  --enable-embed=TYPE     EXPERIMENTAL: Enable building of embedded SAPI library
                          TYPE is either 'shared' or 'static'. TYPE=shared
  --enable-fpm            Enable building of the fpm SAPI executable
  --with-fpm-user=USER    Set the user for php-fpm to run as. (default: nobody)
  --with-fpm-group=GRP    Set the group for php-fpm to run as. For a system user, this
                          should usually be set to match the fpm username (default: nobody)
  --with-fpm-systemd      Activate systemd integration
  --with-fpm-acl          Use POSIX Access Control Lists
  --with-isapi=DIR        Build PHP as an ISAPI module for use with Zeus
  --with-litespeed        Build PHP as litespeed module
  --with-milter=DIR       Build PHP as Milter application
  --with-nsapi=DIR        Build PHP as NSAPI module for Netscape/iPlanet/Sun Webserver
  --enable-phpdbg         Build phpdbg
  --enable-phpdbg-debug   Build phpdbg in debug mode
  --with-phttpd=DIR       Build PHP as phttpd module
  --with-pi3web=DIR       Build PHP as Pi3Web module
  --with-roxen=DIR        Build PHP as a Pike module. DIR is the base Roxen
                          directory, normally /usr/local/roxen/server
  --enable-roxen-zts      ROXEN: Build the Roxen module using Zend Thread Safety
  --with-thttpd=SRCDIR    Build PHP as thttpd module
  --with-tux=MODULEDIR    Build PHP as a TUX module (Linux only)
  --with-webjames=SRCDIR  Build PHP as a WebJames module (RISC OS only)
  --disable-cgi           Disable building CGI version of PHP

General settings:

  --enable-gcov           Enable GCOV code coverage (requires LTP) - FOR DEVELOPERS ONLY!!
  --enable-debug          Compile with debugging symbols
  --with-layout=TYPE      Set how installed files will be laid out.  Type can
                          be either PHP or GNU [PHP]
  --with-config-file-path=PATH
                          Set the path in which to look for php.ini [PREFIX/lib]
  --with-config-file-scan-dir=PATH
                          Set the path where to scan for configuration files
  --enable-sigchild       Enable PHP's own SIGCHLD handler
  --enable-libgcc         Enable explicitly linking against libgcc
  --disable-short-tags    Disable the short-form <? start tag by default
  --enable-dmalloc        Enable dmalloc
  --disable-ipv6          Disable IPv6 support
  --enable-dtrace         Enable DTrace support
  --enable-fd-setsize     Set size of descriptor sets

Extensions:

  --with-EXTENSION=shared[,PATH]

    NOTE: Not all extensions can be build as 'shared'.

    Example: --with-foobar=shared,/usr/local/foobar/

      o Builds the foobar extension as shared extension.
      o foobar package install prefix is /usr/local/foobar/


  --disable-all           Disable all extensions which are enabled by default

  --with-regex=TYPE       Regex library type: system, php. TYPE=php
                          WARNING: Do NOT use unless you know what you are doing!
  --disable-libxml        Disable LIBXML support
  --with-libxml-dir=DIR   LIBXML: libxml2 install prefix
  --with-openssl=DIR      Include OpenSSL support (requires OpenSSL >= 0.9.6)
  --with-kerberos=DIR     OPENSSL: Include Kerberos support
  --with-system-ciphers   OPENSSL: Use system default cipher list instead of hardcoded value
  --with-pcre-regex=DIR   Include Perl Compatible Regular Expressions support.
                          DIR is the PCRE install prefix BUNDLED
  --without-sqlite3=DIR   Do not include SQLite3 support. DIR is the prefix to
                          SQLite3 installation directory.
  --with-zlib=DIR         Include ZLIB support (requires zlib >= 1.0.9)
  --with-zlib-dir=<DIR>   Define the location of zlib install directory
  --enable-bcmath         Enable bc style precision math functions
  --with-bz2=DIR          Include BZip2 support
  --enable-calendar       Enable support for calendar conversion
  --disable-ctype         Disable ctype functions
  --with-curl=DIR         Include cURL support
  --enable-dba            Build DBA with bundled modules. To build shared DBA
                          extension use --enable-dba=shared
  --with-qdbm=DIR         DBA: QDBM support
  --with-gdbm=DIR         DBA: GDBM support
  --with-ndbm=DIR         DBA: NDBM support
  --with-db4=DIR          DBA: Oracle Berkeley DB 4.x or 5.x support
  --with-db3=DIR          DBA: Oracle Berkeley DB 3.x support
  --with-db2=DIR          DBA: Oracle Berkeley DB 2.x support
  --with-db1=DIR          DBA: Oracle Berkeley DB 1.x support/emulation
  --with-dbm=DIR          DBA: DBM support
  --with-tcadb=DIR        DBA: Tokyo Cabinet abstract DB support
  --without-cdb=DIR       DBA: CDB support (bundled)
  --disable-inifile       DBA: INI support (bundled)
  --disable-flatfile      DBA: FlatFile support (bundled)
  --disable-dom           Disable DOM support
  --with-libxml-dir=DIR   DOM: libxml2 install prefix
  --with-enchant=DIR      Include enchant support.
                          GNU Aspell version 1.1.3 or higher required.
  --enable-exif           Enable EXIF (metadata from images) support
  --disable-fileinfo      Disable fileinfo support
  --disable-filter        Disable input filter support
  --with-pcre-dir         FILTER: pcre install prefix
  --enable-ftp            Enable FTP support
  --with-openssl-dir=DIR  FTP: openssl install prefix
  --with-gd=DIR           Include GD support.  DIR is the GD library base
                          install directory BUNDLED
  --with-vpx-dir=DIR      GD: Set the path to libvpx install prefix
  --with-jpeg-dir=DIR     GD: Set the path to libjpeg install prefix
  --with-png-dir=DIR      GD: Set the path to libpng install prefix
  --with-zlib-dir=DIR     GD: Set the path to libz install prefix
  --with-xpm-dir=DIR      GD: Set the path to libXpm install prefix
  --with-freetype-dir=DIR GD: Set the path to FreeType 2 install prefix
  --with-t1lib=DIR        GD: Include T1lib support. T1lib version >= 5.0.0 required
  --enable-gd-native-ttf  GD: Enable TrueType string function
  --enable-gd-jis-conv    GD: Enable JIS-mapped Japanese font support
  --with-gettext=DIR      Include GNU gettext support
  --with-gmp=DIR          Include GNU MP support
  --with-mhash=DIR        Include mhash support
  --disable-hash          Disable hash support
  --without-iconv=DIR     Exclude iconv support
  --with-imap=DIR         Include IMAP support. DIR is the c-client install prefix
  --with-kerberos=DIR     IMAP: Include Kerberos support. DIR is the Kerberos install prefix
  --with-imap-ssl=DIR     IMAP: Include SSL support. DIR is the OpenSSL install prefix
  --with-interbase=DIR    Include InterBase support.  DIR is the InterBase base
                          install directory /usr/interbase
  --enable-intl           Enable internationalization support
  --with-icu-dir=DIR      Specify where ICU libraries and headers can be found
  --disable-json          Disable JavaScript Object Serialization support
  --with-ldap=DIR         Include LDAP support
  --with-ldap-sasl=DIR    LDAP: Include Cyrus SASL support
  --enable-mbstring       Enable multibyte string support
  --disable-mbregex       MBSTRING: Disable multibyte regex support
  --disable-mbregex-backtrack
                          MBSTRING: Disable multibyte regex backtrack check
  --with-libmbfl=DIR      MBSTRING: Use external libmbfl.  DIR is the libmbfl base
                          install directory BUNDLED
  --with-onig=DIR         MBSTRING: Use external oniguruma. DIR is the oniguruma install prefix.
                          If DIR is not set, the bundled oniguruma will be used
  --with-mcrypt=DIR       Include mcrypt support
  --with-mssql=DIR        Include MSSQL-DB support.  DIR is the FreeTDS home
                          directory /usr/local/freetds
  --with-mysql=DIR        Include MySQL support.  DIR is the MySQL base
                          directory, if no DIR is passed or the value is
                          mysqlnd the MySQL native driver will be used
  --with-mysql-sock=SOCKPATH
                          MySQL/MySQLi/PDO_MYSQL: Location of the MySQL unix socket pointer.
                          If unspecified, the default locations are searched
  --with-zlib-dir=DIR     MySQL: Set the path to libz install prefix
  --with-mysqli=FILE      Include MySQLi support.  FILE is the path
                          to mysql_config.  If no value or mysqlnd is passed
                          as FILE, the MySQL native driver will be used
  --enable-embedded-mysqli
                          MYSQLi: Enable embedded support
                          Note: Does not work with MySQL native driver!
  --with-oci8=DIR         Include Oracle Database OCI8 support. DIR defaults to $ORACLE_HOME.
                          Use --with-oci8=instantclient,/path/to/instant/client/lib
                          to use an Oracle Instant Client installation
  --with-odbcver=HEX      Force support for the passed ODBC version. A hex number is expected, default 0x0300.
                             Use the special value of 0 to prevent an explicit ODBCVER to be defined.
  --with-adabas=DIR       Include Adabas D support /usr/local
  --with-sapdb=DIR        Include SAP DB support /usr/local
  --with-solid=DIR        Include Solid support /usr/local/solid
  --with-ibm-db2=DIR      Include IBM DB2 support /home/db2inst1/sqllib
  --with-ODBCRouter=DIR   Include ODBCRouter.com support /usr
  --with-empress=DIR      Include Empress support \$EMPRESSPATH
                          (Empress Version >= 8.60 required)
  --with-empress-bcs=DIR
                          Include Empress Local Access support \$EMPRESSPATH
                          (Empress Version >= 8.60 required)
  --with-birdstep=DIR     Include Birdstep support /usr/local/birdstep
  --with-custom-odbc=DIR  Include user defined ODBC support. DIR is ODBC install base
                          directory /usr/local. Make sure to define CUSTOM_ODBC_LIBS and
                          have some odbc.h in your include dirs. f.e. you should define
                          following for Sybase SQL Anywhere 5.5.00 on QNX, prior to
                          running this configure script:
                            CPPFLAGS=\"-DODBC_QNX -DSQLANY_BUG\"
                            LDFLAGS=-lunix
                            CUSTOM_ODBC_LIBS=\"-ldblib -lodbc\"
  --with-iodbc=DIR        Include iODBC support /usr/local
  --with-esoob=DIR        Include Easysoft OOB support /usr/local/easysoft/oob/client
  --with-unixODBC=DIR     Include unixODBC support /usr/local
  --with-dbmaker=DIR      Include DBMaker support
  --enable-opcache        Enable Zend OPcache support
  --enable-pcntl          Enable pcntl support (CLI/CGI only)
  --disable-pdo           Disable PHP Data Objects support
  --with-pdo-dblib=DIR    PDO: DBLIB-DB support.  DIR is the FreeTDS home directory
  --with-pdo-firebird=DIR PDO: Firebird support.  DIR is the Firebird base
                          install directory /opt/firebird
  --with-pdo-mysql=DIR    PDO: MySQL support. DIR is the MySQL base directory
                          If no value or mysqlnd is passed as DIR, the
                          MySQL native driver will be used
  --with-zlib-dir=DIR     PDO_MySQL: Set the path to libz install prefix
  --with-pdo-oci=DIR      PDO: Oracle OCI support. DIR defaults to \$ORACLE_HOME.
                          Use --with-pdo-oci=instantclient,prefix,version
                          for an Oracle Instant Client SDK.
                          For example on Linux with 11.2 RPMs use:
                            --with-pdo-oci=instantclient,/usr,11.2
                          With 10.2 RPMs use:
                            --with-pdo-oci=instantclient,/usr,10.2.0.4
  --with-pdo-odbc=flavour,dir
                          PDO: Support for 'flavour' ODBC driver.
			  include and lib dirs are looked for under 'dir'.

			  'flavour' can be one of:  ibm-db2, iODBC, unixODBC, generic
			  If ',dir' part is omitted, default for the flavour
			  you have selected will be used. e.g.:

			    --with-pdo-odbc=unixODBC

			  will check for unixODBC under /usr/local. You may attempt
			  to use an otherwise unsupported driver using the \"generic\"
			  flavour.  The syntax for generic ODBC support is:

			    --with-pdo-odbc=generic,dir,libname,ldflags,cflags

			  When built as 'shared' the extension filename is always pdo_odbc.so
  --with-pdo-pgsql=DIR    PDO: PostgreSQL support.  DIR is the PostgreSQL base
                          install directory or the path to pg_config
  --without-pdo-sqlite=DIR
                          PDO: sqlite 3 support.  DIR is the sqlite base
                          install directory BUNDLED
  --with-pgsql=DIR        Include PostgreSQL support.  DIR is the PostgreSQL
                          base install directory or the path to pg_config
  --disable-phar          Disable phar support
  --disable-posix         Disable POSIX-like functions
  --with-pspell=DIR       Include PSPELL support.
                          GNU Aspell version 0.50.0 or higher required
  --with-libedit=DIR      Include libedit readline replacement (CLI/CGI only)
  --with-readline=DIR     Include readline support (CLI/CGI only)
  --with-recode=DIR       Include recode support
  --disable-session       Disable session support
  --with-mm=DIR           SESSION: Include mm support for session storage
  --enable-shmop          Enable shmop support
  --disable-simplexml     Disable SimpleXML support
  --with-libxml-dir=DIR   SimpleXML: libxml2 install prefix
  --with-snmp=DIR         Include SNMP support
  --with-openssl-dir=DIR  SNMP: openssl install prefix
  --enable-soap           Enable SOAP support
  --with-libxml-dir=DIR   SOAP: libxml2 install prefix
  --enable-sockets        Enable sockets support
  --with-sybase-ct=DIR    Include Sybase-CT support.  DIR is the Sybase home
                          directory /home/sybase
  --enable-sysvmsg        Enable sysvmsg support
  --enable-sysvsem        Enable System V semaphore support
  --enable-sysvshm        Enable the System V shared memory support
  --with-tidy=DIR         Include TIDY support
  --disable-tokenizer     Disable tokenizer support
  --enable-wddx           Enable WDDX support
  --with-libxml-dir=DIR   WDDX: libxml2 install prefix
  --with-libexpat-dir=DIR WDDX: libexpat dir for XMLRPC-EPI (deprecated)
  --disable-xml           Disable XML support
  --with-libxml-dir=DIR   XML: libxml2 install prefix
  --with-libexpat-dir=DIR XML: libexpat install prefix (deprecated)
  --disable-xmlreader     Disable XMLReader support
  --with-libxml-dir=DIR   XMLReader: libxml2 install prefix
  --with-xmlrpc=DIR       Include XMLRPC-EPI support
  --with-libxml-dir=DIR   XMLRPC-EPI: libxml2 install prefix
  --with-libexpat-dir=DIR XMLRPC-EPI: libexpat dir for XMLRPC-EPI (deprecated)
  --with-iconv-dir=DIR    XMLRPC-EPI: iconv dir for XMLRPC-EPI
  --disable-xmlwriter     Disable XMLWriter support
  --with-libxml-dir=DIR   XMLWriter: libxml2 install prefix
  --with-xsl=DIR          Include XSL support.  DIR is the libxslt base
                          install directory (libxslt >= 1.1.0 required)
  --enable-zip            Include Zip read/write support
  --with-zlib-dir=DIR     ZIP: Set the path to libz install prefix
  --with-pcre-dir         ZIP: pcre install prefix
  --with-libzip=DIR       ZIP: use libzip
  --enable-mysqlnd        Enable mysqlnd explicitly, will be done implicitly
                          when required by other extensions
  --disable-mysqlnd-compression-support
                          Disable support for the MySQL compressed protocol in mysqlnd
  --with-zlib-dir=DIR     mysqlnd: Set the path to libz install prefix

PEAR:

  --with-pear=DIR         Install PEAR in DIR [PREFIX/lib/php]
  --without-pear          Do not install PEAR

Zend:

  --with-zend-vm=TYPE     Set virtual machine dispatch method. Type is
                          one of "CALL", "SWITCH" or "GOTO" TYPE=CALL
  --enable-maintainer-zts Enable thread safety - for code maintainers only!!
  --disable-inline-optimization
                          If building zend_execute.lo fails, try this switch
  --enable-zend-signals   Use zend signal handling

TSRM:

  --with-tsrm-pth=pth-config
                          Use GNU Pth
  --with-tsrm-st          Use SGI's State Threads
  --with-tsrm-pthreads    Use POSIX threads (default)

Libtool:

  --enable-shared=PKGS    Build shared libraries default=yes
  --enable-static=PKGS    Build static libraries default=yes
  --enable-fast-install=PKGS
                          Optimize for fast installation default=yes
  --with-gnu-ld           Assume the C compiler uses GNU ld default=no
  --disable-libtool-lock  Avoid locking (might break parallel builds)
  --with-pic              Try to use only PIC/non-PIC objects default=use both
  --with-tags=TAGS        Include additional configurations automatic


Some influential environment variables:
  CC          C compiler command
  CFLAGS      C compiler flags
  LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
              nonstandard directory <lib dir>
  LIBS        libraries to pass to the linker, e.g. -l<library>
  CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
              you have headers in a nonstandard directory <include dir>
  CPP         C preprocessor
  YACC        The `Yet Another C Compiler' implementation to use. Defaults to
              the first program found out of: `bison -y', `byacc', `yacc'.
  YFLAGS      The list of arguments that will be passed by default to $YACC.
              This script will default YFLAGS to the empty string to avoid a
              default value of `-d' given by some make applications.
  CXX         C++ compiler command
  CXXFLAGS    C++ compiler flags
  CXXCPP      C++ preprocessor

Use these variables to override the choices made by `configure' or to help
it to find libraries and programs with nonstandard names/locations.

Report bugs to the package provider.
[root@localhost php-5.6.28]# 


编译时不指定扩展而自带的扩展
ctype
dom
ereg
fileinfo
filter
hash
iconv
json
libxml
pcre
pdo
pdo-sqlite
phar
posix
reflection
session
SimpleXML
SPL
sqlite3
tokenizer
xml
xmlreader
xmlwriter

// dmalloc 64位
CFLAGS="-fPIC" \
./configure \
    --prefix=/usr/ijiabao/dmalloc-5.5.2 \
    --libdir=/usr/ijiabao/dmalloc-5.5.2/lib64 \
    --enable-threads \
    --enable-shlib //无法编译
make
make install
make cxx
make cxx install
make threadscxx
make threadscxx install


// libmcrypt-2.5.8 64位(Centos7.1已有)

CFLAGS="-I/usr/ijiabao/dmalloc-5.5.2/include -fPIC" \
LDFLAGS="-L/usr/ijiabao/dmalloc-5.5.2/lib64" \
./configure \
    --prefix=/usr/ijiabao/libmcrypt-2.5.8 \
    --libdir=/usr/ijiabao/libmcrypt-2.5.8/lib64 \
    --enable-maintainer-mode \
    --enable-shared \
    --with-gnu-ld \
    --with-pic \
    --enable-dmalloc-mode \
    //--enable-dynamic-loading
	
make CFLAGS="-I/usr/ijiabao/dmalloc-5.5.2/include -fPIC" LDFLAGS="-L/usr/ijiabao/dmalloc-5.5.2/lib64"


// IMAP: c-client (Centos7.1 libc-client 有 yum install uw-imap-devel)
	 依赖：yum install pam-devel
cd imap-2007f
make lr5 SSLTYPE=unix EXTRACFLAGS=-fPIC
mkdir -pv /usr/ijiabao/imap-2007f/{include,lib64}
cp -vf c-client/*.h /usr/ijiabao/imap-2007f/include/
cp -vf c-client/*.c /usr/ijiabao/imap-2007f/lib64/
cp -vf c-client/c-client.a /usr/ijiabao/imap-2007f/lib64/libc-client.a
	PS: make lr5 PASSWDTYPE=std SSLTYPE=unix.nopwd IP6=4


// 需要独立安装的
    --with-pspell=shared \
    --with-mm=shared \
    --with-recode=shared \ 不能同时和imap存在

// 尽可能将自带扩展编译成extension扩展	

// 如果系统没有这些源:
--with-imap=shared,/usr/ijiabao/imap-2007f \
--with-mcrypt=shared,/usr/ijiabao/libmcrypt-2.5.8 \
	
// 依赖
yum install httpd-devel
systemd-devel
libacl-devel
systemtap-sdt-devel
libxml2-devel
openssl-devel
bzip2-devel
libcurl-devel
gdbm-devel
libdb4-devel	// for db4
enchant-devel
uw-imap-devel // for imap

libvpx-devel libjpeg-devel libpng-devel libXpm-devel freetype-devel t1lib-devel gmp-devel libicu-devel libedit-devel readline-devel
net-snmp-devel	// snmp
libxslt-devel

// 无需安装mysql-devel, 安装完毕后指定socket /var/lib/mysql/mysql.sock, 进入mysql命令, 执行STATUS可查到socket
// 编译前备份/etc/httpd/modules/libphp5.so
// 注:此两项应该2选一:请检查(一个是原生,一个是内嵌)
	--with-mysqli=shared \
    --enable-embedded-mysqli=shared \
// GD的各个目录不能省,如果系统检测不到则不安装,少了很多函数
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr \
    --with-zlib-dir=/usr \
    --with-xpm-dir=/usr \
    --with-freetype-dir=/usr \
    --with-t1lib \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
	
// 编译开始:
./configure \
    --build=x86_64-redhat-linux \
    --host=x86_64-redhat-linux \
    --prefix=/usr/ijiabao/php-5.6.28 \
    --libdir=/usr/ijiabao/php-5.6.28/lib64 \
    --sysconfdir=/etc/php-5.6.28 \
    --with-libdir=lib64 \
    \
    --with-apxs2=/usr/bin/apxs \
    --enable-mod-charset \
    --enable-fpm \
    --with-fpm-systemd \
    --with-fpm-acl \
    \
    --with-config-file-path=/etc/php-5.6.28 \
    --with-config-file-scan-dir=/etc/php-5.6.28/php.d \
    --enable-sigchild \
    --enable-libgcc \
    --enable-dmalloc=/usr/ijiabao/dmalloc-5.5.2 \
    --enable-dtrace \
    \
    --enable-zend-signals \
    \
    --with-tsrm-pthreads \
    \
    --enable-shared \
    --with-gnu-ld \
    --with-pic \
    \
    --with-openssl=shared \
    --with-kerberos \
    --with-sqlite3=shared \
    --with-zlib=shared \
    --enable-bcmath=shared \
    --with-bz2=shared \
    --enable-calendar=shared \
    --with-curl=shared \
    --enable-dba=shared \
    --with-gdbm=shared \
    --with-db4=shared \
    --enable-dom=shared \
    --with-enchant=shared \
    --enable-exif=shared \
    --enable-fileinfo=shared \
    --enable-filter=shared \
    --enable-ftp=shared \
    --with-gd=shared \
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr \
    --with-zlib-dir=/usr \
    --with-xpm-dir=/usr \
    --with-freetype-dir=/usr \
    --with-t1lib \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --with-gettext=shared \
    --with-gmp=shared \
    --with-mhash=shared \
    --with-iconv=shared \
    --with-imap=shared \
    --with-imap-ssl \
    --enable-intl=shared \
    --with-ldap=shared \
    --with-ldap-sasl \
    --enable-mbstring=shared \
    --with-mcrypt=shared \
    --with-mysql=shared \
    --with-mysqli=shared \
    --enable-opcache=shared \
    --enable-pcntl=shared \
    --enable-pdo=shared \
    --with-pdo-mysql=shared \
    --with-pdo-sqlite=shared \
    --enable-phar=shared \
    --with-libedit=shared \
    --with-readline=shared \
    --enable-shmop=shared \
    --with-snmp=shared \
    --enable-soap=shared \
    --enable-sockets=shared \
    --enable-sysvmsg=shared \
    --enable-sysvsem=shared \
    --enable-sysvshm=shared \
    --enable-tokenizer=shared \
    --enable-wddx=shared \
    --enable-xml=shared \
    --enable-xmlreader=shared \
    --with-xmlrpc=shared \
    --enable-xmlwriter=shared \
    --with-xsl=shared \
    --enable-zip=shared \
    --enable-mysqlnd=shared


[root@localhost php-5.6.28]# make install
Installing PHP SAPI module:       apache2handler
/usr/lib64/httpd/build/instdso.sh SH_LIBTOOL='/usr/lib64/apr-1/build/libtool' libphp5.la /usr/lib64/httpd/modules
/usr/lib64/apr-1/build/libtool --mode=install install libphp5.la /usr/lib64/httpd/modules/
libtool: install: install .libs/libphp5.so /usr/lib64/httpd/modules/libphp5.so
libtool: install: install .libs/libphp5.lai /usr/lib64/httpd/modules/libphp5.la
libtool: install: warning: remember to run `libtool --finish /home/sources/php-5.6.28/libs'
chmod 755 /usr/lib64/httpd/modules/libphp5.so
[activating module `php5' in /etc/httpd/conf/httpd.conf]
Installing shared extensions:     /usr/ijiabao/php-5.6.28/lib64/extensions/no-debug-non-zts-20131226/
Installing PHP CLI binary:        /usr/ijiabao/php-5.6.28/bin/
Installing PHP CLI man page:      /usr/ijiabao/php-5.6.28/php/man/man1/
Installing PHP FPM binary:        /usr/ijiabao/php-5.6.28/sbin/
Installing PHP FPM config:        /etc/php-5.6.28/
Installing PHP FPM man page:      /usr/ijiabao/php-5.6.28/php/man/man8/
Installing PHP FPM status page:   /usr/ijiabao/php-5.6.28/php/php/fpm/
Installing PHP CGI binary:        /usr/ijiabao/php-5.6.28/bin/
Installing PHP CGI man page:      /usr/ijiabao/php-5.6.28/php/man/man1/
Installing build environment:     /usr/ijiabao/php-5.6.28/lib64/build/
Installing header files:           /usr/ijiabao/php-5.6.28/include/php/
Installing helper programs:       /usr/ijiabao/php-5.6.28/bin/
  program: phpize
  program: php-config
Installing man pages:             /usr/ijiabao/php-5.6.28/php/man/man1/
  page: phpize.1
  page: php-config.1
Installing PEAR environment:      /usr/ijiabao/php-5.6.28/lib64/php/
[PEAR] Archive_Tar    - installed: 1.4.0
[PEAR] Console_Getopt - installed: 1.4.1
[PEAR] Structures_Graph- installed: 1.1.1
[PEAR] XML_Util       - installed: 1.3.0
[PEAR] PEAR           - installed: 1.10.1
Wrote PEAR system config file at: /etc/php-5.6.28/pear.conf
You may want to add: /usr/ijiabao/php-5.6.28/lib64/php to your php.ini include_path
/home/sources/php-5.6.28/build/shtool install -c ext/phar/phar.phar /usr/ijiabao/php-5.6.28/bin
ln -s -f phar.phar /usr/ijiabao/php-5.6.28/bin/phar
Installing PDO headers:           /usr/ijiabao/php-5.6.28/include/php/ext/pdo/



// 编译后保存php.ini php-fpm.conf init.d.php-fom /etc/httpd/modules/libphp5.so php-fpm.service
// init.d.php-fom 为server启动文件 => /etc/init.d/php-fpm
// php-fpm.conf 为cgi配置文件, php-fpm.service 为systemd 系统文件 =>/etc/systemd/system/
// libphp5.so 为Apache Module (如果是Apache,尽量编译为线程安全,cgi为非线程安全. zend-guarder必须非线程安全)



生成的扩展库
bcmath.so    enchant.so   gmp.so       mcrypt.so   pcntl.so       shmop.so    sysvsem.so    xml.so
bz2.so       exif.so      iconv.so     mysqli.so   pdo_mysql.so   snmp.so     sysvshm.so    xmlwriter.so
calendar.so  fileinfo.so  imap.so      mysqlnd.so  pdo.so         soap.so     tokenizer.so  xsl.so
curl.so      ftp.so       intl.so      mysql.so    pdo_sqlite.so  sockets.so  wddx.so       zip.so
dba.so       gd.so        ldap.so      opcache.so  phar.so        sqlite3.so  xmlreader.so  zlib.so
dom.so       gettext.so   mbstring.so  openssl.so  readline.so    sysvmsg.so  xmlrpc.so
```

