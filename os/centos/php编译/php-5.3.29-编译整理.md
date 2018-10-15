```
[root@bogon php-5.3.29]# ./configure --help
Usage: configure [options] [host]
Options: [defaults in brackets after descriptions]
Configuration:
  --cache-file=FILE       cache test results in FILE
  --help                  print this message
  --no-create             do not create output files
  --quiet, --silent       do not print `checking...' messages
  --version               print the version of autoconf that created configure
Directory and file names:
  --prefix=PREFIX         install architecture-independent files in PREFIX
                          [/usr/local]
  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
                          [same as prefix]
  --bindir=DIR            user executables in DIR [EPREFIX/bin]
  --sbindir=DIR           system admin executables in DIR [EPREFIX/sbin]
  --libexecdir=DIR        program executables in DIR [EPREFIX/libexec]
  --datadir=DIR           read-only architecture-independent data in DIR
                          [PREFIX/share]
  --sysconfdir=DIR        read-only single-machine data in DIR [PREFIX/etc]
  --sharedstatedir=DIR    modifiable architecture-independent data in DIR
                          [PREFIX/com]
  --localstatedir=DIR     modifiable single-machine data in DIR [PREFIX/var]
  --libdir=DIR            object code libraries in DIR [EPREFIX/lib]
  --includedir=DIR        C header files in DIR [PREFIX/include]
  --oldincludedir=DIR     C header files for non-gcc in DIR [/usr/include]
  --infodir=DIR           info documentation in DIR [PREFIX/info]
  --mandir=DIR            man documentation in DIR [PREFIX/man]
  --srcdir=DIR            find the sources in DIR [configure dir or ..]
  --program-prefix=PREFIX prepend PREFIX to installed program names
  --program-suffix=SUFFIX append SUFFIX to installed program names
  --program-transform-name=PROGRAM
                          run sed PROGRAM on installed program names
Host type:
  --build=BUILD           configure for building on BUILD [BUILD=HOST]
  --host=HOST             configure for HOST [guessed]
  --target=TARGET         configure for TARGET [TARGET=HOST]
Features and packages:
  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
  --x-includes=DIR        X include files are in DIR
  --x-libraries=DIR       X library files are in DIR
--enable and --with options recognized:
  --with-libdir=NAME      Look for libraries in .../NAME rather than .../lib
  --disable-rpath         Disable passing additional runtime library
                          search paths
  --enable-re2c-cgoto     Enable -g flag to re2c to use computed goto gcc extension

SAPI modules:

  --with-aolserver=DIR    Specify path to the installed AOLserver
  --with-apxs[=FILE]      Build shared Apache 1.x module. FILE is the optional
                          pathname to the Apache apxs tool [apxs]
  --with-apache[=DIR]     Build Apache 1.x module. DIR is the top-level Apache
                          build directory [/usr/local/apache]
  --enable-mod-charset      APACHE: Enable transfer tables for mod_charset (Rus Apache)
  --with-apxs2filter[=FILE]   
                          EXPERIMENTAL: Build shared Apache 2.0 Filter module. FILE is the optional
                          pathname to the Apache apxs tool [apxs]
  --with-apxs2[=FILE]     Build shared Apache 2.0 Handler module. FILE is the optional
                          pathname to the Apache apxs tool [apxs]
  --with-apache-hooks[=FILE]      
                          EXPERIMENTAL: Build shared Apache 1.x module. FILE is the optional
                          pathname to the Apache apxs tool [apxs]
  --with-apache-hooks-static[=DIR]
                          EXPERIMENTAL: Build Apache 1.x module. DIR is the top-level Apache
                          build directory [/usr/local/apache]
  --enable-mod-charset      APACHE (hooks): Enable transfer tables for mod_charset (Rus Apache)
  --with-caudium[=DIR]    Build PHP as a Pike module for use with Caudium.
                          DIR is the Caudium server dir [/usr/local/caudium/server]
  --disable-cli           Disable building CLI version of PHP
                          (this forces --without-pear)
  --with-continuity=DIR   Build PHP as Continuity Server module. 
                          DIR is path to the installed Continuity Server root
  --enable-embed[=TYPE]   EXPERIMENTAL: Enable building of embedded SAPI library
                          TYPE is either 'shared' or 'static'. [TYPE=shared]
  --enable-fpm              EXPERIMENTAL: Enable building of the fpm SAPI executable
  --with-fpm-user[=USER]  Set the user for php-fpm to run as. (default: nobody)
  --with-fpm-group[=GRP]  Set the group for php-fpm to run as. For a system user, this 
                  should usually be set to match the fpm username (default: nobody)
  --with-isapi[=DIR]      Build PHP as an ISAPI module for use with Zeus
  --with-litespeed        Build PHP as litespeed module
  --with-milter[=DIR]     Build PHP as Milter application
  --with-nsapi=DIR        Build PHP as NSAPI module for Netscape/iPlanet/Sun Webserver
  --with-phttpd=DIR       Build PHP as phttpd module
  --with-pi3web[=DIR]     Build PHP as Pi3Web module
  --with-roxen=DIR        Build PHP as a Pike module. DIR is the base Roxen
                          directory, normally /usr/local/roxen/server
  --enable-roxen-zts        ROXEN: Build the Roxen module using Zend Thread Safety
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
  --enable-safe-mode      Enable safe mode by default
  --with-exec-dir[=DIR]   Only allow executables in DIR under safe-mode
                          [/usr/local/php/bin]
  --enable-sigchild       Enable PHP's own SIGCHLD handler
  --enable-magic-quotes   Enable magic quotes by default.
  --enable-libgcc         Enable explicitly linking against libgcc
  --disable-short-tags    Disable the short-form <? start tag by default
  --enable-dmalloc        Enable dmalloc
  --disable-ipv6          Disable IPv6 support
  --enable-fd-setsize     Set size of descriptor sets

Extensions:

  --with-EXTENSION=[shared[,PATH]]
  
    NOTE: Not all extensions can be build as 'shared'.

    Example: --with-foobar=shared,/usr/local/foobar/

      o Builds the foobar extension as shared extension.
      o foobar package install prefix is /usr/local/foobar/


 --disable-all   Disable all extensions which are enabled by default

  --with-regex=TYPE       regex library type: system, php. [TYPE=php]
                          WARNING: Do NOT use unless you know what you are doing!
  --disable-libxml        Disable LIBXML support
  --with-libxml-dir[=DIR]   LIBXML: libxml2 install prefix
  --with-openssl[=DIR]    Include OpenSSL support (requires OpenSSL >= 0.9.6)
  --with-kerberos[=DIR]     OPENSSL: Include Kerberos support
  --with-pcre-regex=DIR   Include Perl Compatible Regular Expressions support.
                          DIR is the PCRE install prefix [BUNDLED]
  --without-sqlite3[=DIR] Do not include SQLite3 support. DIR is the prefix to
                          SQLite3 installation directory.
  --with-zlib[=DIR]       Include ZLIB support (requires zlib >= 1.0.9)
  --with-zlib-dir=<DIR>   Define the location of zlib install directory
  --enable-bcmath         Enable bc style precision math functions
  --with-bz2[=DIR]        Include BZip2 support
  --enable-calendar       Enable support for calendar conversion
  --disable-ctype         Disable ctype functions
  --with-curl[=DIR]       Include cURL support
  --with-curlwrappers     EXPERIMENTAL: Use cURL for url streams
  --enable-dba            Build DBA with bundled modules. To build shared DBA
                          extension use --enable-dba=shared
  --with-qdbm[=DIR]         DBA: QDBM support
  --with-gdbm[=DIR]         DBA: GDBM support
  --with-ndbm[=DIR]         DBA: NDBM support
  --with-db4[=DIR]          DBA: Oracle Berkeley DB 4.x or 5.x support
  --with-db3[=DIR]          DBA: Oracle Berkeley DB 3.x support
  --with-db2[=DIR]          DBA: Oracle Berkeley DB 2.x support
  --with-db1[=DIR]          DBA: Oracle Berkeley DB 1.x support/emulation
  --with-dbm[=DIR]          DBA: DBM support
  --without-cdb[=DIR]       DBA: CDB support (bundled)
  --disable-inifile         DBA: INI support (bundled)
  --disable-flatfile        DBA: FlatFile support (bundled)
  --disable-dom           Disable DOM support
  --with-libxml-dir[=DIR]   DOM: libxml2 install prefix
  --with-enchant[=DIR]     Include enchant support.
                          GNU Aspell version 1.1.3 or higher required.
  --enable-exif           Enable EXIF (metadata from images) support
  --disable-fileinfo      Disable fileinfo support
  --disable-filter        Disable input filter support
  --with-pcre-dir           FILTER: pcre install prefix
  --enable-ftp            Enable FTP support
  --with-openssl-dir[=DIR]  FTP: openssl install prefix
  --with-gd[=DIR]         Include GD support.  DIR is the GD library base
                          install directory [BUNDLED]
  --with-jpeg-dir[=DIR]     GD: Set the path to libjpeg install prefix
  --with-png-dir[=DIR]      GD: Set the path to libpng install prefix
  --with-zlib-dir[=DIR]     GD: Set the path to libz install prefix
  --with-xpm-dir[=DIR]      GD: Set the path to libXpm install prefix
  --with-freetype-dir[=DIR] GD: Set the path to FreeType 2 install prefix
  --with-t1lib[=DIR]        GD: Include T1lib support. T1lib version >= 5.0.0 required
  --enable-gd-native-ttf    GD: Enable TrueType string function
  --enable-gd-jis-conv      GD: Enable JIS-mapped Japanese font support
  --with-gettext[=DIR]    Include GNU gettext support
  --with-gmp[=DIR]        Include GNU MP support
  --with-mhash[=DIR]      Include mhash support
  --disable-hash          Disable hash support
  --without-iconv[=DIR]   Exclude iconv support
  --with-imap[=DIR]       Include IMAP support. DIR is the c-client install prefix
  --with-kerberos[=DIR]     IMAP: Include Kerberos support. DIR is the Kerberos install prefix
  --with-imap-ssl[=DIR]     IMAP: Include SSL support. DIR is the OpenSSL install prefix
  --with-interbase[=DIR]  Include InterBase support.  DIR is the InterBase base
                          install directory [/usr/interbase]
  --enable-intl           Enable internationalization support
  --with-icu-dir=DIR      Specify where ICU libraries and headers can be found
  --disable-json          Disable JavaScript Object Serialization support
  --with-ldap[=DIR]       Include LDAP support
  --with-ldap-sasl[=DIR]    LDAP: Include Cyrus SASL support
  --enable-mbstring       Enable multibyte string support
  --disable-mbregex         MBSTRING: Disable multibyte regex support
  --disable-mbregex-backtrack
                            MBSTRING: Disable multibyte regex backtrack check
  --with-libmbfl[=DIR]      MBSTRING: Use external libmbfl.  DIR is the libmbfl base
                            install directory [BUNDLED]
  --with-onig[=DIR]         MBSTRING: Use external oniguruma. DIR is the oniguruma install prefix.
                            If DIR is not set, the bundled oniguruma will be used
  --with-mcrypt[=DIR]     Include mcrypt support
  --with-mssql[=DIR]      Include MSSQL-DB support.  DIR is the FreeTDS home
                          directory [/usr/local/freetds]
  --with-mysql[=DIR]      Include MySQL support.  DIR is the MySQL base
                          directory.  If mysqlnd is passed as DIR, 
                          the MySQL native driver will be used [/usr/local]
  --with-mysql-sock[=DIR]   MySQL/MySQLi/PDO_MYSQL: Location of the MySQL unix socket pointer.
                            If unspecified, the default locations are searched
  --with-zlib-dir[=DIR]     MySQL: Set the path to libz install prefix
  --with-mysqli[=FILE]    Include MySQLi support.  FILE is the path
                          to mysql_config.  If mysqlnd is passed as FILE,
                          the MySQL native driver will be used [mysql_config]
  --enable-embedded-mysqli  MYSQLi: Enable embedded support
                            Note: Does not work with MySQL native driver!
  --with-oci8[=DIR]       Include Oracle Database OCI8 support. DIR defaults to $ORACLE_HOME.
                          Use --with-oci8=instantclient,/path/to/instant/client/lib 
                          to use an Oracle Instant Client installation
  --with-adabas[=DIR]     Include Adabas D support [/usr/local]
  --with-sapdb[=DIR]      Include SAP DB support [/usr/local]
  --with-solid[=DIR]      Include Solid support [/usr/local/solid]
  --with-ibm-db2[=DIR]    Include IBM DB2 support [/home/db2inst1/sqllib]
  --with-ODBCRouter[=DIR] Include ODBCRouter.com support [/usr]
  --with-empress[=DIR]    Include Empress support [$EMPRESSPATH]
                          (Empress Version >= 8.60 required)
  --with-empress-bcs[=DIR]
                          Include Empress Local Access support [$EMPRESSPATH]
                          (Empress Version >= 8.60 required)
  --with-birdstep[=DIR]   Include Birdstep support [/usr/local/birdstep]
  --with-custom-odbc[=DIR]
                          Include user defined ODBC support. DIR is ODBC install base
                          directory [/usr/local]. Make sure to define CUSTOM_ODBC_LIBS and
                          have some odbc.h in your include dirs. f.e. you should define 
                          following for Sybase SQL Anywhere 5.5.00 on QNX, prior to
                          running this configure script:
                              CPPFLAGS="-DODBC_QNX -DSQLANY_BUG"
                              LDFLAGS=-lunix
                              CUSTOM_ODBC_LIBS="-ldblib -lodbc"
  --with-iodbc[=DIR]      Include iODBC support [/usr/local]
  --with-esoob[=DIR]      Include Easysoft OOB support [/usr/local/easysoft/oob/client]
  --with-unixODBC[=DIR]   Include unixODBC support [/usr/local]
  --with-dbmaker[=DIR]    Include DBMaker support
  --enable-pcntl          Enable pcntl support (CLI/CGI only)
  --disable-pdo           Disable PHP Data Objects support
  --with-pdo-dblib[=DIR]    PDO: DBLIB-DB support.  DIR is the FreeTDS home directory
  --with-pdo-firebird[=DIR] PDO: Firebird support.  DIR is the Firebird base
                            install directory [/opt/firebird]
  --with-pdo-mysql[=DIR]    PDO: MySQL support. DIR is the MySQL base directory
                                 If mysqlnd is passed as DIR, the MySQL native
                                 native driver will be used [/usr/local]
  --with-zlib-dir[=DIR]       PDO_MySQL: Set the path to libz install prefix
  --with-pdo-oci[=DIR]      PDO: Oracle OCI support. DIR defaults to $ORACLE_HOME.
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
                            you have selected will used. e.g.:
                            
                              --with-pdo-odbc=unixODBC
                              
                            will check for unixODBC under /usr/local. You may attempt 
                            to use an otherwise unsupported driver using the "generic" 
                            flavour.  The syntax for generic ODBC support is:
                            
                              --with-pdo-odbc=generic,dir,libname,ldflags,cflags

                            When build as shared the extension filename is always pdo_odbc.so
  --with-pdo-pgsql[=DIR]    PDO: PostgreSQL support.  DIR is the PostgreSQL base
                            install directory or the path to pg_config
  --without-pdo-sqlite[=DIR]
                            PDO: sqlite 3 support.  DIR is the sqlite base
                            install directory [BUNDLED]
  --with-pgsql[=DIR]      Include PostgreSQL support.  DIR is the PostgreSQL
                          base install directory or the path to pg_config
  --disable-phar          Disable phar support
  --disable-posix         Disable POSIX-like functions
  --with-pspell[=DIR]     Include PSPELL support.
                          GNU Aspell version 0.50.0 or higher required
  --with-libedit[=DIR]    Include libedit readline replacement (CLI/CGI only)
  --with-readline[=DIR]   Include readline support (CLI/CGI only)
  --with-recode[=DIR]     Include recode support
  --disable-session       Disable session support
  --with-mm[=DIR]           SESSION: Include mm support for session storage
  --enable-shmop          Enable shmop support
  --disable-simplexml     Disable SimpleXML support
  --with-libxml-dir=DIR     SimpleXML: libxml2 install prefix
  --with-snmp[=DIR]       Include SNMP support
  --with-openssl-dir[=DIR]  SNMP: openssl install prefix
  --enable-ucd-snmp-hack    SNMP: Enable UCD SNMP hack
  --enable-soap           Enable SOAP support
  --with-libxml-dir=DIR     SOAP: libxml2 install prefix
  --enable-sockets        Enable sockets support
  --without-sqlite=DIR    Do not include sqlite support.  DIR is the sqlite base
                          install directory [BUNDLED]
  --enable-sqlite-utf8      SQLite: Enable UTF-8 support for SQLite
  --with-sybase-ct[=DIR]  Include Sybase-CT support.  DIR is the Sybase home
                          directory [/home/sybase]
  --enable-sysvmsg        Enable sysvmsg support
  --enable-sysvsem        Enable System V semaphore support
  --enable-sysvshm        Enable the System V shared memory support
  --with-tidy[=DIR]       Include TIDY support
  --disable-tokenizer     Disable tokenizer support
  --enable-wddx           Enable WDDX support
  --with-libxml-dir=DIR     WDDX: libxml2 install prefix
  --with-libexpat-dir=DIR   WDDX: libexpat dir for XMLRPC-EPI (deprecated)
  --disable-xml           Disable XML support
  --with-libxml-dir=DIR     XML: libxml2 install prefix
  --with-libexpat-dir=DIR   XML: libexpat install prefix (deprecated)
  --disable-xmlreader     Disable XMLReader support
  --with-libxml-dir=DIR     XMLReader: libxml2 install prefix
  --with-xmlrpc[=DIR]     Include XMLRPC-EPI support
  --with-libxml-dir=DIR     XMLRPC-EPI: libxml2 install prefix
  --with-libexpat-dir=DIR   XMLRPC-EPI: libexpat dir for XMLRPC-EPI (deprecated)
  --with-iconv-dir=DIR      XMLRPC-EPI: iconv dir for XMLRPC-EPI
  --disable-xmlwriter     Disable XMLWriter support
  --with-libxml-dir=DIR     XMLWriter: libxml2 install prefix
  --with-xsl[=DIR]        Include XSL support.  DIR is the libxslt base
                          install directory (libxslt >= 1.1.0 required)
  --enable-zip            Include Zip read/write support
  --with-zlib-dir[=DIR]     ZIP: Set the path to libz install prefix
  --with-pcre-dir           ZIP: pcre install prefix
  --enable-mysqlnd        Enable mysqlnd explicitly, will be done implicitly
                          when required by other extensions
  --disable-mysqlnd-compression-support
                            Disable support for the MySQL compressed protocol in mysqlnd
  --with-zlib-dir[=DIR]       mysqlnd: Set the path to libz install prefix

PEAR:

  --with-pear=DIR         Install PEAR in DIR [PREFIX/lib/php]
  --without-pear          Do not install PEAR

Zend:

  --with-zend-vm=TYPE     Set virtual machine dispatch method. Type is
                          one of CALL, SWITCH or GOTO [TYPE=CALL]
  --enable-maintainer-zts Enable thread safety - for code maintainers only!!
  --disable-inline-optimization 
                          If building zend_execute.lo fails, try this switch
  --enable-zend-multibyte Compile with zend multibyte support

TSRM:

  --with-tsrm-pth[=pth-config]
                          Use GNU Pth
  --with-tsrm-st          Use SGI's State Threads
  --with-tsrm-pthreads    Use POSIX threads (default)

Libtool:

  --enable-shared[=PKGS]  build shared libraries [default=yes]
  --enable-static[=PKGS]  build static libraries [default=yes]
  --enable-fast-install[=PKGS]  optimize for fast installation [default=yes]
  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
  --disable-libtool-lock  avoid locking (might break parallel builds)
  --with-pic              try to use only PIC/non-PIC objects [default=use both]
  --with-tags[=TAGS]      include additional configurations [automatic]

  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]






// 全部依赖
yum install -y gcc gcc-c++ make cmake autoconf bison httpd-devel libxml2-devel httpd-devel systemtap-sdt-devel pth-devel pam-devel openssl-devel libcurl-devel enchant-devel libvpx-devel libjpeg-devel libpng-devel libXpm-devel freetype-devel t1lib-devel gmp-devel libicu-devel libedit-devel readline-devel recode-devel net-snmp-devel libxslt-devel bzip2-devel sqlite-devel systemd-devel libacl-devel

dmalloc:
./configure \
    --prefix=/usr/ijiabao/dmalloc-5.5.2 \
    --enable-threads \
    --enable-shlib //无法编译
make
make install
make cxx
make cxx install

IMAP:
	 依赖：yum install pam-devel
cd imap-2007f
make lr5
mkdir -pv /usr/ijiabao/imap-2007f/{include,lib}
cp -vf c-client/*.h /usr/ijiabao/imap-2007f/include/
cp -vf c-client/*.c /usr/ijiabao/imap-2007f/lib/
cp -vf c-client/c-client.a /usr/ijiabao/imap-2007f/lib/libc-client.a
	PS: make lr5 PASSWDTYPE=std SSLTYPE=unix.nopwd IP6=4

LIBZIP: https://nih.at/libzip/
	https://nih.at/libzip/libzip-1.1.3.tar.gz
./configure \
  --prefix=/usr/ijiabao/libzip-1.1.3 \
  --enable-shared --with-gnu-ld
make
make install
cp .lib/zipconf.h

libmcrypt:
CFLAGS=-I/usr/ijiabao/dmalloc-5.5.2/include \
LDFLAGS=-L/usr/ijiabao/dmalloc-5.5.2/lib \
./configure \
    --prefix=/usr/ijiabao/libmcrypt-2.5.8 \
    --enable-maintainer-mode \
    --enable-shared \
    --with-gnu-ld \
    --with-pic \
    --enable-dmalloc-mode \
    //--enable-dynamic-loading
	
make CFLAGS=-I/usr/ijiabao/dmalloc-5.5.2/include LDFLAGS=-L/usr/ijiabao/dmalloc-5.5.2/lib
make install



yum install lemon libtool-ltdl-devel

php-5.3.29
// 注:64位系统不太兼容; 默认查找/usr/lib; 如果/usr/lib没有相应库,
//		通常用/usr/lib/some->/usr/lib64/some软链接(会影响multi-lib), 
//		应该建一个 /usr/ijiabao/php53support/, 建立相应符号链接, --with-some-ext=/usr/ijiabao/php53support
// with None Thread Safety
// 禁用:
    --with-apxs2=/usr/bin/apxs \
// 添加 
	--without-sqlite
	--without-sqlite3
	--without-pdo-sqlite
	--enable-zend-multibyte
	
./configure \
	--build=x86_64-redhat-linux-gnu --host=x86_64-redhat-linux-gnu \
    --prefix=/usr/ijiabao/php-5.3.29 \
    --with-config-file-path=/etc/php-5.3.29 \
    --with-config-file-scan-dir=/etc/php-5.3.29/php.d \
    --enable-fpm \
	--with-fpm-user=www \
	--with-fpm-group=www \
    --with-fpm-systemd \
    --with-fpm-acl \
    --enable-mod-charset \
    --enable-sigchild       \
    --enable-libgcc         \
    --enable-dtrace         \
    --with-pear             \
    --with-zend-vm          \
    --with-tsrm-pth         \
    --with-tsrm-pthreads    \
    --with-pic              \
    --with-gnu-ld           \
 
    --enable-dmalloc=/usr/ijiabao/dmalloc-5.5.2   \
    --enable-ctype=shared \
    --enable-dba=shared \
    --enable-dom=shared \
    --enable-fileinfo=shared \
    --enable-json=shared \
    --enable-pdo=shared \
    --enable-phar=shared \
    --enable-posix=shared \
    --enable-session=shared \
    --enable-simplexml=shared \
    --enable-tokenizer=shared \
    --enable-xml=shared \
    --enable-xmlreader=shared \
    --enable-xmlwriter=shared \
    --with-iconv=shared \
    --with-mysql=shared,/usr/ijiabao/php53support \
    --with-mysqli=shared \
    --with-pdo-mysql=shared \
	--with-pdo-sqlite=shared \
    --enable-mysqlnd=shared \
    --with-openssl=shared \
    --with-kerberos \
    --with-system-ciphers \
    --with-gd=shared \
    --with-vpx-dir=/usr     \
    --with-jpeg-dir=/usr    \
    --with-png-dir=/usr     \
    --with-zlib-dir=/usr    \
    --with-xpm-dir=/usr/ijiabao/php53support     \
    --with-freetype-dir=/usr \
    --with-t1lib=/usr       \
    --enable-gd-native-ttf  \
    --enable-gd-jis-conv    \
    --enable-mbstring=shared \
    --enable-mbregex \
    --enable-mbregex-backtrack \
    --with-mcrypt=shared,/usr/ijiabao/libmcrypt-2.5.8 \
    --with-curl=shared      \
    --with-imap=shared,/usr/ijiabao/imap-2007f \
    --with-pcre-regex       \
    --with-zlib=shared,/usr \
    --enable-bcmath=shared \
    --with-bz2=shared \
    --enable-calendar=shared \
    --with-gdbm=shared \
    --with-enchant=shared \
    --enable-exif=shared \
    --enable-ftp=shared \
    --with-gettext=shared \
    --with-gmp=shared \
    --with-imap=/usr/ijiabao/imap-2007f \
    --with-kerberos \
    --with-imap-ssl \
    --enable-intl=shared \
    --with-ldap=shared,/usr/ijiabao/php53support \
    --with-ldap-sasl \
    --enable-opcache=shared \
    --enable-pcntl=shared \
    --with-libedit=shared \
    --with-readline=shared \
    --enable-shmop=shared \
    --with-snmp=shared \
    --enable-soap=shared \
    --enable-sockets=shared \
    --enable-sysvmsg=shared \
    --enable-sysvsem=shared \
    --enable-sysvshm=shared \
    --enable-wddx=shared \
    --with-xmlrpc=shared \
    --with-xsl=shared \
    --enable-zip=shared \
    --with-libzip=/usr/ijiabao/libzip-1.1.3 \
    --with-zlib-dir \
    --with-pcre-dir \
	--without-sqlite \
	--enable-zend-multibyte

// 这些参数没有(来自php5.6.24)
--with-fpm-systemd
--with-fpm-acl
--enable-dtrace
--with-system-ciphers
--with-vpx-dir=/usr
--enable-opcache=shared
--with-libzip=/usr/ijiabao/libzip-1.1.3
	
make
make install

Selinux设置
chcon -t texrel_shlib_t libphp5.so
chcon -vt texrel_shlib_t /etc/httpd/modules/libphp5.so
chcon -Rvt texrel_shlib_t /usr/ijiabao/php-5.6.24/lib/php/extensions/debug-zts-20131226/*

// 设置目录/文件的默认属性方式:
semanage fcontext -a -t textrel_shlib_t '/usr/ijiabao/libmcrypt-2.5.8/lib/libmcrypt.so.4.4.8'
restorecon -v '/usr/ijiabao/libmcrypt-2.5.8/lib/libmcrypt.so.4.4.8'

//  允许vhost绑定端口
semanage port -a -t http_port_t -p tcp 8888
//  允许防火墙通过此端口
firewall-cmd --zone=public --add-port=8888/tcp --permanent

service httpd restart

sudo ln -svf /usr/ijiabao/php-5.6.24/bin/* /usr/ijiabao/bin/
新版本目录优先：
/etc/profile
export PATH=/usr/ijiabao/bin:/usr/ijiabao/sbin:$PATH

httpd.conf:
添加：
Define APACHE24 Apache2.4

LoadModule php5_module libphp5.so
AddHandler php5-script .php
AddType text/html .php

PATH
/etc/profile
PATH=/usr/ijiaboa/bin:/usr/ijiabao/sbin:$PATH
export PATH

mkdir -pv /usr/ijiabao/bin
mkdir -pv /usr/ijiabao/sbin
ln -svf /usr/ijiabao/php-5.6.23/bin/* /usr/ijiabao/bin/
ln -svf /usr/ijiabao/dmalloc-5.5.2/bin/dmalloc /usr/ijiabao/bin/

// 系统时区设置, 默认 UTC，那么php.ini也应该设置为UTC
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


VHost设置：
httpd.conf
NameVirtualHost *:80
<VirtualHost *:80>
    DirectoryIndex index.php index.html
    ServerName localhost
    #ServerName *
    DocumentRoot /data/www
    <Directory />        
	AllowOverride None
        Order deny,allow
        #Deny from all          #before apache2.4
        #Require all denied
        Deny from all
    </Directory>

    <Directory /data/www>
        Options FollowSymLinks
        #AllowOverride All
        #Deny from all          #before apache2.4
        #Require all granted
        Allow from all
    </Directory>
</VirtualHost>
#Include /data/cfg/alias/*
Include /data/cfg/vhosts/*

// 修改Selinux安全标签
chcon -Rvt httpd_config_t /data/cfg/vhosts

	

// 附：安装输出记录：
Generating phar.php
Generating phar.phar
PEAR package PHP_Archive not installed: generated phar will require PHP's phar extension be enabled.
clicommand.inc
pharcommand.inc
directorygraphiterator.inc
invertedregexiterator.inc
directorytreeiterator.inc
phar.inc

Build complete.
Don't forget to run 'make test'.

[root@BaoHZServer php-5.6.24]# make install
Installing PHP SAPI module:       apache2handler
/usr/lib/httpd/build/instdso.sh SH_LIBTOOL='/usr/lib/apr-1/build/libtool' libphp5.la /usr/lib/httpd/modules
/usr/lib/apr-1/build/libtool --mode=install install libphp5.la /usr/lib/httpd/modules/
libtool: install: install .libs/libphp5.so /usr/lib/httpd/modules/libphp5.so
libtool: install: install .libs/libphp5.lai /usr/lib/httpd/modules/libphp5.la
libtool: install: warning: remember to run `libtool --finish /data/sources/php-5.6.24/libs'
chmod 755 /usr/lib/httpd/modules/libphp5.so
[activating module `php5' in /etc/httpd/conf/httpd.conf]
Installing shared extensions:     /usr/ijiabao/php-5.6.24/lib/php/extensions/debug-zts-20131226/
Installing PHP CLI binary:        /usr/ijiabao/php-5.6.24/bin/
Installing PHP CLI man page:      /usr/ijiabao/php-5.6.24/php/man/man1/
Installing PHP FPM binary:        /usr/ijiabao/php-5.6.24/sbin/
Installing PHP FPM config:        /usr/ijiabao/php-5.6.24/etc/
Installing PHP FPM man page:      /usr/ijiabao/php-5.6.24/php/man/man8/
Installing PHP FPM status page:   /usr/ijiabao/php-5.6.24/php/php/fpm/
Installing PHP CGI binary:        /usr/ijiabao/php-5.6.24/bin/
Installing PHP CGI man page:      /usr/ijiabao/php-5.6.24/php/man/man1/
Installing build environment:     /usr/ijiabao/php-5.6.24/lib/php/build/
Installing header files:           /usr/ijiabao/php-5.6.24/include/php/
Installing helper programs:       /usr/ijiabao/php-5.6.24/bin/
  program: phpize
  program: php-config
Installing man pages:             /usr/ijiabao/php-5.6.24/php/man/man1/
  page: phpize.1
  page: php-config.1
Installing PEAR environment:      /usr/ijiabao/php-5.6.24/lib/php/
[PEAR] Archive_Tar    - installed: 1.4.0
[PEAR] Console_Getopt - installed: 1.4.1
[PEAR] Structures_Graph- installed: 1.1.1
[PEAR] XML_Util       - installed: 1.3.0
[PEAR] PEAR           - installed: 1.10.1
Wrote PEAR system config file at: /usr/ijiabao/php-5.6.24/etc/pear.conf
You may want to add: /usr/ijiabao/php-5.6.24/lib/php to your php.ini include_path
/data/sources/php-5.6.24/build/shtool install -c ext/phar/phar.phar /usr/ijiabao/php-5.6.24/bin
ln -s -f phar.phar /usr/ijiabao/php-5.6.24/bin/phar
Installing PDO headers:           /usr/ijiabao/php-5.6.24/include/php/ext/pdo/
[root@BaoHZServer php-5.6.24]# 







```

