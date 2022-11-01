def bookapp_api_list = [
    [service_name: "book-api", job_name: "book-api", values_local_parse_pattern: ".image.tag", jenkinsfile_template: "Jenkinsfile.local.common", default_branch: 'master'],
    [service_name: "customer-api", job_name: "customer-api", values_local_parse_pattern: ".image.tag", jenkinsfile_template: "Jenkinsfile.local.common", default_branch: 'master'],
    [service_name: "order-api", job_name: "order-api", values_local_parse_pattern: ".image.tag", jenkinsfile_template: "Jenkinsfile.local.common", default_branch: 'master']
]

bookapp_api_list.each { api ->
    pipelineJob("hoangnv46/${api['job_name']}") {
        environmentVariables {
            env('SERVICE_NAME', "${api['service_name']}")
            env('VALUES_LOCAL_PARSE_PATTERN', "${api['values_local_parse_pattern']}")
        }
        parameters {
            stringParam('BRANCH', "${api['default_branch']}", 'Description: Specify branch to build')
        }
        description()
        keepDependencies(false)
        logRotator {
            artifactNumToKeep(2)
            numToKeep(5)
        }
        properties {
            disableConcurrentBuilds {
                abortPrevious(false)
            }
        }
        definition {
            cps {
                script(readFileFromWorkspace("jenkins-template/templates/${api['jenkinsfile_template']}"))
                sandbox()
            }
        }
    }
}