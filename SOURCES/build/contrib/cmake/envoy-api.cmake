#set(ENVOYAPI_SOURCES
add_library(envoy-api STATIC
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/ratelimit/v2/rls.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/ratelimit/v2/rls.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/discovery/v2/ads.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/discovery/v2/hds.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/discovery/v2/ads.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/discovery/v2/hds.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/metrics/v2/metrics_service.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/metrics/v2/metrics_service.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/load_stats/v2/lrs.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/load_stats/v2/lrs.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/accesslog/v2/als.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/accesslog/v2/als.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/auth/v2/attribute_context.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/auth/v2/external_auth.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/auth/v2/attribute_context.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/service/auth/v2/external_auth.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/endpoint/load_report.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/endpoint/endpoint.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/endpoint/load_report.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/endpoint/endpoint.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/eds.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/route/route.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/route/route.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/auth/auth.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/auth/cert.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/auth/auth.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/auth/cert.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/rds.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/listener/listener.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/listener/listener.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/lds.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/address.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/grpc_service.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/config_source.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/health_check.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/base.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/protocol.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/address.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/config_source.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/grpc_service.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/base.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/health_check.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/protocol.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/cds.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/cluster/outlier_detection.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/cluster/circuit_breaker.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/cluster/outlier_detection.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/cluster/circuit_breaker.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/discovery.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/ratelimit/ratelimit.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/ratelimit/ratelimit.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/eds.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/rds.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/lds.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/discovery.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/cds.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/fault/v2/fault.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/fault/v2/fault.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/transcoder/v2/transcoder.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/transcoder/v2/transcoder.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/lua/v2/lua.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/lua/v2/lua.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/squash/v2/squash.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/squash/v2/squash.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/health_check/v2/health_check.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/health_check/v2/health_check.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/router/v2/router.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/router/v2/router.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/rate_limit/v2/rate_limit.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/rate_limit/v2/rate_limit.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/buffer/v2/buffer.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/http/buffer/v2/buffer.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/client_ssl_auth/v2/client_ssl_auth.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/client_ssl_auth/v2/client_ssl_auth.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/redis_proxy/v2/redis_proxy.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/redis_proxy/v2/redis_proxy.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/mongo_proxy/v2/mongo_proxy.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/mongo_proxy/v2/mongo_proxy.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/tcp_proxy/v2/tcp_proxy.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/tcp_proxy/v2/tcp_proxy.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/http_connection_manager/v2/http_connection_manager.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/http_connection_manager/v2/http_connection_manager.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/rate_limit/v2/rate_limit.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/network/rate_limit/v2/rate_limit.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/fault/v2/fault.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/fault/v2/fault.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/accesslog/v2/accesslog.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/filter/accesslog/v2/accesslog.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/accesslog/v2/als.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/accesslog/v2/als.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/metrics/v2/metrics_service.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/metrics/v2/stats.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/metrics/v2/metrics_service.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/metrics/v2/stats.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/bootstrap/v2/bootstrap.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/bootstrap/v2/bootstrap.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/ratelimit/v2/rls.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/ratelimit/v2/rls.pb.validate.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/trace/v2/trace.pb.cc
          ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/config/trace/v2/trace.pb.validate.cc


        )

set_target_properties(envoy-api PROPERTIES COMPILE_FLAGS -DBUILDING_ENVOY_API)


target_include_directories(envoy-api PRIVATE
    
     
        ${ISTIO_DEP_GENFILES}/external/com_google_protobuf/src
    

        ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy/api/v2/core/
        ${ISTIO_DEP_GENFILES}/external/envoy_api/envoy
        ${ISTIO_DEP_GENFILES}/external/envoy_api
        ${ISTIO_DEP_GENFILES}/external/com_lyft_protoc_gen_validate
        ${ISTIO_DEP_GENFILES}/external/com_github_gogo_protobuf
        ${ISTIO_DEP_GENFILES}/external/com_github_fmtlib_fmt
        ${ISTIO_DEP_GENFILES}/external/envoy/source
        ${ISTIO_DEP_GENFILES}/external/envoy
        ${ISTIO_DEP_GENFILES}/external/com_github_grpc_grpc/include
        ${ISTIO_DEP_GENFILES}/external/promotheus_metrics_model/
        ${ISTIO_DEP_GENFILES}/external/io_opentracing_cpp/include
        ${ISTIO_DEP_GENFILES}/external/io_opentracing_cpp/3rd_party/include/
        ${ISTIO_DEP_GENFILES}/external/com_lightstep_tracer_cpp/include
        ${ISTIO_DEP_GENFILES}/external/com_github_grpc_grpc
        ${ISTIO_DEP_GENFILES}/third_party/cares
        ${ISTIO_DEP_GENFILES}/thirdparty_build/include
        ${ISTIO_DEP_GENFILES}/external/mixerapi_git
        ${ISTIO_DEP_GENFILES}/external/mixerclient_git/
        ${ISTIO_DEP_GENFILES}/external/googleapis
        ${ISTIO_NATIVE}/nghttp2/lib/includes
        ${ISTIO_DEP_GENFILES}/
        .
      
        )


