set(ISTIOPROXY_SOURCES
        ${ISTIO_PROXY}/src/envoy/mixer/http_filter.cc
        ${ISTIO_PROXY}/src/envoy/mixer/utils.cc
        ${ISTIO_PROXY}/src/envoy/mixer/tcp_filter.cc
        ${ISTIO_PROXY}/src/envoy/mixer/mixer_control.cc
        ${ISTIO_PROXY}/src/envoy/mixer/config.cc
        ${ISTIO_PROXY}/src/envoy/mixer/grpc_transport.cc
        ${ISTIO_PROXY}/src/envoy/auth/http_filter.cc
        ${ISTIO_PROXY}/src/envoy/auth/http_filter_factory.cc
        ${ISTIO_PROXY}/src/envoy/auth/jwt_authenticator.cc
        ${ISTIO_PROXY}/src/envoy/auth/jwt.cc
        )


# Must be linked in, so OBJECT. 'static' will not be loaded since there
# are no references.
add_library(istioproxy OBJECT ${ISTIOPROXY_SOURCES})

target_include_directories(istioproxy
        PRIVATE ${ISTIO_NATIVE}/mixerclient
        ${ISTIO_DEP_GENFILES}/external/com_lyft_protoc_gen_validate
        ${ISTIO_DEP_GENFILES}
        ${ISTIO_DEP_GENFILES}/external/com_github_fmtlib_fmt
        ${ISTIO_NATIVE}/fmt
        ${ISTIO_NATIVE}/xxhash
        ${ISTIO_NATIVE}/api
        ${ISTIO_NATIVE}/envoy/include
        ${ISTIO_NATIVE}/proxy
        ${ISTIO_NATIVE}/abseil-cpp
        ${ISTIO_PROXY}
        ${ISTIO_DEP_GENFILES}/external/mixerapi_git
        ${ISTIO_GENFILES}/external/googleapis_git
        ${ISTIO_DEP_GENFILES}/external/googleapis
        ${ISTIO_GENFILES}/external/com_github_googleapis_googleapis
        ${ISTIO_DEP_GENFILES}/external/gogoproto_git
        ${ISTIO_GENFILES}
        ${ISTIO_NATIVE}/boringssl/src/include
        ${ISTIO_NATIVE}/envoy/source
        ${ISTIO_NATIVE}/spdlog/include
        ${ISTIO_NATIVE}/spdlog/include/spdlog
        ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy
        ${ISTIO_DEP_GENFILES}/external/envoy_api
        ${ISTIO_NATIVE}/lightstep/src/c++11
        ${ISTIO_NATIVE}/protobuf/src
        ${ISTIO_NATIVE}/rapidjson/include
        )

