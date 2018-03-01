# Istio Proxy SRPM Builder

## To build the proxy srpm (assume running as root)

* Make sure you don't have any of the following installed: libevent,protobuf,grpc,LuaJIT,opentracing,lightstep
* yum install -y --disablerepo=\* --enablerepo=rhel-7-server-extras-rpms --enablerepo=rhel-7-server-optional-rpms --enablerepo=epel --enablerepo=rhel-7-server-rpms --enablerepo=rhel-server-rhscl-7-rpms docker hostname wget cmake3 devtoolset-4-gcc devtoolset-4-gcc-c++ devtoolset-4-libatomic-devel devtoolset-4-libstdc++-devel devtoolset-4-runtime 
* yum install -y --disablerepo=\* --enablerepo=rhel-7-server-optional-rpms --enablerepo=epel --enablerepo=rhel-7-server-rpms --enablerepo=rhel-server-rhscl-7-rpms zlib-devel git unzip make libtool patch 
* yum install -y --disablerepo=\* --enablerepo=rhel-7-server-optional-rpms --enablerepo=epel --enablerepo=rhel-7-server-rpms --enablerepo=rhel-server-rhscl-7-rpms openssl-static
* source /opt/rh/devtoolset-4/enable
* mkdir -p /root/install
* mkdir -p /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
* git clone https://github.com/bdecoste/istio-proxy-rpmbuild
* cd istio-proxy-rpmbuild
* cp -rf SOURCES/* /root/rpmbuild/SOURCES
* Edit TMP_DIR in fetch_dependencies.sh to point to an appropriate local dir (optional - defaults to /home/root/workspaces/tmp)
* ./fetch_dependencies.sh
* cp ${TMP_DIR}/src.tar.gz /root/rpmbuild/SOURCES
* cp istio-proxy.spec /root/rpmbuild
* cd /root/rpmbuild
* rpmbuild -ba istio-proxy.spec



