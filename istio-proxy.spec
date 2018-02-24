# Generate devel rpm
%global with_devel 0
# Build with debug info rpm
%global with_debug 0

%if 0%{?with_debug}
%global _dwz_low_mem_die_limit 0
%else
%global debug_package   %{nil}
%endif

# this is just a monotonically increasing number to preceed the git hash, to get incremented on every git bump
%global git_bump         1
%global git_commit       f005e33859d423c545bd6d2360231dfe46751aa7
%global git_shortcommit  %(c=%{git_commit}; echo ${c:0:7})

%global provider        github
%global provider_tld    com
%global project         istio
%global repo            proxy
# https://github.com/istio/proxy
%global provider_prefix %{provider}.%{provider_tld}/%{project}/%{repo}
%global import_path     proxy

%define _disable_source_fetch 0

Name:           proxy
Version:        0.6.%{git_bump}.git.%{git_shortcommit}
Release:        1%{?dist}
Summary:        The Istio Proxy is a microservice proxy that can be used on the client and server side, and forms a microservice mesh. The Proxy supports a large number of features.
License:        ASL 2.0
URL:            https://%{provider_prefix}
# TODO: Change to a release version
Source0:        proxy.zip
Source1:        istiorc
Source2:        buildinfo
Source3:        src.tar.gz
Source4:        genfiles.tar.gz
Source5:        thirdparty.tar.gz
Source6:        thirdparty_build.tar.gz
Source7:        external.tar.gz
Source8:        build

# e.g. el6 has ppc64 arch without gcc-go, so EA tag is required
#ExclusiveArch:  %{?go_arches:%{go_arches}}%{!?go_arches:%{ix86} x86_64 aarch64 %{arm}}
# If go_compiler is not set to 1, there is no virtual provide. Use golang instead.
#BuildRequires:  golang >= 1.9

%description
The Istio Proxy is a microservice proxy that can be used on the client and server side, and forms a microservice mesh. The Proxy supports a large number of features.

########### istio-proxy ###############
%package istio-proxy
Summary:  The istio envoy proxy
Requires: istio-proxy = %{version}-%{release}

%description istio-proxy
The Istio Proxy is a microservice proxy that can be used on the client and server side, and forms a microservice mesh. The Proxy supports a large number of features.

This package contains the envoy program.

istio-proxy is the proxy required by the Istio Pilot Agent that talks to Istio pilot

%prep
%setup -q -n %{name}

cp %{SOURCE1} .istiorc.mk
cp %{SOURCE2} buildinfo

tar zxvf %{SOURCE3} -C ..
tar zxvf %{SOURCE4} -C ..
tar zxvf %{SOURCE5} -C ../genfiles
tar zxvf %{SOURCE6} -C ../genfiles
tar zxvf %{SOURCE7} -C ../genfiles
cp -rf %{SOURCE8} ..

cp ../build/contrib/CMakeLists.txt ../CMakeLists.txt
cp ../build/contrib/Makefile.cmake Makefile

mkdir -p ../project/src/envoy
cp -rf src/envoy/* ../src/envoy 
cp -rf ../src/envoy/* ../project/src/envoy

mkdir -p ../genfiles/external/envoy/source/common/filesystem
cp ../genfiles/external/envoy/source/common/filesystem/inotify/watcher_impl.h ../genfiles/external/envoy/source/common/filesystem

mkdir -p ../genfiles/thirdparty_build/include/sys
cp ../genfiles/thirdparty_build/include/event.h ../genfiles/thirdparty_build/include/sys/event.h

%build

export LD_LIBRARY_PATH=/root/install/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/root/install/lib/pkgconfig
export PATH=/root/install/bin:$PATH

pushd ../src/libevent
./configure --prefix="" --enable-shared=no --disable-libevent-regress --disable-openssl
make DESTDIR=/root/install LIBDIR=/root/install install
popd

pushd ../src/protobuf
./configure --prefix=""
make check
make DESTDIR=/root/install LIBDIR=/root/install install
popd

pushd ../src/grpc
make prefix=/root/install LIBDIR=/root/install install
popd

pushd ../src/LuaJIT
sed -i "s/mixed/static/g" src/Makefile
make DESTDIR=/root/install PREFIX="" LIBDIR=/root/install install
popd

pushd ../src/opentracing-cpp
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="" ..
make DESTDIR=/root/install LIBDIR=/root/install install
popd

pushd ../src/lightstep
mkdir build
cd build
cmake -DOPENTRACING_LIBRARY=/root/install/lib/libopentracing.so -DOPENTRACING_INCLUDE_DIR=/root/install/include -DProtobuf_LIBRARY=/root/install/lib/libprotobuf.a -DProtobuf_INCLUDE_DIR=/root/install/include -DCMAKE_INSTALL_PREFIX="" -DProtobuf_PROTOC_EXECUTABLE=/root/install/bin/protoc ..
make DESTDIR=/root/install LIBDIR=/root/install install
popd

make cmake-x86 CMAKE_MAKE_OPT="-j 8"

%install

%files

%changelog
* Tue Feb 13 2018 Bill DeCoste <wdecoste@redhat.com> - 0.4.git22a8d0c
- First package 
