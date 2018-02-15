set -x 
set -e

TMP_DIR=/home/root/workspaces/tmp/src

mkdir -p ${TMP_DIR}

#################### Envoy/Mixer
ENVOY_VERSION=e2117cbf1f7a84e4cfd7a1e00bcc053b1afb0ea7
MIXERCLIENT_VERSION=b8948db16760777aadab04198e810250e4ec5e16

#################### Build Recipes
CARES_VERSION=cares-1_13_0
LIBEVENT_VERSION=release-2.1.8-stable
NGHTTP2_VERSION=v1.30.0
BORINGSSL_VERSION=a20bb7ff8bb5057065a2e7941249773f9676cf45
YAML_CPP_VERSION=yaml-cpp-0.6.1


#################### Bazel 

ENVOY_API_VERSION=258bfddfddaad4d6a1da7b4476c98b060d57bcc1
LIGHTSTEP_VERSION=6a198acd328f976984699f7272bbec7c8b220f65
LIGHTSTEP_TRACER_COMMON_VERSION=v1.0.0
PROTOBUF_VERSION=v3.5.0
ABSEIL_CPP_VERSION=787891a3882795cee0364e8a0f0dda315578d155
BACKWARD_VERSION=44ae9609e860e3428cd057f7052e505b4819eb84
GOOGLEAPIS_VERSION=d6f78d948c53f3b400bb46996eb3084359914f9b
GRPC_TRANSCODING_VERSION=e4f58aa07b9002befa493a0a82e10f2e98b51fc6
HTTP_PARSER_VERSION=feae95a3a69f111bc1897b9048d9acbc290992f9
RAPIDJSON_VERSION=f54b0e47a08782a6131cc3d60f94d038fa6e0a51
SPDLOG_VERSION=v0.16.2
TCLAP_VERSION=3627d9402e529770df9b0edf2aa8c0e0d6c6bb41
XXHASH_VERSION=7caf8bd76440c75dfe1070d3acfbd7891aea8fca

#################### Unknown
CCTZ_VERSION=master

#### lightstep
cd ${TMP_DIR}
rm -rf lightstep787891a3882795cee0364e8a0f0dda315578d155
git clone http://github.com/lightstep/lightstep-tracer-cpp
cd lightstep-tracer-cpp
git reset --hard ${LIGHTSTEP_VERSION}
cd ..
mv lightstep-tracer-cpp lightstep

#### lightstep-tracer-common
cd ${TMP_DIR}
rm -rf lightstep-tracer-common
git clone http://github.com/lightstep/lightstep-tracer-common -b ${LIGHTSTEP_TRACER_COMMON_VERSION}

#### c-ares
cd ${TMP_DIR}
rm -rf cares
git clone http://github.com/c-ares/c-ares -b ${CARES_VERSION}
mv c-ares cares

#### protobuf
cd ${TMP_DIR}
rm -rf protobuf
git clone http://github.com/google/protobuf -b ${PROTOBUF_VERSION}

#### nghttp2
cd ${TMP_DIR}
rm -rf nghttp2
git clone http://github.com/nghttp2/nghttp2 -b ${NGHTTP2_VERSION}

#### envoy-api
cd ${TMP_DIR}
rm -rf envoy-api
git clone http://github.com/envoyproxy/data-plane-api
cd data-plane-api
git reset --hard ${ENVOY_API_VERSION}
cd ..
mv data-plane-api envoy-api

#### libevent
cd ${TMP_DIR}
rm -rf libevent
git clone http://github.com/libevent/libevent -b ${LIBEVENT_VERSION}

#### boringssl
cd ${TMP_DIR}
rm -rf boringssl
git clone http://boringssl.googlesource.com/boringssl
cd boringssl
git reset --hard ${BORING_VERSION}

#### yaml-cpp
cd ${TMP_DIR}
rm -rf yaml-cpp
git clone http://github.com/jbeder/yaml-cpp -b ${YAML_CPP_VERSION}

#### abseil-cpp
cd ${TMP_DIR}
rm -rf abseil-cpp
git clone http://github.com/abseil/abseil-cpp
cd abseil-cpp
git reset --hard ${ABSEIL_CPP_VERSION}

#### backward
cd ${TMP_DIR}
rm -rf backward
git clone http://github.com/bombela/backward-cpp
cd backward-cpp
git reset --hard ${BACKWARD_VERSION}
cd ..
mv backward-cpp backward

#### googleapis
cd ${TMP_DIR}
rm -rf googleapis
git clone http://github.com/google/googleapis
cd googleapis
git reset --hard ${GOOGLEAPIS_VERSION}

#### yaml-cpp
cd ${TMP_DIR}
rm -rf yaml-cpp
git clone http://github.com/jbeder/yaml-cpp -b ${YAML_CPP_VERSION}

#### grpc_transcoding
cd ${TMP_DIR}
rm -rf grpc_transcoding
git clone http://github.com/grpc-ecosystem/grpc-httpjson-transcoding
cd grpc-httpjson-transcoding
git reset --hard ${GRPC_TRANSCODING_VERSION}
cd ..
mv grpc-httpjson-transcoding grpc_transcoding

#### http-parser
cd ${TMP_DIR}
rm -rf http-parser
git clone http://github.com/nodejs/http-parser
cd http-parser
git reset --hard ${HTTP_PARSER_VERSION}

#### rapidjson
cd ${TMP_DIR}
rm -rf rapidjson
git clone http://github.com/tencent/rapidjson
cd rapidjson
git reset --hard ${RAPIDJSON_VERSION}

#### spdlog
cd ${TMP_DIR}
rm -rf spdlog
git clone http://github.com/gabime/spdlog -b ${SPDLOG_VERSION}

#### tclap
cd ${TMP_DIR}
rm -rf tclap
git clone http://github.com/eile/tclap
cd tclap
git reset --hard ${TCLAP_VERSION}

#### xxhash
cd ${TMP_DIR}
rm -rf xxhash
git clone http://github.com/Cyan4973/xxHash
cd xxHash
git reset --hard ${XXHASH_VERSION}
cd ..
mv xxHash xxhash

#### envoy
cd ${TMP_DIR}
rm -rf envoy
git clone http://github.com/envoyproxy/envoy
cd envoy
git reset --hard ${ENVOY_VERSION}

#### mixerclient
cd ${TMP_DIR}
rm -rf mixerclient
git clone http://github.com/istio/mixerclient
cd mixerclient
git reset --hard ${MIXERCLIENT_VERSION}

#### cctz
cd ${TMP_DIR}
rm -rf cctz
git clone https://github.com/google/cctz -b ${CCTZ_VERSION}

############### prune
cd ${TMP_DIR}
find . -name ".git" | xargs rm -rf


############### tarball
cd ${TMP_DIR}/..
tar cvf src.tar src
gzip src.tar

