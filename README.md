# Istio Proxy SRPM Builder

## To build the proxy srpm (assume running as root)

* mkdir -p /root/install
* mkdir -p /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
* git clone https://github.com/bdecoste/istio-proxy-rpmbuild
* cd istio-proxy-rpmbuild
* cp -rf SOURCES/* /root/rpmbuild/SOURCES
* edit TMP_DIR in fetch_dependencies.sh to point to an appropriate local dir (optional - defaults to /home/root/workspaces/tmp)
* run fetch_dependencies.sh
* cp ${TMP_DIR}/src.tar.gz /root/rpmbuild/SOURCES
* cp istio-proxy.spec /root/rpmbuild
* cd /root/rpmbuild
* rpmbuild -ba istio-proxy.spec



