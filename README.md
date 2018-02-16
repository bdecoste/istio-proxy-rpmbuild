# Istio Proxy SRPM Builder

## To build the proxy srpm

* git clone https://github.com/bdecoste/istio-proxy-rpmbuild
* cd istio-proxy-rpmbuild
* edit TMP_DIR in fetch_ependencies.sh to point to an appropriate local dir (optional)
* run fetch_ependencies.sh
* cp ${TMP_DIR}/src/tar.gc SOURCES
* Copy the spec file and SOURCES to ~/rpmbuild
* Create other required rpm dirs (BUILD,BUILDROOT,RPMS,SPECS,SRPMS) 
* Run 'rpmbuild -ba istio-proxy.spec' from ~/rpmbuild



