add_library(googleapis STATIC
        ${ISTIO_DEP_GENFILES}/external/com_github_googleapis_googleapis/google/rpc/status.pb.cc
        )

set_target_properties(googleapis PROPERTIES COMPILE_FLAGS -DBUILDING_GOOGLEAPIS)

target_include_directories(googleapis PRIVATE
        ${ISTIO_DEP_GENFILES}/external/com_github_googleapis_googleapis
)


