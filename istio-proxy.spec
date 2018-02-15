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

mv ../build/contrib/CMakeLists.txt ../CMakeLists.txt
mv ../build/contrib/Makefile.cmake Makefile

mkdir -p ../project/src/envoy
cp -rf ../src/envoy/* ../project/src/envoy
cp -rf src/envoy/* ../project/src/envoy

#cp ../genfiles/external/envoy_api/envoy/api/v2/core/base.pb.h ../genfiles/external/envoy_api/envoy/api/base.pb.h
#cp ../genfiles/external/envoy_api/envoy/api/v2/cds.pb.h ../genfiles/external/envoy_api/envoy/api/cds.pb.h
#cp ../genfiles/external/envoy_api/envoy/config/bootstrap/v2/bootstrap.pb.h .././genfiles/external/envoy_api/envoy/api/bootstrap.pb.h
#cp ../src/nghttp2/lib/includes/nghttp2/nghttp2ver.h.in ../src/nghttp2/lib/includes/nghttp2/nghttp2ver.h
#mkdir -p ../genfiles/external/envoy_api/envoy/api/filter/http
#cp ../genfiles/external/envoy_api/envoy/config/filter/network/http_connection_manager/v2/http_connection_manager.pb.h ../genfiles/external/envoy_api/envoy/api/filter/http/http_connection_manager.pb.h
#cp ../src/spdlog/include/spdlog/fmt/bundled/format.h ../src/spdlog/include/spdlog/fmt/format.h


%build

make cmake-x86 CMAKE_MAKE_OPT="-j 8"

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT%{_bindir}

cp -pav out/linux_amd64/release/{istio-proxy} $RPM_BUILD_ROOT%{_bindir}/

# source codes for building projects
%if 0%{?with_devel}
install -d -p %{buildroot}/%{gopath}/src/%{import_path}/
echo "%%dir %%{gopath}/src/%%{import_path}/." >> devel.file-list
# find all *.go but no *_test.go files and generate devel.file-list
for file in $(find . \( -iname "*.go" -or -iname "*.s" \) \! -iname "*_test.go") ; do
    dirprefix=$(dirname $file)
    install -d -p %{buildroot}/%{gopath}/src/%{import_path}/$dirprefix
    cp -pav $file %{buildroot}/%{gopath}/src/%{import_path}/$file
    echo "%%{gopath}/src/%%{import_path}/$file" >> devel.file-list

    while [ "$dirprefix" != "." ]; do
        echo "%%dir %%{gopath}/src/%%{import_path}/$dirprefix" >> devel.file-list
        dirprefix=$(dirname $dirprefix)
    done
done
%endif

%if 0%{?with_devel}
sort -u -o devel.file-list devel.file-list
%endif

#define license tag if not already defined
%{!?_licensedir:%global license %doc}

%files
%license LICENSE
%doc     README.md

%files istio-proxy
%{_bindir}/istio-proxy

%if 0%{?with_devel}
%files devel -f devel.file-list
%license LICENSE
%doc README.md code-of-conduct.md CONTRIBUTING.md
%dir %{gopath}/src/%{provider}.%{provider_tld}/%{project}
%endif

%changelog
* Tue Feb 13 2018 Bill DeCoste <wdecoste@redhat.com> - 0.4.git22a8d0c
- First package 
